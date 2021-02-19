#include <stdio.h>
#include <stdint.h>

unsigned short g_rgb565_b1 = 0b1100011100011000;
unsigned short g_rgb565_b2 = 0b0000011100001110;

char g_char_array[4] = {90,90,90,90};
char g_char_mean = 0;

int g_number = 33333;

void move_blue();
void number_mul100(); //x*100 = x*(96+4) = x*[32+64+4]
void mean_char_array();

int main() {
  printf("b1 %04x b2 %04x\n", g_rgb565_b1, g_rgb565_b2);
  move_blue();
  printf("b1 %04x b2 %04x\n", g_rgb565_b1, g_rgb565_b2);
  mean_char_array();
  printf("mean %d\n", g_char_mean);
  printf("%d",g_number);
  return 0;  
}
