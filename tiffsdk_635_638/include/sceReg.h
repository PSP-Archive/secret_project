#ifndef __SCEREG_H__
#define __SCEREG_H__

typedef unsigned int REGHANDLE;

int (* sceRegCloseCategory) (REGHANDLE hd) = NULL;
int (* sceRegOpenCategory) (REGHANDLE h, const char *name, int mode, REGHANDLE *hd) = NULL;
int (* sceRegGetKeyValue) (REGHANDLE hd, REGHANDLE hk, void *buf, SceSize size) = NULL;
int (* sceRegOpenRegistry) (struct RegParam *reg, int mode, REGHANDLE *h) = NULL;
int (* sceRegGetKeyInfo) (REGHANDLE hd, const char *name, REGHANDLE *hk, unsigned int *type, SceSize *size) = NULL;
int (* sceRegCloseRegistry) (REGHANDLE h) = NULL;

#endif
