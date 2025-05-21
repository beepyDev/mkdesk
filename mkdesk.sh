#!/bin/bash

# Make a .desktop file from the arguments
# Usage: mkdesk.sh Name Comment "Exec command" IconPath_or_false Terminal(true/false)
# If IconPath is 'false', the Icon line will be omitted.

if [ "$#" -ne 5 ]; then
    echo "Usage: mkdesk Name Comment \"Exec command\" IconPath_or_false Terminal(true/false)"
    exit 1
fi

NAME="$1"
COMMENT="$2"
EXEC="$3"
ICON="$4"
TERMINAL="$5"

# Sanitize .desktop filename (remove spaces, special chars)
FILENAME="${NAME// /_}.desktop"

# Create the .desktop file
cat > "$FILENAME" <<EOF
[Desktop Entry]
Type=Application
Name=$NAME
Comment=$COMMENT
Exec=$EXEC
EOF

# Add Icon line only if ICON is not 'false'
if [ "$ICON" != "false" ]; then
    echo "Icon=$ICON" >> "$FILENAME"
fi

echo "Terminal=$TERMINAL" >> "$FILENAME"

chmod +x "$FILENAME"
echo "$FILENAME created successfully."

# Move to ~/.local/share/applications/ so it's runnable from anywhere
TARGET_DIR="$HOME/.local/share/applications"
mkdir -p "$TARGET_DIR"
mv "$FILENAME" "$TARGET_DIR/"
echo "$FILENAME moved to $TARGET_DIR. It should now appear in your application menu."

echo -e "\e[36mmkdesk by \e]8;;https://github.com/beepyDev\a\e[36mbeepyDev\e[0m\e]8;;\a"