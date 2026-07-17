#!/data/data/com.termux/files/usr/bin/bash
# ============================================
#  LaiLightSMP Tool v1.1
#  Description: Shizuku Service Helper via OTG
#  Developed with AI Assistance
# ============================================

# Function: Check if device is properly connected
check_device() {
    clear
    echo "[*] Checking Device Connection..."
    
    # Step 1: Check if any device is listed
    DEVICE_COUNT=$(adb devices | grep -w "device" | wc -l)
    
    if [ "$DEVICE_COUNT" -eq 0 ]; then
        echo "[!] Error: No device found."
        echo "    1. Check OTG Cable"
        echo "    2. Enable USB Debugging on Target Phone"
        return 1
    fi

    # Step 2: Check device state - more reliable than 'adb devices'
    STATE=$(adb get-state 2>/dev/null)
    
    if [ "$STATE" != "device" ]; then
        echo "[!] Error: Device found but not ready. State: $STATE"
        echo "    Accept the RSA prompt on target phone."
        return 1
    fi

    # Step 3: Get Device Model for confirmation
    MODEL=$(adb shell getprop ro.product.model 2>/dev/null | tr -d '\r')
    echo "[+] Success: Device Connected!"
    echo "[+] Model: $MODEL"
    echo "[+] State: $STATE"
    return 0
}

# Main Menu Loop
while true; do
    clear
    echo "===================================="
    echo "    LaiLightSMP Tool v1.1"
    echo "===================================="
    echo " 1. Device Connection Check"
    echo " 2. Start Shizuku Service via OTG"
    echo " 3. Exit"
    echo "===================================="
    read -p "Enter Option: " choice

    case $choice in
        1)
            # Call the connection check function
            check_device
            read -p "Press Enter to go back to Menu..."
            ;;
        2)
            # Before sending command, first check connection
            if check_device; then
                echo "[*] Device is ready. Starting Shizuku..."
                # NOTE: Replace with your actual Shizuku start path
                adb shell sh /sdcard/Android/data/moe.shizuku.privileged.api/start.sh
                
                # Check if command executed successfully
                if [ $? -eq 0 ]; then
                    echo "[+] Command sent successfully!"
                else
                    echo "[!] Failed to send command. Check Shizuku path."
                fi
            else
                echo "[!] Cannot start. Please fix connection first."
            fi
            read -p "Press Enter to go back to Menu..."
            ;;
        3)
            echo "[*] Exiting... Thanks for using LaiLightSMP!"
            exit 0
            ;;
        *)
            echo "[!] Invalid Option! Please enter 1, 2 or 3."
            sleep 2
            ;;
    esac
done