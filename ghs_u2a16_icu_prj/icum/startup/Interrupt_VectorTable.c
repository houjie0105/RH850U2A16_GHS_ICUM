/*============================================================================*/
/* Module       = Interrupt_VectorTable.c                                     */
/* SW-VERSION   = 1.0.0                                                       */
/* Date         = 2021/07/22                                                  */
/*============================================================================*/
/*                                  COPYRIGHT                                 */
/*============================================================================*/
/* (c) 2018-2020 Renesas Electronics Corporation. All rights reserved.        */
/*============================================================================*/
/* Purpose:                                                                   */
/* This file contains interrupt vector table                                  */
/*                                                                            */
/*============================================================================*/
/*                                                                            */
/* Unless otherwise agreed upon in writing between your company and           */
/* Renesas Electronics Corporation the following shall apply!                 */
/*                                                                            */
/* Warranty Disclaimer                                                        */
/*                                                                            */
/* There is no warranty of any kind whatsoever granted by Renesas. Any        */
/* warranty is expressly disclaimed and excluded by Renesas, either expressed */
/* or implied, including but not limited to those for non-infringement of     */
/* intellectual property, merchantability and/or fitness for the particular   */
/* purpose.                                                                   */
/*                                                                            */
/* Renesas shall not have any obligation to maintain, service or provide bug  */
/* fixes for the supplied Product(s) and/or the Application.                  */
/*                                                                            */
/* Each User is solely responsible for determining the appropriateness of     */
/* using the Product(s) and assumes all risks associated with its exercise    */
/* of rights under this Agreement, including, but not limited to the risks    */
/* and costs of program errors, compliance with applicable laws, damage to    */
/* or loss of data, programs or equipment, and unavailability or              */
/* interruption of operations.                                                */
/*                                                                            */
/* Limitation of Liability                                                    */
/*                                                                            */
/* In no event shall Renesas be liable to the User for any incidental,        */
/* consequential, indirect, or punitive damage (including but not limited     */
/* to lost profits) regardless of whether such liability is based on breach   */
/* of contract, tort, strict liability, breach of warranties, failure of      */
/* essential purpose or otherwise and even if advised of the possibility of   */
/* such damages. Renesas shall not be liable for any services or products     */
/* provided by third party vendors, developers or consultants identified or   */
/* referred to the User by Renesas in connection with the Product(s) and/or   */
/* the Application.                                                           */
/*                                                                            */
/*============================================================================*/
/* Environment:                                                               */
/*              Devices:        ICUM                                          */
/*============================================================================*/

/******************************************************************************/

/*****************************************************************************/
/*                Module Specific header file inclusions                     */
/*****************************************************************************/
/*****************************************************************************/
/*                         ISR Definition                                    */
/*****************************************************************************/
__interrupt static void Dummy(void)
{
  while(1U);
}

#pragma ghs section sdata=".inttable"
void (*IntVectors[])(void) = {
#ifdef INT_VECTOR_000
  INT_VECTOR_000, /* 000 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_001
  INT_VECTOR_001, /* 001 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_002
  INT_VECTOR_002, /* 002 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_003
  INT_VECTOR_003, /* 003 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_004
  INT_VECTOR_004, /* 004 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_005
  INT_VECTOR_005, /* 005 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_006
  INT_VECTOR_006, /* 006 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_007
  INT_VECTOR_007, /* 007 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_008
  INT_VECTOR_008, /* 008 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_009
  INT_VECTOR_009, /* 009 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_010
  INT_VECTOR_010, /* 010 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_011
  INT_VECTOR_011, /* 011 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_012
  INT_VECTOR_012, /* 012 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_013
  INT_VECTOR_013, /* 013 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_014
  INT_VECTOR_014, /* 014 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_015
  INT_VECTOR_015, /* 015 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_016
  INT_VECTOR_016, /* 016 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_017
  INT_VECTOR_017, /* 017 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_018
  INT_VECTOR_018, /* 018 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_019
  INT_VECTOR_019, /* 019 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_020
  INT_VECTOR_020, /* 020 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_021
  INT_VECTOR_021, /* 021 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_022
  INT_VECTOR_022, /* 022 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_023
  INT_VECTOR_023, /* 023 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_024
  INT_VECTOR_024, /* 024 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_025
  INT_VECTOR_025, /* 025 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_026
  INT_VECTOR_026, /* 026 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_027
  INT_VECTOR_027, /* 027 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_028
  INT_VECTOR_028, /* 028 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_029
  INT_VECTOR_029, /* 029 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_030
  INT_VECTOR_030, /* 030 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_031
  INT_VECTOR_031, /* 031 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_032
  INT_VECTOR_032, /* 032 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_033
  INT_VECTOR_033, /* 033 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_034
  INT_VECTOR_034, /* 034 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_035
  INT_VECTOR_035, /* 035 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_036
  INT_VECTOR_036, /* 036 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_037
  INT_VECTOR_037, /* 037 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_038
  INT_VECTOR_038, /* 038 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_039
  INT_VECTOR_039, /* 039 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_040
  INT_VECTOR_040, /* 040 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_041
  INT_VECTOR_041, /* 041 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_042
  INT_VECTOR_042, /* 042 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_043
  INT_VECTOR_043, /* 043 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_044
  INT_VECTOR_044, /* 044 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_045
  INT_VECTOR_045, /* 045 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_046
  INT_VECTOR_046, /* 046 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_047
  INT_VECTOR_047, /* 047 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_048
  INT_VECTOR_048, /* 048 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_049
  INT_VECTOR_049, /* 049 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_050
  INT_VECTOR_050, /* 050 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_051
  INT_VECTOR_051, /* 051 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_052
  INT_VECTOR_052, /* 052 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_053
  INT_VECTOR_053, /* 053 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_054
  INT_VECTOR_054, /* 054 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_055
  INT_VECTOR_055, /* 055 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_056
  INT_VECTOR_056, /* 056 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_057
  INT_VECTOR_057, /* 057 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_058
  INT_VECTOR_058, /* 058 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_059
  INT_VECTOR_059, /* 059 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_060
  INT_VECTOR_060, /* 060 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_061
  INT_VECTOR_061, /* 061 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_062
  INT_VECTOR_062, /* 062 */
#else
  Dummy,
#endif
#ifdef INT_VECTOR_063
  INT_VECTOR_063, /* 063 */
#else
  Dummy,
#endif
};
#pragma ghs section sdata=default

/******************************************************************************
**                          End of File                                      **
*******************************************************************************/
