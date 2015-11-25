# linux_profiles
A repo to hold a wide variety of linux notes, profiles and scripts.   
This repo basically acts a remote 'brain'.   
*requires: git*

Can be quickly set up on a system as follows...   
```bash
git clone https://github.com/kheremos/linux_profiles.git
. ./update.sh
```
(Review update.sh, you should never run arbitrary scripts without reviewing them)   

Update profiles and configuration:   
```. update.sh```

##### NOTE:
I'm not fully respecting the intentions of the various configuration files.   
The specific differences between them should be reviewed and tied into,   
rather than blindly overriding some of them... (Probably by adding source   
lines to the end of each that reference the versions in the repo.)   
[Dot files explained](http://mywiki.wooledge.org/DotFiles)

This is no [Awesome-shell](https://github.com/alebcay/awesome-shell)

Practices to evolve towards [Portable-Shell](http://www.gnu.org/savannah-checkouts/gnu/autoconf/manual/autoconf-2.69/html_node/Portable-Shell.html)
