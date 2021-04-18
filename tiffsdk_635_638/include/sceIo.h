#ifndef sceIoFileMgr_H
#define sceIoFileMgr_H

#define PSP_O_RDONLY 0x0001
#define PSP_O_WRONLY 0x0002
#define PSP_O_RDWR (PSP_O_RDONLY | PSP_O_WRONLY)
#define PSP_O_NBLOCK 0x0004
#define PSP_O_DIROPEN 0x0008
#define PSP_O_APPEND 0x0100
#define PSP_O_CREAT 0x0200
#define PSP_O_TRUNC 0x0400
#define PSP_O_EXCL 0x0800
#define PSP_O_NOWAIT 0x8000
#define PSP_SEEK_SET 0
#define PSP_SEEK_CUR 1
#define PSP_SEEK_END 2

enum IoAssignPerms
{
	IOASSIGN_RDWR = 0,
	IOASSIGN_RDONLY = 1,
};

typedef struct ScePspDateTime
{
	unsigned short year;
	unsigned short month;
	unsigned short day;
	unsigned short hour;
	unsigned short minute;
	unsigned short second;
	unsigned int microsecond;
} ScePspDateTime;

typedef struct SceIoStat
{
	SceMode st_mode;
	unsigned int st_attr;
	SceOff st_size;
	ScePspDateTime st_ctime;
	ScePspDateTime st_atime;
	ScePspDateTime st_mtime;
	unsigned int st_private [6];
} SceIoStat;

typedef struct SceIoDirent
{
	SceIoStat d_stat;
	char d_name [256];
	void * d_private;
	int dummy;
} SceIoDirent;

int (* sceIoWrite) (SceUID fd, const void *data, SceSize size) = NULL;
int (* sceIoDevctl) (const char *dev, unsigned int cmd, void *indata, int inlen, void *outdata, int outlen) = NULL;
int (* sceIoIoctl) (SceUID fd, unsigned int cmd, void *indata, int inlen, void *outdata, int outlen) = NULL;
int (* sceIoRead) (SceUID fd, void *data, SceSize size) = NULL;
int (* sceIoClose) (SceUID fd) = NULL;
int (* sceIoGetstat) (const char *file, SceIoStat *stat) = NULL;
SceUID (* sceIoOpen) (const char *file, int flags, SceMode mode) = NULL;
SceOff (* sceIoLseek) (SceUID fd, SceOff offset, int whence) = NULL;

void io_write_string(SceUID fd, char *str)
{
	sceIoWrite(fd, str, strlen(str));
}

void io_write_wide_hex(SceUID fd, SceInt64 i)
{
	sceIoWrite(fd, "0x", 2);
	u8 digits[16];
	digits[0] = i & 0x000000000000000F;
	digits[1] = (i & 0x00000000000000F0) >> 4;
	digits[2] = (i & 0x0000000000000F00) >> 8;
	digits[3] = (i & 0x000000000000F000) >> 0xC;
	digits[4] = (i & 0x00000000000F0000) >> 0x10;
	digits[5] = (i & 0x0000000000F00000) >> 0x14;
	digits[6] = (i & 0x000000000F000000) >> 0x18;
	digits[7] = (i & 0x00000000F0000000) >> 0x1C;
	digits[8] = (i & 0x0000000F00000000) >> 0x20;
	digits[9] = (i & 0x000000F000000000) >> 0x24;
	digits[10] = (i & 0x00000F0000000000) >> 0x28;
	digits[11] = (i & 0x0000F00000000000) >> 0x2C;
	digits[12] = (i & 0x000F000000000000) >> 0x30;
	digits[13] = (i & 0x00F0000000000000) >> 0x34;
	digits[14] = (i & 0x0F00000000000000) >> 0x38;
	digits[15] = (i & 0xF000000000000000) >> 0x3C;
	for(i = 16; i > 0; i--)
		sceIoWrite(fd, "0123456789ABCDEF"+digits[i-1], 1);
	return;
}

void io_write_hex(SceUID fd, unsigned int i)
{
	sceIoWrite(fd, "0x", 2);
	u8 digits[8];
	digits[0] = i & 0x0000000F;
	digits[1] = (i & 0x000000F0) >> 4;
	digits[2] = (i & 0x00000F00) >> 8;
	digits[3] = (i & 0x0000F000) >> 0xC;
	digits[4] = (i & 0x000F0000) >> 0x10;
	digits[5] = (i & 0x00F00000) >> 0x14;
	digits[6] = (i & 0x0F000000) >> 0x18;
	digits[7] = (i & 0xF0000000) >> 0x1C;
	for(i = 8; i > 0; i--)
		sceIoWrite(fd, "0123456789ABCDEF"+digits[i-1], 1);
	return;
}

void io_write_short_hex(SceUID fd, unsigned int i)
{
	sceIoWrite(fd, "0x", 2);
	u8 digits[4];
	digits[0] = i & 0x0000000F;
	digits[1] = (i & 0x000000F0) >> 4;
	digits[2] = (i & 0x00000F00) >> 8;
	digits[3] = (i & 0x0000F000) >> 0xC;
	for(i = 4; i > 0; i--)
		sceIoWrite(fd, "0123456789ABCDEF"+digits[i-1], 1);
	return;
}

void io_write_byte_hex(SceUID fd, unsigned int i)
{
	sceIoWrite(fd, "0x", 2);
	u8 digits[2];
	digits[0] = i & 0x0000000F;
	digits[1] = (i & 0x000000F0) >> 4;
	sceIoWrite(fd, "0123456789ABCDEF"+digits[0], 1);
	sceIoWrite(fd, "0123456789ABCDEF"+digits[1], 1);
	return;
}

void dump_memregion(const char* file, void *addr, int len)
{
	int fd;

	fd = sceIoOpen(file, PSP_O_CREAT | PSP_O_TRUNC | PSP_O_WRONLY, 0777);
	if(fd >= 0)
	{
		sceIoWrite(fd, addr, len);
		sceIoClose(fd);
	}
}

#endif