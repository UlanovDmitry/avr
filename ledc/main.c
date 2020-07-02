#define F_CPU 16000000UL

#include <avr/io.h>
#include <util/delay.h>
#include <avr/pgmspace.h>

const unsigned short digits[11] PROGMEM = {
    0x00fc,0x0018,0x016c,0x013c,0x0198,
    0x01b4,0x01f4,0x001c,0x01fc,0x01bc,0x0000  
};

int main (void) {

    DDRB |= _BV(DDB0); 

    while(1) {
        PORTB ^= _BV(PB0);
        _delay_ms(500);
    }
}

