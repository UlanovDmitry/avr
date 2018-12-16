@ECHO OFF
"C:\Program Files (x86)\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "C:\ProgAVR\Meander\labels.tmp" -fI -W+ie -C V2E -o "C:\ProgAVR\Meander\Meander.hex" -d "C:\ProgAVR\Meander\Meander.obj" -e "C:\ProgAVR\Meander\Meander.eep" -m "C:\ProgAVR\Meander\Meander.map" "C:\ProgAVR\Meander\Meander.asm"
