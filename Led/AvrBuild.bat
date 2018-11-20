@ECHO OFF
"C:\Program Files (x86)\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "D:\ProgAVR\Led\labels.tmp" -fI -W+ie -C V2E -o "D:\ProgAVR\Led\Led.hex" -d "D:\ProgAVR\Led\Led.obj" -e "D:\ProgAVR\Led\Led.eep" -m "D:\ProgAVR\Led\Led.map" "D:\ProgAVR\Led\Led.asm"
