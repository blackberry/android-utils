LOCAL_PATH:= $(call my-dir)

# We need to build this for both the device (as a shared library)
# and the host (as a static library for tools to use).

common_SRC_FILES := \
	src/main.c \
	src/callback.c \
	src/conntrack/api.c \
	src/conntrack/bsf.c \
	src/conntrack/compare.c \
	src/conntrack/copy.c \
	src/conntrack/filter.c \
	src/conntrack/filter_dump.c \
	src/conntrack/getter.c \
	src/conntrack/grp.c \
	src/conntrack/grp_getter.c \
	src/conntrack/grp_setter.c \
	src/conntrack/setter.c \
	src/conntrack/snprintf.c \
	src/conntrack/snprintf_default.c \
	src/conntrack/snprintf_xml.c \
	src/conntrack/stack.c \
	src/conntrack/parse.c \
	src/conntrack/objopt.c \
	src/conntrack/build.c \
	src/conntrack/labels.c \
	src/expect/api.c \
	src/expect/build.c \
	src/expect/compare.c \
	src/expect/getter.c \
	src/expect/parse.c \
	src/expect/setter.c \
	src/expect/snprintf.c \
	src/expect/snprintf_default.c \
	src/expect/snprintf_xml.c

common_C_INCLUDES += \
	$(LOCAL_PATH)/include

# For the device
# =====================================================

#include $(CLEAR_VARS)
#
#LOCAL_SRC_FILES := $(common_SRC_FILES)
#LOCAL_C_INCLUDES := $(common_C_INCLUDES)
#LOCAL_C_INCLUDES += external/libnetfilter_conntrack/libmnl/libmnl.h
#LOCAL_C_INCLUDES += external/libnfnetlink/include
#LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include
#
#LOCAL_MODULE:= libnetfilter_conntrack
#
#include $(BUILD_STATIC_LIBRARY)


# Shared librar
#=======================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(common_SRC_FILES)
LOCAL_C_INCLUDES := $(common_C_INCLUDES)
LOCAL_C_INCLUDES += external/libnetfilter_conntrack/libmnl/libmnl.h
LOCAL_C_INCLUDES += external/libnfnetlink/include
LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include
LOCAL_ADDITIONAL_DEPENDENCIES := $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr
LOCAL_SHARED_LIBRARIES := $(common_SHARED_LIBRARIES) libnfnetlink

LOCAL_MODULE:= libnetfilter_conntrack
LOCAL_CLANG := false

include $(BUILD_SHARED_LIBRARY)
###
###    # For the host
###    # ========================================================
###
###    include $(CLEAR_VARS)
###    LOCAL_SRC_FILES := $(common_SRC_FILES)
###    LOCAL_C_INCLUDES := $(common_C_INCLUDES)
###    LOCAL_C_INCLUDES += external/libnetfilter_conntrack/libmnl/libmnl.h
###    LOCAL_C_INCLUDES += external/libnfnetlink/include
###    LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include
###    LOCAL_MODULE:= libnetfilter_conntrack
###    include $(BUILD_HOST_STATIC_LIBRARY)
###
