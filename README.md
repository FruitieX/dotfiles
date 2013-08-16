FruitieX' Linux dotfiles
========================
A git repository containing my configuration files for various programs. I've
provided a few handy scripts if you want a set-up just like mine with minimal
effort (no guarentees that they work though :-) and as usual: make backups and
read through the scripts before you run them!)

Screenshot:
-----------
![Screenshot](/screenshot.png "Screenshot of config in action")

Install:
--------

	git clone https://github.com/FruitieX/dotfiles
	cd dotfiles
	./firstrun.sh
	./symlink.sh

Update:
-------

	git pull
	./symlink.sh

Dependencies for arch linux users:
----------------------------------
* **for script**:
	pacman -S git curl

* **vim:**
	pacman -S gvim vim-colorsamplerpack vimpager ctags

* **wm stuff:**
	pacman -S i3 i3status dmenu i3lock unclutter

* **misc cli:**
	pacman -S openssh sudo tmux cmus sshfs ntp terminus-font weechat

* **misc gui:**
	pacman -S rxvt-unicode numlockx redshift feh dwb synergy

* **xorg:**
	pacman -S xorg-server xorg-xset xorg-xsetroot xorg-xmodmap xorg-xinit slim archlinux-themes-slim
