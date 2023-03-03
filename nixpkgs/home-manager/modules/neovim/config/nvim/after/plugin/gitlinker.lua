require "gitlinker".setup({
    callbacks = {
        ["gitlab.com"] = require "gitlinker.hosts".get_gitlab_type_url,
    }
})
