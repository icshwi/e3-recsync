#
#  Copyright (c) 2017 - Present  European Spallation Source ERIC
#
#  The program is free software: you can redistribute
#  it and/or modify it under the terms of the GNU General Public License
#  as published by the Free Software Foundation, either version 2 of the
#  License, or any newer version.
#
#  This program is distributed in the hope that it will be useful, but WITHOUT
#  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
#  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
#  more details.
#
#  You should have received a copy of the GNU General Public License along with
#  this program. If not, see https://www.gnu.org/licenses/gpl-2.0.txt
#
# 
# Author  : Jeong Han Lee
# email   : han.lee@esss.se
# Date    : Monday, September 10 11:28:58 CEST 2018
# version : 0.0.2
#

where_am_I := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

include $(E3_REQUIRE_TOOLS)/driver.makefile
include $(where_am_I)/../configure/DECOUPLE_FLAGS

USR_CPPFLAGS += -DUSE_TYPED_RSET


APP:=client/castApp
APPDB:=$(APP)/Db
APPSRC:=$(APP)/src


USR_INCLUDES += -I$(where_am_I)$(APPSRC)


TEMPLATES += $(APPDB)/reccaster.db


SOURCES += $(APPSRC)/sockhelpers.c
SOURCES += $(APPSRC)/caster.c
SOURCES += $(APPSRC)/castudp.c
SOURCES += $(APPSRC)/casttcp.c
SOURCES += $(APPSRC)/castinit.c
SOURCES += $(APPSRC)/dbcb.c

DBDS    += $(APPSRC)/reccaster.dbd


SCRIPTS += ../iocsh/recsync.iocsh



# db rule is the default in RULES_E3, so add the empty one

db:

.PHONY: db 
