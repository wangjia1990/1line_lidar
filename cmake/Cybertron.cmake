set(CYBERTRON_ROOT "${CMAKE_SOURCE_DIR}/../opt" CACHE PATH "CYBERTRON_ROOT")
set(CYBERTRON_INCLUDE_DIR "${CYBERTRON_ROOT}/include")
set(CYBERTRON_LIB_DIR "${CYBERTRON_ROOT}/lib")
#file(GLOB LIBRARIES "${CYBERTRON_LIB_DIR}/*.so")
#set(CYBERTRON_LIBRARIES ${LIBRARIES} CACHE INTERNAL "CYBERTRON_LIBRARIES")
include_directories(${CYBERTRON_INCLUDE_DIR})
include_directories(${CYBERTRON_INCLUDE_DIR}/cybertron)
link_directories(${CYBERTRON_LIB_DIR})