# binary output path
if (NOT LIBRARY_OUTPUT_PATH)
    set(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/target/bin/${CMAKE_BUILD_TYPE})
endif()
message(STATUS "[sayfuck] LIBRARY_OUTPUT_PATH = " ${LIBRARY_OUTPUT_PATH})

# collect src
message(STATUS "[sayfuck] aux_source_directory")
aux_source_directory(${CMAKE_CURRENT_SOURCE_DIR}/src/ mySRC)
message(STATUS "[sayfuck] mySRC = " ${mySRC})

# add binary
set(myDLIB "say-fuck")
add_library(${myDLIB} SHARED ${mySRC})

# include
target_include_directories(${myDLIB} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/inc/)

# install
my_install(${myDLIB})
