LOCAL_PATH := $(call my-dir)

#########################
# Build the e2fsck binary

e2fsck_src_files :=  \
	iconv.c ../libcharset/lib/localcharset.c relocatable.c nl_langinfo.c timelocal.c lnumeric.c lmonetary.c lmessages.c ldpart.c fix_grouping.c locale.c ctype/ctype_.c ../newlib/newlib/libc/machine/spu/impure.c ../newlib/newlib/libc/stdio/rget.c ../newlib/newlib/libc/stdio/refill.c ../newlib/newlib/libc/stdio/fflush.c ../newlib/newlib/libc/stdio/makebuf.c ../newlib/newlib/libc/sys/linux/freer.c ../newlib/newlib/libc/stdio/fwalk.c ../newlib/newlib/libc/reent/fstatr.c ../newlib/newlib/libc/reent/isattyr.c ../newlib/newlib/libc/stdio/findfp.c ../newlib/libgloss/arm/syscalls.c ../newlib/newlib/libc/sys/linux/mallocr.c errno.c
e2fsck_shared_libraries :=
e2fsck_system_shared_libraries := libc

e2fsck_c_includes := $(LOCAL_PATH) $(LOCAL_PATH)/../include $(LOCAL_PATH)/../lib $(LOCAL_PATH)/../../internal $(LOCAL_PATH)/../libcharset/include $(LOCAL_PATH)/internal

e2fsck_cflags := -O2 -fvisibility=hidden -DLIBDIR=\"/system/lib\" -DBUILDING_LIBICONV -DBUILDING_DLL -DENABLE_RELOCATABLE=1 -DIN_LIBRARY -DINSTALLDIR=\"/system/lib\" -DNO_XMALLOC -Dset_relocation_prefix=libiconv_set_relocation_prefix -Drelocate=libiconv_relocate -DPACKAGE_NAME=\"libiconv\" -DPACKAGE_TARNAME=\"libiconv\" -DPACKAGE_VERSION=\"0\" "-DPACKAGE_STRING=\"libiconv 0\"" -DPACKAGE_BUGREPORT=\"\" -DPACKAGE_URL=\"\" -DINSTALLPREFIX=\"/usr/local\" -DSTDC_HEADERS=1 -DHAVE_SYS_TYPES_H=1 -DHAVE_SYS_STAT_H=1 -DHAVE_STDLIB_H=1 -DHAVE_STRING_H=1 -DHAVE_MEMORY_H=1 -DHAVE_STRINGS_H=1 -DHAVE_INTTYPES_H=1 -DHAVE_STDINT_H=1 -DHAVE_UNISTD_H=1 -D__EXTENSIONS__=1 -D_ALL_SOURCE=1 -D_DARWIN_C_SOURCE=1 -D_GNU_SOURCE=1 -D_POSIX_PTHREAD_SEMANTICS=1 -D__STDC_WANT_IEC_60559_ATTRIBS_EXT__=1 -D__STDC_WANT_IEC_60559_BFP_EXT__=1 -D__STDC_WANT_IEC_60559_DFP_EXT__=1 -D__STDC_WANT_IEC_60559_FUNCS_EXT__=1 -D__STDC_WANT_IEC_60559_TYPES_EXT__=1 -D__STDC_WANT_LIB_EXT2__=1 -D__STDC_WANT_MATH_SPEC_FUNCS__=1 -D_TANDEM_SOURCE=1

include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(e2fsck_src_files)
LOCAL_C_INCLUDES := $(e2fsck_c_includes)
LOCAL_CFLAGS := $(e2fsck_cflags)
LOCAL_SYSTEM_SHARED_LIBRARIES := $(e2fsck_system_shared_libraries)
LOCAL_SHARED_LIBRARIES := $(e2fsck_shared_libraries)
LOCAL_MODULE := libiconv
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(e2fsck_src_files)
LOCAL_C_INCLUDES := $(e2fsck_c_includes)
LOCAL_CFLAGS := $(e2fsck_cflags)
LOCAL_SYSTEM_SHARED_LIBRARIES := $(e2fsck_system_shared_libraries)
LOCAL_SHARED_LIBRARIES := $(e2fsck_shared_libraries)
LOCAL_MODULE := libiconv
LOCAL_MODULE_TAGS := optional
include $(BUILD_STATIC_LIBRARY)
