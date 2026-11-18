return {
  "Olical/conjure",
  init = function()
    -- Prevent the HUD window from auto-opening when opening a file or evaluating
    vim.g["conjure#log#hud#enabled"] = false
    -- Optional: prevent Conjure from auto-starting evcxr until you actually evaluate something
    -- vim.g["conjure#client#rust#evcxr#enabled"] = true
  end,
}
