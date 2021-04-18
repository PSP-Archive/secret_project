#ifndef THREADMAN_H
#define THREADMAN_H

int (* sceKernelCreateFpl) (const char *name, int part, int attr, unsigned int size, unsigned int blocks, struct SceKernelFplOptParam *opt) = NULL;
void (* sceKernelCancelEventFlag) (void) = NULL;
int (* sceKernelDelayThread) (SceUInt delay) = NULL;
SceUID (* sceKernelCreateSema) (const char *name, SceUInt attr, int initVal, int maxVal, SceKernelSemaOptParam *option) = NULL;
int (* sceKernelDeleteFpl) (SceUID uid) = NULL;
int (* sceKernelDeleteEventFlag) (int evid) = NULL;
int (* sceKernelStartThread) (SceUID thid, SceSize arglen, void *argp) = NULL;
int (* sceKernelSetEventFlag) (SceUID evid, u32 bits) = NULL;
int (* sceKernelFreeFpl) (SceUID uid, void *data) = NULL;
int (* sceKernelWaitThreadEnd) (SceUID thid, SceUInt *timeout) = NULL;
int (* sceKernelDeleteSema) (SceUID semaid) = NULL;
int (* sceKernelPollEventFlag) (int evid, u32 bits, u32 wait, u32 *outBits) = NULL;
unsigned int (* sceKernelGetSystemTimeLow) (void) = NULL;
int (* sceKernelTerminateDeleteThread) (SceUID thid) = NULL;
int (* sceKernelSignalSema) (SceUID semaid, int signal) = NULL;
int (* sceKernelWaitEventFlag) (int evid, u32 bits, u32 wait, u32 *outBits, SceUInt *timeout) = NULL;
SceUID (* sceKernelCreateThread) (const char *name, SceKernelThreadEntry entry, int initPriority, int stackSize, SceUInt attr, SceKernelThreadOptParam *option) = NULL;
int (* sceKernelWaitSema) (SceUID semaid, int signal, SceUInt *timeout) = NULL;
SceUID (* sceKernelCreateEventFlag) (const char *name, int attr, int bits, SceKernelEventFlagOptParam *opt) = NULL;
int (* sceKernelPollSema) (SceUID semaid, int signal) = NULL;
void (* sceKernelDeleteLwMutex) (void) = NULL;
int (* sceKernelTryAllocateFpl) (SceUID uid, void **data) = NULL;
int (* sceKernelChangeThreadPriority) (SceUID thid, int priority) = NULL;
int (* sceKernelExitDeleteThread) (int status) = NULL;
int (* sceKernelClearEventFlag) (SceUID evid, u32 bits) = NULL;
void (* sceKernelCancelSema) (void) = NULL;
int (* sceKernelGetThreadCurrentPriority) (void) = NULL;
int (* sceKernelDeleteThread) (SceUID thid) = NULL;
int (* sceKernelExitThread) (int status) = NULL;
void (* sceKernelCreateLwMutex) (void) = NULL;

#endif