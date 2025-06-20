echo "Installing Rclone to access OneDrive and GoogleDrive"
sudo -v ; curl https://rclone.org/install.sh | sudo bash
rclone config

echo "Create Remote Drive AutoStart"
cd ~
mkdir 1_EQUIPE 2_PROJETS OneDrive .config/autostart
mv /Downloads/onedrive.desktop .config/autostart/
mv /Downloads/1_EQUIPE.desktop .config/autostart/
mv /Downloads/2_PROJETS.desktop .config/autostart/
echo "Finished!! "
pause
