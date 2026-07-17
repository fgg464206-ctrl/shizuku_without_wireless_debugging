#!/bin/bash

# LaiLightSMP Tool Installer
echo "[*] Installing dependencies..."

# টার্মাক্সে প্রয়োজনীয় প্যাকেজ আপডেট ও ইন্সটল করা
pkg update && pkg upgrade -y
pkg install adb git curl -y

# প্রধান স্ক্রিপ্টটি ডাউনলোড করা
echo "[*] Downloading Shizuku Without Wireless Debugging Tool..."
curl -sL [আপনার_প্রধান_স্ক্রিপ্টের_Raw_লিঙ্ক] -o shizuku_without_wireless_debugging.sh

# পারমিশন সেট করা
chmod +x shizuku_without_wireless_debugging.sh

echo "===================================="
echo " Installation Complete!"
echo " টুলটি চালু করতে লিখুন: ./shizuku_without_wireless_debugging.sh"
echo "===================================="
