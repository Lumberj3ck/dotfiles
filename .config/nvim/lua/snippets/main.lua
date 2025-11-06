local ls = require("luasnip")

local date = function() return {os.date('%Y-%m-%d')} end
ls.add_snippets("all", {
  ls.snippet(
    {
        trig = "date",
        namr = "Date",
        dscr = "Date in the form of YYYY-MM-DD",
    },
    {
        ls.function_node(date, {})
    }),
})
ls.add_snippets("go", {
  ls.snippet(
    {
        trig = "iferr",
        namr = "iferr",
        dscr = "inserts if err != nil statement",
    },
    {
        ls.text_node("if err != nil{"),
        ls.text_node({"", "\tpanic(err)", }),
        ls.text_node({"", "}",})
    }),
})

ls.add_snippets("python", {
  ls.snippet(
    {
        trig = "hello",
        namr = "Hello",
        dscr = "Test hello snip",
    },
    {
        ls.text_node("print('Hello world')")
    }),
})

ls.add_snippets("all", {
  ls.snippet(
    {
        trig = "forline",
        namr = "for line",
        dscr = "for line in file",
    },
    {
        ls.text_node({'with open("'}), ls.insert_node(1, "file.txt"),
        ls.text_node('", "r") as file:'),
        ls.text_node({"", '\tfor line in file.readline():'}),
        ls.text_node({"", '\t\tprint(line)' }),
    }),
})

