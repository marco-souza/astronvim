-- local harpoon_mark = require('harpoon.mark')
-- local harpoon_term = require('harpoon.term')
-- local harpoon_ui = require('harpoon.ui')

return {
  n = {
    -- neogit
    ["<leader>gg"] = { function() require("neogit").open() end, desc = "Manage Git (Neogit)" },
    -- Harpoon
    -- ['<leader>ml'] = { harpoon_ui.toggle_quick_menu },
    -- ['<leader>mt'] = { harpoon_term.gotoTerminal },
    -- ['<leader>mm'] = { harpoon_mark.add_file },
    -- ['<leader>mn'] = { harpoon_ui.nav_next },
    -- ['<leader>mb'] = { harpoon_ui.nav_prev },
  },
}

