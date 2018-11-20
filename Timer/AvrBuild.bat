@ECHO OFF
"C:\Program Files (x86)\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "C:\ProgAVR\Timer\labels.tmp" -fI -W+ie -C V2E -o "C:\ProgAVR\Timer\Timer.hex" -d "C:\ProgAVR\Timer\Timer.obj" -e "C:\ProgAVR\Timer\Timer.eep" -m "C:\ProgAVR\Timer\Timer.map" "C:\ProgAVR\Timer\Timer.asm"
