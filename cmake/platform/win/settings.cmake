# Package overloads
set(ACE_INCLUDE_DIR ${CMAKE_SOURCE_DIR}/dep/acelite)
set(ACE_LIBRARY "ace")
set(BZIP2_LIBRARIES "bzip2")
set(ZLIB_LIBRARIES "zlib")

add_definitions(-D_WIN32_WINNT=0x0601)

if (CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
  include(${CMAKE_SOURCE_DIR}/cmake/compiler/msvc/settings.cmake)
elseif (CMAKE_CXX_PLATFORM_ID MATCHES "MinGW")
  include(${CMAKE_SOURCE_DIR}/cmake/compiler/mingw/settings.cmake)
elseif (CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
  include(${CMAKE_SOURCE_DIR}/cmake/compiler/clang/settings.cmake)
endif()
