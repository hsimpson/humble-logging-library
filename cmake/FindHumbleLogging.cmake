# Find "include" directory of installation.
# Determined by environment variable "HUMBLE_LOGGING_DIR".
find_path(HLL_INCLUDE_DIR
  humble-logging.h
  HINTS $ENV{HUMBLE_LOGGING_DIR}/include
)

# Windows libs.
if(WIN32)
  find_library(HLL_LIBRARY
    NAMES humblelogging
    HINTS $ENV{HUMBLE_LOGGING_DIR}/lib
  )
endif(WIN32)

# Linux libs.
if(${CMAKE_SYSTEM_NAME} MATCHES "Linux")
  find_library(HLL_LIBRARY
    NAMES libhumblelogging.a libhumblelogging.so
    HINTS $ENV{HUMBLE_LOGGING_DIR}/lib
  )
endif(${CMAKE_SYSTEM_NAME} MATCHES "Linux")

# Export variables.
set(HUMBLE_LOGGING_INCLUDE_DIRS ${HLL_INCLUDE_DIR})
set(HUMBLE_LOGGING_LIBRARIES optimized ${HLL_LIBRARY} debug ${HLL_LIBRARY})