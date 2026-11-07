; extends

; Highlight the text between {{ }} actions as HTML (for .gohtml files).
((text) @injection.content
  (#set! injection.language "html")
  (#set! injection.combined))
