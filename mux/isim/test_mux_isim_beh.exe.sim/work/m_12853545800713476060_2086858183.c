/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/ise/_ise_projects/mux/test_mux.v";
static int ng1[] = {0, 0};
static int ng2[] = {64, 0};
static int ng3[] = {1, 0};
static int ng4[] = {2, 0};
static int ng5[] = {3, 0};
static int ng6[] = {4, 0};
static int ng7[] = {5, 0};



static void Initial_45_0(char *t0)
{
    char t6[8];
    char t17[8];
    char t19[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t18;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    unsigned int t25;
    int t26;

LAB0:    t1 = (t0 + 2840U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(45, ng0);

LAB4:    xsi_set_current_line(46, ng0);
    xsi_set_current_line(46, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);

LAB5:    t2 = (t0 + 1928);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t6, 0, 8);
    xsi_vlog_signed_less(t6, 32, t4, 32, t5, 32);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 != 0);
    if (t12 > 0)
        goto LAB6;

LAB7:
LAB1:    return;
LAB6:    xsi_set_current_line(46, ng0);

LAB8:    xsi_set_current_line(47, ng0);
    t13 = (t0 + 1928);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    t16 = ((char*)((ng3)));
    memset(t17, 0, 8);
    xsi_vlog_signed_bit_and(t17, 32, t15, 32, t16, 32);
    t18 = (t0 + 1448);
    t20 = (t0 + 1448);
    t21 = (t20 + 72U);
    t22 = *((char **)t21);
    t23 = ((char*)((ng1)));
    xsi_vlog_generic_convert_bit_index(t19, t22, 2, t23, 32, 1);
    t24 = (t19 + 4);
    t25 = *((unsigned int *)t24);
    t26 = (!(t25));
    if (t26 == 1)
        goto LAB9;

LAB10:    xsi_set_current_line(48, ng0);
    t2 = (t0 + 1928);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng3)));
    memset(t6, 0, 8);
    xsi_vlog_signed_rshift(t6, 32, t4, 32, t5, 32);
    t7 = ((char*)((ng3)));
    memset(t17, 0, 8);
    xsi_vlog_signed_bit_and(t17, 32, t6, 32, t7, 32);
    t13 = (t0 + 1448);
    t14 = (t0 + 1448);
    t15 = (t14 + 72U);
    t16 = *((char **)t15);
    t18 = ((char*)((ng3)));
    xsi_vlog_generic_convert_bit_index(t19, t16, 2, t18, 32, 1);
    t20 = (t19 + 4);
    t8 = *((unsigned int *)t20);
    t26 = (!(t8));
    if (t26 == 1)
        goto LAB11;

LAB12:    xsi_set_current_line(49, ng0);
    t2 = (t0 + 1928);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng4)));
    memset(t6, 0, 8);
    xsi_vlog_signed_rshift(t6, 32, t4, 32, t5, 32);
    t7 = ((char*)((ng3)));
    memset(t17, 0, 8);
    xsi_vlog_signed_bit_and(t17, 32, t6, 32, t7, 32);
    t13 = (t0 + 1448);
    t14 = (t0 + 1448);
    t15 = (t14 + 72U);
    t16 = *((char **)t15);
    t18 = ((char*)((ng4)));
    xsi_vlog_generic_convert_bit_index(t19, t16, 2, t18, 32, 1);
    t20 = (t19 + 4);
    t8 = *((unsigned int *)t20);
    t26 = (!(t8));
    if (t26 == 1)
        goto LAB13;

LAB14:    xsi_set_current_line(50, ng0);
    t2 = (t0 + 1928);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng5)));
    memset(t6, 0, 8);
    xsi_vlog_signed_rshift(t6, 32, t4, 32, t5, 32);
    t7 = ((char*)((ng3)));
    memset(t17, 0, 8);
    xsi_vlog_signed_bit_and(t17, 32, t6, 32, t7, 32);
    t13 = (t0 + 1448);
    t14 = (t0 + 1448);
    t15 = (t14 + 72U);
    t16 = *((char **)t15);
    t18 = ((char*)((ng5)));
    xsi_vlog_generic_convert_bit_index(t19, t16, 2, t18, 32, 1);
    t20 = (t19 + 4);
    t8 = *((unsigned int *)t20);
    t26 = (!(t8));
    if (t26 == 1)
        goto LAB15;

LAB16:    xsi_set_current_line(51, ng0);
    t2 = (t0 + 1928);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng6)));
    memset(t6, 0, 8);
    xsi_vlog_signed_rshift(t6, 32, t4, 32, t5, 32);
    t7 = ((char*)((ng3)));
    memset(t17, 0, 8);
    xsi_vlog_signed_bit_and(t17, 32, t6, 32, t7, 32);
    t13 = (t0 + 1768);
    xsi_vlogvar_assign_value(t13, t17, 0, 0, 1);
    xsi_set_current_line(52, ng0);
    t2 = (t0 + 1928);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng7)));
    memset(t6, 0, 8);
    xsi_vlog_signed_rshift(t6, 32, t4, 32, t5, 32);
    t7 = ((char*)((ng3)));
    memset(t17, 0, 8);
    xsi_vlog_signed_bit_and(t17, 32, t6, 32, t7, 32);
    t13 = (t0 + 1608);
    xsi_vlogvar_assign_value(t13, t17, 0, 0, 1);
    xsi_set_current_line(53, ng0);
    t2 = (t0 + 2648);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB17;
    goto LAB1;

LAB9:    xsi_vlogvar_assign_value(t18, t17, 0, *((unsigned int *)t19), 1);
    goto LAB10;

LAB11:    xsi_vlogvar_assign_value(t13, t17, 0, *((unsigned int *)t19), 1);
    goto LAB12;

LAB13:    xsi_vlogvar_assign_value(t13, t17, 0, *((unsigned int *)t19), 1);
    goto LAB14;

LAB15:    xsi_vlogvar_assign_value(t13, t17, 0, *((unsigned int *)t19), 1);
    goto LAB16;

LAB17:    xsi_set_current_line(46, ng0);
    t2 = (t0 + 1928);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng3)));
    memset(t6, 0, 8);
    xsi_vlog_signed_add(t6, 32, t4, 32, t5, 32);
    t7 = (t0 + 1928);
    xsi_vlogvar_assign_value(t7, t6, 0, 0, 32);
    goto LAB5;

}


extern void work_m_12853545800713476060_2086858183_init()
{
	static char *pe[] = {(void *)Initial_45_0};
	xsi_register_didat("work_m_12853545800713476060_2086858183", "isim/test_mux_isim_beh.exe.sim/work/m_12853545800713476060_2086858183.didat");
	xsi_register_executes(pe);
}
