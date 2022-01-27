# lesson-template

This lesson template is intended to be used with the
[workshop-template](https://github.com/Southampton-RSG-Training/workshop-template/),
but could still be used to create an independent, standalone lesson. It is based
on the [Carpentries](https://carpentries.github.io/lesson-example/) lesson
example, but with some modifications. The aim is to keep this template as simple
and up-to-date with the Carpentries example as possible.

## Instructions

1. Create a new lesson by creating a template of this repository, ensure that
   the branch is still named gh-pages. Please make sure to create this in the
   Southampton-RSG-Training organization, with a short name such as
   "git-novice", or "shell-advanced".

2. Optionally, you should immediately create a new branch for the lesson you
   are creating. By using branches, it is possible to create a collection of the
   same lesson customized for different audiences which can be easily re-used
   in the future in the workshop template.

3. You need to edit several variables in `_config.yml` for the lesson to render
   correctly.

4. Create the lesson data. If you are unfamiliar with the format, please refer
   to the tutorial on [creating lessons](https://carpentries.github.io/lesson-example/).

5. Ensure each lesson markdown file has the appropriate front matter variables
   as contained in `01-introduction.md`.

6. To render this webpage as a standalone lesson, update the `gh-pages` branch
   with your latest changes. This is the branch which GitHub will use to host
   the lesson webpage.

7. To preview your material, you can use the `make serve` command to launch
   Jekyll locally. Alternatively, you can push changes to `gh-pages` to let
   GitHub handle the rendering.

8. Optional: run `make lesson-check` to check that your files follow the
    Carpentries formatting rules.

When making a lesson to be used with the workshop template, to ensure that your
lesson is a consistent style with the other lessons, please use the `episode`
layout, i.e. ensure that `layout: episode` is in the front matter, or do not
specify a layout at all.

Each lesson included in a workshop has a top level and a detailed schedule. The
detailed schedule is automatically generated, however the top level one may need
some manual changes. This schedule is located in `_includes/rsg/schedule.html`,
and will need some knowledge of HTML to modify. However, the default schedule is
probably okay for most circumstances.

If your lesson takes place over multiple days, then `_includes/rsg/schedule.html`
will need to include two schedule tables. Additionally, for the first
lesson episode for each day, you need to place `start: true` in the front
matter. This will then mark where each day starts and ends in the detailed
lesson schedule.

## Front Matter Variables

To make full use of the lesson template, it is wise to include as many as the
following front matter variables in your episodes:

1. `title` - the episode title
2. `slug` - the episode slug, used as the permalink to that episode
3. `teaching` - the number of minutes of teaching for the episode
4. `exercises` - the number of minutes of exercises for the episode
5. `questions` - a YAML list of questions for the episode
6. `objectives` - a YAML list of episode objectives
7. `keypoints` - a YAML list of episode key points
8. `start` - either true or false, to indicate if a lesson is the first of a day

The `title`, `slug`, `teaching` and `exercises` variables are required, the
others are optional and the layout of the page will adjust accordingly to what
has been included.

## Files to update/create

You should only need to update the following files:

1. `index.md`
2. `setup.md`
3. `reference.md`
4. `_includes/rsg/schedule.html`
5. Lesson markdown files in `_episodes`/`_episode_rmd`
6. Lesson extras in `_extras`
7. `_config.yml`

## Layout

The layout of lessons is nominally explained [here]
(https://carpentries.github.io/lesson-example/03-organization/index.html). But,
in brief:

1.  The source for pages that appear as top-level items in the navigation bar
    are stored in the root directory, including the home page (`index.md`),
    the reference page (`reference.md`), and the setup instructions
    (`setup.md`).

2.  Source files for lesson episodes are stored in `_episodes`. As a standalone
    lesson, `01-introduction.md` would generate `/01-introduction/index.html`.
    As part of the workshop template, the generated page is instead generated
    to the slug of the markdown file.

3.  If you are writing lessons in R Markdown, source files go in
    `_episodes_rmd`. You must run `make lesson-rmd` to turn these into Markdown
    in `_episodes` and commit those Markdown files to the repository
    (since GitHub won't run anything except Jekyll to format material).
    You must also commit any figures generated from your lessons,
    which are stored in the `fig` directory.

5.  Files that appear under the "extras" menu in the lesson navigation bar are
    stored in `_extras`.

6.  Figures are stored in the `fig` directory, data sets in `data`,
    source code in `code`, and miscellaneous files in `files`.


