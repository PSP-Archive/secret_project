#ifndef SCE_RTC_H
#define SCE_RTC_H

typedef struct {
	u16 year;
	u16 month;
	u16 day;
	u16 hour;
	u16 minutes;
	u16 seconds;
	u32 microseconds;
} pspTime;

enum pspRtcCheckValidErrors {
	PSP_TIME_INVALID_YEAR = -1,
	PSP_TIME_INVALID_MONTH = -2,
	PSP_TIME_INVALID_DAY = -3,
	PSP_TIME_INVALID_HOUR = -4,
	PSP_TIME_INVALID_MINUTES = -5,
	PSP_TIME_INVALID_SECONDS = -6,
	PSP_TIME_INVALID_MICROSECONDS = -7
};

int (* sceRtcGetCurrentTick) (u64 *tick) = NULL;
int (* sceRtcGetCurrentClock) (pspTime *time, int tz) = NULL;
int (* sceRtcGetCurrentClockLocalTime) (pspTime *time) = NULL;

#endif