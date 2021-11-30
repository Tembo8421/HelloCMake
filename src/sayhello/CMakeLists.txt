# binary output path
if (NOT LIBRARY_OUTPUT_PATH)
    set(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/target/lib/${CMAKE_BUILD_TYPE})
endif()
message(STATUS "[sayhello] LIBRARY_OUTPUT_PATH = " ${LIBRARY_OUTPUT_PATH})

# collect src
message(STATUS "[sayhello] aux_source_directory")
aux_source_directory(${CMAKE_CURRENT_SOURCE_DIR}/src/ mySRC)
message(STATUS "[sayhello] mySRC = " ${mySRC})

# add binary
set(mySLIB "say-hello")
add_library(${mySLIB} STATIC ${mySRC})

# include
target_include_directories(${mySLIB} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/inc/)

# install
my_install(${mySLIB})