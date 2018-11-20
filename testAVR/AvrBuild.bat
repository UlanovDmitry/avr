@ECHO OFF
"C:\Program Files (x86)\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "D:\ProgAVR\testAVR\labels.tmp" -fI -W+ie -C V2E -o "D:\ProgAVR\testAVR\testAVR.hex" -d "D:\ProgAVR\testAVR\testAVR.obj" -e "D:\ProgAVR\testAVR\testAVR.eep" -m "D:\ProgAVR\testAVR\testAVR.map" "D:\ProgAVR\testAVR\testAVR.asm"
