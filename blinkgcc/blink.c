#include <avr/io.h>
#define F_CPU 1000000UL // частота резонатора 1МГц
#include <util/delay.h>

int main(void) {
    // макрос _BV(число) заменяет конструкцию (1 << число)
    DDRB |= _BV(PB0); // аналог pinMode(PB0,OUTPUT); в Wiring
    for (;;) {
    PORTB ^= _BV(PB0); // инвертируем состояние порта PB0
    _delay_ms(1000); // ждем 1 секунду
    }
    return 0;
}
