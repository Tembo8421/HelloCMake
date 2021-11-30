# Once done, this will define
#                                                                               
#  my3RDPARTY_INCLUDE_DIR - the SPDLOG include directory
#  my3RDPARTY_LIBRARY_DIR - the SPDLOG library directory
#  my3RDPARTY_LIBS - link these to use SPDLOG
#  Note: 如同變數如果宏函數在根目錄CMakeLists.txt中被調用，
#  所有變數作用域可以作用到所有子目錄，如果不是在根目錄調用，
#  則需要設置SPDLOG_LIBS屬性 PARENT_SCOPE
#  ......                                                                       

macro(my_load_3rdparty _os_arch)                                                  
    set(my3RDPARTY_DIR ${PROJECT_SOURCE_DIR}/3rdparty/target/${${_os}}_${${_arch}}/)
    message(STATUS "my3RDPARTY_DIR: ${my3RDPARTY_DIR}")                             
    find_file(mySPDLOG_INCLUDE_DIR include ${my3RDPARTY_DIR} NO_DEFAULT_PATH)          
    find_file(mySPDLOG_LIBRARY_DIR lib ${my3RDPARTY_DIR} NO_DEFAULT_PATH)           
                                                                                
    set(mySPDLOG_LIBS                                         
        spdlog
        pthread
        #PARENT_SCOPE no parent                                           
    )                                                                           
    if(mySPDLOG_INCLUDE_DIR)                                                   
        SET(mySPDLOG_LIBRARY_DIR "${mySPDLOG_LIBRARY_DIR}/spdlog")                  
        message(STATUS "mySPDLOG_INCLUDE_DIR : ${mySPDLOG_INCLUDE_DIR}")            
        message(STATUS "mySPDLOG_LIBRARY_DIR : ${mySPDLOG_LIBRARY_DIR}")            
        message(STATUS "mySPDLOG_LIBS : ${mySPDLOG_LIBS}")                          
    else()                                                                      
        message(FATAL_ERROR "mySPDLOG_LIBS not found!")                           
    endif()                                                                     
endmacro()

# Campatible with cmake 3.11 and above.
macro(FetchContent_MakeAvailable NAME)
    FetchContent_GetProperties(${NAME})
    if(NOT ${NAME}_POPULATED)
        FetchContent_Populate(${NAME})
        add_subdirectory(${${NAME}_SOURCE_DIR} ${${NAME}_BINARY_DIR})
    endif()
endmacro()