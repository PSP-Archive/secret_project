#ifndef __SCECTRL_H__
#define __SCECTRL_H__

enum PspCtrlButtons
{
	PSP_CTRL_SELECT     = 0x000001,
	PSP_CTRL_START      = 0x000008,
	PSP_CTRL_UP	 		= 0x000010,
	PSP_CTRL_RIGHT      = 0x000020,
	PSP_CTRL_DOWN	   	= 0x000040,
	PSP_CTRL_LEFT	   	= 0x000080,
	PSP_CTRL_LTRIGGER   = 0x000100,
	PSP_CTRL_RTRIGGER   = 0x000200,
	PSP_CTRL_TRIANGLE   = 0x001000,
	PSP_CTRL_CIRCLE     = 0x002000,
	PSP_CTRL_CROSS      = 0x004000,
	PSP_CTRL_SQUARE     = 0x008000,
	PSP_CTRL_HOME       = 0x010000,
	PSP_CTRL_HOLD       = 0x020000,
	PSP_CTRL_NOTE       = 0x800000,
	PSP_CTRL_SCREEN     = 0x400000,
	PSP_CTRL_VOLUP      = 0x100000,
	PSP_CTRL_VOLDOWN    = 0x200000,
	PSP_CTRL_WLAN_UP    = 0x040000,
	PSP_CTRL_REMOTE     = 0x080000, 
	PSP_CTRL_DISC       = 0x1000000,
	PSP_CTRL_MS	 		= 0x2000000,
};

enum PspCtrlMode
{
	// Digital
	PSP_CTRL_MODE_DIGITAL = 0,
	// Analog
	PSP_CTRL_MODE_ANALOG
};

typedef struct SceCtrlData
{
	unsigned int TimeStamp;
	unsigned int Buttons;
	unsigned char Lx;
	unsigned char Ly;
	unsigned char Rsrv [6];
} SceCtrlData;

int (* sceCtrlSetSamplingMode) (int mode) = NULL;
int (* sceCtrlReadBufferPositive) (SceCtrlData *pad_data, int count) = NULL;
int (* sceCtrlGetSamplingMode) (int *pmode) = NULL;

#endif
