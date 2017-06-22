#depts for wine and lol. lib32-libldap is arch specific (check?)
sudo pacman -S --needed --noconfirm lib32-libldap alsa-lib gnutls lcms2 lib32-alsa-lib lib32-gnutls lib32-lcms2 lib32-libldap lib32-mpg123 libldap mpg123 gendesk icoutils imagemagick alsa-plugins lib32-alsa-plugins lib32-libpulse libpulse openal lib32-openal

export WINEARCH=win32 WINEPREFIX=~/games/lol-from_reddit
echo 'wiki.archlinux.org/index.php/League_of_Legends#Wine_Method' > $WINEPREFIX/source_instructions.txt
winetricks d3dx9
ln -s /media/Archive/games/LeagueOfLegends/ $WINEPREFIX
winecfg
#override msvcp140
#should also enable CSMT but not until you have a proper video card
echo 'make msvcp140 (Native, then builtin)

wine $WINEPREFIX/LeagueOfLegends/LeagueClient.exe

unset -v WINEARCH WINEPREFIX
