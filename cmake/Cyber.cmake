set(CYBER_ROOT "${CMAKE_SOURCE_DIR}/../opt" CACHE PATH "CYBER_ROOT")
set(CYBER_INCLUDE_DIR "${CYBER_ROOT}/include")
set(CYBER_LIB_DIR "${CYBER_ROOT}/lib")
#file(GLOB LIBRARIES "${CYBERTRON_LIB_DIR}/*.so")
#set(CYBERTRON_LIBRARIES ${LIBRARIES} CACHE INTERNAL "CYBERTRON_LIBRARIES")
include_directories(${CYBER_INCLUDE_DIR})
include_directories(${CYBER_INCLUDE_DIR}/cyber)
include_directories(${CYBER_INCLUDE_DIR}/cyber/proto)
include_directories(${CYBER_INCLUDE_DIR}/cyber/common)
link_directories(${CYBER_LIB_DIR})