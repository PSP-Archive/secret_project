#ifndef interrupt_manager_H
#define interrupt_manager_H

int (* sceKernelRegisterSubIntrHandler) (int intno, int no, void *handler, void *arg) = NULL;
int (* sceKernelReleaseSubIntrHandler) (int intno, int no) = NULL;
int (* sceKernelEnableSubIntr) (int intno, int no) = NULL;

#endif