# My Emacs config


Copy these four things in your Home directory and voila you have your emacs setup!

To enable google-style-code check, install cpplint using, for debian-based distros: 

``
	sudo apt-get -y install python-pip
``

``
	sudo pip install cpplint
``

For fedora:


``
	sudo dnf -y install python-pip
``

``
	sudo pip install cpplint
``



There is an icon set included at `.emacs.d/emacs.iconset/emacs.iconset`

If you wish to change your Emacs icon to this iconset, use

``
	sudo emacs /usr/share/applications/emacs25.desktop 
``

and change the `Icon=` to

``
	Icon=/home/[yourusername]/.emacs.d/emacs.iconset/emacs.iconset/512x512.png
``
