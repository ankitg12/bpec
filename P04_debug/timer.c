#include "bbb.h"
#include "timer.h"

void timer_init(uint32_t msecs)
{
	// Somehow already done - possibly by the stage 0 bootloader
	//CM_WKUP_TIMER0_CLKCTRL = (0x2 << 0); // Enable the wakeup module

	TIMER0_IRQENABLE_SET = (1 << 1);
	TIMER0_TCLR = (1 << 1); // Auto reload
	// Refer sec 20.1.2.2
	TIMER0_TLDR = ~0 - (32768 * msecs / 1000); // For 32768 Hz clk, as it overflows at ~0
	TIMER0_TCRR = ~0 - (32768 * msecs / 1000); // First load
	delay(1000); // TODO: Why?
	TIMER0_TCLR |= (1 << 0); // Start timer
}
void timer_shut(void)
{
	TIMER0_TCLR = (0 << 1) | (0 << 0);
	TIMER0_TLDR = 0;
	TIMER0_IRQENABLE_CLR = (1 << 1);
}
