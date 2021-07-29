/**
 * @file    Practica4MaquinaDeEstados.c
 * @brief   Application entry point.
 * Jesús Alfredo Navarro Guzman		06/07/2021
 */
#include <stdio.h>
#include "board.h"
#include "peripherals.h"
#include "pin_mux.h"
#include "clock_config.h"
#include "MKL25Z4.h"
#include "fsl_debug_console.h"

extern void StateMachine();

int main(void) {
	StateMachine();
    return 0 ;
}
