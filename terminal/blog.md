https://github.com/microsoft/terminal/blob/master/doc/cascadia/SettingsSchema.md#profilesjson-documentation

### Splitting panes
To allow for more options when splitting panes, the splitHorizontal and splitVertical commands have been removed in favor of the new key binding format. Additionally, if you don’t provide a split direction, the Terminal will default to splitting using auto, which will split to provide the largest surface area.

```
{ "command": { "action": "splitPane", "split": "horizontal"}, "keys": "alt+shift+-" },
{ "command": { "action": "splitPane", "split": "vertical"}, "keys": "alt+shift+plus" }
```
### Focusing between panes
Originally, you could use moveFocusDown, moveFocusUp, moveFocusLeft, moveFocusRight as key binding commands to navigate between panes. We have removed these and have added the following formats as replacements:

```
{ "command": { "action": "moveFocus", "direction": "down" }, "keys": "alt+down" },
{ "command": { "action": "moveFocus", "direction": "up" }, "keys": "alt+up" },
{ "command": { "action": "moveFocus", "direction": "left" }, "keys": "alt+left" },
{ "command": { "action": "moveFocus", "direction": "right" }, "keys": "alt+right" }
```
### Resizing panes
To follow the same key binding architecture, the pane resizing commands (resizePaneDown, resizePaneUp, resizePaneLeft, resizePaneRight) have been removed. Below is the new format for resizing panes.

```
{ "command": { "action": "resizePane", "direction": "down" }, "keys": "alt+shift+down" },
{ "command": { "action": "resizePane", "direction": "up" }, "keys": "alt+shift+up" },
{ "command": { "action": "resizePane", "direction": "left" }, "keys": "alt+shift+left" },
{ "command": { "action": "resizePane", "direction": "right" }, "keys": "alt+shift+right" }
```
### Changing the font size
The following key binding commands allowed you to change your font size, but they are now removed: decreaseFontSize, increaseFontSize.

You can modify your font size by using the below key bindings, which use a delta that defines the font size change in points.

```
{ "command": { "action": "adjustFontSize", "delta": -1 }, "keys": "ctrl+-" },
{ "command": { "action": "adjustFontSize", "delta": 1 }, "keys": "ctrl+=" }
```