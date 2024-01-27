# SoundBoardPi

Creates a soundboard you build. You click the link it plays a sound on the local speaker setup. 

Paste the 0-runme.sh file in a terminal on a Pi5 with Raspberry Pi OS installed. Need a keyboard, mouse, usb soundcard attached to a speaker and a monitor. After you run the script it reboots and should show the page below. 

After setup you can set it up for remote access, just web browse to the page and click a button for sounds. 

Pi5 8GB with Sound BlasterX G1 usb attached to speaker via 3.5mm audio cable:
![unnamed](https://github.com/ugotapi/soundboardpi/assets/14945441/e0c007c8-563a-48b0-82f5-0df7e4088ab2)


You will have to know how to have a basic php or html editing skills. 
The numbers in the index.php could have pictures instead of numbers. You have to edit the text and sound files under /var/www/html folder. When you click the links it plays the mp3 file from the play.php file. I dont supply the mp3 files for this, you have to supply 1.mp3 through 40.mp3 files. There are two sample mp3 files in there. 

What it looks like on the web page:
<img width="1434" alt="image" src="https://github.com/ugotapi/soundboardpi/assets/14945441/1417ee2c-522d-4bbb-9f41-a742de8ca3e8">
