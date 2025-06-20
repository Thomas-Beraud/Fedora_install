# Fedora_install
Script and files to install a clean Fedora for work

## Install French and US keyboard (Personnal Preference)

## Remote disk configuration
In rclone 36 for OneDrive or 22 for GoogleDrive, and then select shared disk and assign name 1_EQUIPE for disk 1 and 2_PROJETS for disk 2

Manual command to mount remote disk named OneDrive in the /home/thomas/OneDrive folder :
```console
rclone --vfs-cache-mode writes mount OneDrive: /home/thomas/OneDrive/ --config /home/thomas/.config/rclone/rclone.conf 
```

## VsCode Extensions (User preference)
Better Comments, Python, Rainbow csv, jupyter

## :warning: Add github path in .bashrc
Run command in terminal : 
```console
source ~/.bashrc
```
