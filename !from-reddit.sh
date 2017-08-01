#depts for wine and lol. lib32-libldap is arch specific (check?)
sudo apt-get install lib32-libldap alsa-lib gnutls lcms2 lib32-alsa-lib lib32-gnutls lib32-lcms2 lib32-libldap lib32-mpg123 libldap mpg123 gendesk icoutils imagemagick alsa-plugins lib32-alsa-plugins lib32-libpulse libpulse openal lib32-openal -y

export WINEARCH=win32 WINEPREFIX=~/games/lol-from_reddit
winetricks d3dx9
echo 'wiki.archlinux.org/index.php/League_of_Legends#Wine_Method' > $WINEPREFIX/source_instructions.txt
ln -s ~/games/backup_games/League\ of\ Legends $WINEPREFIX
winecfg
#override msvcp140
#should also enable CSMT but not until you have a proper video card

wine $WINEPREFIX/League\ of\ Legends/LeagueClient.exe
unset -v WINEARCH WINEPREFIX

echo '[Desktop Entry]
Encoding=UTF-8
Version=1.0                                     # version of an app.
Name=League of Legends                                 # name of an app.
Comment=Moba from Riot                # comment which appears as a tooltip.
Exec=WINEARCH=win32 WINEPREFIX=/home/user/games/lol-from_reddit wine $WINEPREFIX/League\ of\ Legends/LeagueClient.exe
Terminal=false                                  # whether an app requires to be run in a terminal.
Icon=/home/user/games/backup_games/League\ of\ Legends/icon.png   # location of icon file.
Type=Application                                # type.
Categories=Games;Wine; ' | sudo tee /usr/share/applications/lol.desktop 

sudo bash -c "cat <<EOF > /usr/share/applications/kill-lol.desktop
[Desktop Entry]
Encoding=UTF-8
Version=1.0                                     # version of an app.
Name=Kill LoL                                 # name of an app.
Comment=Stop LoL emulator process                # comment which appears as a tooltip.
Exec=WINEARCH=win32 WINEPREFIX=~/games/lol-from_reddit wineserver -k  # command used to launch an app.
Terminal=false                                  # whether an app requires to be run in a terminal.
Icon=~/games/backup_games/League\ of\ Legends/kill-icon.png   # location of icon file.
Type=Application                                # type.
Categories=Games;Wine;        # categories in which this app should be listed.
EOF"
