#!/bin/bash
PREFIX=${PREFIX:-~/.local}
echo $PREFIX

mkdir -p $PREFIX/share/krunner/dbusplugins
mkdir -p $PREFIX/share/yubioath-krunner-wayland
mkdir -p ~/.config/autostart
mkdir -p ~/.config/yubioath-krunner-wayland

python3 -m venv "$PREFIX/share/yubioath-krunner-wayland"

$PREFIX/share/yubioath-krunner-wayland/bin/pip install --upgrade --no-input --quiet --disable-pip-version-check pip
$PREFIX/share/yubioath-krunner-wayland/bin/pip install --no-input --quiet --upgrade --disable-pip-version-check -r requirements.txt

cp yubioath-krunner-wayland.config ~/.config/yubioath-krunner-wayland/config
cp yubioath-krunner-wayland.desktop $PREFIX/share/krunner/dbusplugins
cp yubioath-krunner-wayland.py $PREFIX/share/yubioath-krunner-wayland

cat > "$HOME/.config/autostart/yubioath-krunner-wayland.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=yubioath-krunner-wayland
Exec=$PREFIX/share/yubioath-krunner-wayland/bin/python3 $PREFIX/share/yubioath-krunner-wayland/yubioath-krunner-wayland.py
X-GNOME-Autostart-enabled=true
Terminal=false
EOF
