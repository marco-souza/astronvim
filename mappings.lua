-- Neogit
if is_available "neogit" then
  maps.n["<leader>g"] = sections.g
  maps.n["<leader>gg"] = { function() require("neogit").open() end, desc = "Manage Git (Neogit)" }
end
