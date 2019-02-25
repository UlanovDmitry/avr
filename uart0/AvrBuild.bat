@ECHO OFF
"C:\Program Files (x86)\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "C:\ProgAVR\uart0\labels.tmp" -fI -W+ie -C V2E -o "C:\ProgAVR\uart0\uart0.hex" -d "C:\ProgAVR\uart0\uart0.obj" -e "C:\ProgAVR\uart0\uart0.eep" -m "C:\ProgAVR\uart0\uart0.map" "C:\ProgAVR\uart0\uart0.asm"
