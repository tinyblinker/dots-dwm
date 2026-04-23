cmake_minimum_required(VERSION 4.2.3)

# 项目名称与语言
project(MyProject LANGUAGES CXX)

# 可执行文件生成目录为项目构建目录下的bin文件夹
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

# 生成 compile_commands.json
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# 指定 C++ 标准
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# 指定源文件位置
add_executable(MySrc
    src/main.cpp
)

