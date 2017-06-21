export WINEARCH=win32 WINEPREFIX=~/games/lol-from-a_wiki
winecfg     #CHECK IF THIS IS NEEDED. winecfg is needed to trigger installation of mono and gecko. 
sudo pacman -S --needed --noconfirm lib32-alsa-lib lib32-alsa-plugins lib32-libpulse lib32-libldap lib32-lcms2 lib32-gnutls  
winetricks d3dx9 vcrun2005 wininet corefonts
echo 'wiki.archlinux.org/index.php/League_of_Legends#Wine_Method' > $WINEPREFIX/source_instructions.txt
ln -s /media/Archive/games/LeagueOfLegends/ $WINEPREFIX
winecfg
echo 'Access the libraries tab, and add :
msvcp140 (Native, then builtin)
vcomp140 (Native, then builtin)
vcruntime140 (Native, then builtin)'
unset -v WINEARCH WINEPREFIX
