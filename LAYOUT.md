# Lesson Layout

Each lesson is stored in a directory laid out as described below. That
directory is a self-contained Git repository (i.e., there are no
submodules or clever tricks with symbolic links).

1.  `README.md`: initially a copy of this repository's README file.  It should be
    overwritten with short description of the lesson, but should
    include the following blockquote to help people find these
    instructions:

    ~~~
    > Please see [https://github.com/swcarpentry/lesson-example][swc-lesson-example]
    > for instructions on formatting, building, and submitting lessons,
    > or run `make` in this directory for a list of helpful commands.
    ~~~

2.  Other files in the root directory: the source of the lesson's web
    pages (and possibly auxiliary files like Jupyter Notebooks and R
    Markdown files).

3.  `code/`, `data/`, and `fig/`: sub-directories containing sample
    code, data files, and figures.  See "Code, Data, and Figures"
    below.

4.  `css/`, `img/`, and `js/`: style sheets, artwork, and
    Javascript used in the lesson's web site.  See "Support Files"
    below.

5.  `_layouts/` and `_includes/`: page templates and inclusions. See
    "Support Files" below.

6. `tools/`: tools for managing lessons. See "Tools" below.

7. `_config.yml`: a Jekyll configuration file.
   Authors should leave most of the settings alone,
   but will need to change the lesson title.

# Code, Data, and Figures

All of the software samples used in the lesson must go in a directory
called `code/`. Stand-alone data files must go in a directory called
`data/`. Groups of related data files must be put together in a
sub-directory of `data/` with a meaningful (short) name.  Figures,
plots, and diagrams used in the lessons must go in a `fig/` directory.

**Notes:**

1.  This mirrors the layout a scientist would use for actual work.
    However, it may cause novice learners problems.  If a program is
    in `code/a.py`, and contains a reference to a data file
    `../data/b.csv`, then if the user runs the program from the root
    directory using `python code/a.py`, it will be unable to find the
    data file (since the program's working directory will be the root
    directory, not the `data` directory).

2.  Jupyter Notebooks and R Markdown files, which are both code and
    the source for web pages, should go in the root directory.  These
    will not be checked by our validation tool, or indexed by other
    tools we plan to build.

3.  We strongly prefer SVG for line drawings, since they are smaller,
    scale better, and are easier to edit. Screenshots and other raster
    images must be PNG or JPEG format.

# Support Files

Files used to display the lesson, such as artwork, CSS, and
Javascript, are stored in `img/`, `css/`, and `js/` directories of
their own.  We keep website artwork in the `img/` directory
separate from figures used in the lesson (which are stored in `fig/`)
to make it simple to update the former automatically.  Most authors
should not need to modify any of the support files themselves.

The `_layouts/` directory holds the page templates used to translate
Markdown to HTML, while the `_includes/` directory holds snippets of
HTML that are used in several page layouts.  These directories have
underscores at the start of their names to be consistent with Jekyll's
naming conventions, but the files they contain are for Pandoc.

# Tools

The `tools/` directory contains tools to help create and maintain
lessons:

*   `tools/check.py`: make sure that everything is formatted properly,
    and print error messages identifying problems if it's not.

# Pages

The root directory holds the content of the lesson, and must contain:

1.  `Makefile`: contains commands to check, preview, and update the
    repository.  Authors should not need to modify this file.

2.  `index.md`: the home page for the lesson. (See "Home Page" below.)

3.  `dd-slug.md`: the topics in the lesson. `dd` is a sequence number
    such as `01`, `02`, etc., and `slug` is an abbreviated single-word
    mnemonic for the topic. Thus, `03-filesys.md` is the third topic in
    this lesson, and is about the filesystem. (Note that we use hyphens
    rather than underscores in filenames.) See "Topics" below.

4.  `reference.md`: a cheat sheet summarizing key terms and commands,
    syntax, etc., that can be printed and given to learners. See
    "Reference Guide" below.

5.  `discussion.md`: notes about more advanced ideas that would
    distract from the main lesson, and pointers to where to go next.
    See "Discussion Page" below.

6.  `instructors.md`: the instructor's guide for the lesson. See
    "Instructor's Guide" below.

7.  `CONTRIBUTING.md`: instructions for people who want to contribute.
    This file should be edited to replace references to `lesson-template`
    with references to your lesson's repository.

Our [the design document](DESIGN.html) explains why we use blockquotes
and put styles in curly braces after blocks.

## Home Page

`index.md` must be structured as follows:

    ---
    layout: lesson
    ---
    Paragraph(s) of introductory material.

    > ## Prerequisites
    >
    > What learners need to know before tackling this lesson.
    {: .prereq}

    ## Topics

    1.  [Topic Title 1](01-slug.html)
    2.  [Topic Title 2](02-slug.html)

    ## Other Resources

    *   [Reference](reference.html)
    *   [Discussion](discussion.html)
    *   [Instructor's Guide](instructors.html)

**Notes:**

1.  The description of prerequisites is prose for human consumption,
    not a machine-comprehensible list of dependencies. We may
    supplement the former with the latter once we have more experience
    with this lesson format and know what we actually want to do.

2.  Software installation and configuration instructions *aren't* in
    the lesson, since they may be shared with other lessons. They will
    be stored centrally on the Software Carpentry web site and linked
    from the lessons that need them.

## Topics

Each topic page must be structured as follows:

    ---
    layout: page
    subtitle: Topic Title
    minutes: 10
    ---
    > ## Learning Objectives
    >
    > * Learning objective 1
    > * Learning objective 2
    {: .objectives}

    Paragraphs of text
    --- possibly including [definitions](reference.html#definitions) ---
    mixed with:

    ~~~
    some code:
        to be displayed
    ~~~
    {: .python}

    and:

    ~~~
    output
    from
    program
    ~~~
    {: .output}

    and:

    ~~~
    error reports from programs (if any)
    ~~~
    {: .error}

    and possibly including some of these:

    > ## Callout Box
    >
    > An aside of some kind.
    {: .callout}

    and one or more of these at the end:

    > ## Challenge Title
    >
    > Description of a single challenge,
    > separated from the title by a blank line.
    > There may be several challenges;
    > they should all come at the end of the file,
    > and each should have a short, meaningful title.
    {: .challenge}

**Notes:**

1.  The "expected time" heading is called minutes to encourage people
    to create topics that are short (10-15 minutes at most).

2.  There are no sub-headings inside a topic other than the ones
    shown.  (If a topic needs sub-headings, it should be broken into
    two or more topics.)

3.  Every challenge should relate back to a learning objective.
    It should have a brief title and the class `challenge`.

4.  Definitions are links with fragment identifier to `reference.html`
    (like `[definitions](reference.html#definitions)`).
    This is need to enable links from name diferent from the key word defined.

5.  When laying out source code, use `{.lang}` as a style on the
    opening `~~~` line.  For Unix Shell commands use:

        ~~~
        $ some-command
        ~~~
        {: .bash}

    For MATLAB use:

        ~~~
        some code
        ~~~
        {: .matlab}

    For R use:

        ~~~
        some code
        ~~~
        {: .r}

    For Python use:

        ~~~
        some code
        ~~~
        {: .python}

    For SQL use:

        ~~~
        some code
        ~~~
        {: .sql}

## Writing Lessons with R Markdown

Lessons can be written in R Markdown and converted to Markdown. The
main advantages of maintaining lessons in an executable format is 1)
not having to copy-paste the output and 2) it is easier to test if
new changes break code in other parts of the lesson. The main
disadvantage is that there will be more noise when merging the
generated content (e.g. different R versions have slightly different
wording of error messages).

After writing or editing a lesson written in R Markdown, automatically
generate the Markdown and html versions by running the command `make
preview`. This first runs the `knit` command from the [knitr][]
package to convert to Markdown, and then pandoc to convert to html.

To ensure that the generated Markdown files follow the lesson template
guidelines, `source` the R file
[tools/chunk-options.R](tools/chunk-options.R). This file contains
settings that format the input and output code chunks, send all
generated figures to `fig/` instead of `figure/`, and specify a few
other knitr options. Thus a lesson should look like the following:

    ---
    layout: page
    subtitle: Topic Title
    minutes: 10
    ---

    ```{r, include=FALSE}
    source("tools/chunk-options.R")
    opts_chunk$set(fig.path = "fig/topic-title-")
    ```

    > ## Learning Objectives
    >
    > * Learning objective 1
    > * Learning objective 2
    {: .objectives}

    Paragraphs of text
    --- possibly including [definitions](reference.html#definitions) ---
    mixed with:

    ```{r chunk-name}
    # code to be exectued
    ```

    More text.

When using [tools/chunk-options.R](tools/chunk-options.R), figures are
automatically sent to `fig/`. However it is easier to manage all the
figures in a lesson if their names are more descriptive. This can be
acheived by setting a more informative `fig.path` like the example
above, which will prepend "topic-title-" to all generated figure
names. Furthermore, it is recommended to name the code chunks. Thus if
a plot was generated in the example code chunk above, it would be
saved as `fig/topic-title-chunk-name.png`.

To avoid unecessary merge conflicts in the generated content, do not
randomly generate data. Instead use `set.seed` so that any randomly
generated data is always consistent. If introducing the concept of
random number generation is outside the scope of the lesson,
`set.seed` can be hidden from the learners in a separate code chunk.

    ```{r set-seed, echo=FALSE}
    set.seed(12345)
    ```

    ```{r normal-distribution}
    ex_dat <- rnorm(100)
    summary(ex_dat)
    ```

## Reference Guide

The reference guide in `reference.md` is a cheat sheet for learners to print,
doodle on, and take away.  Its format is deliberately unconstrained for now,
since we'll need to see a few before we can decide how they ought to
be laid out (or whether they need to be laid out the same way at all).

The last section of the reference guide must be a glossary laid out as
a definition list:

    ---
    layout: page
    subtitle: Reference
    ---
    ...commands and examples...

    ## Glossary

    key word 1
    :   Definition of first term

    key word 2
    :   Definition of second term

## Discussion Page

The discussion page in `discussion.md` is meant to contain links to
further reading, supplementary material that classes usually won't
get to, and so on.  Sections must use level-2 headings, but the
content is otherwise unconstrained:

    ---
    layout: page
    subtitle: Discussion
    ---
    ## Something That May Be Useful

    Paragraphs of general discussion

    ## Something Else

    More general discussion, with links.

Note: the discussion page is not lesson material, so it should not
contain challenges and the like.  Its format is deliberately vague for
now: once we have more experience with our lesson template, we will
provide more guidance on how to lay out this file.  Until then, please
do whatever feels best.

## Instructor's Guide

Learners may go through lessons outside of class, so it seems best to
keep material for instructors in a separate document called
`instructors.md`, rather than interleaved in the lesson itself.  Its
structure is:

    ---
    layout: page
    subtitle: Instructor's Guide
    ---
    ## Overall

    * Point

    * Point

    ## [Topic Title 1](01-slug.html)

    * Point

    * Point

    1.  Discussion of first challenge.

    2.  Discussion of second challenge.

    ## [Topic Title 2](02-slug.html)

    * Point

    * Point

    1.  Discussion of first challenge.

    2.  Discussion of second challenge.

**Notes:**

1.  The topic headings must match the topic titles. (Yes, we could
    define these as variables in a configuration file and refer to those
    variables everywhere, but in this case, repetition will be a lot
    easier to read, and our validator can check that the titles line
    up.)

2.  The points can be anything: specific ways to introduce ideas, common
    mistakes learners make and how to get out of them, or anything else.

3.  Full solutions to the challenges do not have to be presented, but
    every challenge should be discussed, and that discussion should
    mention how long it typically takes to do.  (Those estimates do
    not go in the challenge itself, since they can increase learners'
    stress levels.)

## Configuration File

`_config.yml` contains settings for Jekyll.
Most of these should be left as they are,
but the following values must be changed:

*   `title`: the lesson's title.

*   `lesson_repo`: the URL of the lesson's GitHub repository,
    such as `https://github.com/swcarpentry/lesson-example`.

*   `lesson_site`: the URL of the lesson's generated website,
    such as `http://swcarpentry.github.io/lesson-example'.

[knitr]: http://yihui.name/knitr/
[swc-lesson-example]: https://github.com/swcarpentry/lesson-example
