
# Donwload requirements
wget https://github.com/Thomas-Beraud/Fedora_install/blob/main/Scripts/1_EQUIPE.desktop
wget https://github.com/Thomas-Beraud/Fedora_install/blob/main/Scripts/2_PROJETS.desktop
wget https://github.com/Thomas-Beraud/Fedora_install/blob/main/Scripts/onedrive.desktop
wget https://github.com/Thomas-Beraud/Fedora_install/blob/main/Scripts/requirements.txt

# Install needed packages
sudo apt update
sudo apt upgrade

# Installation Spyder
sudo apt install python3-spyder

# Installation de Github Desktop
wget -qO - https://apt.packages.shiftkey.dev/gpg.key | gpg --dearmor | sudo tee /usr/share/keyrings/shiftkey-packages.gpg > /dev/null
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/shiftkey-packages.gpg] https://apt.packages.shiftkey.dev/ubuntu/ any main" > /etc/apt/sources.list.d/shiftkey-packages.list'
sudo apt update && sudo apt install github-desktop

# Installation VsCode
echo -e 'Types: deb\nURIs: https://download.vscodium.com/debs\nSuites: vscodium\nComponents: main\nArchitectures: amd64 arm64\nSigned-by: /usr/share/keyrings/vscodium-archive-keyring.gpg' \
| sudo tee /etc/apt/sources.list.d/vscodium.sources
sudo apt update && sudo apt install codium

# Installation gestionnaire mot de passe
sudo apt install keepassxc

# Installation python pour Seismate / Geostack
apt upgrade
apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev wget libbz2-dev
wget https://www.python.org/ftp/python/3.11.9/Python-3.11.9.tgz
tar -xvf Python-3.11.9.tgz
cd Python-3.11.9
./configure --enable-optimizations
nproc
make -j 4 
make altinstall
cd ..
sudo rm -r Python3.11.9
rm Python3.11.9.tgz

cd Documents/
mkdir venv
cd venv
python -m venv --without-pip .seismate
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