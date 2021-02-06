//***************************************************************************
//
// Program for education in subject "Assembly Languages"
// petr.olivka@vsb.cz, Department of Computer Science, VSB-TUO
//
// Example of linking of two modules in C.
//
//***************************************************************************

#include <stdio.h>
char g_znak;
int g_cislo32;
long g_cislo64;
int g_index = 2;
int g_hodnota = 125;

char g_pole_znaky[128] = "Pozdrav z prednasky!";
int g_pole_cislo32[10] = {0,1,2,3,4,5,6,7,8,9};
long g_pole_cislo64[10] = {0,1,4,3,4,5,6,7,8,9};

void nastav_promenne();
void presun_promenne();
void nastav_pole_znaku();

void nastav_pole_cislo64();
void nastav_pole_cislo32_index_32();
void nastav_pole_cislo_32_index();

void presun_pole_znaky_cislo32();

void print_pole_cislo32()
{
  for (int i = 0; i < 10; i++)
  {
    printf("%d ",g_pole_cislo32[i]);
  }
}

void print_pole_cislo64()
{
  for (int i = 0; i < 10; i++)
  {
    printf("%ld ",g_pole_cislo64[i]);
  }
  puts("");
}

int main()
{
  printf("g_znak %c g_cislo32 %d g_cislo64 %ld\n",g_znak,g_cislo32,g_cislo64);
  nastav_promenne();
  printf("g_znak %c g_cislo32 %d g_cislo64 %ld\n",g_znak,g_cislo32,g_cislo64);
  presun_promenne();
  printf("g_znak %c g_cislo32 %d g_cislo64 %ld\n",g_znak,g_cislo32,g_cislo64);
  printf("g_pole_znaky '%s'",g_pole_znaky);
  nastav_pole_znaku();
  printf("g_pole_znaky '%s'\n",g_pole_znaky);
  nastav_pole_cislo64();
  print_pole_cislo64();
  nastav_pole_cislo_32_index();
  print_pole_cislo32();
  nastav_pole_cislo32_index_32();
  printf("\n\n%d",g_pole_cislo32[g_index]);
  }