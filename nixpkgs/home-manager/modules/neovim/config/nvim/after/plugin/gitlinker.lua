local hosts = require("gitlinker.hosts")
local callbacks = {}

-- export GITLINKER_GITLAB_HOSTS="git.corp-a.com,git.corp-b.com"
for host in (vim.env.GITLINKER_GITLAB_HOSTS or ""):gmatch("[^,]+") do
    local key = host:gsub("%-", "%%-") -- escape Lua magic chars
    callbacks[key] = hosts.get_gitlab_type_url
end

require("gitlinker").setup({ callbacks = callbacks })
