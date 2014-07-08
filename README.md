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

	./update.sh

Dependencies for arch linux users:
----------------------------------
* **for script**:
	git curl

* **vim:**
	gvim vim-colorsamplerpack vimpager ctags

* **wm stuff:**
	herbstluftwm compton clock-git xtitle-git dunst-git dzen2-git avant-window-navigator awn-extras-applets

* **misc cli:**
	openssh sudo tmux cmus sshfs ntp ttf-droid weechat htop

* **misc gui:**
	rxvt-unicode numlockx redshift synergy chromium

* **xorg:**
	xorg-server xorg-xset xorg-xsetroot xorg-xmodmap xorg-xinit xorg-xrandr

* **misc**
	pulseaudio pavucontrol mosh urxvt-font-size-git yeganesh ttf-google-fonts-git hsetroot numix-themes
