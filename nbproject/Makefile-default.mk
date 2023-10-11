#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/FREQ_METER.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/FREQ_METER.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=ECU_layer/LCD/ecu_lcd.c MCAL_layer/GPIO/gpio.c MCAL_layer/Interrupt/interrupt_internal.c MCAL_layer/Interrupt/interrupt_manager.c MCAL_layer/TIMER0/timer0.c MCAL_layer/TIMER1/timer1.c freq_meter.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/ECU_layer/LCD/ecu_lcd.p1 ${OBJECTDIR}/MCAL_layer/GPIO/gpio.p1 ${OBJECTDIR}/MCAL_layer/Interrupt/interrupt_internal.p1 ${OBJECTDIR}/MCAL_layer/Interrupt/interrupt_manager.p1 ${OBJECTDIR}/MCAL_layer/TIMER0/timer0.p1 ${OBJECTDIR}/MCAL_layer/TIMER1/timer1.p1 ${OBJECTDIR}/freq_meter.p1
POSSIBLE_DEPFILES=${OBJECTDIR}/ECU_layer/LCD/ecu_lcd.p1.d ${OBJECTDIR}/MCAL_layer/GPIO/gpio.p1.d ${OBJECTDIR}/MCAL_layer/Interrupt/interrupt_internal.p1.d ${OBJECTDIR}/MCAL_layer/Interrupt/interrupt_manager.p1.d ${OBJECTDIR}/MCAL_layer/TIMER0/timer0.p1.d ${OBJECTDIR}/MCAL_layer/TIMER1/timer1.p1.d ${OBJECTDIR}/freq_meter.p1.d

# Object Files
OBJECTFILES=${OBJECTDIR}/ECU_layer/LCD/ecu_lcd.p1 ${OBJECTDIR}/MCAL_layer/GPIO/gpio.p1 ${OBJECTDIR}/MCAL_layer/Interrupt/interrupt_internal.p1 ${OBJECTDIR}/MCAL_layer/Interrupt/interrupt_manager.p1 ${OBJECTDIR}/MCAL_layer/TIMER0/timer0.p1 ${OBJECTDIR}/MCAL_layer/TIMER1/timer1.p1 ${OBJECTDIR}/freq_meter.p1

