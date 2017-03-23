LOCAL_PATH := $(call my-dir)
LIBICONV_PATH := $(LOCAL_PATH)/libiconv/lib

#########################
# Build the e2fsck binary

e2fsck_src_files :=  \
        buffer.c charsetConv.c codepages.c config.c copyfile.c devices.c dirCache.c directory.c direntry.c expand.c fat.c fat_free.c file.c file_name.c filter.c floppyd_io.c force_io.c hash.c init.c llong.c match.c mainloop.c mattrib.c mbadblocks.c mcat.c mcd.c mclasserase.c mcopy.c mdel.c mdir.c mdoctorfat.c mdu.c mformat.c minfo.c misc.c missFuncs.c mk_direntry.c mlabel.c mmd.c mmount.c mmove.c mpartition.c mshortname.c mshowfat.c mzip.c mtools.c patchlevel.c plain_io.c precmd.c privileges.c scsi.c signal.c stream.c streamcache.c subdir.c unixdir.c tty.c vfat.c xdf_io.c dummy.c
#libiconv/lib/nl_langinfo.c

#e2fsck_shared_libraries := libiconv
e2fsck_system_shared_libraries := libc

e2fsck_c_includes := external/mtools external/mtools/internal
#external/mtools/libiconv/lib
#e2fsck_c_includes += $(LIBICONV_PATH)/../include $(LIBICONV_PATH)/../libcharset/include $(LIBICONV_PATH)/internal

e2fsck_cflags := -O2 -g -W -Wall -fno-strict-aliasing -DHAVE_CONFIG_H -DSYSCONFDIR=\"/system/etc\" -DVENDOR_unknown -DOS_linux

include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(e2fsck_src_files)
LOCAL_C_INCLUDES := $(e2fsck_c_includes)
LOCAL_CFLAGS := $(e2fsck_cflags)
LOCAL_SYSTEM_SHARED_LIBRARIES := $(e2fsck_system_shared_libraries)
#LOCAL_SHARED_LIBRARIES := $(e2fsck_shared_libraries)
LOCAL_STATIC_LIBRARIES := libiconv
LOCAL_MODULE := mtools
LOCAL_MODULE_TAGS := optional
include $(BUILD_EXECUTABLE)
