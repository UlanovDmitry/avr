#include <avr/io.h>

#define FOSC 8000000 // Clock Speed
#define BAUD 9600
#define MYUBRR FOSC/16/BAUD-1

void USART_Init(unsigned int ubrr);
void USART_Transmit( unsigned char data );

int main(void) {
	USART_Init(MYUBRR);
    USART_Transmit('A');
	return 0;
}

void USART_Init(unsigned int ubrr) {
	UBRR0H = (unsigned char)(ubrr>>8);
	UBRR0L = (unsigned char)ubrr;
	UCSR0B = (1<<RXEN0)|(1<<TXEN0);
	UCSR0C = (1<<USBS0)|(3<<UCSZ00);
}

void USART_Transmit( unsigned char data )
{
    while (!(UCSR0A & (1<<UDRE0)));
    UDR0 = data;
}
