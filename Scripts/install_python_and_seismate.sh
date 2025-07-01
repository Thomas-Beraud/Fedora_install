sudo dnf install python3-spyder
sudo dnf install keepassxc # Can be removed by user

# Create seismate env
sudo dnf install python3.11
cd ~/Documents
mkdir venv
cd venv
python3.11 -m venv .seismate
source .seismate/bin/activate
pip install -r ~/Downloads/Fedora_install-main/Scripts/requirements.txt

export PYTHONPATH="${PYTHONPATH}:$HOME/Documents/GitHub/seismate"
export PYTHONPATH="${PYTHONPATH}:$HOME/Documents/GitHub/traitement-sismique"

echo "Finished!!, type in terminal: source ~/.bashrc"
