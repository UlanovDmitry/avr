#define F_CPU 16000000UL
#define BAUD 9600
#define UBRRN F_CPU/16/BAUD-1
#include <avr/io.h>
#include <util/delay.h>
#include <string.h>

//����������� ��������� �������
void uartInit( unsigned int baudrate ); 
int writeSerial(char* str);

//���������� ����������
register unsigned char i asm("r22");

int main( void ) 
{
	uartInit(UBRRN);	
	for(;;)
	{
		_delay_ms(1000);
		writeSerial("Hello World!\r\n");
	}
}
void uartInit(unsigned int baudrate) //������� ������������� USART
{
	UBRR0H = (unsigned char) (baudrate>>8);
	UBRR0L = (unsigned char) baudrate;
	//UCSRA = ( 1 << U2X); //������������� �������� ��������
	UCSR0B = (1 << RXEN0)|(1 << TXEN0); //���������� �� ����� � �� �������� ����� USART
	UCSR0C = (0 << USBS0)|(3 << UCSZ00); // 8N1
}
int writeSerial(char* str)
{
	for(i=0;strlen(str); i++)
	{
		while(!(UCSR0A&(1<<UDRE0))){}; // wait ready of port
		UDR0 = str[i];
	}
	return 0;
}

