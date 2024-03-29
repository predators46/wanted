#
# Copyright (C) 2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

# 
# Original Boost 1.51 Makefile by Mirko Vogt <mirko@openwrt.org>
# Dude, this "boost" is really one of the most crude stuff I ported yet.
#


include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/nls.mk
include $(INCLUDE_DIR)/target.mk 

PKG_NAME:=boost
PKG_VERSION:=1_59_0
PKG_RELEASE:=8

PKG_SOURCE:=$(PKG_NAME)_$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/boost
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)_$(PKG_VERSION)
HOST_BUILD_DIR:=$(BUILD_DIR_HOST)/$(PKG_NAME)_$(PKG_VERSION)
PKG_MD5SUM:=51528a0e3b33d9e10aaa311d9eb451e3
PKG_LICENSE:=Boost Software License <http://www.boost.org/users/license.html>
PKG_MAINTAINER:=Carlos M. Ferreira <carlosmf.pt@gmail.com>

PKG_BUILD_DEPENDS += boost/host 
PKG_BUILD_PARALLEL:=0
PKG_USE_MIPS16:=0

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk


define Package/boost/Default
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Boost C++ source library
  URL:=http://www.boost.org
  DEPENDS:=+libstdcpp +libpthread +librt
endef

define Package/boost/description/Default
  true
endef

define Package/boost/description
This package provides the Boost v1.59 libraries.
Boost is a set of free, peer-reviewed, portable C++ source libraries.
This package provides the following libraries:
 - atomic
 - chrono
 - container
 - context
 - coroutine
 - - coroutine2 (requires GCC v5 and up)
 - date_time
 - exception
 - filesystem
 - graph
 - - graph-parallel
 - iostreams
 - locale
 - log
 - math
 - program_options
 - python3
 - random
 - regex
 - serialization
 - signals
 - system
 - thread
 - timer
 - wave
endef

BOOST_LIBS =

define Package/boost-libs
$(call Package/boost/Default)
  TITLE+= (all libs)
  DEPENDS+= $(BOOST_DEPENDS)
  HIDDEN:=1
endef

define Package/boost-libs/description
$(call Package/boost/description/Default)
 .
 This meta package contains only dependencies to the other libraries from
 the boost libraries collection.
endef

# Create a meta-package of dependent libraries (for ALL)
define Package/boost-libs/install
  true
endef

define Package/boost/install
  true
endef


define Package/boost
  $(call Package/boost/Default)
  TITLE+= packages
  DEPENDS:=+ALL:boost-libs +ALL:boost-test
endef