# Source Files
SOURCEFILES=ECU_layer/LCD/ecu_lcd.c MCAL_layer/GPIO/gpio.c MCAL_layer/Interrupt/interrupt_internal.c MCAL_layer/Interrupt/interrupt_manager.c MCAL_layer/TIMER0/timer0.c MCAL_layer/TIMER1/timer1.c freq_meter.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/FREQ_METER.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=18F4620
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/ECU_layer/LCD/ecu_lcd.p1: ECU_layer/LCD/ecu_lcd.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/ECU_layer/LCD" 
	@${RM} ${OBJECTDIR}/ECU_layer/LCD/ecu_lcd.p1.d 
	@${RM} ${OBJECTDIR}/ECU_layer/LCD/ecu_lcd.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gcoff -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/ECU_layer/LCD/ecu_lcd.p1 ECU_layer/LCD/ecu_lcd.c 
	@-${MV} ${OBJECTDIR}/ECU_layer/LCD/ecu_lcd.d ${OBJECTDIR}/ECU_layer/LCD/ecu_lcd.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/ECU_layer/LCD/ecu_lcd.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/MCAL_layer/GPIO/gpio.p1: MCAL_layer/GPIO/gpio.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/MCAL_layer/GPIO" 
	@${RM} ${OBJECTDIR}/MCAL_layer/GPIO/gpio.p1.d 
	@${RM} ${OBJECTDIR}/MCAL_layer/GPIO/gpio.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gcoff -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/MCAL_layer/GPIO/gpio.p1 MCAL_layer/GPIO/gpio.c 
	@-${MV} ${OBJECTDIR}/MCAL_layer/GPIO/gpio.d ${OBJECTDIR}/MCAL_layer/GPIO/gpio.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/MCAL_layer/GPIO/gpio.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/MCAL_layer/Interrupt/interrupt_internal.p1: MCAL_layer/Interrupt/interrupt_internal.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/MCAL_layer/Interrupt" 
	@${RM} ${OBJECTDIR}/MCAL_layer/Interrupt/interrupt_internal.p1.d 
	@${RM} ${OBJECTDIR}/MCAL_layer/Interrupt/interrupt_internal.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gcoff -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/MCAL_layer/Interrupt/interrupt_internal.p1 MCAL_layer/Interrupt/interrupt_internal.c 
	@-${MV} ${OBJECTDIR}/MCAL_layer/Interrupt/interrupt_internal.d ${OBJECTDIR}/MCAL_layer/Interrupt/interrupt_internal.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/MCAL_layer/Interrupt/interrupt_internal.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/MCAL_layer/Interrupt/interrupt_manager.p1: MCAL_layer/Interrupt/interrupt_manager.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/MCAL_layer/Interrupt" 
	@${RM} ${OBJECTDIR}/MCAL_layer/Interrupt/interrupt_manager.p1.d 
	@${RM} ${OBJECTDIR}/MCAL_layer/Interrupt/interrupt_manager.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gcoff -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/MCAL_layer/Interrupt/interrupt_manager.p1 MCAL_layer/Interrupt/interrupt_manager.c 
	@-${MV} ${OBJECTDIR}/MCAL_layer/Interrupt/interrupt_manager.d ${OBJECTDIR}/MCAL_layer/Interrupt/interrupt_manager.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/MCAL_layer/Interrupt/interrupt_manager.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/MCAL_layer/TIMER0/timer0.p1: MCAL_layer/TIMER0/timer0.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/MCAL_layer/TIMER0" 
	@${RM} ${OBJECTDIR}/MCAL_layer/TIMER0/timer0.p1.d 
	@${RM} ${OBJECTDIR}/MCAL_layer/TIMER0/timer0.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gcoff -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/MCAL_layer/TIMER0/timer0.p1 MCAL_layer/TIMER0/timer0.c 
	@-${MV} ${OBJECTDIR}/MCAL_layer/TIMER0/timer0.d ${OBJECTDIR}/MCAL_layer/TIMER0/timer0.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/MCAL_layer/TIMER0/timer0.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/MCAL_layer/TIMER1/timer1.p1: MCAL_layer/TIMER1/timer1.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/MCAL_layer/TIMER1" 
	@${RM} ${OBJECTDIR}/MCAL_layer/TIMER1/timer1.p1.d 
	@${RM} ${OBJECTDIR}/MCAL_layer/TIMER1/timer1.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gcoff -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/MCAL_layer/TIMER1/timer1.p1 MCAL_layer/TIMER1/timer1.c 
	@-${MV} ${OBJECTDIR}/MCAL_layer/TIMER1/timer1.d ${OBJECTDIR}/MCAL_layer/TIMER1/timer1.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/MCAL_layer/TIMER1/timer1.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/freq_meter.p1: freq_meter.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/freq_meter.p1.d 
	@${RM} ${OBJECTDIR}/freq_meter.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gcoff -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/freq_meter.p1 freq_meter.c 
	@-${MV} ${OBJECTDIR}/freq_meter.d ${OBJECTDIR}/freq_meter.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/freq_meter.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
