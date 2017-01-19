---
title: Using Jupyter Notebook 
teaching: 10
exercises: 1
questions:
- "How to write a lesson using Jupyter Notebook?"
objectives:
- "Explain how to use Jupyter Notebook with the new lesson template."
- "Demonstrate how to include pieces of code, figures, and challenges."
keypoints:
- "It shouldn't be difficult"
---

The lesson should be written with a mix of code cells and Markdown cells,
just like you'd normally do.


~~~
1 + 1
~~~
{: .source .python}



~~~
2
~~~
{: .output}


Output with error message:


~~~
x[10]
~~~
{: .source .python}

~~~
---------------------------------------------------------------------------
NameError Traceback (most recent call last)
<ipython-input-2-7644c71c757c> in <module>()
----> 1 x[10]

NameError: name 'x' is not defined
~~~
{: .error}
Output generating figures:


~~~
% matplotlib inline
~~~
{: .source .python}


~~~
import matplotlib.pyplot

matplotlib.pyplot.plot([1,2,3], [1,2,3])
~~~
{: .source .python}



~~~
[<matplotlib.lines.Line2D at 0x7f542455f208>]
~~~
{: .output}




![png](../07-jupyter_6_1.png)

For the challenges you need to pay attention
to include `<blockquote class="challenge">` before it
and `<\blockquote>` after it.
And for the solutions you need to pay attention
to include `<blockquote class="solution">` before it
and `<\blockquote>` after it.
**This hacks is necessary for allow include Jupyter cells on challenges and solutions.**
<blockquote class="challenge">
## Challenge: Can you do it?

What is the output of this command?

~~~
"a" + "b"
~~~
{: .source}

<blockquote class="solution">
## Solution


~~~
"a" + "b"
~~~
{: .source .python}



~~~
'ab'
~~~
{: .output}


</blockquote>
</blockquote>
