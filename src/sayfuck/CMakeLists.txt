## project setting
set(my_prj_name "sayfuck")
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

## add binary
set(myDLIB ${my_prj_name})
add_library(${myDLIB} SHARED ${mySRC})

## include
target_include_directories(${myDLIB} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/inc/)

## install
my_install(${myDLIB})
