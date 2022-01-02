#
# This file is part of the µOS++ distribution.
#   (https://github.com/micro-os-plus)
# Copyright (c) 2021 Liviu Ionescu
#
# This Source Code Form is subject to the terms of the MIT License.
# If a copy of the license was not distributed with this file, it can
# be obtained from https://opensource.org/licenses/MIT/.
#
# -----------------------------------------------------------------------------

# https://cmake.org/cmake/help/v3.19/
# https://cmake.org/cmake/help/v3.19/manual/cmake-packages.7.html#package-configuration-file
cmake_minimum_required(VERSION 3.19)

# Use targets as include markers (variables are not scope independent).
if(TARGET micro-os-plus-devices-stm32f4-extras-included)
  return()
else()
  add_custom_target(micro-os-plus-devices-stm32f4-extras-included)
endif()

if(NOT TARGET micro-os-plus-build-helper-included)
  message(FATAL_ERROR "Include the mandatory build-helper (xpacks/micro-os-plus-build-helper/cmake/xpack-helper.cmake)")
endif()

message(STATUS "Processing xPack ${PACKAGE_JSON_NAME}@${PACKAGE_JSON_VERSION}...")

# -----------------------------------------------------------------------------
# Preprocessor symbols.

# TODO: migrate to options.
set(xpack_device_family_compile_definition "STM32F4")

# This also requires xpack_device_compile_definition to be defined by the user.

# -----------------------------------------------------------------------------
# Dependencies.

find_package(micro-os-plus-architecture-cortexm REQUIRED)

# -----------------------------------------------------------------------------
# The current folder.

get_filename_component(xpack_current_folder ${CMAKE_CURRENT_LIST_DIR} DIRECTORY)

# -----------------------------------------------------------------------------

if(NOT TARGET micro-os-plus-devices-stm32f4-extras-interface)

  add_library(micro-os-plus-devices-stm32f4-extras-interface INTERFACE EXCLUDE_FROM_ALL)

  # Hopefully the file names follow the symbol definitions.
  string(TOLOWER ${xpack_device_compile_definition} device_name)

  # ---------------------------------------------------------------------------

  message(STATUS "+ src/vectors/vectors_${device_name}.c")

  target_sources(
    micro-os-plus-devices-stm32f4-extras-interface

    INTERFACE
      ${xpack_current_folder}/src/vectors/vectors_${device_name}.c
  )

  target_include_directories(
    micro-os-plus-devices-stm32f4-extras-interface

    INTERFACE
      ${xpack_current_folder}/include
  )

  message(STATUS "+ ${xpack_device_family_compile_definition}")
  message(STATUS "+ ${xpack_device_compile_definition}")

  target_compile_definitions(
    micro-os-plus-devices-stm32f4-extras-interface

    INTERFACE
      "${xpack_device_family_compile_definition}"
      "${xpack_device_compile_definition}"
  )

  target_link_libraries(
    micro-os-plus-devices-stm32f4-extras-interface

    INTERFACE
      micro-os-plus::architecture-cortexm
  )

  # ---------------------------------------------------------------------------
  # Aliases.

  add_library(micro-os-plus::devices-stm32f4-extras ALIAS micro-os-plus-devices-stm32f4-extras-interface)
  message(STATUS "=> micro-os-plus::devices-stm32f4-extras")

endif()

# -----------------------------------------------------------------------------
