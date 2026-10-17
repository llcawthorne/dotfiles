USERNAME = "llcawthorne@gmail.com"
STYLE_URLS = [
    # Served as text/css; follows prefers-color-scheme for the markdown itself.
    "https://cdn.jsdelivr.net/npm/github-markdown-css@5.8.1/github-markdown.css",
    # Darken grip's page chrome around the markdown when the OS is in dark mode.
    "data:text/css,"
    "@media (prefers-color-scheme: dark) {"
    "  :root { color-scheme: dark; }"
    "  html, body, body *:not(.markdown-body, .markdown-body *) {"
    "    background-color: %230d1117 !important;"
    "    color: %23e6edf3 !important;"
    "    border-color: %2330363d !important;"
    "  }"
    "}",
]
