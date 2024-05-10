#/bin/sh

# Back up the current configuration
echo "Backing up the current configuration"
mkdir -p ~/.config/nvim_backup
mkdir -p ~/.local/share/nvim_backup

cp -r ~/.config/nvim/* ~/.config/nvim_backup
cp -r ~/.local/share/nvim/* ~/.local/share/nvim_backup

# Remove the current configuration
echo "Removing the current configuration"
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim

# Install the new configuration
echo "Installing nvchad"
git clone https://github.com/NvChad/starter ~/.config/nvim

# Restore the backup, overwriting the new configuration
echo "Restoring the backup"
cp -rf ~/.config/nvim_backup/* ~/.config/nvim
cp -rf ~/.local/share/nvim_backup/* ~/.local/share/nvim

# Remove backup
rm -rf ~/.config/nvim_backup
rm -rf ~/.local/share/nvim_backup

# Install plugins
echo "Installing plugins"
nvim --headless -c 'MasonInstallAll' -c 'qall'
