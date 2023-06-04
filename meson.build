# -----------------------------------------------------------------------------
#
# This file is part of the µOS++ distribution.
#   (https://github.com/micro-os-plus/)
# Copyright (c) 2022 Liviu Ionescu
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
# `subdir('xpacks/@micro-os-plus/devices-stm32f4-extras')`
#
# The result is a dependency that can be added to the linker with:
#
# `dependencies: [micro_os_plus_devices_stm32f4_extras_dependency],`

# Note: the meson configuration is provided only as a proof of concept,
# for production it might need some refinements.

# -----------------------------------------------------------------------------
# Preprocessor symbols.

xpack_device_family_compile_definition = 'STM32F4'

# -----------------------------------------------------------------------------

message('Processing xPack @micro-os-plus/devices-stm32f4-extras...')

# Get the list of symbol names, to be automatically generated in the future.
subdir('meson/symbol-names')

foreach symbol_name: devices_stm32f4_symbol_names

  name = symbol_name.to_lower()

    # https://mesonbuild.com/Reference-manual_functions.html#declare_dependency
  dep = declare_dependency(
    include_directories: include_directories(
      'include',
    ),
    sources: files(
      'src/vectors/vectors_' + name + '.c',
    ),
    compile_args: [
      '-D'+xpack_device_family_compile_definition,
      '-D'+symbol_name
    ],
    dependencies: [
      micro_os_plus_architecture_dependency,
    ]
  )

  # message('+ -I include')
  # message('+ src/vectors/vectors_' + name + '.c')
  # message('+ -D ' + xpack_device_family_compile_definition)
  # message('+ -D ' + symbol_name)
  message('> micro_os_plus_devices_' + name + '_extras_dependency')

  set_variable('micro_os_plus_devices_' + name + '_extras_dependency', dep)

endforeach

# -----------------------------------------------------------------------------
