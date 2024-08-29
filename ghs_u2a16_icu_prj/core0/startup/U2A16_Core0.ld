/*===========================================================================*/
/* Module       = U2A16_Common.ld                                            */
/* SW-VERSION   = CN1.0                                                      */
/*===========================================================================*/
/*                                  COPYRIGHT                                */
/*===========================================================================*/
/* (c) 2018-2020 Renesas Electronics Corporation. All rights reserved.       */
/*===========================================================================*/
/* Purpose:     Template of common linker directive file                     */
/*                                                                           */
/*===========================================================================*/
/*                                                                           */
/* Warranty Disclaimer                                                       */
/*                                                                           */
/* Because the Product(s) is licensed free of charge, there is no warranty   */
/* of any kind whatsoever and expressly disclaimed and excluded by Renesas,  */
/* either expressed or implied, including but not limited to those for       */
/* non-infringement of intellectual property, merchantability and/or         */
/* fitness for the particular purpose.                                       */
/* Renesas shall not have any obligation to maintain, service or provide bug */
/* fixes for the supplied Product(s) and/or the Application.                 */
/*                                                                           */
/* Each User is solely responsible for determining the appropriateness of    */
/* using the Product(s) and assumes all risks associated with its exercise   */
/* of rights under this Agreement, including, but not limited to the risks   */
/* and costs of program errors, compliance with applicable laws, damage to   */
/* or loss of data, programs or equipment, and unavailability or             */
/* interruption of operations.                                               */
/*                                                                           */
/* Limitation of Liability                                                   */
/*                                                                           */
/* In no event shall Renesas be liable to the User for any incidental,       */
/* consequential, indirect, or punitive damage (including but not limited    */
/* to lost profits) regardless of whether such liability is based on breach  */
/* of contract, tort, strict liability, breach of warranties, failure of     */
/* essential purpose or otherwise and even if advised of the possibility of  */
/* such damages. Renesas shall not be liable for any services or products    */
/* provided by third party vendors, developers or consultants identified or  */
/* referred to the User by Renesas in connection with the Product(s) and/or  */
/* the Application.                                                          */
/*                                                                           */
/*===========================================================================*/
/* Environment:                                                              */
/*              Device:         U2A                                          */
/*              IDE:            GHS Multi for V800  V7.1.6/2018.1.5          */
/*===========================================================================*/
MEMORY
{
  /* ------------------------------------------------------------------------ */
  /*                            Code flash                                    */
  /* ------------------------------------------------------------------------ */

  /* User Area */
  CFUAA      : ORIGIN = 0x00001000,  LENGTH = 4M - 4K
  CFUAA_TOP  : ORIGIN = .         ,  LENGTH = 0
  CFUAB      : ORIGIN = 0x00400000,  LENGTH = 4M
  CFUAB_TOP  : ORIGIN = .         ,  LENGTH = 0
  /* The following is only available in U2A16 */
  CFUAC      : ORIGIN = 0x00800000,  LENGTH = 4M
  CFUAC_TOP  : ORIGIN = .         ,  LENGTH = 0
  CFUAD      : ORIGIN = 0x00C00000,  LENGTH = 4M
  CFUAC_TOP  : ORIGIN = .         ,  LENGTH = 0

  /* User Boot Area */
  CFUBAA     : ORIGIN = 0x08000000,  LENGTH = 64K
  CFUBAA_TOP : ORIGIN = .         ,  LENGTH = 0
  CFUBAB     : ORIGIN = 0x08400000,  LENGTH = 64K
  CFUBAB_TOP : ORIGIN = .         ,  LENGTH = 0

  /* ECC Test Area */
  CFETAGA    : ORIGIN = 0x0BFF0000,  LENGTH = 64K
  CFETAA     : ORIGIN = 0x08050000,  LENGTH = 64K
  CFETAB     : ORIGIN = 0x08450000,  LENGTH = 64K
  /* The following is only available in U2A16 */
  CFETAC     : ORIGIN = 0x08850000,  LENGTH = 64K
  CFETAD     : ORIGIN = 0x08C50000,  LENGTH = 64K

  /* Product Info Area  */
  CFPIAA     : ORIGIN = 0x08030000,  LENGTH = 32K
  CFPIAB     : ORIGIN = 0x08430000,  LENGTH = 32K

  /* Non-overlay area */
  CFNOA      : ORIGIN = 0x04000000,  LENGTH = 64M

  /* Blank Check Area */
  CFBCA      : ORIGIN = 0x0C000000,  LENGTH = 64M

  /* ------------------------------------------------------------------------ */
  /*                            Data flash                                    */
  /* ------------------------------------------------------------------------ */

  /* Data Area */
  DFDA0      : ORIGIN = 0xFF200000,  LENGTH = 256K
  DFDA1      : ORIGIN = 0xFF240000,  LENGTH = 256K
  DFDA2      : ORIGIN = 0xFF280000,  LENGTH = 64K
  
  /* Hardware Property Area */
  DFHPA0EDA  : ORIGIN = 0xFF320000,  LENGTH = 2K
  DFHPA0CSA  : ORIGIN = 0xFF320800,  LENGTH = 4K
  DFHPA0SSA  : ORIGIN = 0xFF321800,  LENGTH = 4K
  DFHPA0BPA0 : ORIGIN = 0xFF322800,  LENGTH = 4K
  DFHPA0ECA0 : ORIGIN = 0xFF325000,  LENGTH = 6K
  DFHPA0ECA1 : ORIGIN = 0xFF326800,  LENGTH = 6K

  /* The following is only available in U2A16 */
  DFHPA0BPA1 : ORIGIN = 0xFF340000,  LENGTH = 4K
  DFHPA0ECA2 : ORIGIN = 0xFF341000,  LENGTH = 6K
  DFHPA0ECA3 : ORIGIN = 0xFF342800,  LENGTH = 6K

  DFHPA0SA   : ORIGIN = 0xFF373800,  LENGTH = 4K
  DFHPA0TA   : ORIGIN = 0xFF374800,  LENGTH = 2K

  /* Blank Check Area */
  DFBCA      : ORIGIN = 0xFF400000,  LENGTH = 2M

  /* ------------------------------------------------------------------------ */
  /*                            Local RAM                                     */
  /* ------------------------------------------------------------------------ */

  /* LR_SELF    : ORIGIN = 0xFDE00000,  LENGTH = 64K
  LR_SELF_TOP: ORIGIN = .         ,  LENGTH = 0 */
  LR_CPU0    : ORIGIN = 0xFDC00000,  LENGTH = 64K
  LR_CPU0_TOP: ORIGIN = .         ,  LENGTH = 0
  LR_CPU1    : ORIGIN = 0xFDA00000,  LENGTH = 64K
  LR_CPU1_TOP: ORIGIN = .         ,  LENGTH = 0
  /* The following is only available in U2A16 */
  LR_CPU2    : ORIGIN = 0xFD800000,  LENGTH = 64K
  LR_CPU2_TOP: ORIGIN = .         ,  LENGTH = 0
  LR_CPU3    : ORIGIN = 0xFD600000,  LENGTH = 64K
  LR_CPU3_TOP: ORIGIN = .         ,  LENGTH = 0

  /* ------------------------------------------------------------------------ */
  /*                           Cluster RAM                                    */
  /* ------------------------------------------------------------------------ */

  CRAM0      : ORIGIN = 0xFE000000,  LENGTH = 512K
  CRAM0_TOP  : ORIGIN = .         ,  LENGTH = 0
  /* The following is only available in U2A16 */
  CRAM1      : ORIGIN = 0xFE100000,  LENGTH = 512K
  CRAM1_TOP  : ORIGIN = .         ,  LENGTH = 0
  CRAM2      : ORIGIN = 0xFE400000,  LENGTH = 2M
  CRAM2_TOP  : ORIGIN = .         ,  LENGTH = 0
  CRAM3      : ORIGIN = 0xFE800000,  LENGTH = 256K
  CRAM3_TOP  : ORIGIN = .         ,  LENGTH = 0

  /* ------------------------------------------------------------------------ */
  /*                                Stack                                     */
  /* ------------------------------------------------------------------------ */

  STACK      : ORIGIN = 0xFDE0F800,  LENGTH = 2K
}

