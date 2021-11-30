# 實現3rdparty專案源碼編譯，以 spdlog 項目為例子：
# 在項目跟目錄下執行：
# $ git submodule add -b v1.x   https://github.com/gabime/spdlog.git 3rdparty/spdlog
# $ git submodule update --remote

cmake_minimum_required(VERSION 3.4)                                             
project(HelloCMake_3rdparty)

# 3rdparty專案源碼編譯
add_subdirectory(spdlog)