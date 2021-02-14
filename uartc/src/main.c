#define F_CPU 16000000UL

#include <avr/io.h>
#include <avr/pgmspace.h>
#include <util/delay.h>

#define byte unsigned char
#define _PMV(p, m, v) ((p & (~m)) | (v & m)) // установить значение по маске
#define mskPB 0x03                           // маски для портов
#define mskPD 0xfc
#define mskPC 0x0f
#define del 1 // продолжительность паузы


// массив цифр для индикатора, расширенный до 16 значений
const byte digits[16] PROGMEM = {0x3f, 0x06, 0x5b, 0x4f, 0x66, 0x6d,
                                 0x7d, 0x07, 0x7f, 0x6f, 0x00, 0x00,
                                 0x00, 0x00, 0x00, 0x00};

byte getDigit(int n); // получение цифры по номеру
void outDigit(byte dig, byte pos); // вывод цифры на позицию

int main(void) {

  byte dig;
  byte digs[4] = {2, 2, 1, 2};

  // инициализация
  DDRB |= mskPB;
  DDRD |= mskPD;
  DDRC |= mskPC;

  while (1) {
    byte cnt = 0;
    while (cnt < 4) {
      dig = getDigit(digs[cnt]);
      outDigit(dig, _BV(cnt));
      _delay_ms(del);
      cnt++;
    }
  }
}

byte getDigit(int n) {
  byte pos = (*((byte *)&n)) & 0x0f; // обрезаем позицию до 16
  return pgm_read_byte(&digits[pos]);
}

void outDigit(byte dig, byte pos) {
  PORTC = _PMV(PORTC, mskPC, 0xff);       // тушим все выходы
  PORTB = _PMV(PORTB, mskPB, (dig >> 6)); // кусочек для порта B
  PORTD = _PMV(PORTD, mskPD, (dig << 2)); // кусочек для порта D
  PORTC = _PMV(PORTC, mskPC, ~pos); // зажигаем нужный выход
}
