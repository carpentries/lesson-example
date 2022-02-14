---
title: "Formatting"
teaching: 10
exercises: 0
questions:
- "How are The Carpentries lessons formatted?"
objectives:
- "Explain the header of each episode."
- "Explain the overall structure of each episode."
- "Explain why blockquotes are used to format parts of episodes."
- "Explain the use of code blocks in episodes."
keypoints:
- "Lesson episodes are stored in _episodes/dd-subject.md."
- "Each episode's title must include a title, time estimates, motivating questions, lesson objectives, and key points."
- "Episodes should not use sub-titles or HTML layout."
- "Code blocks can have the source, regular output, or error class."
- "Special sections are formatted as blockquotes that open with a level-2 header and close with a class identifier."
- "Special sections may be callouts or challenges; other styles are used by the template itself."
math: true
---

A lesson consists of one or more episodes,
each of which has:

*   a [YAML][yaml] header containing required values
*   some teachable content
*   some exercises

The diagram below shows the internal structure of a single episode file
(click on the image to see a larger version):

<a href="{{ page.root }}/fig/episode-format.png">
  <img src="{{ page.root }}/fig/episode-format-small.png" alt="Formatting Rules" />
</a>

## Maximum Line Length

Limit all lines to a maximum of 100 characters.
`bin/lesson_check.py` will report lines longer than 100 characters
and this can block your contributions of being accepted.

The two reasons behind the decision to enforce a maximum line length are
(1) make diff and merge easier in the command line and other user interfaces
and
(2) make update of translation of the lessons easier.

## Locations and Names

Episode files are stored in `_episodes`
or, for the case of R Markdown files, `_episodes_rmd`
so that [Jekyll][jekyll] will create a [collection][jekyll-collection] for them.
Episodes are named `dd-subject.md`,
where `dd` is a two-digit sequence number (with a leading 0)
and `subject` is a one- or two-word identifier.
For example,
the first three episodes of this example lesson are
`_episodes/01-design.md`,
`_episodes/02-tooling.md`
and `_episodes/03-formatting.md`.
These become `/01-design/index.html`, `/02-tooling/index.html`, and `/03-formatting/index.html`
in the published site.
When referring to other episodes, use:

{% raw %}
    [link text]({{ page.root }}{% link _episodes/dd-subject.md %})
{% endraw %}

