# docker-dwarffortress-novnc
### Why
I wanted to run dwarf fortress on a headless server and be able to manage my dwarves via browser. There are already a few repositories dealing with this but they're either outdated or they lack dfhack. 

### How-to
1. docker-compose up -d df
2. browse to localhost:8080 and connect!

Dwarf Fortress should be running in workspace 1 with the dfhack console in workspace 2

I've added the keyboard shortcuts ctrl+shift F1..12 to switch between workspaces. Default shortcut (win + 1..12) doesn't work very well in a browser if you're on windows...

### Todo
- minify
- use newer ubuntu-distro
- parameterize
- proper wait for fluxbox
- try using the linux lnp

### Thanks to
- [Dwarf Fortress](http://www.bay12games.com/dwarves/)
- [DFHack](https://github.com/DFHack/dfhack)
- [noVNC](https://novnc.com/info.html)

### Inspired by
- https://hub.docker.com/r/ubergarm/dwarf-fortress/(https://github.com/ubergarm/dwarf-fortress)
- https://github.com/bencawkwell/dockerfile-dwarffortress
- https://github.com/JonathanGerlach/DwarfFortress-on-Docker
- https://github.com/gotget/docker-novnc