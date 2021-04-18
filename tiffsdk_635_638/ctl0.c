#include "sdk.h"

int main(unsigned int text_addr);

// Sprungpunkt zum main Thread
int _start(unsigned int text_addr) __attribute__ ((section (".text.start")));

int _start(unsigned int text_addr)
	
	
{	
	
 sceKernelTryAllocateFpl = (void *)text_addr + 0x0015B7AC;
 sceKernelSignalSema = (void *)text_addr + 0x0015B774;
 sceRtcGetCurrentClockLocalTime = (void *)text_addr + 0x0015B9E4;
 sceDisplayWaitVblankStart = (void *)text_addr + 0x0015B8A4;
 sceGeBreak = (void *)text_addr + 0x0015B8EC;
 sceMpegUnRegistStream = (void *)text_addr + 0x0015B934;
 sceKernelWaitEventFlag = (void *)text_addr + 0x0015B77C;
 sceMpegQueryAtracEsSize = (void *)text_addr + 0x0015B994;
 sceMpegQueryStreamOffset = (void *)text_addr + 0x0015B91C;
 sceCtrlSetSamplingMode = (void *)text_addr + 0x0015B87C;
 sceKernelDcacheWritebackRange = (void *)text_addr + 0x0015B804;
 sceKernelPollEventFlag = (void *)text_addr + 0x0015B754;
 sceKernelFreeFpl = (void *)text_addr + 0x0015B734;
 sceKernelCreateSema = (void *)text_addr + 0x0015B70C;
 sceIoRead = (void *)text_addr + 0x0015B66C;
 sceMpegMallocAvcEsBuf = (void *)text_addr + 0x0015B954;
 sceCtrlGetSamplingMode = (void *)text_addr + 0x0015B88C;
 sceMpegAtracDecode = (void *)text_addr + 0x0015B94C;
 sceMpegCreate = (void *)text_addr + 0x0015B984;
 sceKernelDcacheInvalidateRange = (void *)text_addr + 0x0015B7FC;
 sceKernelCreateLwMutex = (void *)text_addr + 0x0015B7EC;
 sceMpegInitAu = (void *)text_addr + 0x0015B914;
 sceMpegGetAtracAu = (void *)text_addr + 0x0015B98C;
 sceCtrlReadBufferPositive = (void *)text_addr + 0x0015B884;
 sceAudioChangeChannelVolume = (void *)text_addr + 0x0015B85C;
 sceKernelCancelSema = (void *)text_addr + 0x0015B7CC;
 sceKernelDeleteSema = (void *)text_addr + 0x0015B74C;
 sceKernelStopModule = (void *)text_addr + 0x0015B6C4;
 sceIoOpen = (void *)text_addr + 0x0015B684;
 sceDisplaySetMode = (void *)text_addr + 0x0015B894;
 sceKernelExitThread = (void *)text_addr + 0x0015B7E4;
 sceKernelGetSystemTimeLow = (void *)text_addr + 0x0015B75C;
 sceKernelCpuSuspendIntr = (void *)text_addr + 0x0015B6A4;
 sceMpegDelete = (void *)text_addr + 0x0015B93C;
 sceRegCloseCategory = (void *)text_addr + 0x0015B9A4;
 sceGeListEnQueueHead = (void *)text_addr + 0x0015B8C4;
 SysMemUserForUser_ACBD88CA = (void *)text_addr + 0x0015B6EC;
 sceGeDrawSync = (void *)text_addr + 0x0015B8E4;
 sceKernelDeleteLwMutex = (void *)text_addr + 0x0015B7A4;
 sceKernelDeleteFpl = (void *)text_addr + 0x0015B714;
 sceKernelCreateFpl = (void *)text_addr + 0x0015B6F4;
 sceIoClose = (void *)text_addr + 0x0015B674;
 sceMpegRegistStream = (void *)text_addr + 0x0015B92C;
 sceKernelWaitSema = (void *)text_addr + 0x0015B78C;
 sceGeListEnQueue = (void *)text_addr + 0x0015B8DC;
 sceKernelLockLwMutex = (void *)text_addr + 0x0015B69C;
 sceIoLseek = (void *)text_addr + 0x0015B68C;
 sceDisplaySetFrameBuf = (void *)text_addr + 0x0015B89C;
 sceRegOpenCategory = (void *)text_addr + 0x0015B9AC;
 sceKernelReleaseSubIntrHandler = (void *)text_addr + 0x0015B64C;
 sceAudioOutputPannedBlocking = (void *)text_addr + 0x0015B834;
 sceRtcGetCurrentClock = (void *)text_addr + 0x0015B9DC;
 sceKernelCreateThread = (void *)text_addr + 0x0015B784;
 sceKernelTerminateDeleteThread = (void *)text_addr + 0x0015B764;
 sceKernelDeleteEventFlag = (void *)text_addr + 0x0015B71C;
 sceKernelLoadModule = (void *)text_addr + 0x0015B6DC;
 sceGeEdramGetAddr = (void *)text_addr + 0x0015B8FC;
 sceMpegRingbufferPut = (void *)text_addr + 0x0015B95C;
 sceGeEdramGetSize = (void *)text_addr + 0x0015B8CC;
 sceAudioSetChannelDataLen = (void *)text_addr + 0x0015B864;
 sceKernelDeleteThread = (void *)text_addr + 0x0015B7DC;
 sceKernelDelayThread = (void *)text_addr + 0x0015B704;
 sceKernelDcacheWritebackAll = (void *)text_addr + 0x0015B7F4;
 sceKernelGetThreadCurrentPriority = (void *)text_addr + 0x0015B7D4;
 sceKernelChangeThreadPriority = (void *)text_addr + 0x0015B7B4;
 sceKernelPollSema = (void *)text_addr + 0x0015B79C;
 sceKernelStartThread = (void *)text_addr + 0x0015B72C;
 sceMpegQueryMemSize = (void *)text_addr + 0x0015B96C;
 sceDisplayGetFrameBuf = (void *)text_addr + 0x0015B8AC;
 sceMpegRingbufferDestruct = (void *)text_addr + 0x0015B90C;
 sceKernelClearEventFlag = (void *)text_addr + 0x0015B7C4;
 sceKernelUnloadModule = (void *)text_addr + 0x0015B6CC;
 sceKernelCpuResumeIntr = (void *)text_addr + 0x0015B6BC;
 sceAudioGetChannelRestLength = (void *)text_addr + 0x0015B854;
 sceGeContinue = (void *)text_addr + 0x0015B8D4;
 sceRegCloseRegistry = (void *)text_addr + 0x0015B9CC;
 sceKernelPrintf = (void *)text_addr + 0x0015B6E4;
 sceRtcGetCurrentTick = (void *)text_addr + 0x0015B9D4;
 sceKernelExitDeleteThread = (void *)text_addr + 0x0015B7BC;
 sceKernelStartModule = (void *)text_addr + 0x0015B6D4;
 sceKernelUnlockLwMutex = (void *)text_addr + 0x0015B6AC;
 sceMpegFreeAvcEsBuf = (void *)text_addr + 0x0015B974;
 sceMpegQueryStreamSize = (void *)text_addr + 0x0015B944;
 sceAudioChRelease = (void *)text_addr + 0x0015B844;
 sceKernelEnableSubIntr = (void *)text_addr + 0x0015B654;
 sceMpegRingbufferAvailableSize = (void *)text_addr + 0x0015B964;
 sceMpegRingbufferQueryMemSize = (void *)text_addr + 0x0015B97C;
 sceAudioChangeChannelConfig = (void *)text_addr + 0x0015B84C;
 sceRegGetKeyValue = (void *)text_addr + 0x0015B9B4;
 sceKernelCreateEventFlag = (void *)text_addr + 0x0015B794;
 sceAudioOutputPanned = (void *)text_addr + 0x0015B86C;
 sceRegOpenRegistry = (void *)text_addr + 0x0015B9BC;
 sceKernelWaitThreadEnd = (void *)text_addr + 0x0015B73C;
 sceKernelSetEventFlag = (void *)text_addr + 0x0015B724;
 sceAudioOutputBlocking = (void *)text_addr + 0x0015B82C;
 sceGeListSync = (void *)text_addr + 0x0015B8BC;
 sceKernelCancelEventFlag = (void *)text_addr + 0x0015B6FC;
 sceKernelRegisterSubIntrHandler = (void *)text_addr + 0x0015B644;
 sceIoWrite = (void *)text_addr + 0x0015B65C;
 sceGeListUpdateStallAddr = (void *)text_addr + 0x0015B8F4;
 sceIoIoctl = (void *)text_addr + 0x0015B664;
 sceRegGetKeyInfo = (void *)text_addr + 0x0015B9C4;
 sceIoGetstat = (void *)text_addr + 0x0015B67C;
 sceMpegGetAvcAu = (void *)text_addr + 0x0015B99C;
 sceAudioChReserve = (void *)text_addr + 0x0015B83C;
 sceMpegAvcDecode = (void *)text_addr + 0x0015B904;
 sceMpegRingbufferConstruct = (void *)text_addr + 0x0015B924;



	main(text_addr);
	
};