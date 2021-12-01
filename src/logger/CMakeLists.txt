## project setting
set(my_prj_name "logger")
set(lang "CXX")
set(lang_ver "11")
project(${my_prj_name} VERSION ${my_prj_ver} LANGUAGES ${lang})
message(STATUS "[${my_prj_name}] project name = " ${my_prj_name})

## binary output path
if (NOT LIBRARY_OUTPUT_PATH)
    set(LIBRARY_OUTPUT_PATH ${CMAKE_SOURCE_DIR}/target/bin/${CMAKE_BUILD_TYPE})
endif()
message(STATUS "[${my_prj_name}] LIBRARY_OUTPUT_PATH = " ${LIBRARY_OUTPUT_PATH})

## collect src
message(STATUS "[${my_prj_name}] aux_source_directory")
aux_source_directory(${CMAKE_CURRENT_SOURCE_DIR}/src mySRC)
message(STATUS "[${my_prj_name}] mySRC = " ${mySRC})

# include(${PROJECT_SOURCE_DIR}/cmake/load3rdparty.cmake)
# if(NOT myTARGET_OS)                                                          
#     set(myTARGET_OS linux)                                                   
# endif()                                                                         
# if(NOT myTARGET_ARCH)                                                        
#     set(myTARGET_ARCH arm64)                                                
# endif()                                                                         
# message(STATUS "Your target os : ${myTARGET_OS}")                            
# message(STATUS "Your target arch : ${myTARGET_ARCH}")
# 
# loadlib_spdlog(myTARGET_OS myTARGET_ARCH)
# message(STATUS "[main] CMAKE_BUILD_TYPE= " ${my3RDPARTY_DIR})

set(myDLIB ${my_prj_name})
message(STATUS "[${my_prj_name}] myDLIB = " ${myDLIB})
add_library(${myDLIB} SHARED ${mySRC})

target_include_directories(${myDLIB} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/inc/)

## mySPDLOG_LIBS 是spdlog庫名
message(STATUS "[${my_prj_name}] mySPDLOG_LIBS = " ${mySPDLOG_LIBS})
target_link_libraries(${myDLIB} PRIVATE )

## install
## to do ...
my_install(${myDLIB})
