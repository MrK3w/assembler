//***************************************************************************
//
// Program for education in subject "Assembly Languages"
// petr.olivka@vsb.cz, Department of Computer Science, VSB-TUO
//
// Empty project
//
//***************************************************************************
#include <stdio.h>

// Variables
char g_pozdrav[] = "APPS testik";

void testik();

int main()
{
    char* l_p_char = g_pozdrav;
    printf("%s",g_pozdrav);
    l_p_char[3] = '5';
    printf("%s\n", g_pozdrav);
    testik();
    printf("%s\n", g_pozdrav);

}