_i.e._, use [Jekyll's link tag][jekyll-link-tag] and the name of the file.

## Episode Header

Each episode's [YAML][yaml] header must contain:

*   the episode's title
*   time estimates for teaching and exercises
*   motivating questions
*   lesson objectives
*   a summary of key points

These values are stored in the header so that [Jekyll][jekyll] will read them
and make them accessible in other pages as `site.episodes.the_episode.key`,
where `the_episode` is the particular episode
and `key` is the key in the [YAML][yaml] header.
This lets us do things like
list each episode's key questions in the syllabus on the lesson home page.

## Episode Structure

The episode layout template in `_layouts/episode.html` automatically creates
an introductory block that summarizes the lesson's teaching time,
exercise time,
key questions,
and objectives.
It also automatically creates a closing block that lists its key points.
In between,
authors should use only:

*   paragraphs
*   images
*   tables
*   ordered and unordered lists
*   code samples (described below).
*   special blockquotes (described below)

Authors should *not* use:

*   sub-titles (instead, use H2 subheadings (`##`) in the episode files)
*   HTML layout (e.g., `div` elements).


> ## Linking section IDs
>
> In the HTML output each header of a section, code sample, exercise will be associated with an
> unique ID (the rules of the ID generation are given in kramdown
> [documentation](https://kramdown.gettalong.org/converter/html.html#auto-ids),
> but it is easier to look for them directly in the page sources).
> These IDs can be used to easily link to the section by attaching the hash (`#`) followed by the ID
> to the page's URL (like [this](#linking-section-ids)). For example, the instructor might copy the
> link to the etherpad, so that the lesson opens in learners' web browser directly at the right
> spot.
{: .callout}

## Formatting Code

Inline code fragments are formatted using back-quotes.
Longer code blocks are formatted by opening and closing the block with `~~~` (three tildes),
with a class specifier after the block:

{% raw %}
    ~~~
    for thing in collection:
        do_something
    ~~~
    {: .source}
{% endraw %}

which is rendered as:

~~~
for thing in collection:
    do_something
~~~
{: .source}

The class specified at the bottom using an opening curly brace and colon,
the class identifier with a leading dot,
and a closing curly brace.
The [template]({{ site.template_repo }}) provides three styles for code blocks:

~~~
.source: program source.
~~~
{: .source}

~~~
.output: program output.
~~~
{: .output}

~~~
.error: error messages.
~~~
{: .error}

### Syntax Highlighting

The following styles like `.source`, but include syntax highlighting for the
specified language.
Please use them where possible to indicate the type of source being displayed,
and to make code easier to read.

`.language-bash`: Bash shell commands:

~~~
echo "Hello World"
~~~
{: .language-bash}

`.language-html`: HTML source:

~~~
<html>
<body>
<em>Hello World</em>
</body>
</html>
~~~
{: .language-html}

`.language-make`: Makefiles:

~~~
all:
    g++ main.cpp hello.cpp -o hello
~~~
{: .language-make}

`.language-matlab`: MATLAB source:

~~~
disp('Hello, world!')
~~~
{: .language-matlab}

`.language-python`: Python source:

~~~
print("Hello World")
~~~
{: .language-python}

`.language-r`: R source:

~~~
cat("Hello World")
~~~
{: .language-r}

`.language-sql`: SQL source:

~~~
CREATE PROCEDURE HelloWorld AS
PRINT 'Hello, world!'
RETURN (0)
~~~
{: .language-sql}

> ## Highlighting for other languages
> You may use other `language-*` classes to activate syntax highlighting
> for other languages.
> For example,
>
> {% raw %}
>     ~~~
>     title: "YAML Highlighting Example"
>     description: "This is an example of syntax highlighting for YAML."
>     array_values:
>         - value_1
>         - value_2
>     ~~~
>     {: .language-yaml }
> {% endraw %}
>
>
> will produce this:
>
> ~~~
> title: "YAML Highlighting Example"
> description: "This is an example of syntax highlighting for YAML."
> array_values:
>     - value_1
>     - value_2
> ~~~
> {: .language-yaml }
>
>
> Note that using `.language-*` classes other than
> `.language-bash`
> `.language-html`,
> `.language-make`,
> `.language-matlab`,
> `.language-python`,
> `.language-r`,
> or `.language-sql`
> will currently cause one of the tests in the lesson template's
> `make lesson-check` to fail for your lesson,
> but will not prevent lesson pages from building and rendering correctly.
>
{: .solution }


## Special Blockquotes

We use blockquotes to group headings and text
rather than wrapping them in `div` elements.
in order to avoid confusing [Jekyll][jekyll]'s parser
(which sometimes has trouble with Markdown inside HTML).
Each special blockquote must begin with a level-2 header,
but may contain anything after that.
For example,
a callout is formatted like this:

~~~
> ## Callout Title
>
> text
> text
> text
>
> ~~~
> code
> ~~~
> {: .source}
{: .callout}
~~~
{: .source}

(Note the empty lines within the blockquote after the title and before the code block.)
This is rendered as:

> ## Callout Title
>
> text
> text
> text
>
> ~~~
> code
> ~~~
> {: .source}
{: .callout}

The [lesson template]({{ site.template_repo }}) defines styles
for the following special blockquotes:

<div class="row">
  <div class="col-md-6" markdown="1">

> ## `.callout`
>
> An aside or other comment.
{: .callout}

> ## `.challenge`
>
> An exercise.
{: .challenge}

> ## `.checklist`
>
> Checklists.
{: .checklist}

> ## `.discussion`
>
> Discussion questions.
{: .discussion}

> ## `.keypoints`
>
> Key points of an episode.
{: .keypoints}

  </div>
  <div class="col-md-6" markdown="1">

> ## `.objectives`
>
> Episode objectives.
{: .objectives}

> ## `.prereq`
>
> Prerequisites.
{: .prereq}

> ## `.solution`
>
> Exercise solution.
{: .solution}

> ## `.testimonial`
>
> A laudatory quote from a user.
{: .testimonial}

  </div>
</div>

Note that `.challenge` and `.discussion` have the same color but different icons.
Note also that one other class, `.quotation`,
is used to mark actual quotations
(the original purpose of the blockquote element).
This does not add any styling,
but is used to prevent the checking tools from complaining about a missing class.

Most authors will only use `.callout`, `.challenge`, and `.prereq`,
as the others are automatically generated by the template.
Note that `.prereq` is meant for describing things
that learners should know before starting this lesson;
setup instructions do not have a particular style,
but are instead put on the `setup.md` page.

Note also that solutions are nested inside exercises as shown below:

~~~
> ## Challenge Title
>
> This is the body of the challenge.
>
> ~~~
> it may include some code
> ~~~
> {: .source}
>
> > ## Solution
> >
> > This is the body of the solution.
> >
> > ~~~
> > it may also include some code
> > ~~~
> > {: .output}
> {: .solution}
{: .challenge}
~~~
{: .source}

The double indentation is annoying to edit,
but the alternatives we considered and discarded are worse:

1.  Use HTML `<div>` elements for the challenges.
    Most people dislike mixing HTML and Markdown,
    and experience shows that it's all too easy to confuse Jekyll's Markdown parser.

2.  Put solutions immediately after challenges rather than inside them.
    This is simpler to edit,
    but clutters up the page
    and makes it harder for tools to tell which solutions belong to which exercises.

## Applying a Shadow to Images

By default, images in the lesson are displayed without borders or shadows.
In some circumstances, it may be desirable to make images stand out
from the background of the page,
for example, when using screenshots that include text on white background.
You can add a drop shadow effect to images by applying the
`image-with-shadow` class to them:

~~~
{% raw %}![image alt text](path/to/image/source.svg){: .image-with-shadow }{% endraw %}
~~~
{: .source }

[jekyll-link-tag]: https://jekyllrb.com/docs/liquid/tags/#link

## Adding Formatted Equations

The template supports rendering of equations via [KaTeX](https://katex.org/).
This option must be activated by adding `math: true` to the `_config.yml` file 
or YAML front matter of the Markdown file where you wish to use it.

Mathematical expressions can then be added to the page content using the LaTeX syntax.

Expressions can be written inline:

~~~
{% raw %}Inline expressions can be added between `$` symbols, e.g. $E = Mc^2$.{% endraw %}
~~~
{: .source}

with the result:

Inline expressions can be added between `$` symbols, e.g. $E = mc^2$.

Or as a block across multiple lines:

~~~
{% raw %}$$
    \lim_{x \rightarrow 0}
    \frac{
        \sin x
    } {
        x
    }
    = 1
$${% endraw %}
~~~
{: .source}

with the result:

$$
    \lim_{x \rightarrow 0}
    \frac{
        \sin x
    } {
        x
    }
    = 1
$$

The example above was taken from the chapter _Typesetting Mathematical Formulae_,
in [The Not So Short Introduction to LaTeX](https://tobi.oetiker.ch/lshort/lshort.pdf).
[The Mathematics chapter of the LaTeX WikiBook](https://en.wikibooks.org/wiki/LaTeX/Mathematics)
is a good reference guide for those wishing to add equations
and mathematical expressions to their lessons.

{% include links.md %}
