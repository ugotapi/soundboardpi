//  for using the HDMI sound you can remove "-ao alsa:device=hw=2,0". Assumes a USB audio device to speaker setup
<?php
$sound = $_GET['sound']; // Retrieves the value of the "sound" parameter from the URL
exec('/usr/bin/mplayer -vo null -ao alsa:device=hw=2,0 /var/www/html/$sound');
header('Location: ../index.php?success=true');
?>
