/* 
 * File:   timer0.h
 * Author: Ahmed Yasser
 *
 * Created on October 11, 2023, 8:22 AM
 */
#ifndef TIMER0_H
#define	TIMER0_H

/* Section : Includes */
#include "../mcal_std_types.h"
#include <../proc/pic18f4620.h>
#include "../device_config.h"
#include "../Interrupt/interrupt_cfg.h"
#include "../Interrupt/interrupt_internal.h"


/* Section : Macro Declarations */  
#define TIMER0_TIMER_MODE                1
#define TIMER0_COUNTER_MODE              0
#define TIMER0_PRESCALER_ENABLE_CFG      1
#define TIMER0_PRESCALER_DISABLE_CFG     0
#define TIMER0_8BIT_REGISTER_MODE        1
#define TIMER0_16BIT_REGISTER_MODE       0
#define TIMER0_COUNTER_RISING_EDGE_CFG   1
#define TIMER0_COUNTER_FALLING_EDGE_CFG  0

/* Section : Macro Function Declaration */
#define TIMER0_PRESCALER_ENABLE()           (T0CONbits.PSA = 0)
#define TIMER0_PRESCALER_DISABLE()          (T0CONbits.PSA = 1)
#define TIMER0_RISING_EDGE_ENABLE()         (T0CONbits.T0SE = 0)
#define TIMER0_FALLING_EDGE_ENABLE()        (T0CONbits.T0SE = 1)
#define TIMER0_TIMER_MODE_ENABLE()          (T0CONbits.T0CS = 0)
#define TIMER0_COUNTER_MODE_ENABLE()        (T0CONbits.T0CS = 1)
#define TIMER0_8BIT_REGISTER_MODE_ENABLE()  (T0CONbits.T08BIT = 1)
#define TIMER0_16BIT_REGISTER_MODE_ENABLE() (T0CONbits.T08BIT = 0)
#define TIMER0_MODULE_ENABLE()              (T0CONbits.TMR0ON = 1)
#define TIMER0_MODULE_DISABLE()             (T0CONbits.TMR0ON = 0)

/* Section : Data Type Declarations */
typedef enum{
    TIMER0_PRESCALER_DIV_BY_2 = 0,
    TIMER0_PRESCALER_DIV_BY_4,
    TIMER0_PRESCALER_DIV_BY_8,
    TIMER0_PRESCALER_DIV_BY_16,
    TIMER0_PRESCALER_DIV_BY_32,
    TIMER0_PRESCALER_DIV_BY_64,
    TIMER0_PRESCALER_DIV_BY_128,
    TIMER0_PRESCALER_DIV_BY_256
}timer0_prescaler_select_t;

typedef struct {
    #if INTERRUPT_INTERNAL_FEATURE == INTERRUPT_INTERNAL_ENABLE
    void (*interrupt_timer0)(void);
    #if INTERRUPT_PRIORITY_FEATURE == INTERRUPT_PRIORITY_ENABLE
    interrupt_priority_status priority;
    #endif
    #endif
    uint8 timer0_mode;
    uint8 timer0_counter_edge;
    uint8 prescaler_status;
    timer0_prescaler_select_t prescaler_timer0_value;
    uint8 cnt_register_sz;
    uint16 value_start_cnt;
}Timer0_cfg_t;

/* Section : Function Declarations */
Std_ReturnType Timer0_init(Timer0_cfg_t *timer0);
Std_ReturnType Timer0_deinit(Timer0_cfg_t *timer0);
Std_ReturnType Timer0_8bit_write_value(Timer0_cfg_t *timer0,uint8 value);
Std_ReturnType Timer0_8bit_read_value(Timer0_cfg_t *timer0,uint8 *value);
Std_ReturnType Timer0_16bit_write_value(Timer0_cfg_t *timer0,uint16 value);
Std_ReturnType Timer0_16bit_read_value(Timer0_cfg_t *timer0,uint16 *value);
#endif	/* TIMER0_H */


