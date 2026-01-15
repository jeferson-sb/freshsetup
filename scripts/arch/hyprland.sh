# hyprland.conf

# Update
yay -Syuu
pacman -Syuu

# Create a python shell for devsetup and run
pip3 install beaupy

yay -S openssh
yay -S spotify google-chrome discord runjs-bin flipper-bin

sudo pacman -S github-cli
gh auth login
gh repo clone SolDoesTech/HyperV4

nmcli device wifi connect <wifi> password <pass>
hyprctl devices
setxkbmap -print -verbose 10
localectl list-keymaps
setxkbmap -model abnt2 -layout br -variant abnt2

flatpak install flathub com.slack.Slack
