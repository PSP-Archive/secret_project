#ifndef SCEAUDIO_H
#define SCEAUDIO_H

int (* sceAudioOutputBlocking) (int channel, int vol, void *buf) = NULL;
int (* sceAudioOutputPannedBlocking) (int channel, int leftvol, int rightvol, void *buf) = NULL;
int (* sceAudioChReserve) (int channel, int samplecount, int format) = NULL;
int (* sceAudioChRelease) (int channel) = NULL;
int (* sceAudioChangeChannelConfig) (int channel, int format) = NULL;
void (* sceAudioGetChannelRestLength) (void) = NULL;
int (* sceAudioChangeChannelVolume) (int channel, int leftvol, int rightvol) = NULL;
int (* sceAudioSetChannelDataLen) (int channel, int samplecount) = NULL;
int (* sceAudioOutputPanned) (int channel, int leftvol, int rightvol, void *buf) = NULL;

#endif