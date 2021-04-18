#ifndef SCE_MPEG_H
#define SCE_MPEG_H

typedef void SceVoid;
typedef SceVoid SceMpegStream;
typedef void * ScePVoid;
typedef ScePVoid SceMpeg;
typedef SceInt32 (* sceMpegRingbufferCB)(ScePVoid pData, SceInt32 iNumPackets, ScePVoid pParam);
typedef SceInt32 SceMpegAuMode;

typedef struct SceMpegAu
{
	SceUInt32 iUnk0;
	SceInt32 iTimestamp;
	SceUInt32 iUnk1;
	SceUInt32 iUnk2;
	SceUInt32 iUnk3;
	SceUInt32 iUnk4;
} SceMpegAu;

typedef struct SceMpegRingbuffer
{
	SceInt32 iPackets;
	SceUInt32 iUnk0;
	SceUInt32 iUnk1;
	SceUInt32 iUnk2;
	SceUInt32 iUnk3;
	ScePVoid pData;
	sceMpegRingbufferCB Callback;
	ScePVoid pCBparam;
	SceUInt32 iUnk4;
	SceUInt32 iUnk5;
	SceMpeg pSceMpeg;
} SceMpegRingbuffer;

typedef struct SceMpegAvcMode
{
	SceInt32 iUnk0;
	SceInt32 iPixelFormat;
} SceMpegAvcMode;

typedef struct SceMpegAvcDecodeDetailInfo
{
	SceInt32	iDecodeResult;
	SceUInt32	uiRecoveryPoint;

	SceUInt32	uiHorizontalSize;
	SceUInt32	uiVerticalSize;
	SceUInt32	uiFrameCropLeftOffset;
	SceUInt32	uiFrameCropRightOffset;
	SceUInt32	uiFrameCropTopOffset;
	SceUInt32	uiFrameCropBottomOffset;
	SceUInt32	uiDisplayFrameNum;

} SceMpegAvcDecodeDetailInfo;

typedef struct SceMpegLLI
{
	ScePVoid 	pSrc;
	ScePVoid 	pDst;
	ScePVoid	Next;
	SceInt32	iSize;
} SceMpegLLI;

typedef struct {
   SceInt32 height;
   SceInt32 width;
   SceInt32 mode0;
   SceInt32 mode1;
   ScePVoid buffer0;
   ScePVoid buffer1;
   ScePVoid buffer2;
   ScePVoid buffer3;
   ScePVoid buffer4;
   ScePVoid buffer5;
   ScePVoid buffer6;
   ScePVoid buffer7;
} AvcCscStruct;

SceInt32 (* sceMpegAvcDecode) (SceMpeg *Mpeg, SceMpegAu *pAu, SceInt32 iFrameWidth, ScePVoid pBuffer, SceInt32 *iInit) = NULL;
SceVoid (* sceMpegRingbufferDestruct) (SceMpegRingbuffer *Ringbuffer) = NULL;
SceInt32 (* sceMpegInitAu) (SceMpeg *Mpeg, ScePVoid pEsBuffer, SceMpegAu *pAu) = NULL;
SceInt32 (* sceMpegQueryStreamOffset) (SceMpeg *Mpeg, ScePVoid pBuffer, SceInt32 *iOffset) = NULL;
SceInt32 (* sceMpegRingbufferConstruct) (SceMpegRingbuffer *Ringbuffer, SceInt32 iPackets, ScePVoid pData, SceInt32 iSize, sceMpegRingbufferCB Callback, ScePVoid pCBparam) = NULL;
SceMpegStream (* sceMpegRegistStream) (SceMpeg *Mpeg, SceInt32 iStreamID, SceInt32 iUnk) = NULL;
SceVoid (* sceMpegUnRegistStream) (SceMpeg Mpeg, SceMpegStream *pStream) = NULL;
SceVoid (* sceMpegDelete) (SceMpeg *Mpeg) = NULL;
SceInt32 (* sceMpegQueryStreamSize) (ScePVoid pBuffer, SceInt32 *iSize) = NULL;
SceInt32 (* sceMpegAtracDecode) (SceMpeg *Mpeg, SceMpegAu *pAu, ScePVoid pBuffer, SceInt32 iInit) = NULL;
ScePVoid (* sceMpegMallocAvcEsBuf) (SceMpeg *Mpeg) = NULL;
SceInt32 (* sceMpegRingbufferPut) (SceMpegRingbuffer *Ringbuffer, SceInt32 iNumPackets, SceInt32 iAvailable) = NULL;
SceInt32 (* sceMpegRingbufferAvailableSize) (SceMpegRingbuffer *Ringbuffer) = NULL;
SceInt32 (* sceMpegQueryMemSize) (int iUnk) = NULL;
SceVoid (* sceMpegFreeAvcEsBuf) (SceMpeg *Mpeg, ScePVoid pBuf) = NULL;
SceInt32 (* sceMpegRingbufferQueryMemSize) (SceInt32 iPackets) = NULL;
SceInt32 (* sceMpegCreate) (SceMpeg *Mpeg, ScePVoid pData, SceInt32 iSize, SceMpegRingbuffer *Ringbuffer, SceInt32 iFrameWidth, SceInt32 iUnk1, SceInt32 iUnk2) = NULL;
SceInt32 (* sceMpegGetAtracAu) (SceMpeg *Mpeg, SceMpegStream *pStream, SceMpegAu *pAu, ScePVoid pUnk) = NULL;
SceInt32 (* sceMpegQueryAtracEsSize) (SceMpeg *Mpeg, SceInt32 *iEsSize, SceInt32 *iOutSize) = NULL;
SceInt32 (* sceMpegGetAvcAu) (SceMpeg *Mpeg, SceMpegStream *pStream, SceMpegAu *pAu, SceInt32 *iUnk) = NULL;

#endif