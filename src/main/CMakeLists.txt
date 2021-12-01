## binary output path
if (NOT EXECUTABLE_OUTPUT_PATH)
    set(EXECUTABLE_OUTPUT_PATH ${CMAKE_SOURCE_DIR}/target/bin/${CMAKE_BUILD_TYPE})
endif()
message(STATUS "[main] EXECUTABLE_OUTPUT_PATH = " ${EXECUTABLE_OUTPUT_PATH})

## collect src
message(STATUS "[main] aux_source_directory")
aux_source_directory(${CMAKE_CURRENT_SOURCE_DIR}/src mySRC)

## add binary
set(myAPP ${my_prj_name})
add_executable(${myAPP} ${mySRC})

## include
target_include_directories( ${myAPP} PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/inc/
)

## linking
target_link_libraries(${myAPP} PRIVATE sayhello sayfuck logger)

## install
my_install(${myAPP})