define Package/boost/config
    menu "Select Boost Options"
      depends on PACKAGE_boost
      	comment "Boost compilation options."

      	choice
      		prompt "Compile Boost libraries."
      			default boost-static-and-shared-libs
      			help
      				Choose which version to compile.
      				 -> Shared:
      				    - Only Shared libs will be compiled.
      				 -> Static:
      				    - Only Static libs will be compiled.
      				 -> Both:
      				    - Both Static and Shared libs will be compiled.		    

		    config boost-shared-libs
		    	bool "Shared"
			
			config boost-static-libs
		    	bool "Static"		    	
			
			config boost-static-and-shared-libs
		    	bool "Both"		    	
	    endchoice

      	choice
      		prompt "Selects Boost Runtime linkage."
      		default boost-runtime-shared
      		help
      			Choose which C and C++ runtimes to use:
      			 -> Use Shared runtimes.
      			 -> Use Static runtimes.
      			    - Not available if Shared libs are to be built.
      			 -> Use both runtimes.
      			    - Not available if Shared libs are to be built.
      			    - Two seperate versions of Boost are built, linking each to a different runtime. 
      			    - This option requires "Use tagged names" option to be active.

		    config boost-runtime-shared
		    	bool "Shared"

		    config boost-runtime-static
		    	depends on @(!boost-shared-libs&&!boost-static-and-shared-libs)
		    	bool "Static"		    	
		    
		    config boost-runtime-static-and-shared
		    	depends on @(boost-use-name-tags&&!boost-shared-libs&&!boost-static-and-shared-libs)
		    	bool "Both"
	    endchoice

      	choice
      		prompt "Select a Variant."
      		default boost-variant-release
      		help
      			Chooses which boost variant should be selected:
      			-> Release: Optimizes Boost for release.
      			   - Optimization: Speed;  Debug Symbols: Off; Inlining: Full; Runtime Debugging: Off.
      			-> Debug: 
      			   - Optimization: Off; Debug Symbols: On; Inlining: Off; Runtime Debugging: On.
      			-> Profile:
      			   - Profiling: On;  Debug Symbols: On.

      		config boost-variant-release
      			bool "Release"

      		config boost-variant-debug
      			bool "Debug"
      				
      		config boost-variant-profile
      			bool "Profile"
      	endchoice	    	

	    config boost-use-name-tags
	    	bool "Use tagged names."
	    	help 
	    		Add name tags the lib files, to diferentiate each library version:
	    		  "-mt" for multi-threading.
	    		  "-d" for debugging.
	    		  "-s" for runtime static link".
	    		Might break compatibility with libraries that expect boost libs with default names.
	    	default n	    	

	    config boost-single-thread
	    	depends on @boost-use-name-tags
	    	bool "Single thread Support."
	    	help 
	    		Compile Boost libraries in single-thread mode.
	    	default n
			    
	    config boost-build-type-complete
	    	depends on @boost-use-name-tags
	    	bool "Complete Boost Build."
	    	help 
	    		Builds both release and debug libs. It will take much longer to compile.
	    	default n	    	
    endmenu

    menu "Select Boost libraries"
      depends on PACKAGE_boost
		comment "Libraries"

		config boost-libs-all
		bool "Include all Boost libraries."
	    	select PACKAGE_boost-libs	    	

		config boost-test-pkg
		bool "Boost test package."
	    	select PACKAGE_boost-test
	    
		config boost-coroutine2
		depends on @GCC_VERSION_5
		bool "Boost couroutine2 support."
		select PACKAGE_boost-coroutine
		default n

		config boost-graph-parallel
		bool "Boost parallel graph support."
		select PACKAGE_boost-graph
		default n

		$(foreach lib,$(BOOST_LIBS), \
		  config PACKAGE_boost-$(lib)
		  prompt "Boost $(lib) library."
		)
  	endmenu

endef

PKG_CONFIG_DEPENDS:= CONFIG_PACKAGE_boost-test

define Package/boost-test
  $(call Package/boost/Default)
  TITLE+= (test)
  HIDDEN:=1  
  DEPENDS+=+boost-system +boost-timer
endef

define Build/Configure
endef

# 1: short name
# 2: dependencies on other boost libraries (short name)
# 3: dependencies on other packages
define DefineBoostLibrary

  BOOST_DEPENDS+= +boost-$(1) 
  BOOST_LIBS+= $(1)

  PKG_CONFIG_DEPENDS+= CONFIG_PACKAGE_boost-$(1)

  define Package/boost-$(1)
    $(call Package/boost/Default)
    TITLE+= ($(1))
    DEPENDS+= $$(foreach lib,$(2),+boost-$$(lib)) $(3)
    HIDDEN:=1
  endef

  define Package/boost-$(1)/description
   $(call Package/boost/description/Default)
   .
   This package contains the Boost $(1) library.
  endef
endef


