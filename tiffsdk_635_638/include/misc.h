#ifndef MISC_H
#define MISC_H

typedef int  (* SceKernelThreadEntry) (unsigned int args, void *argp);
typedef int (*SceKernelCallbackFunction)(int arg1, int arg2, void *arg);

typedef struct SceKernelLMOption
{
	unsigned int size;
	int mpidtext;
	int mpiddata;
	unsigned int flags;
	char position;
	char access;
	char creserved [2];
} SceKernelLMOption;

typedef struct SceKernelThreadOptParam
{
	unsigned int size;
	int stackMpid;
} SceKernelThreadOptParam;

typedef struct SceKernelSemaOptParam
{
	unsigned int size;
} SceKernelSemaOptParam;

typedef struct SceKernelEventFlagOptParam
{
	unsigned int size;
} SceKernelEventFlagOptParam;

typedef struct SceKernelSysClock
{
	unsigned int low;
	unsigned int hi;
} SceKernelSysClock;

typedef struct SceKernelSMOption
{
	unsigned int size;
	int mpidstack;
	unsigned int stacksize;
	int priority;
	unsigned int attribute;
} SceKernelSMOption;

typedef struct SceKernelMbxOptParam
{
	unsigned int size;
} SceKernelMbxOptParam;

typedef struct SceKernelSemaInfo {
	unsigned int         size;
	char            name[32];
	unsigned int         attr;
	int             initCount;
	int             currentCount;
	int             maxCount;
	int             numWaitThreads;
} SceKernelSemaInfo;

typedef struct SceKernelVplInfo {
	unsigned int         size;
	char    name[32];
	unsigned int         attr;
	int     poolSize;
	int     freeSize;
	int     numWaitThreads;
} SceKernelVplInfo;

#endif