#ifndef SYSMEM_MANAGER_H
#define SYSMEM_MANAGER_H

void (* sceKernelPrintf) (const char *format, ...) __attribute__((format(printf, 1, 2))) = NULL;
void (* SysMemUserForUser_ACBD88CA) (void) = NULL;

#endif