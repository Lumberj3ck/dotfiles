To sync all files 

Dry run 
```bash
stow -n -v .
```

Apply the dotfiles, including the Plasma virtual desktop widget:

```bash
stow --restow -v .
```

The widget requires Plasma 6. Add **Virtual Desktop Occupancy** to a panel
after stowing the repository.

To install or update only the widget without stowing everything:

```bash
kpackagetool6 --type Plasma/Applet --upgrade \
  .local/share/plasma/plasmoids/local.currentdesktop
```
