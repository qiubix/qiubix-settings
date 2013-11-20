
# moje aliasy

alias rm='rm -vI' 					#przed usunieciem upewnia sie, czy chce usunac ten plik i wyswietla zmiany
alias mv='mv -vi'					#przed przeniesieniem upewnia sie, a potem wyswietla zmiany
alias mkdir='mkdir -v'					#utworzenie katalogu z wyswietleniem zmian
alias list='ls -lhgop'					#wyswietlenie listy plikow bez niektorych atrybutow, pliki w 'ludzkich' rozmiarach
alias ..='cd ..'					#powrot do katalogu wyzej

alias off='sudo shutdown -h now'			#wylaczenie komputera
alias reboot='sudo reboot'				#restart komputera

alias install='sudo apt-get install'			#instalacja aplikacji
alias update='sudo apt-get update'			#update listy repozytoriow
alias wlan='sudo modprobe ndiswrapper'			#uruchomienie ndiswrappera
alias nano='nano -w'					#uruchomienie nano w trybie bez zawijania wierszy
alias Dropbox='cd ~/Dropbox'				#przejscie do katalogu Dropboxa

# zmiana prompta na krotki/dlugi
alias ps1short="PS1='[${BCYAN}\A${NORMAL}][${debian_chroot:+($debian_chroot)}${GREEN}\u@${BRED}\h${NORMAL}][${BBLUE}\W${NORMAL}]\$ '"
alias ps1long="PS1='[${BCYAN}\A${NORMAL}][${debian_chroot:+($debian_chroot)}${GREEN}\u@${BRED}\h${NORMAL}][${BBLUE}\w${NORMAL}]\$ '"

