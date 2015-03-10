FruitieX' Linux dotfiles
========================
A git repository containing my configuration files for various programs. I've
provided a few handy scripts if you want a set-up just like mine with minimal
effort (no guarentees that they work though :-) and as usual: make backups and
read through the scripts before you run them!)

Screenshot:
-----------
![Screenshot](/screenshot.png "Screenshot of config in action")

Getting up and running with a bare minimum setup (tmux, zsh and vim):
---------------------------------------------------------------------

1. First install dependencies:

        Ubuntu: sudo apt-get install tmux zsh git
        Arch: sudo pacman -S tmux zsh git

2. Clone the repo and run the install script:

        git clone https://github.com/FruitieX/dotfiles
        cd dotfiles
        ./firstrun.sh

3. (Optional) If you wish to use `vim` instead of `neovim` you can:

        echo "alias nvim=\"vim\"" >> ~/.zshrc
        ln -s ~/.nvim ~/.vim
        ln -s ~/.nvimrc ~/.vimrc

4. Install vim plugins by:

        vim
        :PlugInstall
        
5. Enjoy! Suggestions are welcome. :)

Update:
-------

    ./update.sh

Optional dependencies for arch linux users:
----------------------------------
* **vim:**
    gvim vimpager ctags

* **wm stuff:**
    herbstluftwm compton clock-git xtitle-git dunst-git dzen2-git avant-window-navigator awn-extras-applets

* **misc cli:**
    openssh sudo tmux cmus sshfs ntp ttf-droid weechat htop

* **misc gui:**
    rxvt-unicode numlockx redshift synergy chromium

* **xorg:**
    xorg-server xorg-xset xorg-xsetroot xorg-xmodmap xorg-xinit xorg-xrandr

* **misc:**
    pulseaudio pavucontrol mosh urxvt-font-size-git dmenu-history-xrdb-xft ttf-google-fonts-git hsetroot numix-themes parcellite
