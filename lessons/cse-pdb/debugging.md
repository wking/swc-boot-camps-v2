Debugging and Profiling

 

Errors & Error Handling

Bugs

Various versions of this have been floating around:  I recomposed this
based on the original psychological definitions.

 

        Denial  "I feel fine."; "This can't be happening, not to me."

  Denial is usually only a temporary defense for the individual.

        Anger  "Why me? It's not fair!"; "How can this happen to me?";
'"Who is to blame?"

  Because of anger, the person is difficult to care for due to feelings
of rage and envy.

        Bargaining "I'll do anything for a few more years."; "I will
give my life savings if..."

  The third stage involves the hope that the individual can postpone or
delay [bugs].

        Depression "I'm so sad, why bother with anything?"; "I miss my
loved one, why go on?"

  During the fourth stage, the grieving person begins to understand the
certainty of [bugs].

        Acceptance "It's going to be okay."; "I can't fight it, I may as
well prepare for it."

  In this last stage, individuals begin to come to terms with their
[code's bugginess].

 

In the face of ambiguity, refuse the temptation to guess.

        —The Zen of Python

 

Definitions

Errors—exceptions which cause the program to be unrunnable (cannot be
handled at run time)

Exceptions—unusual behavior (although not necessarily unexpected
behavior, particularly in Python)

Tracebacks—listing of function calls on the stack at the time the
exception arises

 

Errors

Typically SyntaxError, which renders the program unrunnable (but we'll
discuss linting below).

 

Exceptions

[Invoke live with examples in ipython:  "(hga"; examples can also be
found in lessons/thw-python-debugging/examples]

 

        SyntaxError \# Check missing colons or parentheses

        NameError   \# Check for typos, function definitions

        TypeError   \# Check variable types (coerce if necessary)

        ValueError  \# Check function parameters

        IOError     \# Check that files exist

        IndexError  \# Don't reference nonexistent list elements

        KeyError    \# Similar to an IndexError, but for dictionaries

        ZeroDivisionError   \# Three guesses...

        Exception   \# Generic error category

 

Exercises

-   ■Open the examples of bad code.  See if the students can identify
    why each error is thrown. 

-   ■Write some snippets of code which throw the following exceptions:  
    SyntaxError, NameError, TypeError, ValueError, IOError, IndexError,
    KeyError, ZeroDivisionError 

 

Tracebacks

The stack is intimidating, but you can generally tease out the
information you need.  There is an immediate listing of the function
calls, line numbers, and general condition of the stack at the moment of
failure.  We will also discuss debugging, which allows you to explore
the exceptions in much greater detail:  we'll show how to identify
failure conditions and unexpected behavior.

 

Debugging & Profiling

Illustrate these using material from
lessons/thw-python-debugging/examples/.

 

Linting

As I said before, you can debug by simply attempting to run your code.
 This, however, is very annoying.  First off, the code will always stop
at the first exception.  This means that, if you have ten errors, you'll
have to run the code ten times to find all of them.  Now, imagine that
this is long-running code.  Imagine waiting five minutes for your code
to run, only to discover it breaks because of a typo.  Doesn't that
sound exciting?

 

Linting is the process of statically analyzing the code in order to
catch multiple errors simultaneously (rather than dealing with them one
at a time in the debugger).  There are several available; I'll
illustrate the use of pyflakes.

 \$ pyflakes my\_code.py

 

Coding Standards

In a written natural language, there are many ways to express the same
idea.  To make the consumption of information easier, people define
style guides to enforce particularly effective ways of writing.  This is
even more true in coding; consistent style choices make scripts much
easier to read.  They become absolutely essential as projects become
large (\>1 person).

 

Some programming languages have multiple competing standards, and it's
easy to imagine how messy this can get.  You can find strong opinions on
what constitutes a tab, for instance.  Luckily, Python doesn't have this
issue.  The official standard, PEP8, is used everywhere.  Unless you
plan on hiding all the code you write from the outside world, you should
learn it.

To help out coders, there are tools to test for compliance.  The aptly
named pep8 library shows you where your code deviates from the PEP8
standard, and autopep8 goes a step further by trying to fix all of your
errors for you.  These are both run from the shell, as

 \$ pep8 my\_code.py

 \$ autopep8 my\_code.py \> my\_new\_code.py

 

Debugging

Effective debugging will often utilize unit testing or a standard set of
answers to problems (if known) in order to determine if your code is
working as you expect it to.

 

Profiling

A profiler runs your code inside of a framework which it can query
hundreds or thousands of times per second in order to create a breakdown
of where time is spent in the program.  This allows you to identify
bottlenecks to target in your optimization efforts.

We will discuss CPU time profiling only (you can also profile memory,
input/output speed, etc.). There are three main ways you can accomplish
this in Python.

First, you can use the time package as a stopwatch on specific functions
and make your own comparisons (this is the equivalent of using print as
a debugger).

[https://speakerdeck.com/rwarren/a-brief-intro-to-profiling-in-python](https://speakerdeck.com/rwarren/a-brief-intro-to-profiling-in-python)

        import time

        start = time.time()

        myFunc()

        end = time.time()

        print(repr(end-start), " s elapsed.")

Secondly, you can use the timeit module either inside or outside of your
code to accomplish something similar (best of three).

        \$ python -m timeit "x=2\*\*100;x\*\*100"

Finally, you can use the built-in profiling tool which gives you an
embarassment of riches on timing information.

        \$ python -m cProfile -s time my\_code.py

 

Profilers are inappropriate for benchmarking.  For instance, cProfile
introduces a relative overhead for Python programs as opposed to C,
making the C functions called in the code proportionally faster.

 

 

Another useful tool is RunSnakeRun, which can take the cProfile output
and render it more legible (including showing nested system calls).

 \$ sudo port install wxWidgets-devel \#on Mac

 \$ cd wxPython-src-2.9.0.1/wxPython

 \$ sudo python build-wxpython.py –build\_dir=../bld

 \$ sudo easy\_install wxpython SquareMap RunSnakeRun

 \$ python -m cProfile -s time my\_code.py \> my\_code.profile

 \$ runsnake my\_code.profile

 

 \$ sudo yum install wxPython \#on Fedora Linux

 \$ sudo easy\_install SquareMap RunSnakeRun

        \$ python -m cProfile -s time my\_code.py \> my\_code.profile

 \$ runsnake my\_code.profile

You also need to be aware of the granularity of your system clock.
 Small values (\<10-6 s) are possibly meaningless and so you should use
large numbers of calls instead if you need to know small differences.

 

In Matlab, I have seen worse than 10× slowdown by invoking profiling;
Python seems to give about a 20–30% slowdown in my experience.  In any
case, you won't leave it on when you're not actively profiling so it's
not that big of a deal.

 

Exercises

-   ■Profile the code in the cse-debug/stats directory.  Which function
    is taking up the most time? 

 

Handling Errors at Runtime

Throwing & Catching

This is a surprisingly controversial topic even within Python.  I'll
tell you how it works and then give you my advice.  You can then delve
into others' opinions if you like as well.

 

try:

 readFromFile(inputFile)

 writeToFile(outputFile)

except IOException:

 \# deal with fallout

-   ■Why is this code fragment particularly pernicious? 

 

finally:  A finally block always executes, even if you return before it
would typically be arrived at.

 

Exercises

-   ■Pull up your snippets of code which threw exceptions before.  Try
    to handle each of them appropriately with an except clause.  (In
    other words, your code should overall run without showing a
    traceback.) 

 

Now we've practiced this, but I will counsel you that you should rarely
write your own exception handling.  It's rather a philosophical debate,
but

 

Arguments against exception handling:

-   ■Exception handling lies perilously close to "goto" spaghetti code
    because you aren't required to preserve scope. 

-   ■try/except/else/finally control flow can be hard to follow. 

-   ■Exception handling is slow:  but this isn't appreciably true in
    Python! 

-   ■try/except/else/finally impacts code readability (superfluous
    indentations and breaks). 

-   ■Exceptions should indicate exceptional situations, not normally
    anticipated ones. 

 

Arguments in favor of exception handling:

-   ■Python uses exceptions in regular control flow (for loops use
    StopIteration exception). 

-   ■Exception handling isn't slow in Python. 

-   ■If you are writing a library function to be called repeatedly, some
    robust exception-handling may be called for. 

 

If you decide that it is necessary for you to write exception-handling
code, follow these principles:

-   ■If anything you can do can recover from the error, catch the
    exception and deal with it. 

-   ■If the error is extremely common, return error codes in a tuple
    rather than handling it. 

-   ■If nothing you can do can recover from the error, leave it
    uncatched or try to perform a marginally graceful shutdown of the
    program. 

(Adapted from cwap,
[http://stackoverflow.com/questions/729379/why-not-use-exceptions-as-regular-flow-of-control](http://stackoverflow.com/questions/729379/why-not-use-exceptions-as-regular-flow-of-control))

 

In any case, follow the principle of least astonishment and avoid
bogging down later researchers perusing your code.

 

The Principle of Least Astonishment

The result of performing some operation should be obvious, consistent,
and predictable, based upon the name of the operation and other clues.

 

In any case, you will need to read and follow exception handling code if
you're going to work substantially with any existing libraries or code.

 

————————

This document was created by Neal Davis for Computational Science &
Engineering at the University of Illinois at Urbana–Champaign.  It
incorporates some elements from Software Carpentry, contributed by Greg
Wilson and others; and The Hacker Within, contributed by Katy Huff,
Anthony Scopatz, Joshua R. Smith, and Sri Hari Krishna Narayanan.
