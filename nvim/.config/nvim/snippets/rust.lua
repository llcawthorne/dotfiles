-- Rust snippets for LuaSnip; loaded by the from_lua loader in init.lua.
local ls = require 'luasnip'
local s, i = ls.snippet, ls.insert_node
local t = ls.text_node
local fmta = require('luasnip.extras.fmt').fmta

return {
  s(
    { trig = 'der', desc = '#[derive(...)] standard baseline (7 traits)' },
    t '#[derive(Debug, Clone, PartialEq, Eq, PartialOrd, Ord, Hash)]'
  ),
  s(
    { trig = 'derc', desc = '#[derive(...)] baseline with Copy for small values' },
    t '#[derive(Debug, Clone, Copy, PartialEq, Eq, PartialOrd, Ord, Hash)]'
  ),
  s(
    { trig = 'derd', desc = '#[derive(...)] baseline with Default' },
    t '#[derive(Debug, Clone, PartialEq, Eq, PartialOrd, Ord, Hash, Default)]'
  ),

  s(
    { trig = 'dis', desc = 'impl std::fmt::Display for Type' },
    fmta(
      [[
impl std::fmt::Display for <> {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "<>", <>)
    }
}
]],
      { i(1, 'Type'), i(2, '{}'), i(3, 'self.0') }
    )
  ),

  s(
    { trig = 'test', desc = '#[test] fn test_name() { ... }' },
    fmta(
      [[
#[test]
fn <>() {
    <>
}
]],
      { i(1, 'test_name'), i(0) }
    )
  ),

  s(
    { trig = 'tmod', desc = '#[cfg(test)] mod tests boilerplate' },
    fmta(
      [[
#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn <>() {
        <>
    }
}
]],
      { i(1, 'works'), i(0) }
    )
  ),
}

