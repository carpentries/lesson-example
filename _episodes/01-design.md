---
title: "Lesson Design"
teaching: 10
exercises: 0
questions:
- "How do we design lessons?"
objectives:
- "Describe the reverse instructional design process."
- "Describe the purpose and implementation of formative assessments."
keypoints:
- "Lessons are designed in four stages: conceptual, summative, formative, and connective."
---

This episode describes how we go about designing lessons and why.
For more information on how we design lessons and why,
see our
[**new curriculum development guide**](https://carpentries.github.io/curriculum-development/).
Our instructor training course can be found at <https://carpentries.github.io/instructor-training>

## Reverse Instructional Design

### Idealized

In principle,
we design lessons in four stages:

1.  **Conteptual:** describe target audience,
    overall lesson's goals,
    and how long it is going to be.

    **Example**:

    a. A lesson for people who have taught themselves
    how to write page-long statistical analyses in R using RStudio,
    but have never written functions or run programs from the Unix shell prompt.

    b. Lesson's overall goal is to teach them how to write modular programs
    and how to use `dplyr` to regularize their analyses.

    c. Esimated time: half a day.

    It's often helpful to use [concept maps][concept-maps] in this stage.

2.  **Summative Assessment:**
    figure out how learners will demonstrate that they have mastered the material.

    **This is the most important step** because
    it determines the scope of the lesson.

    **Example**:
    Write a four-function program
    to load, clean up, analyze, and plot a collection of medical data sets.

3.  **Formative Assessments:** describe exercises that learners will do during the lesson.

    It wouldn't be fair to ask someone to parallel park on a driving test
    if they'd never done it before.
    Therefore, two formative assessments in a driving course might be
    "back up" and "parallel park between safety cones".

4.  **Connect the Dots**:
    put the formative assessments in order
    and develop lesson episodes to go from one to the next.

    It is common to sketch a concept map for each lesson episode,
    both to outline its key ideas
    and to check that it's not too big.
    The ordering of lesson episodes is constrained by dependencies
    but is usually not completely determined by them:
    there are often several different orders in which ideas can sensibly be introduced.
    It is common to discover a need for more formative assessments at this stage;
    to continue with the driving example,
    the lesson author might realize that a third exercise on turning while backing up is needed
    (since many people initially turn the steering wheel the wrong way when they're in reverse).


### In practice

In practice, the process often looks more like this:

1.  Draft the assumptions and major outcomes.

2.  Describe the summative assessments for each half day of material
    (i.e., one summative assessment for a three-hour lesson and two for a full-day lesson).

3.  Write a one- or two-line description of the formative assessments
    building up to those summative assessments.
    These should be used ideally every 5 minutes and at least every 10-15 minutes.

4.  Get early feedback from peers,
    particularly on how realistic the time estimates are.

5.  Do a second pass to flesh out the assumptions and assessments.

6.  Get more feedback.

7.  Start writing the lesson content.

Steps 1-6 are best done in a single Markdown file for easy review;
if you are using this template,
you should call it `_extras/design.md`.
Once work starts on step 7,
the detailed milestones should be moved into lesson episode files.
For an example of this,
see the [novice Python lesson using the gapminder data][python-gapminder].

## What Makes a Good Formative Assessment

The two purposes of formative assessment are
(a) to help learners prepare for the summative assessment and
(b) to tell them and their instructor *during the lesson*
whether they're making progress (and if not, what obstacles they have hit).
If lesson episodes are 10-15 minutes long,
then formative assessments should take no more than 5 minutes.
This means that formative assessments should be:

*   multiple choice questions,
*   debugging exercises
    (in which the learner is given a few lines of code that do the wrong thing
    and asked to find and fix the bug), or
*   extensions of examples show in the lecture.

Good formative assessments do *not* require learners to write lots of code from scratch:
it takes too long,
there are usually too many possible right solutions to discuss in just a couple of minutes,
and many novices find a blank page (or screen) intimidating.

{% include links.md %}
