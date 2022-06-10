local yabs = require("yabs")
local toggleterm = function(command)
    require("toggleterm").exec(command, 1, nil, nil, 'horizontal', false)
end

yabs:setup {
    languages = {
        python = {
            tasks = {
                run = {
                    command = 'python3 %',
                    output = toggleterm
                },
            },
        },

        c = {
            tasks = {
                build = {
                    command = 'gcc -Wall -Werror -Wpedantic -Wextra -Wfloat-conversion -Wfloat-equal -std=c99 % -o app.exe',
                    output = 'quickfix',
                },
                run = {
                    command = 'clear; ./app.exe',
                    output = toggleterm
                },
                -- WARNING: tasks chaining is broken now
                -- build_and_run = {
                --     command = function()
                --         yabs:run_task('build', {
                --             on_exit = function(Job, exit_code)
                --                 -- print('ye' .. exit_code)
                --                 if exit_code == 0 then
                --                     yabs:run_task('run')
                --                 end
                --             end,
                --         })
                --     end,
                --     type = 'lua',
                -- }
            }
        }
    },
}
