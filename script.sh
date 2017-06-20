export WINEARCH=win32 WINEPREFIX=~/games/lol-from-a_wiki
winecfg
sudo pacman -S lib32-alsa-lib lib32-alsa-plugins lib32-libpulse lib32-libldap lib32-lcms2 lib32-gnutls
man pacman
sudo pacman -S lib32-alsa-lib lib32-alsa-plugins lib32-libpulse lib32-libldap lib32-lcms2 lib32-gnutls
winetricks d3dx9 vcrun2005 wininet corefonts adobeair ie8
winecfg
wine '/home/personal/games/lol-from-a_wiki/League of Legends/LeagueClient.exe'
