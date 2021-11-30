# Get version from version.ver and output by _version
function(my_extract_version _version)
    # read file
    file(READ "${CMAKE_CURRENT_LIST_DIR}/resource/version.ver" file_contents)
    # phrase major number
    string(REGEX MATCH "PROJECT_VERSION_MAJOR ([0-9]+)" _ "${file_contents}")
    if(NOT CMAKE_MATCH_COUNT EQUAL 1)
        message(FATAL_ERROR "Could not extract major version number from /resource/version.h")
    endif()
    set(ver_major ${CMAKE_MATCH_1})
    # phrase minor number
    string(REGEX MATCH "PROJECT_VERSION_MINOR ([0-9]+)" _ "${file_contents}")
    if(NOT CMAKE_MATCH_COUNT EQUAL 1)
        message(FATAL_ERROR "Could not extract minor version number from /resource/version.h")
    endif()
    # phrase patch number
    set(ver_minor ${CMAKE_MATCH_1})
    string(REGEX MATCH "PROJECT_VERSION_PATCH ([0-9]+)" _ "${file_contents}")
    if(NOT CMAKE_MATCH_COUNT EQUAL 1)
        message(FATAL_ERROR "Could not extract patch version number from /resource/version.h")
    endif()
    set(ver_patch ${CMAKE_MATCH_1})

    # get version
    set(${_version} "${ver_major}.${ver_minor}.${ver_patch}" PARENT_SCOPE)
endfunction()

# get git hash
macro(my_get_git_hash _git_hash)
    find_package(Git QUIET) 
    if(GIT_FOUND)
      execute_process(
        COMMAND ${GIT_EXECUTABLE} log -1 --pretty=format:%h
        OUTPUT_VARIABLE ${_git_hash}
        OUTPUT_STRIP_TRAILING_WHITESPACE
        ERROR_QUIET
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
        )
    endif()
endmacro()

# get git branch
macro(my_get_git_branch _git_branch)
    find_package(Git QUIET)
    if(GIT_FOUND)
      execute_process(
        COMMAND ${GIT_EXECUTABLE} symbolic-ref --short -q HEAD
        OUTPUT_VARIABLE ${_git_branch}
        OUTPUT_STRIP_TRAILING_WHITESPACE
        ERROR_QUIET
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
        )
    endif()
endmacro()

function(my_install _target)
    # ${CMAKE_INSTALL_PREFIX} default= 
        # Uinx: /usr/local; Win: c:/Program Files/${PROJECT_NAME}
    # install
    #install(DIRECTORY ${PROJECT_SOURCE_DIR}/include
    #        DESTINATION ${CMAKE_INSTALL_PREFIX}/include
    #        FILES_MATCHING 
    #        PATTERN "*.h"
    #        PATTERN "*.hpp"
    #        PATTERN "*.h_"
    #        # PATTERN "CMakeLists.txt" EXCLUDE
    #        )
#
    #install(TARGETS ${_target}
    #        ARCHIVE DESTINATION lib                                                     
    #        LIBRARY DESTINATION lib                                                     
    #        RUNTIME DESTINATION bin)
endfunction()