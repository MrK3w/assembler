#include <stdio.h>
#include <stdint.h>


void move_blue();
void number_mul100(); //x*100 = x*(96+4) = x*[32+64+4]
void mean_char_array();
void suma_int_array();
void count_numbers();
void string_len();
void array_len();
void rgb888_to_rgb565();
void enemy_selector();
void login_i32();
void chat_cleaner();
void attack_simulator();
void prevodnik();
void positive_censure();

char pal[128];
uint8_t is_palindrom;

int16_t rousek;
int16_t respiratoru;
int16_t skafandru;
char negative[];
uint32_t rgb888 = 0xF22ECE;
uint16_t rgb565;
int32_t nums[] = {-1,100,123,32};
int64_t result[] = {0,0,0,0};  /* 32 + 16 + 8 + 1*/
int len = 4;
unsigned short g_rgb565_b1 = 0b1100011100011000;
unsigned short g_rgb565_b2 = 0b0000011100001110;
char negative[] = "dalsi tezky ukol :( (a v asembleru)";
char chat_message[] = "pReVedTe cOol tExT z cHatu dO ciTelneJSI podObY. tEntO tExT sE uZ neZobrAzI.";

int16_t selectedEnemy = 1; // nepritel na prvni pozici s 500 hp
int16_t health_in_rounds[32]; // 260, 20, -220
int rounds; // 3

char g_char_array[4] = {90,90,90,90};
char g_char_mean = 0;
int g_suma = 0;
int g_kladna = 0;
int g_zaporna = 0;
int g_number = 3333; //64+32+4  
char g_string[] = "Hello from FEI!";
int g_string_len = 0;
int g_int_array[10] = {-10,0,-30,40,50,99,60,80,90,100};
void string_low();

int16_t enemyHps[] = {100,500,18000,-50};
uint32_t enemiesCount = sizeof(enemyHps)/sizeof(*enemyHps);
uint16_t strongestEnemyHP;
uint32_t strongestEnemy;

int main() {
  enemy_selector();
  printf("Strongest enemy at position %d with %d HP\n", strongestEnemy, strongestEnemyHP);
  chat_cleaner();
  printf("%s\n",chat_message);
  attack_simulator();
  printf("Rounds: %d\n", rounds);
  for (int i = 0; i < rounds; i++)
  {
    printf("Round %d: %d hp, ",i+1,health_in_rounds[i]);
  }
  puts("");
  respiratoru = 4;
  prevodnik();
  printf("chirurgicke oblicejove rousky: %d, respiratoru tridy FFP2: %d, skafandru: %d\n", rousek, respiratoru, skafandru);
  respiratoru = 30;
  prevodnik();
  printf("chirurgicke oblicejove rousky: %d, respiratoru tridy FFP2: %d, skafandru: %d\n", rousek, respiratoru, skafandru);
  printf("%s",negative);
  
  return 0;  
}
