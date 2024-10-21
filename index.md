---
layout: lesson
root: .  # Is the only page that doesn't follow the pattern /:path/index.html
permalink: index.html  # Is the only page that doesn't follow the pattern /:path/index.html
---

{% include gh_variables.html %}

> ## Use the New Lesson Infrastructure!
>
> Our new lesson infrastructure, [The Carpentries Workbench](https://carpentries.github.io/workbench/)
> became the default for official Carpentries lessons in May 2023.
>
> The Workbench is designed to be more accessible and easier to use than the styles
> infrastructure by separating tools from the content. As such, **using this repository for
> lessons is no longer supported by The Carpentries Core Team**.
>
> **If you would like to create a new lesson, we encourage you to use The Workbench templates below.**
>
> - Markdown Lesson Template: <https://github.com/carpentries/workbench-template-md>
> - R Markdown Lesson Template: <https://github.com/carpentries/workbench-template-rmd>
>
> ### Resources
> 
> - Lesson Maintainer/Author Documentation: <https://carpentries.github.io/sandpaper-docs/>
> - Migrating between Carpentries lesson infrastructures:
>     - A semi-automated workflow for migrating from the previous infrastructure to the Workbench: <https://carpentries.github.io/sandpaper-docs/migrating-from-styles.html>
>     - Transition Guide: <https://carpentries.github.io/workbench/transition-guide.html>
> - General Information: <https://carpentries.github.io/workbench/>
> - Discussion: <https://github.com/carpentries/workbench/discussions>
> - Bug Reports: <https://github.com/carpentries/workbench/issues>
> - Contact: team at carpentries dot org
{: .callout}


For guidelines on how to develop curriculum content, please visit
[The Carpentries Curriculum Development Handbook][curriculum-handbook].

This lesson shows how to use [The Carpentries]({{ site.carpentries_site }})
lesson template. The materials below assume familiarity with tools such as GitHub, Markdown,
and Jekyll. For more guidance, please visit the [Technological introductions][tech-intro]
section of The Carpentries Curriculum Development Handbook.

For guidelines on how to help improve our lessons and this template,
please see [the contribution guidelines][contributing];
for guidelines on how to set up your machine to preview changes locally,
please see [the setup instructions]({{ page.root }}{% link setup.md %}).

> ## Prerequisites
>
> Use the `.prereq` style to specify prerequisites.
{: .prereq}

> ## Ten Things You Need To Know
>
> 0.  Don't panic.
> 1.  Create a new lesson by using GitHub Import, *not* by forking.
> 2.  Run `bin/lesson_initialize.py` *once* in a new lesson repository to set up standard files.
> 3.  Run `make lesson-check` to check that the lesson is formatted correctly.
> 4.  Put lesson episodes in `_episodes` (or `_episodes_rmd` if you are writing in RMarkdown).
> 5.  Run `make serve` to preview the lesson website locally.
> 6.  Do *not* commit the generated HTML files in the `_site` directory.
> 7.  Style blocks and code samples by putting `{: .stylename}` on a newline *after* the block or
      code.
> 8.  Put solutions inside challenges using nested blockquotes.
> 9.  File issues and template fixes in the [styles repository][styles],
>     and enhancements to this documentation in this one.
{: .checklist}

[curriculum-handbook]: https://carpentries.github.io/curriculum-development/
[tech-intro]: https://carpentries.github.io/curriculum-development/technological-introductions.html

{% include links.md %}

