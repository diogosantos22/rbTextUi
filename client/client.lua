local RESOURCE_NAME = GetCurrentResourceName()
local NUIReady = false
local NUI = {}

RegisterNUICallback('ready', function(data, cb)
    nui:config()
    cb("ok")
end)

function NUI:new()
    local obj = {}
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function NUI:config() 
    SendNUIMessage({
        action = 'config',
        data = Config.Settings,
    })
end

function NUI.show(text, key, id)
    local data = {
        text = text,
        key = key,
    }

    data.ui = not id and (Config.Settings.multipleUis and GetInvokingResource() or RESOURCE_NAME) or id

    SendNUIMessage({
        action = 'show',
        data = data,
    })
end

function NUI.hide(id)
    SendNUIMessage({
        action = 'hide',
        data = not id and (Config.Settings.multipleUis and GetInvokingResource() or RESOURCE_NAME) or id
    })
end

nui = NUI:new()

exports("show", nui.show)
exports("hide", nui.hide)

RegisterNetEvent('rbTextUi:show')
AddEventHandler('rbTextUi:show', nui.show)

RegisterNetEvent('rbTextUi:hide')
AddEventHandler('rbTextUi:hide', nui.hide)

    
if Config.Settings.compatibility == "luke_textui" then
    RegisterNetEvent('luke_textui:ShowUI')
    AddEventHandler('luke_textui:ShowUI', function(text, color)
        nui.show(text)
    end)
    
    RegisterNetEvent('luke_textui:HideUI')
    AddEventHandler('luke_textui:HideUI', function()
        nui.hide()
    end)

elseif Config.Settings.compatibility == "cd_drawtextui" then
    RegisterNetEvent('cd_drawtextui:ShowUI')
    AddEventHandler('cd_drawtextui:ShowUI', function(action, text)
        nui.show(text)
    end)
    
    RegisterNetEvent('cd_drawtextui:HideUI')
    AddEventHandler('cd_drawtextui:HideUI', function()
        nui.hide()
    end)
end