$(eval $(call DefineBoostLibrary,atomic,system,))
$(eval $(call DefineBoostLibrary,chrono,system,))
$(eval $(call DefineBoostLibrary,container,,))
$(eval $(call DefineBoostLibrary,context,chrono system thread,))
$(eval $(call DefineBoostLibrary,coroutine,system chrono context thread,))
$(eval $(call DefineBoostLibrary,date_time,,))
#$(eval $(call DefineBoostLibrary,exception,,))
$(eval $(call DefineBoostLibrary,filesystem,system,))
$(eval $(call DefineBoostLibrary,graph,regex,))
$(eval $(call DefineBoostLibrary,iostreams,,+PACKAGE_boost-iostreams:zlib))
$(eval $(call DefineBoostLibrary,locale,system,$(ICONV_DEPENDS) +@BUILD_NLS))
$(eval $(call DefineBoostLibrary,log,system chrono date_time thread filesystem regex,))
$(eval $(call DefineBoostLibrary,math,,))
#$(eval $(call DefineBoostLibrary,mpi,,)) # OpenMPI does no exist in OpenWRT at this time.
$(eval $(call DefineBoostLibrary,program_options,,))
$(eval $(call DefineBoostLibrary,python3,,+PACKAGE_boost-python3:python3))
$(eval $(call DefineBoostLibrary,random,system,))
$(eval $(call DefineBoostLibrary,regex,,))
$(eval $(call DefineBoostLibrary,serialization,,))
$(eval $(call DefineBoostLibrary,signals,,))
$(eval $(call DefineBoostLibrary,system,,))
$(eval $(call DefineBoostLibrary,thread,system chrono atomic,))
$(eval $(call DefineBoostLibrary,timer,chrono))
$(eval $(call DefineBoostLibrary,wave,date_time thread filesystem,))


define Host/Compile
	# b2 does not provide a configure-script nor a Makefile
	( cd $(HOST_BUILD_DIR)/tools/build/src/engine ; ./build.sh gcc )
endef

CONFIGURE_PREFIX:=$(PKG_INSTALL_DIR)
TARGET_LDFLAGS += -pthread -lrt

TARGET_CFLAGS += \
	$(if $(CONFIG_PACKAGE_boost-python3), -I$(STAGING_DIR)/usr/include/python3.5/) \
	$(if $(CONFIG_SOFT_FLOAT),-DBOOST_NO_FENV_H) -fPIC

ifneq ($(findstring mips,$(ARCH)),)
    BOOST_ABI = o32
    ifneq ($(findstring 64,$(ARCH)),)
        BOOST_ABI = o64
    endif
else ifneq ($(findstring arm,$(ARCH)),)
    BOOST_ABI = aapcs
else ifeq ($(ARCH),aarch64)
    BOOST_ABI = aapcs
else
    BOOST_ABI = sysv
endif

comma := ,

