#include <stdio.h>
#include <stdint.h>

void speechspeed();
void combine_items();
void belt_move();
void combine();
void box_take_items();
void assembler();

char sentence[] = "tezkyukol";
uint32_t belt[] = {
  0x11112222, 0x33334444,
  0x55556666, 0x77778888,
  0x9999AAAA, 0xBBBBCCCC
};

int64_t chest[8] = {
  0x1111111111111111, 0x2222222222222222, 0x3333333333333333, 0x4444444444444444,
  0x5555555555555555, 0x6666666666666666, 0x7777777777777777, 0x8888888888888888
};
uint16_t itemsIndexes = 0x0204; // vynuluj index 2 a 4 v poli

int32_t belt1[] = {0x1234ffff, 0x5678ffff, 0xaabbffff, 0xccd1ffff};
int32_t belt2[] = {0xaaaabbbb, 0xccccdddd, 0xeeee1111, 0x22223333};
int64_t final_product; // expected 0x1234bbbbaaaa5678

void print_belt()
{
  for(int i =0; i < 6; i++)
  {
    printf("0x%x ",belt[i]);
  }
  puts("");
  return;
}

uint16_t left = 0x1234;
uint16_t right = 0xabcd;
uint32_t combined;

uint32_t before_combined = 0x1234abcd;
uint32_t split_left = 0xffffffff; // ocekavame nastaveni hodnoty 0x12340000
uint32_t split_right = 0xffffffff; // ocekavame nastaveni hodnoty 0x0000abcd
int main() {
  printf("'%s' ... ", sentence);
  speechspeed();
  printf("'%s'\n", sentence);
  combine_items();
  printf("Combining 0x%x with 0x%x makes 0x%x\n", left, right, combined);
  printf("belt before ");
  print_belt();
  belt_move();
  printf("belt after ");
  print_belt();
  combine();
  printf("before_combined = %08x split_left = %08x split_right = %08x\n", before_combined, split_left, split_right);
  box_take_items();
  for(int i = 0; i < 8; i++) 
  {
  printf("%016lx ", chest[i]);
  }
  assembler();
  printf("\n");
  printf("assembled 0x%lx\n",final_product);
  return 0;  
}
