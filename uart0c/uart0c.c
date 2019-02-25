#include <avr/io.h>

//Перечисляем прототипы функций
void USART_Init( unsigned int baudrate ); 
unsigned char USART_Receive( void ); 
void USART_Transmit( unsigned char data ); 

int main( void ) //Главная функция
{// 51
	USART_Init(103); //Скорость соединения 9600 бит/с для микроконтроллера ATMega328P
	//for (unsigned char i=0x32;i<0x49;i++) //Вечный цикл
	for(;;)
	{
		USART_Transmit(USART_Receive()); //Отправка принятого символа назад
		//USART_Transmit(i);//0x36);
	}
}

void USART_Init(unsigned int baudrate) //Функция инициализации USART
{
	UBRR0H = (unsigned char) (baudrate>>8);
	UBRR0L = (unsigned char) baudrate;
	//UCSRA = ( 1 << U2X); //Устанавливаем удвоение скорости
	UCSR0B = (1 << RXEN0)|(1 << TXEN0); //Разрешение на прием и на передачу через USART
	UCSR0C = (0 << USBS0)|(3 << UCSZ00);
}

unsigned char USART_Receive(void) //Функция приема данных
{
	while (!(UCSR0A & (1 << RXC0))); //Ожидание приема символа
	return UDR0; //Возврат содержимого буфера приема символа
}

void USART_Transmit( unsigned char data ) //Функция отправки данных
{
	while (!(UCSR0A & (1 << UDRE0)) ); //Ожидание опустошения буфера приема
	UDR0 = data; //Начало передачи данных
}