SECTIONS
{
  /* Start of internal ROM area (CFUA) */

  .intvect                 align(16)            :> CFUAA   /* start of interrupt vector. This section contains RESET and exception table for PE0 */
  .inttable                align(0x200)         :>.
  .inttable_end                                 :>.

  .rozdata                                      :>.   /* constant datas in ZDA area */
  .robase                      align(4)         :>.   /* initialize textpointer TP for SDA addressing */
  .rosdata                     align(4)         :>.   /* constant datas in SDA area */
  .rodata                      align(4)         :>.   /* constant datas in normal area */


  /* program code area */
  .text     align(4)                            :>.

  .fixaddr              align(4)                :>.    /* ghs internal (compiler) */
  .fixtype              align(4)                :>.    /* ghs internal (compiler) */
  .secinfo              align(4)                :>.    /* ghs internal (runtime library) */
  .syscall              align(4)                :>.    /* ghs internal (linker) */

  .romdata              ROM(.data)              :>.    /* constant data to initialize variables (copied to RAM at startup)*/
  .romzdata             ROM(.zdata)             :>.    /* constant data to initialize variables in ZDA area (copied to RAM at startup)*/
  .romsdata             ROM(.sdata)             :>.    /* constant data to initialize variables in SDA area (copied to RAM at startup)*/
  .romtdata             ROM(.tdata)             :>.    /* constant data to initialize variables in TDA area (copied to RAM at startup)*/
  .romsldata            ROM(.sldata)            :>.    /* constant data to initialize variables in LSDA area (copied to GRAM at startup)*/

  .stack    align(4)    pad(0x0800)             :>STACK      /* definition of stack size */

  /* Start of cluster RAM area (cRAM_0) */
  .SpinlockStatus                    pad(0x00FF)      :> CRAM0   /* initialized data */ 
  .data                              align(4)         :>.   /* initialized data */
  .sdabase                           align(4)         :>.      /* initialize global pointer GP for SDA addressing */
  .zdata                             align(4)         :>.      /* initialized data in ZDA area */
  .sldata                            align(4)         :>.      /* initialized data in LSDA area */
  .sdata                             align(4)         :>.      /* initialized data in SDA area */
 
  .bss                                  align(4) :>.      /* zero initialized data */
  .zbss                                 align(4) :>.      /* zero initialized data in ZDA area */
  .slbss                                align(4) :>.      /* zero initialized data in LSDA area */
  .sbss                                 align(4) :>.      /* zero initialized data in SDA area */


  .ramtext  align(128)  MAX_SIZE(0x2000)        :>.      /* initialized and zero-initialized data in TDA area */
  .tdata    align(4)    MAX_SIZE(0x0100)        :>.      /* initialized and zero-initialized data in TDA area */
  .exec     align(128)                          :>.
  .mev_address                 align(32)        :>.      /* Mutual Exclusive Variable is used for Sync flags between multi core */

  .top_of_RAM                     align(4)     :> CRAM0_TOP

}

/*===========================================================================*/
/*      End of File                                                          */
/*===========================================================================*/
