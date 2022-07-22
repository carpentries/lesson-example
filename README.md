# RSG Training Lesson Template

This lesson template is intended to be used with the
[workshop-template](https://github.com/Southampton-RSG-Training/workshop-template/),
but can be used to create an independent, standalone lesson.

## Standalone lesson build using existing lesson content

To create a standalone lesson fork the lesson repository, then simply update the location and time variables in 
_config.yml. Then commit and push to GitHub after the actions run (you may need to grant permission) then the lesson 
will be served on the gh-pages branch and hosted on GitHub pages.

## Customising existing lessons

Pull a local copy of the lesson, create a branch with a short descriptive name e.g. for a simplified lesson 'easy-mode'. 
Make modifications to the markdown in _episodes commit the new material. The actions script in the main lesson 
repository should not be altered. To serve this lesson standalone fork the lesson and modify the action script in your 
new branch replacing 'main' with e.g. 'easy-mode'. To build locally simply run `bash bin/build_me.sh`. To include the 
custom lesson in a workshop simply update the branch tag in the lesson's description in the workshop's _config.yml.

## Developing New Lessons

Create a new lesson by creating a template of this repository, ensure that the branch is named main and also bring 
across the gh-pages branch. Please make sure to create this in the Southampton-RSG-Training organization, with a short 
name such as "git-novice", or "shell-advanced". 

The lessons are written in markdown, firstly please view some existing lessons shell-novice and python-novice are good 
starting points and will inform you as to style and contain a lot of structures you can copy. There are extensive 
markdown guides elsewhere, so we will focus on the specific things to help use the additional features and files 
expected from this template.

### Files to update/create

You should only need to update the following files:

1. `reference.md`
2. Lesson markdown files in `_episodes`
3. `_config.yml`
4. Figures can be stored in `fig/`
5. Code can be stored in `code/`
6. Data can be stored in `data/`
7. The home logo and favicon can be changed in `assets/`

### Specifying _config.yml

Update the _config.yml to include the following:

These are essential:
- kind: workshop or course depending on if you want a site with schedules and dates (workshop) or a site which hosts the content for people to access in their own time (course).
- type: use episode (unless you are developing in r_markdown then change it to episode_r, then stop developing in r_markdown switch to markdown and change it back)
- title, form_title: the title of the workshop and the title of the workshop with spaces replaced with '+' and special characters removed, this is used for Google forms.

These are not essential:

- venue, address, country, lat/long: updates the details for the workshop location. You can use, e.g., Google Maps or https://www.latlong.net/convert-address-to-lat-long.html to find the latitude and longitude of the venue.
- humandate, humantime, startdate, enddate: human- and machine-readable dates and times, respectively, for the start and end of the workshop. Machine readable dates should be in YYYY-MM-DD format. The human-readable dates are free form.
- platform-name: e.g. Teams, Zoom...

### Writing new markdown

New episodes should follow the naming format '00-lesson-name.md'.

Here are a few tips and tricks to get you writing good-looking lessons quickly:

#### Front Matter Variables

To make full use of the lesson template, it is wise to include as many as the
following front matter variables in your episodes:

1. `title` - the episode title
2. `slug` - the episode slug, used to generate the permalink to that episode
3. `teaching` - the number of minutes of teaching for the episode
4. `exercises` - the number of minutes of exercises for the episode
5. `questions` - a YAML list of questions for the episode
6. `objectives` - a YAML list of episode objectives
7. `keypoints` - a YAML list of episode key points

#### Using tags

We use content tags to make engaging content by breaking up the flow.

A tag is used to style blocks of content, the format is {: .tag-name}. The tag needs to be positioned correctly to 
ensure styling is correctly applied. The tags may work when applied incorrectly but are likely to break later. 

The tags apply on two types of content, text blocks and code blocks. 

Code Blocks:

```
~~~
print('Hello world')
~~~
{: .language-python}
```
or
~~~
```
print('Hello world')
```
{: .language-python}
~~~

The tag directly after the block defines the formatting

Text Blocks:
```
> ## We can add titles to text blocks
> 
> A text block can be styled using a tag
> but its best to leave one extra indented line
> 
{: .callout}
```

Using nesting and tags:

```
> A text block can be styled using a tag
> but its best to leave one extra indented line
>
> > This is useful when we use nested blocks so they 
> > don't trip over each other
> >
> {: .solution}
>
{: .callout}
```

Code and text all together:

```
> A text block can be styled using a tag
> but its best to leave one extra indented line
>
> ~~~
> print('Hello World')
> ~~~
> {: .language-python}
>
> > This is useful when we use nested blocks so they 
> > don't trip over each other
> >
> > > ## No reason indenting cant define a code block too
> > > print('Hello World')
> > >
> > {: .language-python}
> >
> {: .solution}
>
{: .callout}
```


For more examples see the markdown 00-introduction.md which should be deleted before you build the site.

