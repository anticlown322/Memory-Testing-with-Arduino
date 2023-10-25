/*
 * test.c
 *
 * Created: 10/25/2023 12:04:34 AM
 * Author: qwerr
 */

#include <mega328p.h>
#include <delay.h>

void main(void) {
    int i = 0;
    while(1){                                                                                               
        i = i ^ 1;
        delay_ms(1000);
        PORTB = (i<<PORTB7)|(i<<PORTB6)|(i<<PORTB5)|(i<<PORTB4)|(i<<PORTB3)|(i<<PORTB2)|(i<<PORTB1)|(i<<PORTB0);
    }
}
