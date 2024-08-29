/*===========================================================================*/
/* Module       = icum.ld                                                    */
/* SW-VERSION   = 1.0.0                                                      */
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
/*              Device:         ICUM                                         */
/*              IDE:            GHS Multi V7.1.6 or later                    */
/*===========================================================================*/
MEMORY
{
  /* ------------------------------------------------------------------------ */
  /*                            Code flash                                    */
  /* ------------------------------------------------------------------------ */
  /* Code Flash */
  ICUM_CF      : ORIGIN = 0x580000,  LENGTH = 512K
  ICUM_CF_TOP  : ORIGIN = .         ,  LENGTH = 0

  /* ------------------------------------------------------------------------ */
  /*                            Data flash                                    */
  /* ------------------------------------------------------------------------ */
  /* Data Area */
  ICUM_DF      : ORIGIN = 0xFF300000,  LENGTH = 30K
  ICUM_DF_TOP  : ORIGIN = .         ,  LENGTH = 0

  /* ------------------------------------------------------------------------ */
  /*                            Local RAM                                     */
  /* ------------------------------------------------------------------------ */
  ICUM_LR      : ORIGIN = 0xFEDF0000,  LENGTH = 60K
  ICUM_LR_TOP  : ORIGIN = .         ,  LENGTH = 0

  /* ------------------------------------------------------------------------ */
  /*                            Global RAM (CRAM1)                            */
  /* ------------------------------------------------------------------------ */
  GLOBAL_GR    : ORIGIN = 0xFE100000,  LENGTH = 512K
  GLOBAL_GR_TOP  : ORIGIN = .         ,  LENGTH = 0

  /* ------------------------------------------------------------------------ */
  /*                                Stack                                     */
  /* ------------------------------------------------------------------------ */
  STACK        : ORIGIN = 0xFEDFF000,  LENGTH = 4K
  STACK_TOP    : ORIGIN = .         ,  LENGTH = 0
}

SECTIONS
{
  /* Start of internal ROM area (CF) */
  .intvect                 align(16)            :> ICUM_CF       /* start of interrupt vector. This section contains RESET and exception table for PE0 */
  .inttable                align(0x200)         :>.
  .inttable_end                                 :>.

  .rozdata                                      :>.         /* constant datas in ZDA area */
  .robase                      align(4)         :>.         /* initialize textpointer TP for SDA addressing */
  .rosdata                     align(4)         :>.         /* constant datas in SDA area */
  .rodata                      align(4)         :>.         /* constant datas in normal area */

  /* program code area */
  .text     align(4)                            :>.

  .fixaddr              align(4)                :>.     /* ghs internal (compiler) */
  .fixtype              align(4)                :>.     /* ghs internal (compiler) */
  .secinfo              align(4)                :>.     /* ghs internal (runtime library) */
  .syscall              align(4)                :>.     /* ghs internal (linker) */

  R_FAD_CONST                       align(4)    :>. /* Constants in ROM                                     */
  R_FAD_CODE_ROM_EX_PROT pad(0x30)  align(4)    :>. /* For prevent ECC error                                */

  ROM.R_FAD_USER ROM(R_FAD_USER)                :>. /* Constant data to initialize variables                */
  ROM.R_FAD_CODE_RAM ROM(R_FAD_CODE_RAM)        :>. /* Constant data to initialize variables                */
  ROM.R_FAD_CODE_ROM ROM(R_FAD_CODE_ROM)        :>. /* Constant data to initialize variables                */
  ROM.R_FAD_CODE_ROMRAM ROM(R_FAD_CODE_ROMRAM)  :>. /* Constant data to initialize variables                */

  .romdata              ROM(.data)              :>.     /* constant data to initialize variables (copied to RAM at startup)*/
  .romzdata             ROM(.zdata)             :>.     /* constant data to initialize variables in ZDA area (copied to RAM at startup)*/
  .romsdata             ROM(.sdata)             :>.     /* constant data to initialize variables in SDA area (copied to RAM at startup)*/
  .romtdata             ROM(.tdata)             :>.     /* constant data to initialize variables in TDA area (copied to RAM at startup)*/
  .romsldata            ROM(.sldata)            :>.     /* constant data to initialize variables in LSDA area (copied to GRAM at startup)*/
  ROM.R_FAD_TEST  ROM(.R_FAD_TEST)               :>.

  /* Start of internal RAM area (LR_C1A) */
  .data                        align(4)         :> ICUM_LR/* initialized data */
  .sdabase                     align(4)         :>.      /* initialize global pointer GP for SDA addressing */
  .zdata                       align(4)         :>.      /* initialized data in ZDA area */
  .sldata                      align(4)         :>.      /* initialized data in LSDA area */
  .sdata                       align(4)         :>.      /* initialized data in SDA area */

  .bss                         align(4)         :>.      /* zero initialized data */
  .zbss                        align(4)         :>.      /* zero initialized data in ZDA area */
  .slbss                       align(4)         :>.      /* zero initialized data in LSDA area */
  .sbss                        align(4)         :>.      /* zero initialized data in SDA area */

  R_FAD_GLOBAL_RAM                  :>.
  R_FAD_USER            align(4)    :>.             /* User code located in ROM                             */
  R_FAD_CODE_RAM        align(4)    :>.             /* Code located in RAM                                  */
  R_FAD_CODE_ROM        align(4)    :>.             /* Code located in ROM                                  */
  R_FAD_CODE_ROMRAM     align(4)    :>.             /* Code located in ROM or RAM                           */
  R_FAD_DATA            align(4)    :>.             /* Data with initialization value                       */
  R_FAD_BSS             align(4)    :>.             /* Data without initialization value                    */
  
  .R_FAD_TEST          align(4)    :>.

  .ramtext  align(128)  MAX_SIZE(0x2000)        :>.      /* initialized and zero-initialized data in TDA area */
  .tdata    align(4)    MAX_SIZE(0x0100)        :>.      /* initialized and zero-initialized data in TDA area */
  .exec     align(128)                          :>.

  .heapbase align(4)                            :>.
  .heap     align(4)
            pad(addr(ICUM_LR_TOP)-addr(.heapbase))
            NOCLEAR                             :>.      /* definition of heap size */
  .top_of_RAM           align(4)                :> ICUM_LR_TOP

  .stack    align(4)    pad(0x0800)             :> STACK      /* definition of stack size */

  /*  Symbols for compiler references */

}
