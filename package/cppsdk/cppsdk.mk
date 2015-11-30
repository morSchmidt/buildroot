################################################################################
#
# cppsdk
#
################################################################################
CPPSDK_VERSION = dbfb23f6418af3ce92eebbd7579ffd6d5602523b
CPPSDK_SITE_METHOD = git
CPPSDK_SITE = git@github.com:Metrological/cppsdk.git
CPPSDK_INSTALL_STAGING = YES

ifeq ($(BR2_ENABLE_DEBUG),y)
CPPSDK_CONF_OPTS += -DCPPSDK_DEBUG=ON
else ifeq ($(BR2_PACKAGE_CPPSDK_DEBUG),y)
CPPSDK_CONF_OPTS += -DCPPSDK_DEBUG=ON
endif

ifeq ($(BR2_PACKAGE_CPPSDK_GENERICS),y)
CPPSDK_CONF_OPTS += -DCPPSDK_GENERICS=ON
endif

ifeq ($(BR2_PACKAGE_CPPSDK_CRYPTALGO),y)
CPPSDK_CONF_OPTS += -DCPPSDK_CRYPTALGO=ON
endif

ifeq ($(BR2_PACKAGE_CPPSDK_WEBSOCKET),y)
CPPSDK_CONF_OPTS += -DCPPSDK_WEBSOCKET=ON
CPPSDK_DEPENDENCIES += zlib
endif

ifeq ($(BR2_PACKAGE_CPPSDK_TRACING),y)
CPPSDK_CONF_OPTS += -DCPPSDK_TRACING=ON
endif

ifeq ($(BR2_PACKAGE_CPPSDK_DEVICES),y)
CPPSDK_CONF_OPTS += -DCPPSDK_DEVICES=ON
endif

$(eval $(cmake-package))
