set(SUITESPARSE_FOUND 1 CACHE INTERNAL "SUITESPARSE_FOUND")
set(SUITESPARSE_ROOT ${3RD_ROOT}/SuiteSparse CACHE INTERNAL "SUITESPARSE_ROOT")
set(SUITESPARSE_INCLUDE_DIRS ${SUITESPARSE_ROOT}/include CACHE INTERNAL "SUITESPARSE_INCLUDE_DIRS")
set(SUITESPARSE_LIBRARY_DIRS ${SUITESPARSE_ROOT}/lib CACHE INTERNAL "SUITESPARSE_LIBRARY_DIRS")
file(GLOB LIBRARIES "${SUITESPARSE_LIBRARY_DIRS}/*.so")
set(SUITESPARSE_LIBRARIES ${LIBRARIES} CACHE INTERNAL "SUITESPARSE_LIBRARIES")

include_directories(${SUITESPARSE_INCLUDE_DIRS})
link_directories(${SUITESPARSE_LIBRARY_DIRS})