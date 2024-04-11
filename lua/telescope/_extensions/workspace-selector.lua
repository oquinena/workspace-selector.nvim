return require("telescope").register_extension {
    exports = {
        ["workspace-selector"] = require "workspace-selector.nvim",
    },
}
