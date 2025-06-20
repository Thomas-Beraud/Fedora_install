# Fedora for Geostack with SeisUnix <img src="https://upload.wikimedia.org/wikipedia/commons/3/3f/Fedora_logo.svg" width="35">
Script and files to install a clean Fedora for work and compile SeisUnix from the work of https://github.com/JohnWStockwellJr.

Modified from https://github.com/PAULGOYES/install_seismicUnix

# Tested on Fedora Workstation 42 

Download the Fedora_Install Project in your Home/Downloads Folder. 

Inside Fedora_install folder run :
```console
sh install.sh
```


## Install French and US keyboard (Personnal Preference)

## Remote disk configuration
In rclone 36 for OneDrive or 22 for GoogleDrive, and then select shared disk and assign name 1_EQUIPE for disk 1 and 2_PROJETS for disk 2

Manual command to mount remote disk named OneDrive in the /home/thomas/OneDrive folder :
```console
rclone --vfs-cache-mode writes mount OneDrive: /home/thomas/OneDrive/ --config /home/thomas/.config/rclone/rclone.conf 
```
git  
## VsCode Extensions (User preference)
Better Comments, Python, Rainbow csv, jupyter

## :warning: Add github path in .bashrc
Run command in terminal : 
```console
source ~/.bashrc
```

# For SeisUnix

### :file_folder: Download all necessary files :
Download the 44R28 on https://nextcloud.seismic-unix.org/index.php/s/LZpzc8jMzbWG9BZ and put it in the Home/Downloads Folder.

### Wait for gcc compiling :clock4:

### :warning: Don't forget to update the .bashrc to get SU function access 
At the end of the installation run source ~/.bashrc to update the Fedora path to SU functions.
