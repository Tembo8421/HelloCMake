## binary output path
if (NOT LIBRARY_OUTPUT_PATH)
    set(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/target/bin/${CMAKE_BUILD_TYPE})
endif()
message(STATUS "[logger] LIBRARY_OUTPUT_PATH = " ${LIBRARY_OUTPUT_PATH})

## collect src
message(STATUS "[logger] aux_source_directory")
aux_source_directory(${CMAKE_CURRENT_SOURCE_DIR}/src/ mySRC)
message(STATUS "[logger] mySRC = " ${mySRC})

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


set(myDLIB "cyl-logger")
message(STATUS "[logger] myDLIB = " ${myDLIB})
add_library(${myDLIB} SHARED ${mySRC})

target_include_directories(${myDLIB} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/inc/)

## mySPDLOG_LIBS 是spdlog庫名
message(STATUS "[logger] mySPDLOG_LIBS = " ${mySPDLOG_LIBS})
target_link_libraries(${myDLIB} PRIVATE )

## install
## to do ...
my_install(${myDLIB})
