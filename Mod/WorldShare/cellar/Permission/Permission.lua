--[[
Title: Permission
Author(s):  big
Date: 2020.05.22
place: Foshan
Desc: 
use the lib:
------------------------------------------------------------
local Permission = NPL.load("(gl)Mod/WorldShare/cellar/Permission/Permission.lua")
------------------------------------------------------------
]]

local KeepworkServiceSession = NPL.load("(gl)Mod/WorldShare/service/KeepworkService/Session.lua")
local KeepworkServicePermission = NPL.load("(gl)Mod/WorldShare/service/KeepworkService/Permission.lua")
local LoginModal = NPL.load("(gl)Mod/WorldShare/cellar/LoginModal/LoginModal.lua")
local VipNotice = NPL.load("(gl)Mod/WorldShare/cellar/VipNotice/VipNotice.lua")

local Permission = NPL.export()

function Permission:CheckPermission(authName, bOpenUIIfNot, callback)
    if not authName or type(authName) ~= "string" then
        authName = ""
    end

    if bOpenUIIfNot then
        LoginModal:CheckSignedIn(L"此功能需要特殊权限，请先登录", function(result)
            if not result then
                return false
            end

            local function Handle()
                KeepworkServicePermission:Authentication(authName, function(result)
                    if result == false then
                        self:ShowFailDialog(authName)
                    end

                    if type(callback) == "function" then
                        callback(result)
                    end
                end)
            end

            if result == 'REGISTER' or result == 'FORGET' then
                return false
            end

            if result == 'THIRD' then
                return Handle
            end

            if result == true then
                Handle()
            end
        end)
    else
        if KeepworkServiceSession:IsSignedIn() then
            KeepworkServicePermission:Authentication(authName, callback)
        else
            if type(callback) == "function" then
                callback(false)
            end
        end
    end
end

function Permission:ShowFailDialog(authName)
    if authName == "OnlineTeaching" then
        _guihelper.MessageBox(L"此功能需要教师权限")
    else
        VipNotice:Init(false);
    end
end