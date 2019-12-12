--[[
Title: Keepwork Repos API
Author(s):  big
Date:  2019.11.8
Place: Foshan
use the lib:
------------------------------------------------------------
local KeepworkReposApi = NPL.load("(gl)Mod/WorldShare/api/Keepwork/Repos.lua")
------------------------------------------------------------
]]

local KeepworkBaseApi = NPL.load('./BaseApi.lua')
local GitEncoding = NPL.load('(gl)Mod/WorldShare/helper/GitEncoding.lua')

local KeepworkReposApi = NPL.export()

function KeepworkReposApi:GetRepoPath(foldername)
    local username = Mod.WorldShare.Store:Get('user/username')

    if type(username) ~= 'string' or type(foldername) ~= 'string' then
        return ''
    else
        return Mod.WorldShare.Utils.UrlEncode(username .. '/' .. GitEncoding.Base32(foldername))
    end
end

-- url: /repos/:repoPath/download
-- method: GET
-- params:
--[[
    repoPath string 必须 仓库路径	
    ref string 必须 commitId
]]
-- return: object
function KeepworkReposApi:Download()
end

-- url: /repos/:repoPath/tree
-- method: GET
-- params:
--[[
    repoPath string 必须 仓库路径	
    ref string 必须 commitId
]]
-- return: object
function KeepworkReposApi:Tree(foldername, commitId, success, error)
    if type(commitId) ~= 'string' then
        commitId = 'master'
    end

    local url = '/repos/' .. self:GetRepoPath(foldername) .. '/tree?ref=' .. commitId

    KeepworkBaseApi:Get(url, nil, nil, success, error)
end

-- url: /repos/:repoPath/files/:filePath/info
-- method: GET
-- params:
--[[
    repoPath string 必须 仓库路径	
    filePath string 必须 文件路径
]]
-- return: object
function KeepworkReposApi:Info()
end

-- url: /repos/:repoPath/files/:filePath/raw
-- method: GET
-- params:
--[[
    repoPath string 必须 仓库路径	
    filePath string 必须 文件路径
]]
-- return: object
function KeepworkReposApi:Raw(foldername, filePath, commitId, success, error)
    if type(filePath) ~= 'string' then
        return false
    end

    if type(commitId) ~= 'string' then
        commitId = 'master'
    end

    local url = format('/repos/%s/files/%s/raw?commitId=%s', self:GetRepoPath(foldername), filePath, commitId)

    KeepworkBaseApi:Get(url, nil, nil, success, error)
end

-- url: /repos/:repoPath/files/:filePath/history
-- method: GET
-- params:
--[[
    repoPath string 必须 仓库路径	
    filePath string 必须 文件路径
]]
-- return: object
function KeepworkReposApi:History()
end

-- url: /repos/:repoPath/files/:filePath
-- method: PUT
-- params:
--[[
    repoPath string 必须 仓库路径	
    filePath string 必须 文件路径
]]
-- return: object
function KeepworkReposApi:UpdateFile(foldername, filePath, content, success, error)
    if type(foldername) ~= 'string' or type(filePath) ~= 'string' then
        return false
    end

    local url = format('/repos/%s/files/%s', self:GetRepoPath(foldername), Mod.WorldShare.Utils.UrlEncode(filePath))

    KeepworkBaseApi:Put(url, { content = content }, nil, success, error)
end

-- url: /repos/:repoPath/files/:filePath
-- method: POST
-- params:
--[[
    repoPath string 必须 仓库路径	
    filePath string 必须 文件路径
    content binary 必须 文件内容
]]
-- return: object
function KeepworkReposApi:CreateFile(foldername, filePath, content, success, error)
    if type(foldername) ~= 'string' or type(filePath) ~= 'string' then
        return false
    end

    local url = format('/repos/%s/files/%s', self:GetRepoPath(foldername), Mod.WorldShare.Utils.UrlEncode(filePath))

    KeepworkBaseApi:Post(url, { content = content }, nil, success, error)
end

-- url: /repos/:repoPath/files/:filePath
-- method: DELETE
-- params:
--[[
    repoPath string 必须 仓库路径	
    filePath string 必须 文件路径
]]
-- return: object
function KeepworkReposApi:RemoveFile()
end

-- url: /repos/:repoPath/files/:filePath
-- method: DELETE
-- params:
--[[
    repoPath string 必须 仓库路径	
    filePath string 必须 文件路径
]]
-- return: object
function KeepworkReposApi:MoveFile()
end

-- url: /repos/:repoPath/folders/:folderPath
-- method: POST
-- params:
--[[
    repoPath string 必须 仓库路径	
    filePath string 必须 文件路径
]]
-- return: object
function KeepworkReposApi:NewFolder()
end

-- url: /repos/:repoPath/folders/:folderPath
-- method: DELETE
-- params:
--[[
    repoPath string 必须 仓库路径	
    filePath string 必须 文件路径
]]
-- return: object
function KeepworkReposApi:RemoveFolder()
end

-- url: /repos/:repoPath/folders/:folderPath/rename
-- method: POST 
-- params:
--[[
    repoPath string 必须 仓库路径	
    filePath string 必须 文件路径
]]
-- return: object
function KeepworkReposApi:MoveFolder()
end