else
${OBJECTDIR}/ECU_layer/LCD/ecu_lcd.p1: ECU_layer/LCD/ecu_lcd.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/ECU_layer/LCD" 
	@${RM} ${OBJECTDIR}/ECU_layer/LCD/ecu_lcd.p1.d 
	@${RM} ${OBJECTDIR}/ECU_layer/LCD/ecu_lcd.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gcoff -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/ECU_layer/LCD/ecu_lcd.p1 ECU_layer/LCD/ecu_lcd.c 
	@-${MV} ${OBJECTDIR}/ECU_layer/LCD/ecu_lcd.d ${OBJECTDIR}/ECU_layer/LCD/ecu_lcd.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/ECU_layer/LCD/ecu_lcd.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/MCAL_layer/GPIO/gpio.p1: MCAL_layer/GPIO/gpio.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/MCAL_layer/GPIO" 
	@${RM} ${OBJECTDIR}/MCAL_layer/GPIO/gpio.p1.d 
	@${RM} ${OBJECTDIR}/MCAL_layer/GPIO/gpio.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gcoff -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/MCAL_layer/GPIO/gpio.p1 MCAL_layer/GPIO/gpio.c 
	@-${MV} ${OBJECTDIR}/MCAL_layer/GPIO/gpio.d ${OBJECTDIR}/MCAL_layer/GPIO/gpio.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/MCAL_layer/GPIO/gpio.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/MCAL_layer/Interrupt/interrupt_internal.p1: MCAL_layer/Interrupt/interrupt_internal.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/MCAL_layer/Interrupt" 
	@${RM} ${OBJECTDIR}/MCAL_layer/Interrupt/interrupt_internal.p1.d 
	@${RM} ${OBJECTDIR}/MCAL_layer/Interrupt/interrupt_internal.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gcoff -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/MCAL_layer/Interrupt/interrupt_internal.p1 MCAL_layer/Interrupt/interrupt_internal.c 
	@-${MV} ${OBJECTDIR}/MCAL_layer/Interrupt/interrupt_internal.d ${OBJECTDIR}/MCAL_layer/Interrupt/interrupt_internal.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/MCAL_layer/Interrupt/interrupt_internal.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/MCAL_layer/Interrupt/interrupt_manager.p1: MCAL_layer/Interrupt/interrupt_manager.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/MCAL_layer/Interrupt" 
	@${RM} ${OBJECTDIR}/MCAL_layer/Interrupt/interrupt_manager.p1.d 
	@${RM} ${OBJECTDIR}/MCAL_layer/Interrupt/interrupt_manager.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gcoff -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/MCAL_layer/Interrupt/interrupt_manager.p1 MCAL_layer/Interrupt/interrupt_manager.c 
	@-${MV} ${OBJECTDIR}/MCAL_layer/Interrupt/interrupt_manager.d ${OBJECTDIR}/MCAL_layer/Interrupt/interrupt_manager.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/MCAL_layer/Interrupt/interrupt_manager.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/MCAL_layer/TIMER0/timer0.p1: MCAL_layer/TIMER0/timer0.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/MCAL_layer/TIMER0" 
	@${RM} ${OBJECTDIR}/MCAL_layer/TIMER0/timer0.p1.d 
	@${RM} ${OBJECTDIR}/MCAL_layer/TIMER0/timer0.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gcoff -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/MCAL_layer/TIMER0/timer0.p1 MCAL_layer/TIMER0/timer0.c 
	@-${MV} ${OBJECTDIR}/MCAL_layer/TIMER0/timer0.d ${OBJECTDIR}/MCAL_layer/TIMER0/timer0.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/MCAL_layer/TIMER0/timer0.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/MCAL_layer/TIMER1/timer1.p1: MCAL_layer/TIMER1/timer1.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/MCAL_layer/TIMER1" 
	@${RM} ${OBJECTDIR}/MCAL_layer/TIMER1/timer1.p1.d 
	@${RM} ${OBJECTDIR}/MCAL_layer/TIMER1/timer1.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gcoff -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/MCAL_layer/TIMER1/timer1.p1 MCAL_layer/TIMER1/timer1.c 
	@-${MV} ${OBJECTDIR}/MCAL_layer/TIMER1/timer1.d ${OBJECTDIR}/MCAL_layer/TIMER1/timer1.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/MCAL_layer/TIMER1/timer1.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/freq_meter.p1: freq_meter.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/freq_meter.p1.d 
	@${RM} ${OBJECTDIR}/freq_meter.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits $(COMPARISON_BUILD)  -std=c99 -gcoff -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/freq_meter.p1 freq_meter.c 
	@-${MV} ${OBJECTDIR}/freq_meter.d ${OBJECTDIR}/freq_meter.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/freq_meter.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/FREQ_METER.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=${DISTDIR}/FREQ_METER.${IMAGE_TYPE}.map  -D__DEBUG=1  -mdebugger=none  -DXPRJ_default=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits -std=c99 -gcoff -mstack=compiled:auto:auto:auto        $(COMPARISON_BUILD) -Wl,--memorysummary,${DISTDIR}/memoryfile.xml -o ${DISTDIR}/FREQ_METER.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	@${RM} ${DISTDIR}/FREQ_METER.${IMAGE_TYPE}.hex 
	
else
${DISTDIR}/FREQ_METER.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=${DISTDIR}/FREQ_METER.${IMAGE_TYPE}.map  -DXPRJ_default=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -mwarn=-3 -Wa,-a -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mno-default-config-bits -std=c99 -gcoff -mstack=compiled:auto:auto:auto     $(COMPARISON_BUILD) -Wl,--memorysummary,${DISTDIR}/memoryfile.xml -o ${DISTDIR}/FREQ_METER.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(wildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
