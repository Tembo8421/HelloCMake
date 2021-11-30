message(STATUS "Configure Cross Compiler")
                    
set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR aarch64)

set(tools_dir "your/tools/dir/")
# cross compiler
set(CMAKE_C_COMPILER       ${tools_dir}/bin/aarch64-linux-gnu-gcc)                              
set(CMAKE_CXX_COMPILER     ${tools_dir}/bin/aarch64-linux-gnu-g++)

set(CMAKE_FIND_ROOT_PATH  ${tools_dir})
# search for programs in the build host directories                                      
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# for libraries and headers in the target directories                                    
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)             
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)                                     
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

# set g++ param                                                                 
# set(CMAKE_CXX_FLAGS "-march=armv8-a -fopenmp ${CMAKE_CXX_FLAGS}")
