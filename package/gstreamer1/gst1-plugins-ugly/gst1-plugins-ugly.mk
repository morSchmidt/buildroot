################################################################################
#
# gst1-plugins-ugly
#
################################################################################

GST1_PLUGINS_UGLY_VERSION = 1.6.1
GST1_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST1_PLUGINS_UGLY_VERSION).tar.xz
GST1_PLUGINS_UGLY_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-ugly
GST1_PLUGINS_UGLY_LICENSE_FILES = COPYING
# GPL licensed plugins will append to GST1_PLUGINS_UGLY_LICENSE if enabled.
GST1_PLUGINS_UGLY_LICENSE = LGPLv2.1+

ifeq ($(BR2_PACKAGE_GSTREAMER1_GIT),y)
GST1_PLUGINS_UGLY_VERSION = cc2c53bdde6be3d8d400ec9772c78979b8691aa9
GST1_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST1_PLUGINS_UGLY_VERSION).tar.xz
GST1_PLUGINS_UGLY_SITE = http://cgit.freedesktop.org/gstreamer/gst-plugins-ugly/snapshot
BR_NO_CHECK_HASH_FOR += $(GST1_PLUGINS_UGLY_SOURCE)
GST1_PLUGINS_UGLY_AUTORECONF = YES
GST1_PLUGINS_UGLY_AUTORECONF_OPTS = -I $(@D)/m4 -I $(@D)/common/m4
GST1_PLUGINS_UGLY_POST_DOWNLOAD_HOOKS += GSTREAMER1_COMMON_DOWNLOAD
GST1_PLUGINS_UGLY_POST_EXTRACT_HOOKS += GSTREAMER1_COMMON_EXTRACT
GST1_PLUGINS_UGLY_PRE_CONFIGURE_HOOKS += GSTREAMER1_FIX_AUTOPOINT
GST1_PLUGINS_UGLY_POST_INSTALL_TARGET_HOOKS += GSTREAMER1_REMOVE_LA_FILES
endif

GST1_PLUGINS_UGLY_CONF_OPTS = --disable-examples --disable-valgrind

GST_PLUGINS_BAD1_CONF_OPTS += \
	--disable-a52dec \
	--disable-amrnb \
	--disable-amrwb \
	--disable-cdio \
	--disable-sidplay \
	--disable-twolame \
	--disable-x264

GST1_PLUGINS_UGLY_DEPENDENCIES = gstreamer1 gst1-plugins-base

ifeq ($(BR2_PACKAGE_ORC),y)
GST1_PLUGINS_UGLY_CONF_OPTS += --enable-orc
GST1_PLUGINS_UGLY_DEPENDENCIES += orc
endif

ifeq ($(BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_ASFDEMUX),y)
GST1_PLUGINS_UGLY_CONF_OPTS += --enable-asfdemux
else
GST1_PLUGINS_UGLY_CONF_OPTS += --disable-asfdemux
endif

ifeq ($(BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_DVDLPCMDEC),y)
GST1_PLUGINS_UGLY_CONF_OPTS += --enable-dvdlpcmdec
else
GST1_PLUGINS_UGLY_CONF_OPTS += --disable-dvdlpcmdec
endif

ifeq ($(BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_DVDSUB),y)
GST1_PLUGINS_UGLY_CONF_OPTS += --enable-dvdsub
else
GST1_PLUGINS_UGLY_CONF_OPTS += --disable-dvdsub
endif

ifeq ($(BR2_PACKAGE_GST_PLUGINS_UGL1_PLUGIN_XINGMUX),y)
GST1_PLUGINS_UGLY_CONF_OPTS += --enable-xingmux
else
GST1_PLUGINS_UGLY_CONF_OPTS += --disable-xingmux
endif

ifeq ($(BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_REALMEDIA),y)
GST1_PLUGINS_UGLY_CONF_OPTS += --enable-realmedia
else
GST1_PLUGINS_UGLY_CONF_OPTS += --disable-realmedia
endif

ifeq ($(BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_DVDREAD),y)
GST1_PLUGINS_UGLY_CONF_OPTS += --enable-dvdread
GST1_PLUGINS_UGLY_DEPENDENCIES += libdvdread
GST1_PLUGINS_UGLY_HAS_GPL_LICENSE = y
else
GST1_PLUGINS_UGLY_CONF_OPTS += --disable-dvdread
endif

ifeq ($(BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_LAME),y)
GST1_PLUGINS_UGLY_CONF_OPTS += --enable-lame
GST1_PLUGINS_UGLY_DEPENDENCIES += lame
else
GST1_PLUGINS_UGLY_CONF_OPTS += --disable-lame
endif

ifeq ($(BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_MAD),y)
GST1_PLUGINS_UGLY_CONF_OPTS += --enable-mad
GST1_PLUGINS_UGLY_DEPENDENCIES += libid3tag libmad
GST1_PLUGINS_UGLY_HAS_GPL_LICENSE = y
else
GST1_PLUGINS_UGLY_CONF_OPTS += --disable-mad
endif

ifeq ($(BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_MPEG2DEC),y)
GST1_PLUGINS_UGLY_CONF_OPTS += --enable-mpeg2dec
GST1_PLUGINS_UGLY_DEPENDENCIES += libmpeg2
GST1_PLUGINS_ULGY_HAS_GPL_LICENSE = y
else
GST1_PLUGINS_UGLY_CONF_OPTS += --disable-mpeg2dec
endif

# Add GPL license if GPL plugins enabled.
ifeq ($(GST1_PLUGINS_UGLY_HAS_GPL_LICENSE),y)
GST1_PLUGINS_UGLY_LICENSE += GPLv2
endif

# Use the following command to extract license info for plugins.
# # find . -name 'plugin-*.xml' | xargs grep license

$(eval $(autotools-package))
