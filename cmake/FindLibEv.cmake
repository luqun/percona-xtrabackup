# Copyright (c) 2014 Percona LLC and/or its affiliates
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; version 2 of the License.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA 

# This module defines
#  LIBEV_INCLUDE_DIRS, where to find LibEv headers
#  LIBEV_LIBRARIES, LibEv libraries
#  LIBEV_FOUND, If false, do not try to use ant

IF (NOT LIBEV_INCLUDE_PATH)
  SET(LIBEV_INCLUDE_PATH
    /usr/include
    /usr/local/include
    /opt/local/include
    /usr/include/libev
  )
ENDIF()

FIND_PATH(LIBEV_INCLUDE_DIRS ev.h PATHS ${LIBEV_INCLUDE_PATH})

IF (NOT LIBEV_LIB_PATH)
  SET(LIBEV_LIB_PATH /usr/lib /usr/local/lib /opt/local/lib)
ENDIF()

# Use static library since we don't distribute libev.so file in our runtime
FIND_LIBRARY(LIBEV_LIB NAMES libev.a PATHS ${LIBEV_LIB_PATH})

IF (LIBEV_LIB AND LIBEV_INCLUDE_DIRS)
  SET(LIBEV_FOUND TRUE)
  SET(LIBEV_LIBRARIES ${LIBEV_LIB})
ELSE ()
  SET(LIBEV_FOUND FALSE)
ENDIF ()

IF (LIBEV_FOUND)
  IF (NOT LIBEV_FIND_QUIETLY)
    MESSAGE(STATUS "Found libev: ${LIBEV_LIBRARIES}")
  ENDIF ()
ELSE ()
  MESSAGE(STATUS "libev NOT found.")
ENDIF ()

mark_as_advanced(
    LIBEV_LIB
    LIBEV_INCLUDE_DIRS
  )
