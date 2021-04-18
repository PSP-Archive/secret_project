#ifndef display_H
#define display_H

enum PspDisplayPixelFormats {
	PSP_DISPLAY_PIXEL_FORMAT_565 = 0,
	PSP_DISPLAY_PIXEL_FORMAT_5551,
	// 16-bit RGBA 4:4:4:4
	PSP_DISPLAY_PIXEL_FORMAT_4444,
	// 32-bit RGBA 8:8:8:
	PSP_DISPLAY_PIXEL_FORMAT_8888
};

enum PspDisplaySetBufSync {
	PSP_DISPLAY_SETBUF_IMMEDIATE = 0, 
	PSP_DISPLAY_SETBUF_NEXTFRAME = 1
};

enum PspDisplayErrorCodes
{
   SCE_DISPLAY_ERROR_OK    = 0,   
   SCE_DISPLAY_ERROR_POINTER    = 0x80000103,   
   SCE_DISPLAY_ERROR_ARGUMENT   = 0x800  
};

int (* sceDisplaySetMode) (int mode, int width, int height) = NULL;
int (* sceDisplaySetFrameBuf) (void *topaddr, int bufferwidth, int pixelformat, int sync) = NULL;
int (* sceDisplayWaitVblankStart) (void) = NULL;
int (* sceDisplayGetFrameBuf) (void **topaddr, int *bufferwidth, int *pixelformat, int sync) = NULL;

#endif