export WINEARCH=win32 WINEPREFIX=~/games/lol-from-a_wiki
winecfg
sudo pacman -S --needed --noconfirm lib32-alsa-lib lib32-alsa-plugins lib32-libpulse lib32-libldap lib32-lcms2 lib32-gnutls  
winetricks d3dx9 vcrun2005 wininet corefonts
ln -s /media/Archive/games/LeagueOfLegends/ $WINEPREFIX
winecfg
echo 'Access the libraries tab, and add :
msvcp140 (Native, then builtin)
vcomp140 (Native, then builtin)
vcruntime140 (Native, then builtin)'
