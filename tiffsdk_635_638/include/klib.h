#ifndef KERNEL_LIBARY_H
#define KERNEL_LIBARY_H

unsigned int (* sceKernelCpuSuspendIntr) (void) = NULL;
void (* sceKernelUnlockLwMutex) (void) = NULL;
void (* sceKernelCpuResumeIntr) (unsigned int flags) = NULL;
void (* sceKernelLockLwMutex) (void) = NULL;

#endif