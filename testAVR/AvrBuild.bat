@ECHO OFF
"C:\Program Files (x86)\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "G:\ProgMCU\testAVR\labels.tmp" -fI -W+ie -C V2E -o "G:\ProgMCU\testAVR\testAVR.hex" -d "G:\ProgMCU\testAVR\testAVR.obj" -e "G:\ProgMCU\testAVR\testAVR.eep" -m "G:\ProgMCU\testAVR\testAVR.map" "G:\ProgMCU\testAVR\testAVR.asm"
