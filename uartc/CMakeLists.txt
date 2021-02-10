cmake_minimum_required(VERSION 3.8)
set(CMAKE_VERBOSE_MAKEFILE ON)

project(uartc)

set(F_CPU 16000000UL)
set(MCU atmega328p)
set(BAUD 9600)
set(PROG_TYPE avrdude)

INCLUDE("avr-toolchain.cmake")
#message("${CMAKE_C_COMPILER}")


file(GLOB SRC_FILES "src/*.c")

add_executable(${PROJECT_NAME} ${SRC_FILES})


