import platform
import subprocess
import distro


def install_package_command(package):
    os = distro.id()
    based = distro.like()

    if os == "arch" or based == "arch":
        return f"sudo pacman -Sy {package} --noconfirm > /dev/null"
    if os == "fedora" or based == "fedora":
        return f"dnf install {package} -y > /dev/null"
    if platform.system() == "Darwin":
        return f"brew install {package}"

    return f"sudo apt install {package} -y > /dev/null"


def shell_run(command):
    subprocess.run(command, shell=True, check=True)


def is_installed(pckg):
    code = subprocess.run(f"command -v {pckg} &> /dev/null", shell=True).returncode

    return bool(code)
