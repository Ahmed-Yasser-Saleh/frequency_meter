/* 
 * File:   timer0.c
 * Author: Ahmed Yasser
 *
 * Created on October 11, 2023, 8:36 AM
 */

/* Section : Includes */
#include "timer0.h"

/* Section : Macro Declarations */     

/* Section : Macro Function Declaration */
void (*TIMER0_HUNDLER)(void);
static Std_ReturnType select_cnt_reg_size(Timer0_cfg_t *timer0);
static Std_ReturnType select_timer_mode(Timer0_cfg_t *timer0);
static Std_ReturnType prescaler_timer_status(Timer0_cfg_t *timer0);
static Std_ReturnType set_TIMER0_interrupt(Timer0_cfg_t *timer0);
/* Section : Data Type Declarations */


/* Section : Function Declarations */
Std_ReturnType Timer0_init(Timer0_cfg_t *timer0){
  Std_ReturnType ret = E_OK;
    if(NULL == timer0)
        ret = E_NOT_OK;
    else
    {
        TIMER0_MODULE_DISABLE();
        
        select_timer_mode(timer0);
        
        TMR0H = timer0->value_start_cnt >> 8;
        TMR0L = (uint8)timer0->value_start_cnt;
        select_cnt_reg_size(timer0);
        
        prescaler_timer_status(timer0);  
          
        TIMER0_MODULE_ENABLE();
     #if INTERRUPT_INTERNAL_FEATURE == INTERRUPT_INTERNAL_ENABLE
     TIMER0_INTERRUPT_NOT_OCCURE();
     #if INTERRUPT_PRIORITY_FEATURE == INTERRUPT_PRIORITY_ENABLE
      INTERRUPT_PRIORITY_GENERAL_ENABLE();
      
      if(adc_confg->priority == LOW_PRIORITY)
      {
          INTERRUPT_LOW_PRIORITY_ENABEL();
          TIMER0_LOW_PRIORITY();
      }
      else if(adc_confg->priority == HIGH_PRIORITY)
      {
          INTERRUPT_HIGH_PRIORITY_ENABLE();
          TIMER0_HIGH_PRIORITY();
      }
    #else
       INTERRUPT_PeripheralInterrupt_Enable();
       INTERRUPT_GlobalInterrupt_Enable();
    #endif
    set_TIMER0_interrupt(timer0);
    TIMER0_INTERRUPT_ENABLE();      
    #endif
    }
    return ret;   
}
Std_ReturnType Timer0_deinit(Timer0_cfg_t *timer0){
   Std_ReturnType ret = E_OK;
    if(NULL == timer0)
        ret = E_NOT_OK;
    else
    {
       TIMER0_MODULE_DISABLE(); 
    }
    return ret;  
}
Std_ReturnType Timer0_8bit_write_value(Timer0_cfg_t *timer0,uint8 value){
    Std_ReturnType ret = E_OK;
    if(NULL == timer0)
        ret = E_NOT_OK;
    else
    {
        TMR0L = value;
    }
    return ret;
}
Std_ReturnType Timer0_8bit_read_value(Timer0_cfg_t *timer0,uint8 *value){
    Std_ReturnType ret = E_OK;
    if(NULL == timer0)
        ret = E_NOT_OK;
    else
    {
        *value = TMR0L;
    }
    return ret; 
}
Std_ReturnType Timer0_16bit_write_value(Timer0_cfg_t *timer0,uint16 value){
    Std_ReturnType ret = E_OK;
    if(NULL == timer0)
        ret = E_NOT_OK;
    else
    {
        TMR0H = value >> 8;
        TMR0L = (uint8)value;
    }
    return ret;
}
Std_ReturnType Timer0_16bit_read_value(Timer0_cfg_t *timer0,uint16 *value){
    Std_ReturnType ret = E_OK;
    uint8 tmr0L = 0, tmr0H = 0;
    if(NULL == timer0)
        ret = E_NOT_OK;
    else
    {
        tmr0L = TMR0L;
        tmr0H = TMR0H;
        *value = (uint16)(TMR0L + (TMR0H << 8));
    }
    return ret; 
}



static Std_ReturnType select_cnt_reg_size(Timer0_cfg_t *timer0){
     Std_ReturnType ret = E_OK;
    if(NULL == timer0)
        ret = E_NOT_OK;
    else
    {
        if(TIMER0_8BIT_REGISTER_MODE == timer0->cnt_register_sz)
        {
            TIMER0_8BIT_REGISTER_MODE_ENABLE();
        }
        
        else if(TIMER0_16BIT_REGISTER_MODE == timer0->cnt_register_sz)
        {  
            TIMER0_16BIT_REGISTER_MODE_ENABLE(); 
        }
    }
    return ret; 
}
static Std_ReturnType select_timer_mode(Timer0_cfg_t *timer0){
     Std_ReturnType ret = E_OK;
    if(NULL == timer0)
        ret = E_NOT_OK;
    else
    {
        if(TIMER0_TIMER_MODE == timer0->timer0_mode)
           TIMER0_TIMER_MODE_ENABLE();
        
        else if(TIMER0_COUNTER_MODE == timer0->timer0_mode)
        {
            TIMER0_COUNTER_MODE_ENABLE();
            if(TIMER0_COUNTER_RISING_EDGE_CFG == timer0->timer0_counter_edge)
                TIMER0_RISING_EDGE_ENABLE();
            
            else if(TIMER0_COUNTER_FALLING_EDGE_CFG == timer0->timer0_counter_edge)
                TIMER0_FALLING_EDGE_ENABLE();      
        }
    }
    return ret; 
    
    
}
static Std_ReturnType prescaler_timer_status(Timer0_cfg_t *timer0){
     Std_ReturnType ret = E_OK;
    if(NULL == timer0)
        ret = E_NOT_OK;
    else
    {
        if(TIMER0_PRESCALER_ENABLE_CFG == timer0->prescaler_status)
        {
            TIMER0_PRESCALER_ENABLE();
            T0CONbits.T0PS = timer0->prescaler_timer0_value;
        }
        else if(TIMER0_PRESCALER_DISABLE_CFG == timer0->prescaler_status)
            TIMER0_PRESCALER_DISABLE();
    }
    return ret; 
}

static Std_ReturnType set_TIMER0_interrupt(Timer0_cfg_t *timer0){
       Std_ReturnType ret = E_OK;
    if(NULL == timer0)
        ret = E_NOT_OK;
    else
    {
       TIMER0_HUNDLER = timer0->interrupt_timer0;
    }
    return ret;   
}


void TIMER0_ISR(void){
    TIMER0_INTERRUPT_NOT_OCCURE();
   if(TIMER0_HUNDLER) 
       TIMER0_HUNDLER();
}
