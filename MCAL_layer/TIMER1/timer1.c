/* 
 * File:   timer1.c
 * Author: Ahmed Yasser
 *
 * Created on October 11, 2023, 8:34 PM
 */

/* Section : Includes */
#include "timer1.h"

/* Section : Macro Declarations */     

/* Section : Macro Function Declaration */
void (*TIMER1_HUNDLER)(void);
static Std_ReturnType select_timer_mode(Timer1_cfg_t *timer1);
static Std_ReturnType select_prescaler_timer(Timer1_cfg_t *timer1);
static Std_ReturnType set_TIMER1_interrupt(Timer1_cfg_t *timer1);
/* Section : Data Type Declarations */


/* Section : Function Declarations */
Std_ReturnType Timer1_init(Timer1_cfg_t *timer1){
  Std_ReturnType ret = E_OK;
    if(NULL == timer1)
        ret = E_NOT_OK;
    else
    {
        TIMER1_MODULE_DISABLE();
        
        if(timer1->timer1_osc_status == TIMER1_OSCILLATOR_ENABLE_ST)
        TIMER1_OSCILLATOR_ENABLE();
        else if(timer1->timer1_osc_status == TIMER1_OSCILLATOR_DISABLE_ST)
        TIMER1_OSCILLATOR_DISABLE();
        
        select_timer_mode(timer1);
        
        select_prescaler_timer(timer1); 
      
        TMR1H = timer1->value_start_cnt >> 8;
        TMR1L = (uint8)timer1->value_start_cnt;

        TIMER1_MODULE_ENABLE();
        
        #if INTERRUPT_INTERNAL_FEATURE == INTERRUPT_INTERNAL_ENABLE
        TIMER1_INTERRUPT_NOT_OCCURE();
        #if INTERRUPT_PRIORITY_FEATURE == INTERRUPT_PRIORITY_ENABLE
      INTERRUPT_PRIORITY_GENERAL_ENABLE();
      
      if(adc_confg->priority == LOW_PRIORITY)
      {
          INTERRUPT_LOW_PRIORITY_ENABEL();
          TIMER1_LOW_PRIORITY();
      }
      else if(adc_confg->priority == HIGH_PRIORITY)
      {
          INTERRUPT_HIGH_PRIORITY_ENABLE();
          TIMER1_HIGH_PRIORITY();
      }
    #else
       INTERRUPT_PeripheralInterrupt_Enable();
       INTERRUPT_GlobalInterrupt_Enable();
    #endif
    set_TIMER1_interrupt(timer1);
    TIMER1_INTERRUPT_ENABLE();      
    #endif
    }
    return ret;   
}
Std_ReturnType Timer1_deinit(Timer1_cfg_t *timer1){
   Std_ReturnType ret = E_OK;
    if(NULL == timer1)
        ret = E_NOT_OK;
    else
    {
       TIMER1_MODULE_DISABLE(); 
    }
    return ret;  
}

Std_ReturnType Timer1_write_value(Timer1_cfg_t *timer1,uint16 value){
      Std_ReturnType ret = E_OK;
    if(NULL == timer1)
        ret = E_NOT_OK;
    else
    {
        TIMER1_TWO_8BIT_OPERATION();
        TMR1H = value >> 8;
        TMR1L = (uint8)value;
    }
    return ret;
}
Std_ReturnType Timer1_read_value(Timer1_cfg_t *timer1,uint16 *value){
     Std_ReturnType ret = E_OK;
    uint8 tmr1L = 0, tmr1H = 0;
    if(NULL == timer1)
        ret = E_NOT_OK;
    else
    {
        //TIMER1_ONE_16BIT_OPERATION();
        tmr1L = TMR1L;
        tmr1H = TMR1H;
        *value = (uint16)(TMR1L + (TMR1H << 8));
    }
    return ret; 
}

static Std_ReturnType select_timer_mode(Timer1_cfg_t *timer1){
     Std_ReturnType ret = E_OK;
    if(NULL == timer1)
        ret = E_NOT_OK;
    else
    {
        if(TIMER1_TIMER_MODE == timer1->timer1_mode)
           TIMER1_TIMER_MODE_ENABLE();
        
        else if(TIMER1_COUNTER_MODE == timer1->timer1_mode)
        {
            TIMER1_COUNTER_MODE_ENABLE(); 
            
            if(TIMER1_SYNCRONOUS_COUNTER_MODE == timer1->timer1_counter_mode)
                TIMER1_SYNCRONOUS_EXTERNAL_CLOCK();
            
            else if(TIMER1_ASYNCRONOUS_COUNTER_MODE == timer1->timer1_counter_mode)
                TIMER1_ASYNCRONOUS_EXTERNAL_CLOCK();
        }
    }
    return ret; 
}
static Std_ReturnType select_prescaler_timer(Timer1_cfg_t *timer1){
     Std_ReturnType ret = E_OK;
    if(NULL == timer1)
        ret = E_NOT_OK;
    else
    {
       T1CONbits.T1CKPS = timer1->prescaler_timer1_value;
    }
    return ret; 
}

static Std_ReturnType set_TIMER1_interrupt(Timer1_cfg_t *timer1){
       Std_ReturnType ret = E_OK;
    if(NULL == timer1)
        ret = E_NOT_OK;
    else
    {
       TIMER1_HUNDLER = timer1->interrupt_timer1;
    }
    return ret;   
}


void TIMER1_ISR(void){
    TIMER1_INTERRUPT_NOT_OCCURE();
   if(TIMER1_HUNDLER) 
       TIMER1_HUNDLER();
}
