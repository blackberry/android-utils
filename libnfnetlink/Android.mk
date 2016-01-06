LOCAL_PATH:= $(call my-dir)

# We need to build this for both the device (as a shared library)
# and the host (as a static library for tools to use).

common_SRC_FILES := \
	src/rtnl.c \
	src/libnfnetlink.c \
	src/iftable.c

common_C_INCLUDES += \
	$(LOCAL_PATH)/include

###    # For the device
###    # =====================================================
###
###    include $(CLEAR_VARS)
###    LOCAL_SRC_FILES := $(common_SRC_FILES)
###    LOCAL_C_INCLUDES += $(common_C_INCLUDES)
###
###    LOCAL_MODULE:= libnfnetlink
###
###    include $(BUILD_STATIC_LIBRARY)

# Shared library
#=======================================================
include $(CLEAR_VARS)

LOCAL_MODULE:= libnfnetlink

LOCAL_SRC_FILES := $(common_SRC_FILES)
LOCAL_C_INCLUDES := $(common_C_INCLUDES)

include $(BUILD_SHARED_LIBRARY)

###   # For the host
###   # ========================================================
###
###   include $(CLEAR_VARS)
###   LOCAL_SRC_FILES := $(common_SRC_FILES)
###   LOCAL_C_INCLUDES += $(common_C_INCLUDES)
###   LOCAL_MODULE:= libnfnetlink
###   include $(BUILD_HOST_STATIC_LIBRARY)
