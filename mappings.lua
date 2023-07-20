local harpoon_mark = require('harpoon.mark')
local harpoon_term = require('harpoon.term')
local harpoon_ui = require('harpoon.ui')

return {
  n = {
    -- lsp
    ["gf"] = { vim.lsp.buf.format, desc = "Rename variable name" },
    ["gr"] = { vim.lsp.buf.rename, desc = "Rename variable name" },
    ["gd"] = { vim.lsp.buf.definition, desc = "Go to Definition" },
    ["gD"] = { vim.lsp.buf.references, desc = "Go to References" },
    -- neogit
    ["<leader>gg"] = { function() require("neogit").open() end, desc = "Manage Git (Neogit)" },
    -- Harpoon
    ['<leader>ml'] = { harpoon_ui.toggle_quick_menu },
    ['<leader>mt'] = { harpoon_term.gotoTerminal },
    ['<leader>mm'] = { harpoon_mark.add_file },
    ['<leader>mn'] = { harpoon_ui.nav_next },
    ['<leader>mb'] = { harpoon_ui.nav_prev },
  },
}

