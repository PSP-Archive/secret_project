#ifndef __SCEGE_H__
#define __SCEGE_H__

typedef void (* PspGeCallback)(int id, void *arg) ;

typedef struct PspGeContext
{
	unsigned int context[512];
} PspGeContext;

typedef struct PspGeListArgs
{
	unsigned int size;
	PspGeContext *context;
} PspGeListArgs;

typedef struct PspGeCallbackData
{
	PspGeCallback signal_func;
	void * signal_arg;
	PspGeCallback finish_func;
	void * finish_arg;
} PspGeCallbackData;

// (* sceGe_lazy_31129B95) (__) = (void *) 0x08800b44;

int (* sceGeListSync) (int qid, int syncType) = NULL;
int (* sceGeListEnQueueHead) (const void *list, void *stall, int cbid, PspGeListArgs *arg) = NULL;
unsigned int (* sceGeEdramGetSize) (void) = NULL;
void (* sceGeContinue) (int unk1) = NULL;
int (* sceGeListEnQueue) (const void *list, void *stall, int cbid, PspGeListArgs *arg) = NULL;
int (* sceGeDrawSync) (int syncType) = NULL;
void (* sceGeBreak) (int unk1) = NULL;
int (* sceGeListUpdateStallAddr) (int qid, void *stall) = NULL;
void * (* sceGeEdramGetAddr) (void) = NULL;

#endif
