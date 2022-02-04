#
# This file is part of the µOS++ distribution.
#   (https://github.com/micro-os-plus)
# Copyright (c) 2021 Liviu Ionescu
#
# Permission to use, copy, modify, and/or distribute this software
# for any purpose is hereby granted, under the terms of the MIT license.
#
# If a copy of the license was not distributed with this file, it can
# be obtained from https://opensource.org/licenses/MIT/.
#
# -----------------------------------------------------------------------------

# This file is intended to be consumed by applications with:
#
# `add_subdirectory("xpacks/micro-os-plus-devices-stm32f4-extras")`
#
# The result is an interface library that can be added to the linker with:
#
# `target_link_libraries(your-target PUBLIC micro-os-plus::devices-stm32f4-extras)`

# -----------------------------------------------------------------------------
## Preamble ##

# https://cmake.org/cmake/help/v3.20/
cmake_minimum_required(VERSION 3.20)

project(
  micro-os-plus-devices-stm32f4-extras
  DESCRIPTION "µOS++ complementary STM32F4 files"
)

if(COMMAND xpack_get_package_name_and_version)
  xpack_get_package_name_and_version("${CMAKE_CURRENT_SOURCE_DIR}/package.json")
  message(VERBOSE "Processing xPack ${PACKAGE_JSON_NAME}@${PACKAGE_JSON_VERSION}...")
endif()

# -----------------------------------------------------------------------------
## The project library definitions ##

# https://cmake.org/cmake/help/v3.20/command/add_library.html?highlight=interface#normal-libraries
# PRIVATE: build definitions, used internally
# INTERFACE: usage definitions, passed up to targets linking to it
# PUBLIC: both

# -----------------------------------------------------------------------------
# Preprocessor symbols.

set(xpack_device_family_compile_definition "STM32F4")

# -----------------------------------------------------------------------------

# This function is called to instantiate libraries for all known devices.
function(add_micro_os_plus_device_stm32f4_extra_library symbol_name)

  # The file name part is derived from the symbol.
  string(TOLOWER ${symbol_name} name)

  add_library(micro-os-plus-devices-${name}-extras-interface INTERFACE EXCLUDE_FROM_ALL)

  target_include_directories(
    micro-os-plus-devices-${name}-extras-interface

    INTERFACE
      "include"
  )

  target_sources(
    micro-os-plus-devices-${name}-extras-interface

    INTERFACE
      "src/vectors/vectors_${name}.c"
  )

  target_compile_definitions(
    micro-os-plus-devices-${name}-extras-interface

    INTERFACE
      "${xpack_device_family_compile_definition}"
      "${symbol_name}"
  )

  target_compile_options(
    micro-os-plus-devices-${name}-extras-interface

    INTERFACE
      # ... perhaps ignore some warnings.
  )

  target_link_libraries(
    micro-os-plus-devices-${name}-extras-interface

    INTERFACE
      micro-os-plus::architecture-cortexm
  )

  # if (COMMAND xpack_display_target_lists)
  #   xpack_display_target_lists(micro-os-plus-devices-${name}-extras-interface)
  # endif()

  # -----------------------------------------------------------------------------
  # Aliases.

  add_library(micro-os-plus::devices-${name}-extras ALIAS micro-os-plus-devices-${name}-extras-interface)
  message(VERBOSE "> micro-os-plus::devices-${name}-extras -> micro-os-plus-devices-${name}-extras-interface")

endfunction()

# -----------------------------------------------------------------------------

include("${CMAKE_CURRENT_SOURCE_DIR}/cmake/add_devices_libraries.cmake")

# -----------------------------------------------------------------------------
