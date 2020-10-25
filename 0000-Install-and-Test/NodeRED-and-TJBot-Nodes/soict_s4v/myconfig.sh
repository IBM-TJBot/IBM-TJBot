#!/bin/bash
#---------------------------------------------------------------------------
echo "ĐẶT TÊN TJBOT"
echo "Tên hiện tại của TJBot là: " $(cat /home/pi/Desktop/soict_s4v/id.txt)
read -p "Có muốn đặt lại tên không? [y/N] " choice </dev/tty
case "$choice" in
    "y" | "Y")
        read -p "    Tên mới: " newname </dev/tty
        echo $newname > /home/pi/Desktop/soict_s4v/id.txt
        ;;
    *) ;;
esac
#---------------------------------------------------------------------------
echo "CÀI ĐẶT LOA BLUETOOTH"
echo "Hãy bật loa bluetooth ở chế độ dò tìm ghép cặp pair trước."
echo "Sau đó phần mềm sẽ tự dò tìm thiết bị. Hãy đợi cho tới khi thiết bị  BT_SPEAKER hiện ra thì bấm Ctrl+C để dừng quá trình scan. Copy và dán địa chỉ Bluetooth vào phần trả lời kế tiếp."
echo "Khi nghe thấy tiếng tút, tức là loa bluetooth đã kết nối thành công"
read -p "Bạn muốn kết nối loa ngoài với TJBot qua bluetooth ngay bây giờ không? [y/N] " choice </dev/tty
case "$choice" in
    "y" | "Y")
        bluetoothctl agent on 
        #bluetoothctl default-agent
        bluetoothctl scan on
        read -p "Hãy nhập vào Địa chỉ bluetooth của loa muốn kết nối: " bluetoothaddress </dev/tty
        bluetoothctl pair $bluetoothaddress  #BT Speaker 01:BF:12:27:12:C5
        bluetoothctl trust $bluetoothaddress
        bluetoothctl connect $bluetoothaddress 
        ;;
    *) ;;
esac

#---------------------------------------------------------------------------
echo "CÀI ĐẶT MẬT KHẨU MẠNG WIFI"
echo "Hãy lần lượt chọn Network Options / Wireless LAN / nhập tên mạng WiFi vào ô SSID / nhập mật khẩu vào ô passphrase / bấm OK."
read -p "Bạn muốn kết nối TJBot với mạng WiFi ngay bây giờ không? [y/N] " choice </dev/tty
case "$choice" in
    "y" | "Y")
        sudo raspi-config
        ;;
    *) ;;
esac 

#---------------------------------------------------------------------------
echo "CÀI TÀI KHOẢN IBM CLOUD"
echo "Hãy sửa, hoặc ghi đè file /home/pi/Desktop/soict_s4v/tests/.env "
echo "Và file /home/pi/Desktop/labs/.env sẽ được softlink tới file trên."
read -p "Bạn có muốn mở file này để sửa luôn không? [y/N] " choice </dev/tty
case "$choice" in
    "y" | "Y")
        nano /home/pi/Desktop/soict_s4v/tests/.env
        ;;
    *) ;;
esac 