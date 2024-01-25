#!/bin/bash

#create the file that starts Chromium a displays a web page. myscript.sh is what you edit to get a different web page on the TV. 
cat > /home/$USER/myscript.sh << EOL
#!/bin/sh
# what this script does: start chromium
chromium-browser --start-maximized  --incognito --user-data-dir=/home/$USER/.config/chromium2 --enable-features=OverlayScrollbar,OverlayScrollbarFlashAfterAnyScrollUpdate,OverlayScrollbarFlashWhenMouseEnter --app=http://localhost &

EOL

sudo chmod +x /home/$USER/myscript.sh


# File path
file_path="/home/$USER/.config/wayfire.ini"

# Text string to add
text_to_add="
[autostart]
runmeman = $HOME/myscript.sh
"

# Check if the [autostart] section already exists
if grep -q "^\[autostart\]" "$file_path"; then
    # Append the text after the last line of the [autostart] section
    sed -i "/^\[autostart\]/,$ a\
$text_to_add" "$file_path"
else
    # Append the text to the end of the file
    echo -e "$text_to_add" >> "$file_path"
fi



sudo apt install -y apache2 php mplayer

# This adds apache user to audio group in order give permissions to play sounds locally on the Pi
sudo usermod -aG audio www-data
# remove default apache web page
sudo rm -rf /var/www/html/index.html
cd /home/$USER

#download and put files in place for apache web server
wget https://raw.githubusercontent.com/ugotapi/soundboardpi/main/index.php
wget https://www.thesoundarchive.com/starwars/alwaystwo.mp3
wget https://www.thesoundarchive.com/starwars/swvader03.mp3
wget https://raw.githubusercontent.com/ugotapi/soundboardpi/main/play.php

sudo cp /home/$USER/swvader03.mp3 /var/www/html/1.mp3
sudo cp /home/$USER/index.php /var/www/html
sudo cp /home/$USER/alwaystwo.mp3 /var/www/html/2.mp3
sudo cp /home/$USER/play.php /var/www/html

sudo chown www-data:www-data /var/www/html/*.mp3
sudo chown www-data:www-data /var/www/html/*.php

sudo reboot
