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
I should review the specific differences between them and tie into them,   
rather than blindly overriding all of them... (Probably by adding source   
lines to the end of each that reference the versions in the repo.)   
[Dot files explained](http://mywiki.wooledge.org/DotFiles)

This is no [Awesome-shell](https://github.com/alebcay/awesome-shell)
