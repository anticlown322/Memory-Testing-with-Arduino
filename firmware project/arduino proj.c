#include <mega328p.h>
#include <delay.h>

#define E PORTB.4
#define D PORTC.5
#define W PORTD.4
#define Q PORTD.5
#define A5 PORTC.0
#define A6 PORTC.1
#define A9 PORTC.2
#define A8 PORTC.3
#define A7 PORTC.4
#define A0 PORTB.3
#define A1 PORTB.2
#define A2 PORTB.1
#define A3 PORTB.0
#define A10 PORTD.7
#define A11 PORTD.6
#define A4  PORTB.5

#define A(offset) A0 = offset & 0b00000000000000000000000000000001; \
    A1 = offset & 0b00000000000000000000000000000010; \
    A2 = offset & 0b00000000000000000000000000000100; \
    A3 = offset & 0b00000000000000000000000000001000; \
    A4 = offset & 0b00000000000000000000000000010000; \
    A5 = offset & 0b00000000000000000000000000100000; \
    A6 = offset & 0b00000000000000000000000001000000; \
    A7 = offset & 0b00000000000000000000000010000000; \
    A8 = offset & 0b00000000000000000000000100000000; \
    A9 = offset & 0b00000000000000000000001000000000; \
    A10 = offset & 0b00000000000000000000010000000000; \
    A11 = offset & 0b00000000000000000000100000000000;

void writeZeroCycle(){                         
    
    unsigned int dataOffset = 0;               
                      
    D = 0;
    
    while (dataOffset < 4096) {
        E = 0;
        
        E = 1;
        W = 0;
        A(dataOffset)

        W = 1;
        delay_ms(5);
        
        W = 0;
        delay_ms(5);

        dataOffset++;
    }
}

void main(void) {
    writeZeroCycle();
}