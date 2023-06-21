LOCAL_LDLIBS    := -landroid -llog

# Make the final output library smaller by only keeping the symbols referenced from the app.
ifneq ($(APP_OPTIM),debug)
    LOCAL_CFLAGS += -O3
    LOCAL_CFLAGS += -fvisibility=hidden -fvisibility-inlines-hidden
    LOCAL_CFLAGS += -ffunction-sections -fdata-sections
    LOCAL_LDFLAGS += -Wl,--gc-sections
    LOCAL_LDFLAGS += -Wl,--exclude-libs,ALL
    LOCAL_LDFLAGS += -flto
endif

LOCAL_CFLAGS    += -DSTDC_HEADERS -std=c11 -I $(LOCAL_PATH)
LOCAL_CPPFLAGS  += -std=c++11
LOCAL_SRC_FILES := $(LOCAL_PATH)/ggml.c \
                   $(LOCAL_PATH)/whisper.cpp \
                   $(LOCAL_PATH)/jni.c