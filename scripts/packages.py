import subprocess
import distro
from os_install import install_package_command as os_install_package_command
from os_install import shell_run as os_shell_run
from os_install import is_installed as os_is_installed


def gitlfs():
    os_shell_run(
        "curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash"
    )


def zsh():
    os_shell_run(os_install_package_command("zsh"))


def powerlevel10k():
    os_shell_run(
        "git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k"
    )
    os_shell_run("echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc")


def vim():
    os_shell_run(os_install_package_command("vim"))


def neovim():
    if distro.id() == "ubuntu":
        os_shell_run("sudo add-apt-repository ppa:neovim-ppa/stable")
        os_shell_run("sudo apt update")
    os_shell_run(os_install_package_command("neovim"))


def lunarvim():
    os_shell_run(
        "LV_BRANCH='release-1.4/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.4/neovim-0.9/utils/installer/install.sh)"
    )


def pnpm():
    os_shell_run("curl -fsSL https://get.pnpm.io/install.sh | sh -")
    os_shell_run(
        'echo "export PNPM_HOME=$HOME/.local/share/pnpm" | sudo tee -a ~/.zshenv'
    )


def rust_utils():
    os_shell_run(
        os_install_package_command(
            "eza bat tokei fzf tealdeer ripgrep hyperfine fd-find xclip"
        )
    )


def sqlite():
    os_shell_run(os_install_package_command("sqlite3"))


def asdf_git():
    os_shell_run(
        "git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.18.0"
    )
    os_shell_run('echo ". $HOME/.asdf/asdf.sh" | sudo tee -a ~/.zshrc')


def asdf_pacman():
    os_shell_run(
        "git clone https://aur.archlinux.org/asdf-vm.git && cd asdf-vm && makepkg -si"
    )
    os_shell_run('echo ". /opt/asdf-vm/asdf.sh" | sudo tee -a ~/.zshrc')


def programming_languages():
    if os_is_installed("asdf"):
        os_shell_run(
            """
          asdf plugin-add elixir
          && asdf plugin-add erlang
          && asdf plugin-add lua
          && asdf plugin-add nodejs
          && asdf plugin-add python
          && asdf plugin-add ruby
          && asdf plugin-add rust
        """
        )
    else:
        print("❌ asdf is not installed!")


def homebrew():
    os_shell_run(
        'sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"'
    )
    os_shell_run(
        "[ -d /home/linuxbrew/.linuxbrew ] && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    )


def others():
    os_shell_run(os_install_package_command("btop earlyoom"))


def bruno():
    os_shell_run(os_install_package_command("bruno"))


def spotify():
    os_shell_run("flatpak install flathub com.spotify.Client -y")


def discord():
    os_shell_run("flatpak install flathub com.discordapp.Discord -y")


def google_chrome():
    os_shell_run("flatpak install flathub com.google.Chrome -y")


def vscode():
    os_shell_run("flatpak install flathub com.visualstudio.code -y")
