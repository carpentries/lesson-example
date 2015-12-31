## Background and Design

There are a few things you need to know in order to understand why
this template is organized the way it is:

1.  Git uses the term *clone* to mean "a copy of a repository".
    GitHub uses the term *fork* to mean, "a copy of a GitHub-hosted
    repo that is also hosted on GitHub", and the term *clone* to mean
    "a copy of a GitHub-hosted repo that's located on someone else's
    machine".  In both cases, the duplicate has a remote called
    `origin` that points to the original repo; other remotes can be
    added manually.

2.  A user on GitHub can only have one fork of a particular repo.
    This is a problem for us because an author may be involved in
    writing several lessons, each of which has its own website repo.
    Those website repositories ought to be forks of this one, but
    since GitHub doesn't allow that, we've had to find a workaround.

3.  If a repository has a branch called `gh-pages` (which stands for
    "GitHub pages"), then GitHub uses the HTML and Markdown files in
    that branch to create a website for the repository.  If the
    repository's URL is `http://github.com/darwin/finches`, the URL
    for the website is `http://darwin.github.io/finches`.

4.  We use Markdown for writing pages because it's simple to learn,
    and isn't tied to any specific language (the ReStructured Text
    format popular in the Python world, for example, is a complete
    unknown to R programmers).  If authors want to use something else
    to author their lessons (e.g., Jupyter Notebooks), it's up to them
    to generate and commit Markdown formatted according to the rules
    below.

    **Note:** we do *not* prescribe what tools instructors should use
    when actually teaching.  The Jupyter Notebook, Python IDEs like
    Spyder, and the GOCLI (Good Ol' Command Line Interpreter) are all
    equally welcome up on stage --- all we specify is the format of
    the lesson notes.

5.  GitHub uses Jekyll to turn Markdown into HTML.  Jekyll looks for
    a header at the top of each page formatted like this:

    ~~~
    ---
    variable: value
    other_variable: other_value
    ---
    ...stuff in the page...
    ~~~

    and inserts the values of those variables into the page when
    formatting this.  Lesson authors will usually not have to worry
    about this.

    Jekyll also takes values from a `_config.yml` configuration file
    and inserts them into the page.  Lesson authors will also not
    have to worry about this in most cases, provided they update the
    `title`, `lesson_repo`, and `lesson_site` variables in `_config.yml`.

6.  In order to display properly, our generated HTML pages need artwork,
    CSS style files, and a few bits of Javascript.  We could load these
    from the web e.g. from a content delivery network (CDN), but that
    would make offline authoring difficult.  Instead, each lesson's
    repository is self-contained and has a copy of all these third party
    resources, and a way of updating them (and only them) on demand.

## Why All the Blockquotes?

We try not to put HTML inside Markdown because it's
ugly to read and write, and error-prone to process. Instead, we put
things that ought to be in `<div>` blocks, like the learning
objectives and challenge exercises, in blockquotes indented with `>`,
then attach a style to the blockquote like this:

    > ## Title
    >
    > body
    {: .style}

Note that:

*   The curly-braced style declaration is *not* prefaced with `>`.

*   The title isn't explicitly styled;
    instead,
    our CSS defines what an `h2` inside a `blockquote` should look like.

*   We style code blocks the same way for consistency's sake.
