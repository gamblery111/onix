#include <onix/onix.h>
#include <onix/types.h>
#include <onix/io.h>
#include <onix/string.h>
#include <onix/console.h>
#include <onix/printk.h>
#include <onix/assert.h>
#include <onix/debug.h>
#include <onix/global.h>
#include <onix/task.h>
#include <onix/interrupt.h>
#include <onix/stdlib.h>
#include <onix/rtc.h>

extern void memory_map_init();
extern void interrupt_init();
extern void clock_init();
extern void time_init();
extern void rtc_init();
extern void hang();

extern void memory_test();

void kernel_init()
{
    memory_map_init();
    interrupt_init();
    clock_init();
    // time_init();
    // rtc_init();

    memory_test();

    // task_init();
    asm volatile("sti");
    hang();
}