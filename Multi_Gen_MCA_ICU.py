# -*- coding: utf-8 -*-
"""
chaoyang.ren.aj@renesas.com
"""
import os

PRJ_NAME = "default"
PROGRAM = "ghs_u2a16_icu_prj"
CORE_NUM = 3
OUTPUT_DIR = "output"

MCA_LIST = ["ghs_u2a16_icu_prj"]
CORE_LIST = ["core0", "core1", "core2", "core3"]
ICUM_LIST = ["icum"]
SHARED_LIST = ["share"]

IGNORE_DIR = [".git",
              ".vscode",
              "tools",
              "output"]

IGNORE_FILE = []

PRJ_FILE_SUFFIX = ".gpj"

SRC_FILE_SUFFIX = ".c"
ASM_FILE_SUFFIX = ".850"
LIB_FILE_SUFFIX = ".a"
LD_FILE_SUFFIX = ".ld"
INC_FILE_SUFFIX = ".h"
GHSMC_FILE_SUFFIX = ".ghsmc"
GPC_FILE_SUFFIX = ".gpc"
ELF_FILE_SUFFIX = ".elf"
CORE_SUFFIX = "[Core]"
SHARE_SUFFIX = "[SharedMemory]"

PROJ_FILE_TYPE = [SRC_FILE_SUFFIX, ASM_FILE_SUFFIX, \
    LIB_FILE_SUFFIX, LD_FILE_SUFFIX, INC_FILE_SUFFIX]

CORE_CPU_TYPE = 0
CORE_ICUM_TYPE = 1
SHARE_TYPE = 2
OTHER_TYPE = 3

TOP_DIR = 0

DEBUG = "debug"
RELEASE = "release"

TOP_GPJ = \
'''#!gbuild
defineConfig(Debug   dbg debug.gpc)
defineConfig(Release rel release.gpc)
primaryTarget=v800_standalone.tgt
[Project]
\t:binDir=%s
%s\\%s.gpj\t[MultiCoreArchive]
'''
MCA_GPJ = \
'''#!gbuild
[MultiCoreArchive]
'''

CORE_CPU_GPJ = \
'''#!gbuild
[Core]
\t-object_dir=./%s/objs/%s
\t-cpu=rh850g4mh
'''

CORE_ICUM_GPJ = \
'''#!gbuild
[Core]
\t-object_dir=./%s/objs/%s
\t-cpu=rh850g3k
'''

SHARE_GPJ = \
'''#!gbuild
[SharedMemory]
\t-object_dir=./%s/objs/%s
\t-cpu=rh850g4mh
'''

PFH = \
'''#!gbuild
'''
SPCO = \
'''[Subproject]
'''

DEBUG_GPC = \
'''#!gbuild
[Build Configuration]
\t-bsp generic
\t-no_misalign_pack
\t-shared_imports
\t-allow_overlap
\t-overlap
\t-G
\t-e _RESET
\t-prepare_dispose
\t-inline_prologue
\t-sda=all
\t-large_sda
\t-dual_debug
\t-D__DEBUG
'''
RELEASE_GPC = \
'''#!gbuild
[Build Configuration]
\t-bsp generic
\t-no_misalign_pack
\t-shared_imports
\t-allow_overlap
\t-overlap
\t-e _RESET
\t-prepare_dispose
\t-inline_prologue
\t-sda=all
\t-large_sda
'''

DSS = '/'
DSSTW = '\\'

IH = "\t-I.\\"

NL = "\n"
TAB = "\t"

FXU = '_fxu'
USE_FXU = "\t-rh850_fxu"

