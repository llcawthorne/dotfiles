-- Go snippets for LuaSnip; loaded by the from_lua loader in init.lua.
-- <Tab>/<S-Tab> jump between the placeholders.
local ls = require 'luasnip'
local s, i = ls.snippet, ls.insert_node
local rep = require('luasnip.extras').rep
local fmta = require('luasnip.extras.fmt').fmta

return {
  s(
    { trig = 'gw', desc = 'if got != want { t.Errorf(...) }' },
    fmta(
      [[
if got != want {
	t.Errorf("got <>, want <>", got, want)
}
]],
      { i(1, '%v'), rep(1) }
    )
  ),

  s(
    { trig = 'iferr', desc = 'if err != nil { ... }' },
    fmta(
      [[
if err != nil {
	<>
}
]],
      { i(1, 'return err') }
    )
  ),

  s(
    { trig = 'trun', desc = 't.Run subtest' },
    fmta(
      [[
t.Run("<>", func(t *testing.T) {
	<>
})
]],
      { i(1), i(0) }
    )
  ),

  s(
    { trig = 'tfunc', desc = 'func TestXxx(t *testing.T)' },
    fmta(
      [[
func Test<>(t *testing.T) {
	<>
}
]],
      { i(1), i(0) }
    )
  ),

  s(
    { trig = 'ttable', desc = 'table-driven test loop' },
    fmta(
      [[
cases := []struct {
	name string
	<>
}{
	{name: "<>"},
}

for _, tt := range cases {
	t.Run(tt.name, func(t *testing.T) {
		<>
	})
}
]],
      { i(1, 'want string'), i(2), i(0) }
    )
  ),

  s(
    { trig = 'thelper', desc = 'assertion helper with t.Helper()' },
    fmta(
      [[
func assert<>(t testing.TB, got, want <>) {
	t.Helper()
	if got != want {
		t.Errorf("got <>, want <>", got, want)
	}
}
]],
      { i(1, 'Equal'), i(2, 'string'), i(3, '%q'), rep(3) }
    )
  ),
}
