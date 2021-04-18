#ifndef MODULE_MANAGER_H
#define MODULE_MANAGER_H

int (* sceKernelUnloadModule) (SceUID modid) = NULL;
int (* sceKernelStartModule) (SceUID modid, SceSize argsize, void *argp, int *status, SceKernelSMOption *option) = NULL;
SceUID (* sceKernelLoadModule) (const char *path, int flags, SceKernelLMOption *option) = NULL;
int (* sceKernelStopModule) (SceUID modid, SceSize argsize, void *argp, int *status, SceKernelSMOption *option) = NULL;

int LoadStartModule(char *path)
{
    u32 loadResult;
    u32 startResult;
    int status;

    loadResult = sceKernelLoadModule(path, 0, NULL);
    if (loadResult & 0x80000000)
	{
       return -1;
    }
	else
	{
       startResult = sceKernelStartModule(loadResult, 0, NULL, &status, NULL);
    }

    if (loadResult != startResult)
	{
       return -2;
    }
    return 0;
}

int StopUnloadModule(SceUID modID)
{
    int status;
    sceKernelStopModule(modID, 0, NULL, &status, NULL);
    sceKernelUnloadModule(modID);
    return 0;
}

#endif