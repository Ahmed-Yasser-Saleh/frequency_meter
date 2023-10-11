/* 
 * File:   freq_meter.c
 * Author: Ahmed Yasser
 *
 * Created on October 11, 2023, 8:45 AM
 */
#include "freq_meter.h"
#include "MCAL_layer/Interrupt/interrupt_cfg.h"

#include "MCAL_layer/TIMER0/timer0.h"
#include "MCAL_layer/TIMER1/timer1.h"

volatile uint32 freq;
volatile uint8 flag;
uint8 arr[11];

void SET_FLAG(void);

lcd_confg_4_t lcd_4bit = {
        .rs_lcd.port = PORTD_INDEX,
       .rs_lcd.pin  = PIN0,
       .rs_lcd.direction = OUTPUT,
       .rs_lcd.logic     = LOW,
       .en_lcd.port = PORTD_INDEX,
       .en_lcd.pin = PIN1,
       .en_lcd.direction = OUTPUT,
       .en_lcd.logic = LOW,
      .lcd_pin[0].port = PORTD_INDEX,
      .lcd_pin[0].pin = PIN4,
      .lcd_pin[0].direction = OUTPUT,
      .lcd_pin[0].logic = LOW,
      .lcd_pin[1].port = PORTD_INDEX,
      .lcd_pin[1].pin  = PIN5,
      .lcd_pin[1].direction = OUTPUT,
      .lcd_pin[1].logic = LOW,
      .lcd_pin[2].port = PORTD_INDEX,
      .lcd_pin[2].pin = PIN6,
      .lcd_pin[2].direction = OUTPUT,
      .lcd_pin[2].logic = LOW,
      .lcd_pin[3].port = PORTD_INDEX,
      .lcd_pin[3].pin  = PIN7,
      .lcd_pin[3].direction = OUTPUT,
      .lcd_pin[3].logic = LOW,
   };
  
Timer0_cfg_t timer0_obj = {
.interrupt_timer0 = SET_FLAG,
.cnt_register_sz = TIMER0_16BIT_REGISTER_MODE,
.prescaler_status = TIMER0_PRESCALER_ENABLE_CFG,
.prescaler_timer0_value = TIMER0_PRESCALER_DIV_BY_16,
.timer0_mode = TIMER0_TIMER_MODE,
.value_start_cnt = 3036
};

Timer1_cfg_t timer1_obj = {
.interrupt_timer1 = NULL,
.prescaler_timer1_value = TIMER1_PRESCALER_DIV_BY_1,
.timer1_mode = TIMER1_COUNTER_MODE,
.timer1_counter_mode = TIMER1_SYNCRONOUS_COUNTER_MODE,
.timer1_osc_status = TIMER1_OSCILLATOR_DISABLE_ST,
.value_start_cnt = 0
};


int main() {
    Std_ReturnType ret = E_NOT_OK;
    application_initialize();
    send_4_bit_string_data(&lcd_4bit,"loading");
    for(uint8 i = 0; i < 13; i++)
    {
        send_4_bit_char_data_pos(&lcd_4bit,1,i+8,'.');
        __delay_ms(10);        
    }
     while(1){
         
     }
      return (EXIT_SUCCESS);
}

void application_initialize(void){
    Timer0_init(&timer0_obj);
    Timer1_init(&timer1_obj);
    lcd_pins_4_initialize(&lcd_4bit);
}

void SET_FLAG(void){
    flag++;
    Timer1_read_value(&timer1_obj,&freq);
    cnvert_uint32_to_string((freq + 1),arr);
    if(1 == flag)
    {
        send_4_bit_command(&lcd_4bit,CLEAR_DISPLAY);
    }
    send_4_bit_string_data_pos(&lcd_4bit,1,1,"Frequency = ");
    send_4_bit_string_data_pos(&lcd_4bit,1,13,arr);
    Timer1_write_value(&timer1_obj,0x0000);
}