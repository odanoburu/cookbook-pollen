#lang pollen/pre

◊(require racket/file)

◊; Since line height is used in so many places...
◊(define LINEHEIGHT 1.5)

◊(define lineheight (string-append (number->string LINEHEIGHT) "rem"))

◊(define (x-lineheight multiple) 
    (string-append (real->decimal-string (* LINEHEIGHT multiple) 2) "rem"))

◊(file->string "fonts/fonts.css")

◊(define sans-serif "'Plex Sans',-apple-system,BlinkMacSystemFont,Helvetica,Arial,sans-serif,
Apple Color Emoji,Segoe UI Emoji")

◊(define mono "'Plex Mono', 'Menlo', 'DejaVu Sans Mono', 'Bitstream Vera Sans Mono', Courier,
monospace")

html {
  font-family: ◊sans-serif;
  font-size: 20px;
  color: black;
}

body {
  line-height: ◊lineheight;
  margin: 2rem 0 0 8rem;
}

main {
    max-width: 40rem;
}

h2, h3, h4 { 
    font-family: 'PatrickSC';
    font-weight: normal;
    line-height: 1em;
    margin-bottom: ◊x-lineheight[0.5];
    color: #0074D9;
}

h2 { font-size: ◊x-lineheight[1.6]; }
h3 { font-size: ◊x-lineheight[1.25]; }

h1.site-title {
    font-family: 'BDGeminis';
    font-weight: normal;
    margin-bottom: ◊x-lineheight[2.5];
    margin-left: -8px;
}

h1.site-title a {
    color: black;
    text-decoration: none;
    padding: 8px 8px 0 8px;
    transition-property: background, color;
    transition-duration: 0.1s;
}

h1.site-title a:hover {
    color: darkgoldenrod;
    background: black;
    border-radius: 4px;
}

pre.code {
    font-family: ◊mono;
    font-size: 0.8rem;
    color: rebeccapurple;
    line-height: 1.3em;
    border-top: solid 1px lightgray;
    border-bottom: solid 1px lightgray;
    padding: 8px 0 8px 8px;
    border-radius: 8px;
}

pre.code mark {
    color: rebeccapurple;
    background: #fff0cb;
}

b.repl {
    color: black;
    font-weight: bold;
}

span.repl-code {
    color: navy;
}

code {
    font-family: ◊mono;
    color: darkgoldenrod;
    font-style: italic;
    letter-spacing: -1px;
}

samp {
    font-family: ◊sans-serif;
    font-style: italic;
    color: navy;
    background: #f6f6f6;
    border: dashed 1px darkgray;
    padding: 3px;
    border-radius: 3px;
}

◊(dynamic-require "tooltips.css.pp" 'doc)
