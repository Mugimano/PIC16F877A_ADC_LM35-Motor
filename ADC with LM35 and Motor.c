#include<pic.h>
#define _XTAL_FREQ 20e6

#define RS RB1
#define EN RB2
#define RE RB4

//LCD declaration

void lcd_init();
void command(unsigned char);
void lcd_data(unsigned char);
void lcd_send(const char *word);

//ADC declaration

void adc_init();
void adc_value();
void adc_hex(unsigned int);
void temperature(float);

//Global variables

unsigned int a,b,val;
unsigned int th,thr,h,hr,t,o;
float tempr, volt, f;

void lcd_init()
{
 command(0x01);
 command(0x06);
 command(0x0C);    
 command(0x38);
}

void command(unsigned char com)
{
 PORTD = com;
 RS = 0;
 EN = 1;
 __delay_ms(10);
 EN = 0;
}

void lcd_data(unsigned char rec)
{
 PORTD = rec;
 RS = 1;
 EN = 1;
 __delay_ms(10);
 EN = 0;
}
 
void lcd_send(const char *word)
{
while(*word)
{
lcd_data(*word++);
__delay_ms(10);
}
}

void adc_init()
{
ADCON1 = 0x80;
}

void adc_value()
{
ADCON0 = 0xC5;
//while(ADGO);
__delay_ms(10);
a = ADRESL;
b = ADRESH;
b = b*256;
val = (b+a);
f = val;
volt = (f*5) / 1023;
tempr = volt * 100;
}

void adc_hex(unsigned int val)
{
 h=val/1000; // 1023/1000 = 1.023 //Type casting
 hr=val%1000;//023
 t=hr/100; //023/100 = 0.23
 o=hr%100; //23
 th=o/10; //23/10 = 2.3
 thr=o%10; //3
 lcd_data(h+0x30); //31(Hex) --> LCD 1
 lcd_data(t+0x30); //30 --> LCD 0
 lcd_data(th+0x30); //32 --> LCD 2
 lcd_data(thr+0x30); //33 --> LCD 3
}

void temperature(float num)
{
	static float f1;
	int x1,x2,x3,x4,n,temp;
	n = num; //100
	temp = num; //100
	x1 = n%10; //100%10 = (100/10=10) - Reminder 0 17%5 = 2
	n = n/10; //100/10 = 10
	x2 = n%10; //10%10 = 0 --> (10%10=1) - reminder 0
	n = n/10; //10/10 = 1
	x3 = n%10; //1%10 = 1/10 --> 1
	f1 = num - temp; //100-100 = 0
	x4 = f1*10; //0*0 = 0
	lcd_data(x3+0x30); //1
	lcd_data(x2+0x30); //0
	lcd_data(x1+0x30); //0
	lcd_data(0x2e); // character (.)
	lcd_data(x4+0x30); //0
}





void main()
{
TRISA = 0x01;
PORTA = 0x00;

TRISB = 0x00;
PORTB = 0x00;

//TRISC = 0x00;
//PORTC = 0x00;

TRISD = 0x00;
PORTD = 0x00;

lcd_init();
adc_init();

while(1)
{
adc_value();
//command(0x86);
//lcd_send("Temperature ");
command(0xc3);
adc_hex(val);
command(0xCA);
temperature(tempr);	
__delay_ms(10);

//if(tempr < 45 && tempr > 75) // Grater than 75 motor will be OFF stage
//{
RE = 0x00;

if(tempr < 25)
{
RE = 0x01;
command(0x80);
lcd_send("Temperature-Low ");
}

if(tempr > 25 && tempr < 75)
{
command(0x80);
lcd_send("Temperature-Normal");
}

 if(tempr > 75)
 {
 RE = 0x01;
 command(0x80);
 lcd_send("Temperature-High");
 }

  /*else 
 {
 RE = 0x00;
 }*/

/*else
{
RE =0x00;
}*/

/*if(tempr < 45) // < 45motor status is OFF and > 45 motor status is ON
{
RE = 0x01;
//command (0x01);
command (0x80);
lcd_send("Tempe low ");
}*/

/*if (tempr > 25 && tempr < 75)
{
PORTC = 0x00;
command(0x80);
lcd_send ("Temperature Normal");
}*/
/*else
{
RE = 0x00;
}*/
}
}

