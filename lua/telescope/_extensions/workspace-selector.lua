return require("telescope").register_extension {
    exports = {
        ["workspace_selector"] = require "workspace-selector.nvim",
    },
}
