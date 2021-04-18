#ifndef UTIILITY_USER_H
#define UTILITY_USER_H

void (* sceKernelDcacheWritebackAll) (void) = NULL;
void (* sceKernelDcacheInvalidateRange) (const void *p, unsigned int size) = NULL;
void (* sceKernelDcacheWritebackRange) (const void *p, unsigned int size) = NULL;

#endif