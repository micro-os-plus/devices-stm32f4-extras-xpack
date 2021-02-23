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

if(micro-os-plus-devices-stm32f4-extras-included)
  return()
endif()

set(micro-os-plus-devices-stm32f4-extras-included TRUE)

message(STATUS "Including micro-os-plus-devices-stm32f4-extras...")

# -----------------------------------------------------------------------------
# Preprocessor symbols.

# TODO: migrate to options.
set(xpack_device_family_compile_definition "STM32F4")
message(STATUS "${xpack_device_family_compile_definition}")

# =============================================================================

# This also requires xpack_device_compile_definition to be defined by the user.

function(add_libraries_micro_os_plus_devices_stm32f4_extras)

  get_filename_component(xpack_current_folder ${CMAKE_CURRENT_FUNCTION_LIST_DIR} DIRECTORY)

  # ---------------------------------------------------------------------------

  find_package(micro-os-plus-architecture-cortexm)

  # ---------------------------------------------------------------------------

  if(NOT TARGET micro-os-plus-devices-stm32f4-extras-interface)

    add_library(micro-os-plus-devices-stm32f4-extras-interface INTERFACE EXCLUDE_FROM_ALL)

    # Hopefully the file names follow the symbol definitions.
    string(TOLOWER ${xpack_device_compile_definition} device_name)
    
    # -------------------------------------------------------------------------
  
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

    target_compile_definitions(
      micro-os-plus-devices-stm32f4-extras-interface
  
      INTERFACE
        "${xpack_device_family_compile_definition}"
    )
  
    target_link_libraries(
      micro-os-plus-devices-stm32f4-extras-interface

      INTERFACE
        micro-os-plus::architecture-cortexm
    )

    # -------------------------------------------------------------------------
    # Aliases

    add_library(micro-os-plus::devices-stm32f4-extras ALIAS micro-os-plus-devices-stm32f4-extras-interface)
    message(STATUS "micro-os-plus::devices-stm32f4-extras")

  endif()

  # ---------------------------------------------------------------------------

endfunction()

# -----------------------------------------------------------------------------
