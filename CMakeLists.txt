cmake_minimum_required(VERSION 3.2)
# get start time
string(TIMESTAMP build_timestamp "%Y-%m-%d %H:%M:%S")

include(cmake/utils.cmake)
# get version from /resource/version.ver
set(my_prj_ver)
my_extract_version(my_prj_ver)
# get git info
set(git_hash)
my_get_git_hash(git_hash)
set(git_branch)
my_get_git_branch(git_branch)

# project setting
set(my_prj_name "HelloCMake")
set(lang "CXX")
set(lang_ver "11")
project(${my_prj_name} VERSION ${my_prj_ver} LANGUAGES ${lang})

# build type
# cmake -DCMAKE_BUILD_TYPE=Debug ..
if(NOT CMAKE_BUILD_TYPE)                                                        
    set(CMAKE_BUILD_TYPE "Debug" CACHE STRING "Choose Release or Debug" FORCE)  
endif()                                                                        

# generate config header
configure_file(
    ${PROJECT_SOURCE_DIR}/cmake/config.h_.in
    ${PROJECT_SOURCE_DIR}/include/${PROJECT_NAME}/main/config.h_
)

message(STATUS "INFO　============================================")
message(STATUS "[${my_prj_name}] build time is = "      ${build_timestamp})
message(STATUS "[${my_prj_name}] Build type is = "      ${CMAKE_BUILD_TYPE})
message(STATUS "[${my_prj_name}] project name = "       ${PROJECT_NAME})
message(STATUS "[${my_prj_name}] git branch = "         ${git_branch})
message(STATUS "[${my_prj_name}] git hash = "           ${git_hash})
message(STATUS "[${my_prj_name}] project version = "    ${PROJECT_VERSION})


# add 3rdparty
add_subdirectory(3rdparty)

# add sub module
add_subdirectory(src)
