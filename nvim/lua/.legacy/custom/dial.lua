local augend = require("dial.augend")
require("dial.config").augends:register_group {
    default = {
        augend.integer.alias.decimal_int,
        augend.integer.alias.hex,
        augend.integer.alias.binary,
        augend.constant.alias.bool,
        augend.constant.new {
            elements = { "and", "or" },
            word = true,
            cyclic = true,
        },
        augend.constant.new {
            elements = { "&&", "||" },
            word = false,
            cyclic = true,
        },
    }
}
