
# Donwload requirements
wget https://raw.githubusercontent.com/Thomas-Beraud/Fedora_install/refs/heads/main/Scripts/1_EQUIPE.desktop
wget https://raw.githubusercontent.com/Thomas-Beraud/Fedora_install/refs/heads/main/Scripts/2_PROJETS.desktop
wget https://raw.githubusercontent.com/Thomas-Beraud/Fedora_install/refs/heads/main/Scripts/onedrive.desktop
wget https://raw.githubusercontent.com/Thomas-Beraud/Fedora_install/refs/heads/main/Scripts/requirements.txt

# Install needed packages
sudo apt update
sudo apt upgrade
sudo apt install inkscape
sudo apt install keepassxc
sudo apt install python3-spyder

# Installation de Github Desktop
curl -fsSL https://mirror.mwt.me/shiftkey-desktop/gpgkey | sudo gpg --dearmor --yes -o /usr/share/keyrings/mwt-desktop.gpg
printf '%s\n' \
'Types: deb' \
'URIs: https://mirror.mwt.me/shiftkey-desktop/deb/' \
'Suites: any' \
'Components: main' \
'Architectures: amd64' \
'Signed-By: /usr/share/keyrings/mwt-desktop.gpg' \
| sudo tee /etc/apt/sources.list.d/mwt-desktop.sources > /dev/null
sudo apt update
apt-cache policy github-desktop
sudo apt install github-desktop -y

# Installation VsCode
echo -e 'Types: deb\nURIs: https://download.vscodium.com/debs\nSuites: vscodium\nComponents: main\nArchitectures: amd64 arm64\nSigned-by: /usr/share/keyrings/vscodium-archive-keyring.gpg' \
| sudo tee /etc/apt/sources.list.d/vscodium.sources
sudo apt update && sudo apt install codium

wget -qO- https://astral.sh/uv/install.sh | sh
source $home/.local/share/../bin/env
uv python install 3.11.9
cd Documents/
mkdir venv
cd venv
uv venv --python 3.11 /home/thomas/Documents/venv/.seismate
source .seismate/bin/activate
uv pip install -r ~/requirements.txt

export PYTHONPATH="${PYTHONPATH}:$HOME/Documents/GitHub/seismate"
export PYTHONPATH="${PYTHONPATH}:$HOME/Documents/GitHub/traitement-sismique"

echo "Create Remote Drive AutoStart"
cd ~
mkdir 1_EQUIPE 2_PROJETS OneDrive .config/autostart
cp ~/onedrive.desktop .config/autostart/
cp ~/1_EQUIPE.desktop .config/autostart/
cp ~/2_PROJETS.desktop .config/autostart/

sudo -v ; curl https://rclone.org/install.sh | sudo bash
rclone config