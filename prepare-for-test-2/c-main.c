#include <stdio.h>
#include <stdint.h>

char sentence[] = "Hello there"; 
void swap_letters();
void change_letters();
void swap_bytes(); 
void convert_number();
void index_to_array();
void change_pointer();

int val = 255;
uint8_t value = 10;
uint64_t new_value = 0;
int position = 2;
int  var = 20;   /* actual variable declaration */
   int  *ip;        /* pointer variable declaration */

   

void bin(unsigned n)
{
  puts("");
    unsigned i;
    for (i = 1 << 15; i > 0; i = i / 2)
        (n & i) ? printf("1") : printf("0");
}
 

int main() {
  
   
  ip = &var;  
   printf("Value of *ip variable: %d\n", *ip );
   *ip = 33;
   printf("Value of *ip variable: %d\n", *ip );
   change_pointer();
    printf("Value of *ip variable: %d\n", *ip );
}  
