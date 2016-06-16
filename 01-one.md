---
layout: page
title: Lesson Title
subtitle: Topic Title One
minutes: 10
---
> ## Learning Objectives {.objectives}
>
> * Learning objective 1
> * Learning objective 2

Paragraphs of text
--- possibly including [key word 1](reference.html#key-word-1) ---
mixed with:

~~~ {.python}
some code:
    to be displayed
~~~
~~~ {.output}
output
from
program
~~~
~~~ {.error}
error reports from program (if any)
~~~

and possibly including:

> ## Callout Box {.callout}
>
> An aside of some kind.

or an image from the `figs` directory:

![this is the image's title](fig/example.svg "this is the image's alt text")

> ## Challenge Title {.challenge}
>
> Description of a single challenge.
> There may be several challenges.

> ## Syntax Highlighting {.callout}
>
> Pandoc [uses highlighting-kate for syntax highlighting][pandoc-syntax-highlighting].
> highlighting-kate [supports a number of languages and formats][highlighting-kate-languages], configured via the [syntax used by KatePart][katepart-syntax-highlighting].
> highlighting-kate stores its syntax definitions [here][highlighting-kate-definitions].
> If you need highlighting for a language or format that highlighting-kate does not support, you'll want to find or write a syntax definition and build it into highlighting-kate, either by [filing a pull-request][highlighting-kate-pull] and waiting for a new [pandoc release][pandoc-release] or by building highlighting-kate and pandoc locally.
> There are a number of sources for KatePart-compatible syntax definitions, but the ones used by [Kate][] are in the [KTextEditor repository][ktexteditor-definitions].

[highlighting-kate-definitions]: https://github.com/jgm/highlighting-kate/tree/master/xml
[highlighting-kate-languages]: https://github.com/jgm/highlighting-kate#highlighting-kate
[highlighting-kate-pull]: https://github.com/jgm/highlighting-kate/pulls
[Kate]: http://kate-editor.org/
[katepart-syntax-highlighting]: https://docs.kde.org/stable5/en/applications/katepart/highlight.html
[ktexteditor-definitions]: https://quickgit.kde.org/?p=ktexteditor.git&a=tree&h=bddb953426ddd52ede120471f4e34827c7eb930b&hb=fdc16749c3345ad7ce6c6305ae687e74298e8cb3&f=src%2Fsyntax%2Fdata
[pandoc-release]: http://www.pandoc.org/installing.html
[pandoc-syntax-highlighting]: http://www.pandoc.org/README.html#syntax-highlighting
