@ECHO OFF
"C:\Program Files (x86)\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "G:\ProgAVR\Timer\labels.tmp" -fI -W+ie -C V2E -o "G:\ProgAVR\Timer\Timer.hex" -d "G:\ProgAVR\Timer\Timer.obj" -e "G:\ProgAVR\Timer\Timer.eep" -m "G:\ProgAVR\Timer\Timer.map" "G:\ProgAVR\Timer\Timer.asm"
