#ifndef __BASE_H__
#define __BASE_H__

#define TRUE 1
#define FALSE !TRUE
#define NULL 0

typedef int SceUID;
typedef int SceMode;
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef unsigned long int u64;
typedef unsigned int SceSize;
typedef unsigned int SceUInt;
typedef unsigned long clock_t;
typedef unsigned long time_t;
typedef unsigned int uint32_t;
typedef int int32_t;
typedef long int int64_t;
typedef int32_t SceInt32;
typedef int64_t SceInt64;
typedef uint32_t SceUInt32;
typedef SceInt64 SceOff;

int strlen_c(const char *s)
{
	const char *sc;

	for (sc = s; *sc != '\0'; ++sc)
		;// nothing

	return sc - s;
}

u16 getSyscallForFunc(u32 func)
{
	return (u16)((((u32 *) func)[1] >> 6) & 0xFFFFF);
}

u32 getOpcodeForSyscall(u16 syscall)
{
	return (syscall<<6)+0xC;
}

#endif