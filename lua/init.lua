local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local config = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

-- local log = require("plenary.log"):new()
-- log.level = "debug"

local inventory = {
  "sto1",
  "sto2",
  "sto3",
  "sto4",
  "dco1",
  "rise1",
  "osl2",
  "lab",
}

local basedir = "/home/nomad/safespring/seter/inventory/"

local M = {}

M.select_inventory = function (opts)
  pickers.new(opts, {
    finder = finders.new_table(inventory),
    sorter = config.generic_sorter(opts),
    attach_mappings = function(prompt_bufnr)
      actions.select_default:replace(function()
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        vim.fn.chdir(basedir .. selection.value)
        -- log.debug("Selected: ", selection.value)
      end)
      return true
    end,
  }):find()
end

return M
