//***************************************************************************
//
// Program for education in subject "Assembly Languages"
// petr.olivka@vsb.cz, Department of Computer Science, VSB-TUO
//
// Empty project
//
//***************************************************************************

#include <stdio.h>
#include <stdint.h>

int32_t fn(); 

int32_t array_to_rgb888(uint8_t* color)
{
    return color[0] << 16 | color[1] << 8 | color[2];
}

uint8_t rgb888_red(uint32_t red_color)
{
    return red_color >> 16;
}

uint8_t rgb888_green(uint32_t green_color)
{
    return green_color >> 8;
}

uint8_t rgb888_blue(uint32_t blue_color)
{
    return blue_color;
}


uint32_t rgb888_to_rgb565(uint32_t color)
{
   return (rgb888_red(color) >> 3) << 11 | (rgb888_green(color) >> 2) << 5 | rgb888_blue(color) >> 3;
}

void rgb565_set_green(uint16_t* color, uint8_t green)
{
    *color = (*color & 0xF81F) | (green >> 2) << 5;
}


int main() 
{
    uint8_t red[] = {0xFF, 0x00, 0x00};
    uint8_t green[] = {0x00, 0xFF, 0x00};
    uint8_t blue[] = {0x00, 0x00, 0xFF};
    uint8_t rand_color[] = {0xAB, 0xCD, 0xE1};
    
    printf("RED 0x%06X\n", array_to_rgb888(red));
    printf("GREEN 0x%06X\n", array_to_rgb888(green));
    printf("BLUE 0x%06X\n", array_to_rgb888(blue));
    printf("rand color 0x%06X\n", array_to_rgb888(rand_color));

    uint32_t rgb888 = 0x123456;
    printf(
  "0x%06X RED = %02X, GREEN = %02X, BLUE = %02X\n",
  rgb888,
  rgb888_red(rgb888),
  rgb888_green(rgb888),
  rgb888_blue(rgb888)
);

    rgb888 = 0xFF0000;
printf("RGB888 0x%06X -> RGB565 0x%04X\n", rgb888, rgb888_to_rgb565(rgb888));

rgb888 = 0x00FF00;
printf("RGB888 0x%06X -> RGB565 0x%04X\n", rgb888, rgb888_to_rgb565(rgb888));

rgb888 = 0x0000FF;
printf("RGB888 0x%06X -> RGB565 0x%04X\n", rgb888, rgb888_to_rgb565(rgb888));

rgb888 = 0xabcdef;
printf("RGB888 0x%06X -> RGB565 0x%04X\n", rgb888, rgb888_to_rgb565(rgb888));

rgb888 = 0xabffef;
printf("RGB888 0x%06X -> RGB565 0x%04X\n", rgb888, rgb888_to_rgb565(rgb888));

uint16_t rgb565 = 0xFFFF;
rgb565_set_green(&rgb565, 0x00);
printf("set GREEN=0x00 to 0xFFFF ... 0x%04X\n", rgb565);

rgb565_set_green(&rgb565, 0xFF);
printf("set GREEN=0xFF to 0xF81F ... 0x%04X\n", rgb565);
}