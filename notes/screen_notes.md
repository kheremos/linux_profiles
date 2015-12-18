Screen Commands
==================================
| Command            |                                                      |
|--------------------|------------------------------------------------------|
| `screen -r`        | Re-attach screen                                     |
| `screen -ls`       | List available screens                               |
| `screen -r *name*` | Attach to screen with *name* or create a new session |
| `screen -d`        | Detach screen session                                |
| `exit`             | Close current screen session (tab)                   | 

Common keybindings
------------------
| Common keybindings     | Help and Navigation        |
|------------------------|----------------------------|
| `^a ?`                 | Keybindings help           |
| `^a ^a`                | Toggle between two windows |
| `^a ^n`                | Switch to next window      |
| `^a ^p`                | Switch to previous window  |

| Screen Splitting/Management |                               |
|-----------------------------|-------------------------------|
| `^a c`                      | Create new window             |
| `^a A`                      | Rename current window         |
| `^a ^S`                     | Split horizontally            |
| `^a ^|`                     | Split vertically              |
| `^a ^*tab*`                 | Jump to next display region   |
| `^a X`                      | Remove current display region |
| `^a Q`                      | Remove all other regions      |

Share Screens
-------------
Create the shared screen session  
```screen -d -m -S shared```
Join the screen session  
```screen -x shared```
