
# Donwload requirements
wget https://github.com/Thomas-Beraud/Fedora_install/blob/main/Scripts/1_EQUIPE.desktop
wget https://github.com/Thomas-Beraud/Fedora_install/blob/main/Scripts/2_PROJETS.desktop
wget https://github.com/Thomas-Beraud/Fedora_install/blob/main/Scripts/onedrive.desktop
wget https://github.com/Thomas-Beraud/Fedora_install/blob/main/Scripts/requirements.txt

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

curl -LsSf https://astral.sh | sh
uv python install 3.11.9

# Installation python pour Seismate / Geostack
sudo apt update
sudo apt install -y build-essential zlib1g-dev libncurses-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev curl libbz2-dev libsqlite3-dev tk-dev libc6-dev 

# Download the source code for the desired Python version
curl -O https://www.python.org/ftp/python/3.11.9/Python-3.11.9.tgz
tar -xf Python-3.11.9.tgz
cd Python-3.11.9

# Configure and install
./configure --enable-optimizations
make -j $(nproc)
sudo make altinstall
cd ..
sudo rm Python-3.11.9.tgz
sudo rm -rf Python-3.11.9

cd Documents/
mkdir venv
cd venv
python3.11 -m venv .seismate
source .seismate/bin/activate
pip install -r ~/Downloads/requirements.txt

export PYTHONPATH="${PYTHONPATH}:$HOME/Documents/GitHub/seismate"
export PYTHONPATH="${PYTHONPATH}:$HOME/Documents/GitHub/traitement-sismique"

echo "Installing Rclone to access OneDrive and GoogleDrive"
sudo -v ; curl https://rclone.org/install.sh | sudo bash
rclone config

echo "Create Remote Drive AutoStart"
cd ~
mkdir 1_EQUIPE 2_PROJETS OneDrive .config/autostart
cp ~/Downloads/Fedora_install/Scripts/onedrive.desktop .config/autostart/
cp ~/Downloads/Fedora_install/Scripts/1_EQUIPE.desktop .config/autostart/
cp ~/Downloads/Fedora_install/Scripts/2_PROJETS.desktop .config/autostart/