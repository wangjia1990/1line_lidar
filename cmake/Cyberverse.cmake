set(CYBERVERSE_ROOT "${CMAKE_SOURCE_DIR}/../opt" CACHE PATH "CYBERVERSE_ROOT")
set(CYBERVERSE_LIB_DIR ${CYBERVERSE_ROOT}/lib CACHE INTERNAL "CYBERVERSE_LIB_DIR")
set(CYBERVERSE_INCLUDE_DIR ${CYBERVERSE_ROOT}/include CACHE INTERNAL "CYBERVERSE_INCLUDE_DIR")
include_directories(${CYBERVERSE_INCLUDE_DIR})
link_directories(${CYBERVERSE_LIB_DIR})