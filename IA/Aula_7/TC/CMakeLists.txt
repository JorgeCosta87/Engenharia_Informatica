cmake_minimum_required(VERSION 3.6)
project(TC)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

set(SOURCE_FILES
    algoritmo.c
    algoritmo.h
    funcao.c
    funcao.h
    main.c
    utils.c
    utils.h)

add_executable(TC ${SOURCE_FILES})