def add_src_file(cur_dir, dir_depth, type): 
    cur_dir_name = os.path.basename(cur_dir)
    if dir_depth == 0:
        prj_file = open(cur_dir + DSS + cur_dir_name + PRJ_FILE_SUFFIX, 'w')
        if type == CORE_CPU_TYPE:
            prj_file.write((CORE_CPU_GPJ) % (OUTPUT_DIR, cur_dir_name))
            prj_file.write(IH + NL)
            for f_root, f_dirs, f_files in os.walk(cur_dir):
                for f_dir in f_dirs:
                    inc_path = os.path.relpath(os.path.join(f_root, f_dir))
                    dir_lists = inc_path.split(DSSTW)
                    if dir_lists[0] in IGNORE_DIR:
                        pass
                    else:
                        prj_file.write(IH + os.path.relpath(os.path.join(f_root, f_dir), cur_dir) + NL)
        elif type == CORE_ICUM_TYPE:
            prj_file.write((CORE_ICUM_GPJ) % (OUTPUT_DIR, cur_dir_name))
            prj_file.write(IH + NL)
            for f_root, f_dirs, f_files in os.walk(cur_dir):
                for f_dir in f_dirs:
                    inc_path = os.path.relpath(os.path.join(f_root, f_dir))
                    dir_lists = inc_path.split(DSSTW)
                    if dir_lists[0] in IGNORE_DIR:
                        pass
                    else:
                        prj_file.write(IH + os.path.relpath(os.path.join(f_root, f_dir), cur_dir) + NL)
        elif type == SHARE_TYPE:
            prj_file.write((SHARE_GPJ) % (OUTPUT_DIR, cur_dir_name))
            prj_file.write(IH + NL)
            for f_root, f_dirs, f_files in os.walk(cur_dir):
                for f_dir in f_dirs:
                    inc_path = os.path.relpath(os.path.join(f_root, f_dir))
                    dir_lists = inc_path.split(DSSTW)
                    if dir_lists[0] in IGNORE_DIR:
                        pass
                    else:
                        prj_file.write(IH + os.path.relpath(os.path.join(f_root, f_dir), cur_dir) + NL)
        else:
            prj_file.write(PFH)
            prj_file.write(SPCO)

        for file_list in os.listdir(cur_dir):
            full_path = os.path.join(cur_dir, file_list)
            dir_name = os.path.basename(full_path)

            if os.path.isdir(full_path):
                if dir_name in IGNORE_DIR:
                    pass
                else:
                    prj_file.write(dir_name + DSSTW + \
                        dir_name + PRJ_FILE_SUFFIX + NL)
                    dir_depth += 1
                    add_src_file(full_path, dir_depth, type)
                    dir_depth -= 1
            else:
                cur_file_suffix = os.path.splitext(full_path)[1]
                if cur_file_suffix in PROJ_FILE_TYPE:
                    if dir_name in IGNORE_FILE:
                        pass
                    else:
                        prj_file.write(dir_name + NL)
                        if FXU in dir_name:
                            prj_file.write(USE_FXU + NL)
        prj_file.close()
    else:
        prj_file = open(cur_dir + DSS + cur_dir_name + PRJ_FILE_SUFFIX, 'w')
        prj_file.write(PFH)
        prj_file.write(SPCO)
    
        for file_list in os.listdir(cur_dir):
            full_path = os.path.join(cur_dir, file_list)
            dir_name = os.path.basename(full_path)

            if os.path.isdir(full_path):
                if dir_name in IGNORE_DIR:
                    pass
                else:
                    prj_file.write(dir_name + DSSTW + dir_name + PRJ_FILE_SUFFIX + NL)
                    dir_depth += 1
                    add_src_file(full_path, dir_depth, OTHER_TYPE)
                    dir_depth -= 1
            else:
                cur_file_suffix = os.path.splitext(full_path)[1]
                if cur_file_suffix in PROJ_FILE_TYPE:
                    if dir_name in IGNORE_FILE:
                        pass
                    else:
                        prj_file.write(dir_name + NL)
                        if FXU in dir_name:
                            prj_file.write(USE_FXU + NL)
        prj_file.close()

