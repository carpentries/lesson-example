---
layout: page
title: Setup
permalink: /setup/
---
## Setup Instructions for Actual Lessons

1.  Installation instructions for core lessons are included in the [workshop template's home page][template],
    so that they are all in one place.
    The `setup.md` files of core lessons link to
    the appropriate sections of the [workshop template page][workshop-repo].

2.  Other lessons' `setup.md` include full installation instructions organized by OS
    (following the model of the workshop template home page).

## Setting Up for Lesson Development

If you want to set up Jekyll
so that you can preview changes on your own machine before pushing them to GitHub,
you must install the software described below.
(Note: Julian Thilo has written instructions for
[installing Jekyll on Windows][jekyll-windows].)

1.  **Ruby**.
    This is included with Linux and Mac OS X;
    the simplest option on Windows is to use [RubyInstaller][ruby-installer].
    You can test your installation by running `ruby --version`.
    For more information,
    see [the Ruby installation guidelines][ruby-install-guide].

2.  **[RubyGems][rubygems]**
    (the package manager for Ruby).
    You can test your installation by running `gem --version`.

3.  **[Jekyll][jekyll]**.
    You can install this by running `gem install jekyll`.

4.  **R Packages**.
    We use [knitr][cran-knitr], [stringr][cran-stringr], and [checkpoint][cran-checkpoint]
    to format lessons written in R Markdown,
    so you will need to install these to build R lessons
    (and this example lesson).

If you want to run `bin/lesson_check.py` (which is invoked by `make lesson-check`)
you will need Jekyll (so that you have its Markdown parser, which is called Kramdown)
and the [PyYAML][pyyaml] module for Python 3.

## Creating a New Lesson

We will assume that your user ID is `timtomch` and the name of your
lesson is `data-cleanup`.

1.  Go to [GitHub's importer][importer].

2.  Put the URL of [the styles repository][styles] in the "Your old repository’s clone URL" box.
    Do *not* use the URL of this repository,
    as that will bring in a lot of example files you don't actually want.

3.  Select the owner for your new repository.
    In our example this is `timtomch`,
    but it may instead be an organization you belong to.

4.  Choose a name for your lesson repository.
    In our example, this is `data-cleanup`.

5.  Make sure the repository is public.

6.  At this point, you should have a page like this:

    ![](./fig/using-github-import.png)

    You can now click "Begin Import".
    When the process is done,
    you can click "Continue to repository" to visit your newly-created repository.

7.  Clone your newly-created repository to your desktop:

    ~~~
    $ git clone -b gh-pages https://github.com/timtomch/data-cleanup.git
    ~~~
    {: .source}

    Note that the URL for your lesson will be different than the one above.

8.  Go into that directory using:

    ~~~
    $ cd data-cleanup
    ~~~
    {: .source}

    Note that the name of your directory will be different,
    since your lesson probably won't be called `data-cleanup`.

9. Manually add the styles repository as a remote called `template`:

    ~~~
    $ git remote add template https://github.com/swcarpentry/styles.git
    ~~~
    {: .source}

    This will allow you to pull in changes made to the template,
    such as improvements to our CSS style files.
    (Note that the user name above is `swcarpentry`, *not* `timtomch`,
    since you are adding the master copy of the template as a remote.)

10. Make sure you are using the `gh-pages` branch of the lesson template:

    ~~~
    $ git checkout gh-pages
    ~~~
    {: .source}

	This will ensure that you are using the most "stable" version of the
	template repository. Since it's being actively maintained by the
	Software Carpentry community, you could end up using a development branch
	that contains experimental (and potentially not working) features without
	necessarily realising it. Switching to the `gh-branch` ensures you are
	using the "stable" version of the template.

11. Run `bin/lesson_initialize.py` to create all of the boilerplate files
    that cannot be put into the styles repository
    (because they would trigger repeated merge conflicts).

12. Create and edit files as explained in [the episodes of this lesson]({{ page.root }}/{{ site.index }}#schedule).

13. Preview the HTML pages for your lesson:

    ~~~
    $ make serve
    ~~~
    {: .source}

14. Commit your changes *and the HTML pages in the root directory of
    your lesson repository* and push to the `gh-pages` branch of your
    repository:

    ~~~
    $ cd data-cleanup
    $ git add changed-file.md changed-file.html
    $ git commit -m "Explanatory message"
    $ git push origin gh-pages
    ~~~
    {: .source}

15. [Tell us][contact] where your lesson is so that we can add it to
    the appropriate index page(s).

**Note:**

1.  SSH cloning (rather than the HTTPS cloning used above)
    will also work for those who have set up SSH keys with GitHub.

2.  Once a lesson has been created, please submit changes
    for review as pull requests that contain *only the modified Markdown files*.
    Do *not* submit generated HTML.

3.  Some people have had intermittent errors during the import process,
    possibly because of the network timing out.
    If you experience a problem, please re-try;
    if the problem persists,
    please [get in touch][contact].

{% include links.md %}
