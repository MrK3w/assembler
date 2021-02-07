//***************************************************************************
//
// Program for education in subject "Assembly Languages"
// petr.olivka@vsb.cz, Department of Computer Science, VSB-TUO
//
// Empty project
//
//***************************************************************************
#include <stdint.h>
#include <stdio.h>

// Variables
void swap_endian();
void build_login();
void prohod();
void apps_max_matrix();
void convert8_to_64();

int16_t login_num = 0x0056;
char letters[] = "PIE";

int32_t digits[] = {'0','0','5','6'};

char login[] = "XAMET PRO VYTVORENY LOGIN";

uint32_t apps_max[32] = {7,7,7,3,4,5,3,4,5};

char g_auto[] = "urasur";

int8_t remaining_point = -12;

int64_t cheaters_remaining_points;

void print_matrix()
{
    for (int i = 0; i < 10; i++)
    {
        printf("%d ",apps_max[i]);
    }
    puts("");
}
int main()
{
    swap_endian();
    build_login();
    apps_max_matrix();
    print_matrix();
    printf("%s\n",login);
    //printf("%04X\n",login_num);
    convert8_to_64();
    printf("%ld",cheaters_remaining_points);
}
