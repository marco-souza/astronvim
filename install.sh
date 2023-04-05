# cleanup current setup
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak

# astronvim config
git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
# user configs
git clone https://github.com/marco-souza/astronvim ~/.config/nvim/lua/user

