/* 
 * File:   interrupt_manager.h
 * Author: Ahmed Yasser
 *
 * Created on September 7, 2023, 2:30 PM
 */

/* Section : Includes */
#include "interrupt_manager.h"

/* Section : Macro Declarations */ 


/* Section : Macro Function Declaration */

/* Section : Data Type Declarations */

/* Section : Function Declarations */

#if INTERRUPT_PRIORITY_FEATURE == INTERRUPT_PRIORITY_ENABLE
void __interrupt() InterruptManagerHigh(void){
        if((INTERRUPT_ENABLE == INTCON3bits.INT1IE) && (INTERRUPT_OCCURE == INTCON3bits.INT1IF)){
        INT1_ISR();
    }
    else{ /* Nothing */ }
   
    
 
    
   

         if((INTERRUPT_ENABLE == INTCONbits.RBIE) && (INTERRUPT_OCCURE == INTCONbits.RBIF) && 
       (PORTBbits.RB4 == 1) && (RB4_Flag == 1)){
        RB4_Flag = 0;
        RB4_ISR(0);
    }
    else{ /* Nothing */ }
    if((INTERRUPT_ENABLE == INTCONbits.RBIE) && (INTERRUPT_OCCURE == INTCONbits.RBIF) && 
       (PORTBbits.RB4 == 0) && (RB4_Flag == 0)){
        RB4_Flag = 1;
        RB4_ISR(1);
    }
    else{ /* Nothing */ }

}

void __interrupt(low_priority) InterruptManagerLow(void){ 

    if((INTERRUPT_ENABLE == INTCON3bits.INT2IE) && (INTERRUPT_OCCURE == INTCON3bits.INT2IF)){
        INT2_ISR();
    }
    else{ /* Nothing */ } 
    if((INTERRUPT_ENABLE == PIE1bits.ADIE) && (INTERRUPT_OCCURE == PIR1bits.ADIF)){
        ADC_ISR(); /* External Interrupt 0 */
    }
    else{ /* Nothing */ }
}
#else

void __interrupt() InterruptManager(void){
    /* ============ INTx External On Change Interrupt Start ============ */
    
    
    if((INTERRUPT_ENABLE == INTCONbits.TMR0IE) && (INTERRUPT_OCCURE == INTCONbits.TMR0IF)){
        TIMER0_ISR(); /* External Interrupt 0 */
    }
    else{ /* Nothing */ }
    
    if((INTERRUPT_ENABLE == PIE1bits.TMR1IE) && (INTERRUPT_OCCURE == PIR1bits.TMR1IF)){
        TIMER1_ISR(); /* External Interrupt 0 */
    }
    else{ /* Nothing */ }
 
    
}
#endif
