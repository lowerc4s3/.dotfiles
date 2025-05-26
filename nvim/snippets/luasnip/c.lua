return {
    s({ trig = "ifndef", desc = "include guard" }, fmta([[
    #ifndef <>
    #define <>

    <>

    #endif // !<>
    ]], {
        f(function(_, parent) return parent.snippet.env.TM_FILENAME_BASE:upper() .. "_H" end, nil, { key = "macro_name"}),
        rep(k("macro_name")),
        i(0),
        rep(k("macro_name")),
    }))
}
