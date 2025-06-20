echo "Installing a new clean Fedora with all your Geostack Needs"

sh Scripts/install_github.sh
sh Scripts/install_vscodium.sh # User preference
sh Scripts/install_python_and_seismate.sh
sh Scripts/drive_autostart.sh
sh Scripts/install_SeisUnix.sh