define Build/Compile
	$(info Selected Boost API $(BOOST_ABI) for architecture $(ARCH) and cpu $(CPU_TYPE) $(CPU_SUBTYPE))
	( cd $(PKG_BUILD_DIR) ; \
		echo "using gcc : $(ARCH) : $(GNU_TARGET_NAME)-gcc : <compileflags>\"$(TARGET_CFLAGS)\" <cxxflags>\"$(TARGET_CXXFLAGS)\" <linkflags>\"$(TARGET_LDFLAGS)\" ;" > tools/build/src/user-config.jam ; \
		$(if $(CONFIG_PACKAGE_boost-python3), \
			echo "using python : 3.5 : $(STAGING_DIR_ROOT)/usr/bin/python3 : $(STAGING_DIR)/usr/include/python3.5/ ;" >> \
				tools/build/src/user-config.jam; \
		) \
		b2 \
			$(CONFIGURE_ARGS) \
			--ignore-site-config \
			--toolset=gcc-$(ARCH) abi=$(BOOST_ABI) \
			--disable-long-double \
			$(if $(CONFIG_boost-variant-release), variant=release,) \
			$(if $(CONFIG_boost-variant-debug), variant=debug,) \
			$(if $(CONFIG_boost-variant-profile), variant=profile,) \
			$(if $(CONFIG_boost-use-name-tags),--layout=tagged,--layout=system) \
			$(if $(CONFIG_boost-build-type-complete),--build-type=complete,--build-type=minimal) \
			$(if $(CONFIG_boost-shared-libs),link=shared,) \
			$(if $(CONFIG_boost-static-libs),link=static,) \
			$(if $(CONFIG_boost-static-and-shared-libs),link=static$(comma)shared,) \
			$(if $(CONFIG_boost-runtime-shared),runtime-link=shared,) \
			$(if $(CONFIG_boost-runtime-static),runtime-link=static,) \
			$(if $(CONFIG_boost-runtime-static-and-shared),runtime-link=shared$(comma)static,) \
			$(if $(CONFIG_boost-single-thread),threading=single,) \
			threading=multi \
			--without-mpi \
			$(if $(CONFIG_boost-coroutine2),,--without-coroutine2) \
			$(if $(CONFIG_boost-graph-parallel),,--without-graph_parallel) \
			$(if $(CONFIG_PACKAGE_boost-test),,--without-test) \
			--without-python \
			$(foreach lib,$(BOOST_LIBS), \
				$(if $(findstring python3,$(lib)),, \
					$(if $(CONFIG_PACKAGE_boost-$(lib)),, \
					) \
				) \
			) \
			$(if $(CONFIG_PACKAGE_boost-locale),boost.locale.iconv=on -sICONV_PATH=$(ICONV_PREFIX) boost.locale.posix=$(if $(USE_MUSL),on,off), \
				boost.locale.iconv=off) \
			\
			$(if $(CONFIG_PACKAGE_boost-iostreams),-sNO_BZIP2=1 -sZLIB_INCLUDE=$(STAGING_DIR)/usr/include \
				-sZLIB_LIBPATH=$(STAGING_DIR)/usr/lib) \
			install \
	)
endef

define Build/InstallDev
	$(INSTALL_DIR) \
		$(1)/usr/include/boost/

	$(CP) \
		$(PKG_INSTALL_DIR)/include/boost/* \
		$(1)/usr/include/boost/ \
		# copies _all_ header files - independent of <--with-library>-argument above

	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) -v $(PKG_INSTALL_DIR)/lib/*.a $(1)/usr/lib/ # copies all compiled archive files
	$(FIND) $(PKG_INSTALL_DIR)/lib/ -name '*.so*' -exec $(CP) {} $(1)/usr/lib/ \; # copies all the shared objects files
endef

define Host/Install
	$(INSTALL_DIR) \
		$(STAGING_DIR_HOST)/bin

	$(CP) \
		$(HOST_BUILD_DIR)/tools/build/src/engine/bin.*/b2 \
		$(STAGING_DIR_HOST)/bin/
endef

define Package/boost/Default/install
	$(INSTALL_DIR) \
		$(1)/usr/lib

	$(FIND) \
		$(PKG_INSTALL_DIR)/lib/ -name 'libboost_$(2)*.so*' -exec $(CP) {} $(1)/usr/lib/ \;
endef

define Package/boost-test/install	
		$(INSTALL_DIR) \
			$(1)/usr/lib

		$(FIND) \
			$(PKG_INSTALL_DIR)/lib/ -name 'libboost_unit_test_framework*.so*' -exec $(CP) {} $(1)/usr/lib/ \;
		
		$(FIND) \
			$(PKG_INSTALL_DIR)/lib/ -name 'libboost_prg_exec_monitor*.so*' -exec $(CP) {} $(1)/usr/lib/ \;	
endef

define BuildBoostLibrary
  define Package/boost-$(1)/install
	$(call Package/boost/Default/install,$$(1),$(1))
  endef

  $$(eval $$(call BuildPackage,boost-$(1)))
endef

$(eval $(call HostBuild))

$(foreach lib,$(BOOST_LIBS),$(eval $(call BuildBoostLibrary,$(lib))))
$(eval $(call BuildPackage,boost-test))
$(eval $(call BuildPackage,boost-libs))
$(eval $(call BuildPackage,boost))
