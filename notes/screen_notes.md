Common and Useful Screen Commands
==================================
Re-attach screen   
`screen -r`  

See what screens are available  
`screen -ls`    

Attach to screen with _name_ or create a new session  
`screen -r <name>`

Common keybindings
------------------
Keybindings help   
`^a ?`   

Create new window   
`^a c`   

Toggle between two windows   
`^a ^a`
	
Switch to next window   
`^a ^n`

Screen Splitting/Management
---------------------------
Split horizontally  
^a S	
Jump to next display region  	
^a [tab]	  
Remove current display region  
^a X		
Remove all regions except current  
^a Q		
Split vertically  
^a |		

Share Screens
-------------

Create the screen session  
```screen -d -m -S shared```

Join the screen session  
```screen -x shared```
