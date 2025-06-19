# mkdesk

> mkdesk is a quick-and-dirty script to create `.desktop` files for any command. I made it because I'm too lazy to write the .desktop files myself.

## ✨ What it does
`mkdesk.sh` creates a desktop-launcher file for any command, moves it to `~/.local/share/applications/`, and makes it executable so it shows up in your application menu right away.

## 🛠  Requirements
- Any POSIX-flavored shell (written & tested in `bash`)
- Linux desktop environment that reads `.desktop` files (GNOME, KDE, XFCE, etc.)

## 📦 Installation
```bash
# clone (or just copy the script into a file)
$ git clone https://github.com/beepyDev/mkdesk.git
$ cd mkdesk

# make it executable & move it somewhere in your $PATH
$ chmod +x mkdesk.sh
$ sudo mv mkdesk.sh /usr/local/bin/mkdesk
```

## 📝 Usage
```bash
$ mkdesk.sh Name Comment "Exec command" IconPath_or_false Terminal(true/false)
```
> *Note: IconPath_or_false can be "false" to omit the Icon line.*

### Example usage:
```bash
$ mkdesk.sh "Brave Browser" "Launch Brave Browser" "brave" "~/Downloads/brave.png" true
```

## 📜 License
[WTFPL](https://choosealicense.com/licenses/wtfpl/)
