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

message(STATUS "Including micro-os-plus-devices-stm32f4...")

# -----------------------------------------------------------------------------

function(target_sources_micro_os_plus_device target)

  get_filename_component(xpack_root_folder ${CMAKE_CURRENT_FUNCTION_LIST_DIR} DIRECTORY)

  # Hopefully the file names follow the symbol definitions.
  string(TOLOWER ${xpack_device_compile_definition} device_name)

  target_sources(
    ${target}

    PRIVATE
      ${xpack_root_folder}/src/vectors/vectors_${device_name}.c
  )

endfunction()

# -----------------------------------------------------------------------------

function(target_include_directories_micro_os_plus_device target)

  get_filename_component(xpack_root_folder ${CMAKE_CURRENT_FUNCTION_LIST_DIR} DIRECTORY)
  
  target_include_directories(
    ${target}

    PUBLIC
      ${xpack_root_folder}/include
  )

endfunction()

# -----------------------------------------------------------------------------
