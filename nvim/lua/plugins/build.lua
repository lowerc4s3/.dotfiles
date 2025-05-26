return {
    {
        -- CMake integration
        'Civitasv/cmake-tools.nvim',
        cmd = {
            'CMakeGenerate',
            'CMakeBuild',
            'CMakeRun',
            'CMakeDebug',
            'CMakeSelectBuildType',
            'CMakeSelectBuildTarget',
            'CMakeSelectLaunchTarget',
            'CMakeSelectKit',
            'CMakeSelectConfigurePreset',
            'CMakeSelectBuildPreset',
            'CMakeOpen',
            'CMakeClose',
            'CMakeInstall',
            'CMakeClean',
            'CMakeStop',
        },
        opts = {
            cmake_command = 'cmake',
            cmake_build_directory = 'build',
            cmake_build_directory_prefix = '',
            cmake_generate_options = { '-D', 'CMAKE_EXPORT_COMPILE_COMMANDS=1', '-D', 'CMAKE_CXX_COMPILER=clang++' },
            cmake_soft_link_compile_commands = true,
            cmake_build_options = {},
            cmake_console_size = 10,
            cmake_console_position = 'belowright',
            cmake_show_console = 'always',
            cmake_dap_configuration = { name = 'cpp', type = 'lldb', request = 'launch' },
            cmake_variants_message = {
                short = { show = true },
                long = { show = true, max_length = 40 }
            }
        }
    }
}
