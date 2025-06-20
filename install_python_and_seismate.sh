sudo dnf install python3-spyder
sudo dnf install keepassxc # Can be removed by user

# Create seismate env
sudo dnf install python3.11
cd $HOME/Documents
mkdir venv
cd venv
python3.11 -m venv .seismate
source .seismate/bin/activate
pip install -r ~/requirements.txt

export PYTHONPATH="${PYTHONPATH}:/home/thomas/Documents/GitHub/seismate"
export PYTHONPATH="${PYTHONPATH}:/home/thomas/Documents/GitHub/traitement-sismique"

echo "Finished!!, type in terminal: source ~/.bashrc"
