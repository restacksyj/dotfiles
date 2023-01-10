local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

-- ls.add_snippets("lua", {
-- 	s("lf", {
-- 		-- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
-- 		-- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
-- 		i(1, "cond"),
-- 		t(" ? "),
-- 		i(2, "then"),
-- 		t(" : "),
-- 		i(3, "else"),
-- 	}),
-- })
-- print(ls.add_snippets)
-- ls.add_snippets("c", {})

-- ls.add_snippets(nil, {
-- 	-- basic, don't need to know anything else
-- 	--    arg 1: string
-- 	--    arg 2: a node
-- 	s("simple", t("wow, you were right!")),
-- })
