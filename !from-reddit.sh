#depts for wine and lol. lib32-libldap is arch specific (check?)
sudo pacman -S --needed --noconfirm lib32-libldap alsa-lib gnutls lcms2 lib32-alsa-lib lib32-gnutls lib32-lcms2 lib32-libldap lib32-mpg123 libldap mpg123 gendesk icoutils imagemagick alsa-plugins lib32-alsa-plugins lib32-libpulse libpulse openal lib32-openal

export WINEARCH=win32 WINEPREFIX=~/games/lol-from_reddit
winetricks d3dx9
echo 'wiki.archlinux.org/index.php/League_of_Legends#Wine_Method' > $WINEPREFIX/source_instructions.txt
ln -s /media/Archive/games/LeagueOfLegends/ $WINEPREFIX
winecfg
#override msvcp140
#should also enable CSMT but not until you have a proper video card
echo 'make msvcp140 (Native, then builtin)

wine $WINEPREFIX/LeagueOfLegends/LeagueClient.exe

unset -v WINEARCH WINEPREFIX

sudo bash -c "cat <<EOF > /usr/share/applications/lol.desktop
[Desktop Entry]
Encoding=UTF-8
Version=1.0                                     # version of an app.
Name=League of Legends                                 # name of an app.
Comment=Moba from Riot                # comment which appears as a tooltip.
Exec=WINEARCH=win32 WINEPREFIX=/home/personal/games/lol_from-reddit/ wine /home/personal/games/lol_from-reddit/LeagueOfLegends/LeagueClient.exe  # command used to launch an app.
Terminal=false                                  # whether an app requires to be run in a terminal.
Icon=/home/personal/games/LeagueOfLegends/icon.png   # location of icon file.
Type=Application                                # type.
Categories=Games;Wine;        # categories in which this app should be listed.
EOF"

sudo bash -c "cat <<EOF > /usr/share/applications/kill-lol.desktop
[Desktop Entry]
Encoding=UTF-8
Version=1.0                                     # version of an app.
Name=Kill LoL                                 # name of an app.
Comment=Stop LoL emulator process                # comment which appears as a tooltip.
Exec=WINEARCH=win32 WINEPREFIX=/home/personal/games/lol_from-reddit/ wineserver -k  # command used to launch an app.
Terminal=false                                  # whether an app requires to be run in a terminal.
Icon=/home/personal/games/LeagueOfLegends/kill-icon.png   # location of icon file.
Type=Application                                # type.
Categories=Games;Wine;        # categories in which this app should be listed.
EOF"
