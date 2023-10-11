/* 
 * File:   timer1.h
 * Author: Ahmed Yasser
 *
 * Created on October 11, 2023, 8:24 AM
 */

#ifndef TIMER1_H
#define	TIMER1_H

/* Section : Includes */
#include "../mcal_std_types.h"
#include <../proc/pic18f4620.h>
#include "../device_config.h"
#include "../Interrupt/interrupt_cfg.h"
#include "../Interrupt/interrupt_internal.h"


/* Section : Macro Declarations */  
#define TIMER1_TIMER_MODE                        1
#define TIMER1_COUNTER_MODE                      0

#define TIMER1_ASYNCRONOUS_COUNTER_MODE          1
#define TIMER1_SYNCRONOUS_COUNTER_MODE           0

#define TIMER1_TWO_8BIT_OPERATION_STATUS         1        
#define TIMER1_ONE_16BIT_OPERATION_STATUS        0

#define TIMER1_OSCILLATOR_ENABLE_ST              1
#define TIMER1_OSCILLATOR_DISABLE_ST             0              



/* Section : Macro Function Declaration */
#define TIMER1_TIMER_MODE_ENABLE()              (T1CONbits.TMR1CS = 0)
#define TIMER1_COUNTER_MODE_ENABLE()            (T1CONbits.TMR1CS = 1)

#define TIMER1_SYNCRONOUS_EXTERNAL_CLOCK()      (T1CONbits.T1SYNC = 0)
#define TIMER1_ASYNCRONOUS_EXTERNAL_CLOCK()     (T1CONbits.T1SYNC = 1)

#define TIMER1_MODULE_DISABLE()                 (T1CONbits.TMR1ON = 0)
#define TIMER1_MODULE_ENABLE()                  (T1CONbits.TMR1ON = 1)

#define TIMER1_OSCILLATOR_DISABLE()             (T1CONbits.T1OSCEN = 0) 
#define TIMER1_OSCILLATOR_ENABLE()              (T1CONbits.T1OSCEN = 1)

#define TIMER1_TWO_8BIT_OPERATION()             (T1CONbits.RD16 = 0)
#define TIMER1_ONE_16BIT_OPERATION()            (T1CONbits.RD16 = 1)

#define TIMER1_SYSTEM_CLK_STATUS()              (T1CONbits.T1RUN)
/* Section : Data Type Declarations */
typedef enum{
    TIMER1_PRESCALER_DIV_BY_1 = 0,
    TIMER1_PRESCALER_DIV_BY_2,
    TIMER1_PRESCALER_DIV_BY_4,
    TIMER1_PRESCALER_DIV_BY_8
}timer1_prescaler_select_t;

typedef struct {
    #if INTERRUPT_INTERNAL_FEATURE == INTERRUPT_INTERNAL_ENABLE
    void (*interrupt_timer1)(void);
    #if INTERRUPT_PRIORITY_FEATURE == INTERRUPT_PRIORITY_ENABLE
    interrupt_priority_status priority;
    #endif
    #endif
    uint8 timer1_mode;
    uint8 timer1_counter_mode;
    timer1_prescaler_select_t prescaler_timer1_value;
    uint8 timer1_operation_status;
    uint8 timer1_osc_status;
    uint16 value_start_cnt;
}Timer1_cfg_t;

/* Section : Function Declarations */
Std_ReturnType Timer1_init(Timer1_cfg_t *timer1);
Std_ReturnType Timer1_deinit(Timer1_cfg_t *timer1);
Std_ReturnType Timer1_write_value(Timer1_cfg_t *timer1, uint16 value);
Std_ReturnType Timer1_read_value(Timer1_cfg_t *timer1, uint16 *value);

#endif	/* TIMER1_H */

