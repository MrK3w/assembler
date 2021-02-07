//***************************************************************************
//
// Program for education in subject "Assembly Languages"
// petr.olivka@vsb.cz, Department of Computer Science, VSB-TUO
//
// Empty project
//
//***************************************************************************
#include <stdio.h>

union Rozklad
{
    char m_heslo[9];
    long m_long;
    int m_inty[2];
};

#define sw(a, b, c) c = a; a = b; b = c;


// Variables

int main()
{
    int l_int = 0x12345678;
    char *l_p_char = (char *) &l_int;
    char tmp;
    printf("int %X\n", l_int);
    sw(l_p_char[0], l_p_char[3],tmp);
    sw(l_p_char[1], l_p_char[2],tmp);
    printf("int %X\n", l_int);

    char l_heslo[9] = "MeRcEdEs";
    long l_long = 0;
    l_long = * (long *) l_heslo;
    printf("heslo %s long %lx\n", l_heslo, l_long);
    l_long |= 0x2020202020202020;
    * (long *) l_heslo = l_long;
    printf("heslo %s long %lx\n", l_heslo, l_long);

    int *l_p_int = (int * )&l_long;
    printf("long %lx hi_long %x lo_long %x\n",l_long, l_p_int[1], l_p_int[0]);

    union Rozklad u;
    u.m_long = l_long;
    u.m_heslo[8] = 0;
    printf("heslo %s hi_long %x lo_long %x\n",u.m_heslo, u.m_inty[1], u.m_inty[0]);

}