def find_mca_arch(cur_dir, dir_depth):
    if dir_depth == 0:
        prj_file = open(cur_dir + DSS + PRJ_NAME + PRJ_FILE_SUFFIX, 'w')
        for file_list in os.listdir(cur_dir):
            full_path = os.path.join(cur_dir, file_list)
            dir_name = os.path.basename(full_path)
            if os.path.isdir(full_path):
                if dir_name in IGNORE_DIR:
                    pass
                elif dir_name in MCA_LIST:
                    prj_file.write((TOP_GPJ) % (OUTPUT_DIR, dir_name, PROGRAM))
                    dir_depth += 1
                    find_mca_arch(full_path, dir_depth)
                    dir_depth -= 1
                else:
                    prj_file.write(dir_name + DSSTW + dir_name + PRJ_FILE_SUFFIX + NL)
                    dir_depth += 1
                    find_mca_arch(full_path, dir_depth)
                    dir_depth -= 1
            else:
                cur_file_suffix = os.path.splitext(full_path)[1]
                if cur_file_suffix in PROJ_FILE_TYPE:
                    if dir_name in IGNORE_FILE:
                        pass
                    else:
                        prj_file.write(dir_name + NL)
                        if FXU in dir_name:
                            prj_file.write(USE_FXU + NL)
        prj_file.close()
    elif dir_depth == 1:
        prj_file = open(cur_dir + DSS + PROGRAM + PRJ_FILE_SUFFIX, 'w')
        prj_file.write(MCA_GPJ)
        for file_list in os.listdir(cur_dir):
            full_path = os.path.join(cur_dir, file_list)
            dir_name = os.path.basename(full_path)
            if os.path.isdir(full_path):
                if dir_name in IGNORE_DIR:
                    pass
                elif dir_name in CORE_LIST:
                    prj_file.write(dir_name + DSSTW + dir_name + PRJ_FILE_SUFFIX + TAB + CORE_SUFFIX + NL)
                    add_src_file(cur_dir + DSSTW + dir_name, 0, CORE_CPU_TYPE)
                elif dir_name in ICUM_LIST:
                    prj_file.write(dir_name + DSSTW + dir_name + PRJ_FILE_SUFFIX + TAB + CORE_SUFFIX + NL)
                    add_src_file(cur_dir + DSSTW + dir_name, 0, CORE_ICUM_TYPE)
                elif dir_name in SHARED_LIST:
                    prj_file.write(dir_name + DSSTW + dir_name + PRJ_FILE_SUFFIX + TAB + SHARE_SUFFIX + NL)
                    add_src_file(cur_dir + DSSTW + dir_name, 0, SHARE_TYPE)
                else:
                    prj_file.write(dir_name + DSSTW + dir_name + PRJ_FILE_SUFFIX + NL)
                    dir_depth += 1
                    find_mca_arch(full_path, dir_depth)
                    dir_depth -= 1

            else:
                cur_file_suffix = os.path.splitext(full_path)[1]
                if cur_file_suffix in PROJ_FILE_TYPE:
                    if dir_name in IGNORE_FILE:
                        pass
                    else:
                        prj_file.write(dir_name + NL)
                        if FXU in dir_name:
                            prj_file.write(USE_FXU + NL)
        prj_file.close()
    else:
        cur_dir_name = os.path.basename(cur_dir)
        prj_file = open(cur_dir + DSS + cur_dir_name + PRJ_FILE_SUFFIX, 'w')
        prj_file.write(PFH)
        prj_file.write(SPCO)
        for file_list in os.listdir(cur_dir):
            full_path = os.path.join(cur_dir, file_list)
            dir_name = os.path.basename(full_path)
            if os.path.isdir(full_path):
                if dir_name in IGNORE_DIR:
                    pass
                else:
                    prj_file.write(dir_name + DSSTW + dir_name + PRJ_FILE_SUFFIX + NL)
                    dir_depth += 1
                    find_mca_arch(full_path, dir_depth)
                    dir_depth -= 1

            else:
                cur_file_suffix = os.path.splitext(full_path)[1]
                if cur_file_suffix in PROJ_FILE_TYPE:
                    if dir_name in IGNORE_FILE:
                        pass
                    else:
                        prj_file.write(dir_name + NL)
                        if FXU in dir_name:
                            prj_file.write(USE_FXU + NL)
        prj_file.close()

def project_generator():
    find_mca_arch(os.getcwd(), 0)
    prj_file = open(os.getcwd() + DSS + RELEASE + GPC_FILE_SUFFIX, 'w')
    prj_file.write((RELEASE_GPC))
    prj_file.close()
    prj_file = open(os.getcwd() + DSS + DEBUG + GPC_FILE_SUFFIX, 'w')
    prj_file.write((DEBUG_GPC))
    prj_file.close()

# if __name__ == '__main__':
project_generator()
