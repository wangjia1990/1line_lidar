function(smart_install_one arg)
    get_filename_component(real_argv0 "${ARGV0}" REALPATH)
    get_filename_component(real_argv1 "${ARGV1}" REALPATH)

    if(IS_DIRECTORY "${real_argv0}")
        file(GLOB dir_files ${real_argv0}/*)
        get_filename_component(last_dir "${real_argv0}" NAME)
        foreach(item_file ${dir_files})
            smart_install_one(${item_file} ${real_argv1}/${last_dir})
        endforeach()
    else()
        install(FILES ${real_argv0}
                DESTINATION ${real_argv1})
    endif()
endfunction()

# @brief: install file or directory (it can deal with symlink in it)
#         actually, it is a strong version for install
# @usage:
#       smart_install(data conf ${CUR_BINARY_NAME})
function(smart_install arg)
    set(SRCS "")
    set(DIST "")
    math(EXPR max_arg_index ${ARGC}-1)
    math(EXPR cnt_loop ${ARGC}-2)
    list(GET ARGV ${max_arg_index} DIST)
    foreach(idx RANGE ${cnt_loop})
        list(GET ARGV ${idx} idx_arg)
        list(APPEND SRCS ${idx_arg})
        smart_install_one(${idx_arg} ${DIST})
    endforeach()
    message(STATUS "SRCS: ${SRCS}, DIST: ${DIST}")
endfunction()

function(INCLUDE_3RD_MODULE)
  if(NOT ARGN)
    message(SEND_ERROR "Error: INCLUDE_3RD_MODULE() called without any args")
    return()
  endif(NOT ARGN)

  file(GLOB ALL_MODULE "${BAIDU_ROOT}/cmake/*.cmake")

  foreach(PARA ${ARGN})
    set(MODULE_FOUND 0)
    foreach(MODULE ${ALL_MODULE})
      string(REGEX MATCH "([a-z,A-Z,0-9,_])*.cmake$" MODULE_NAME ${MODULE})
      string(REGEX REPLACE "^(.*)\\.[^\\.]*$" "\\1" MODULE_NAME ${MODULE_NAME})
      string(TOLOWER "${MODULE_NAME}" MODULE_NAME_LOWER)
      string(TOLOWER "${PARA}" PARA_LOWER)

      if(${PARA_LOWER} STREQUAL ${MODULE_NAME_LOWER})
        include(${MODULE})
        message("-- Info: Add module ${PARA}")
        set(MODULE_FOUND 1)
        break()
      endif(${PARA_LOWER} STREQUAL ${MODULE_NAME_LOWER})
    endforeach()

    if(NOT ${MODULE_FOUND})
      message("-- Error: module ${PARA} not found!")
    endif(NOT ${MODULE_FOUND})

  endforeach()

endfunction()
