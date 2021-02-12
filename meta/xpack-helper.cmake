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

set(xpack_device_family_compile_definition "STM32F4")
message(STATUS "${xpack_device_family_compile_definition}")

# -----------------------------------------------------------------------------

function(target_sources_micro_os_plus_devices_stm32f4_extras target)

  get_filename_component(xpack_current_folder ${CMAKE_CURRENT_FUNCTION_LIST_DIR} DIRECTORY)

  # Hopefully the file names follow the symbol definitions.
  string(TOLOWER ${xpack_device_compile_definition} device_name)

  target_sources(
    ${target}

    PUBLIC
      ${xpack_current_folder}/src/vectors/vectors_${device_name}.c
  )

endfunction()

# -----------------------------------------------------------------------------

function(target_include_directories_micro_os_plus_devices_stm32f4_extras target)

  get_filename_component(xpack_current_folder ${CMAKE_CURRENT_FUNCTION_LIST_DIR} DIRECTORY)
  
  target_include_directories(
    ${target}

    PUBLIC
      ${xpack_current_folder}/include
  )

endfunction()

# -----------------------------------------------------------------------------

function(target_compile_definitions_micro_os_plus_devices_stm32f4_extras target)

  get_filename_component(xpack_current_folder ${CMAKE_CURRENT_FUNCTION_LIST_DIR} DIRECTORY)

  target_compile_definitions(
    ${target}

    PUBLIC
      "${xpack_device_family_compile_definition}"
  )

endfunction()

# =============================================================================

function(add_libraries_micro_os_plus_devices_stm32f4_extras)

  # ---------------------------------------------------------------------------

  find_package(micro-os-plus-architecture-cortexm)

  # ---------------------------------------------------------------------------

  if(NOT TARGET micro-os-plus-devices-stm32f4-extras-objects)

    add_library(micro-os-plus-devices-stm32f4-extras-objects OBJECT EXCLUDE_FROM_ALL)

    target_sources_micro_os_plus_devices_stm32f4_extras(micro-os-plus-devices-stm32f4-extras-objects)
    target_include_directories_micro_os_plus_devices_stm32f4_extras(micro-os-plus-devices-stm32f4-extras-objects)
    target_compile_definitions_micro_os_plus_devices_stm32f4_extras(micro-os-plus-devices-stm32f4-extras-objects)

    add_library(micro-os-plus::devices-stm32f4-extras ALIAS micro-os-plus-devices-stm32f4-extras-objects)
    message(STATUS "micro-os-plus::devices-stm32f4-extras")

    target_link_libraries(
      micro-os-plus-devices-stm32f4-extras-objects

      PUBLIC
        micro-os-plus::common
        micro-os-plus::architecture-cortexm
    )

  endif()

  # ---------------------------------------------------------------------------

  if(NOT TARGET micro-os-plus-devices-stm32f4-extras-static)

    add_library(micro-os-plus-devices-stm32f4-extras-static STATIC EXCLUDE_FROM_ALL)

    target_sources_micro_os_plus_devices_stm32f4_extras(micro-os-plus-devices-stm32f4-extras-static)
    target_include_directories_micro_os_plus_devices_stm32f4_extras(micro-os-plus-devices-stm32f4-extras-static)
    target_compile_definitions_micro_os_plus_devices_stm32f4_extras(micro-os-plus-devices-stm32f4-extras-static)

    add_library(micro-os-plus::devices-stm32f4-extras-static ALIAS micro-os-plus-devices-stm32f4-extras-static)

    target_link_libraries(
      micro-os-plus-devices-stm32f4-extras-static

      PUBLIC
        micro-os-plus::common
        micro-os-plus::architecture-cortexm
    )

  endif()

  # ---------------------------------------------------------------------------

endfunction()

# -----------------------------------------------------------------------------
