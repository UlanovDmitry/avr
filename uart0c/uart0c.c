#include <avr/io.h>

//����������� ��������� �������
void USART_Init( unsigned int baudrate ); 
unsigned char USART_Receive( void ); 
void USART_Transmit( unsigned char data ); 

int main( void ) //������� �������
{// 51
	USART_Init(103); //�������� ���������� 9600 ���/� ��� ���������������� ATMega328P
	//for (unsigned char i=0x32;i<0x49;i++) //������ ����
	for(;;)
	{
		USART_Transmit(USART_Receive()); //�������� ��������� ������� �����
		//USART_Transmit(i);//0x36);
	}
}

void USART_Init(unsigned int baudrate) //������� ������������� USART
{
	UBRR0H = (unsigned char) (baudrate>>8);
	UBRR0L = (unsigned char) baudrate;
	//UCSRA = ( 1 << U2X); //������������� �������� ��������
	UCSR0B = (1 << RXEN0)|(1 << TXEN0); //���������� �� ����� � �� �������� ����� USART
	UCSR0C = (0 << USBS0)|(3 << UCSZ00);
}

unsigned char USART_Receive(void) //������� ������ ������
{
	while (!(UCSR0A & (1 << RXC0))); //�������� ������ �������
	return UDR0; //������� ����������� ������ ������ �������
}

void USART_Transmit( unsigned char data ) //������� �������� ������
{
	while (!(UCSR0A & (1 << UDRE0)) ); //�������� ����������� ������ ������
	UDR0 = data; //������ �������� ������
}
