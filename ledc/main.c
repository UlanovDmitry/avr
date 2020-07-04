#define DEBUG
#ifdef DEBUG
#define F_CPU 8000000UL
#define DELAY 100
#else
#define F_CPU 16000000UL
#define DELAY 1000
#endif

#include <avr/io.h>
#include <util/delay.h>
#include <avr/pgmspace.h>

const unsigned char digits[11] PROGMEM = {
    0x3f, 0x06, 0x5b, 0x4f, 0x66, 0x6d, 0x7d, 0x07, 0x7f, 0x6f, 0x00
};

int main (void) {

    DDRB |= _BV(DDB5); 
    DDRD |= _BV(DDD2);

    DDRC |= _BV(DDC0);
    PORTC |= _BV(PC0);
    // PORTC ^= _BV(PC0);

    while(1) {
        PORTB ^= _BV(PB5);
        PORTD ^= _BV(PD2);
        _delay_ms(DELAY);
    }
}

