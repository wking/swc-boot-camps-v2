Version Control with Git (Local)

 

Version Control Basics

Motivation

Probably all of us, at one time or another, have adopted a revision
system predicated on slightly altering file names according to dates,
trial features, or meaningless numbers.  In large projects like
dissertations or multi-year research projects, this can become unwieldy
and cryptic surprisingly quickly.

 

I did this quite a bit with compile scripts during my dissertation.  I
had a particularly finicky piece of software that I had to compile on
two machines with a whole host of poorly documented—and in at least one
case undocumented—environment variables and linked libraries, so
whenever the software developers or the system administrators upgraded
anything it felt like I had to use voodoo to get it to work again.

\$ ls compile/

 

Even with my sparse notes it was difficult to trace the path of my
attempts.  And of course with output data or programming scripts the
problem persists:  you want to try a small change in a function, so you
“\$ cp my\_func.py my\_func.py.original” and the whole cycle can begin
anew.

 

Even if you have a more rational filing system than this (and I hope you
do!), how can you ensure that document and data versions are
synchronized across different machines?

 

Alternatively, imagine you have two computers—the first a powerful
desktop with dual monitors, the second a tiny lightweight netbook for
travel. Imagine also that you have a presentation at a conference
overseas. You know that no matter how "finished" you think you are with
your slide deck, inevitably you will realize you need to add an exta
figure or recalculate some data AFTER leaving the country and your main
desktop workstation. How can you be sure your slide deck, data, and the
programs you've written are synchronized between your two machines? How
can you be sure that every little change you've made on your netbook is
reflected on your desktop? What happens if you start making changes on
your slide deck, only to realize you need to drop back to the slide deck
you had five days ago?

 

What version control systems provide is a consistent way to store files
as well as track changes, including the ability to revert to earlier
versions if necessary.  You can—and should!—assign a rationale to each
change and store that as well.

 

Getting Help

 \$ man git \# search /help

 \$ git --help

 

Setup and Signup

Let's go ahead and start with configuring our local Git installations.
 Please open a terminal window in your operating system of choice and
type git at the command prompt.  If this gives you an error, please flag
it so a helper can get you up and running.

 

First we will set up an identity so that Git knows who is doing what
we're going to be doing.

\$ git config --global user.name "User Name"

\$ git config --global user.email "user@email.com"

\$ git config --global core.editor "nano"

\$ git config --global color.ui true

 

These values are written to a global configuration file located at
\~/.gitconfig on many Unix-derived systems.  The core.editor setting
requires a command-line invocation, so you're limited to emacs, vi, and
nano here unless you know how to invoke your favorite GUI editor from
the command line.  (If there are any Windows users here who are
interested in using Notepad++, I can point you at [some
code](http://stackoverflow.com/questions/16451669/so-changed-gits-default-editor-now-how-do-i-invoke-it-from-git-bash)
to set that as the main editor.)

 

Creating a Local Repository

To keep track of numerous versions of your work without saving numerous
copies, you can make a local repository for it on your computer. What
git does is to save the first version, then for each subsequent version
it saves only the changes. That is, git only records the difference
between the new version and the one before it. With this compact
information, git is able to recreate any version on demand by adding the
changes to the original in order up to the version of interest.

 

To create your own local (on your own machine) repository, you must
initialize the repository with the infrastructure git needs in order to
keep a record of things within the repsitory that you're concerned
about. The command to do this is git init .

 

Activity:  Make a local repository

-   ■Initialize your repository: 

    -   ◦\$ cd 

    -   ◦\$ mkdir good\_science 

    -   ◦\$ cd good\_science 

    -   ◦\$ git init 

-   ■Browse the directory's hidden files to see what happened here. Open
    directories, browse file contents. Learn what you can in a
    minute—use your shell knowledge. 

    -   ◦\$ ls -A 

    -   ◦\$ cd .git 

    -   ◦\$ ls -A 

-   ■Use what you've learned. You may have noticed the file called
    description. You can describe your repository by opening the
    description file and replacing the text with a name for the
    repository. Mine will be called "Reproducible Science". You may call
    yours anything you like. 

    -   ◦\$ nano description 

-   ■Applications sometimes create files that are not needed. For
    example, kate creates a temporary file called 'filename\~' when you
    edit the file 'filename'. You can ask git to ignore such files by
    editing the file '.git/info/exclude'. Edit the file to ignore files
    the end with '\~'. 

 

Adding a File To Version Control

For the git repository to know which files within this directory you
would like to keep track of, you must add them. First, you'll need to
create one, then we'll learn the git add command.

 

Activity:  Add a file

-   ■Create a file to add to your repository. 

-   ■Inform Git that you would like to track future changes to this file
    (git add). 

 

Checking the Status of Your Local Copy

The files you've created on your machine are your local "working" copy.
The changes your make in this local copy aren't backed up online
automatically. Until you commit them, the changes you make are local
changes. When you change anything, your set of files becomes different
from the files in the official repository copy. To find out what's
different about them in the terminal, try:

 \$ git status

 

A null result means that you're up to date with the current version of
the repository online. This result indicates that the current difference
between the repository HEAD (which, so far, is empty) and your
good\_science directory is this new readme.rst file.

 

Saving a Snapshot

In order to save a snapshot of the current state (revision) of the
repository, we use the commit command. This command is always associated
with a message describing the changes since the last commit and
indicating their purpose. Informative commit messages will serve you
well someday, so make a habit of never committing changes without at
least a full sentence description.

 

ADVICE: Commit often.  In the same way that it is wise to often save a
document that you are working on, so too is it wise to save numerous
revisions of your code. More frequent commits increase the granularity
of your undo button.

 

ADVICE: Write good commit messages.  There are no hard and fast rules,
but good commits are atomic: they are the smallest change that remain
meaningful. A good commit message usually contains a one-line
description followed by a longer explanation if necessary.

 

Activity:  Commit a change

-   ■Commit the file you've added to your repository. 

-   ■Admire your work. (git status) 

 

Viewing the Differences

Recall the behavior of the diff command on the command line. Choosing
two files that are similar, the command diff file1 file2 will output the
lines that differ between the two files. This information can be saved
as what's known as a patch, but we won't go deeply into that just now.

 

The only difference between the command line diff tool and git's diff
tool is that the git tool is aware of all of the revisions in your
repository, allowing each revision of each file to be treated as a full
file.

 

Thus, git diff will output the changes in your working directory that
are not yet staged for a commit. To see how this works, make a change in
your readme.rst file, but don't yet commit it.

 

\$ git diff

\$ git diff --stat

\$ git diff HEAD -- [path]

\$ git diff –cached \# what is staged for the next commit

 

Viewing the History

A log of the commit messages is kept by the repository and can be
reviewed with the log command.

\$ git log

 

Unstaging a staged file

\$ git reset filename \# opposite of 'git add filename'

 

Discarding unstaged modifications

\$ git checkout -- filename    

 

Removing a file

\$ git rm filename \# remove a file from the repository

 

Moving a file

\$ git mv filename \# needed to move a file or else Git loses track of
it

 

Activity

-   ■Create 5 files in your directory with one line of content in each
    file. 

-   ■Commit the files to the repository. 

-   ■Change 2 of the 5 files and commit them. 

-   ■Undo the changes in the last step. 

-   ■Print out the last entry in the log. 

     

    Listing, Creating, and Deleting Branches 

Branches are parallel instances of a repository that can be edited and
version controlled in parallel. They are useful for pursuing various
implementations experimentally or maintaining a stable core while
developing separate sections of a code base.

 

Without an argument, the branch command lists the branches that exist in
your repository.

 \$ git branch

The master branch is created when the repository is initialized. With an
argument, the branch command creates a new branch with the given name.

 

\$ git branch experimental

\$ git branch

 

To delete a branch, use the -d flag.

\$ git branch -d experimental

\$ git branch

 

Switching Between Branches, Abandoning Local Changes

The git checkout command allows context switching between branches as
well as abandoning local changes.

 

To switch between branches, try

 \$ git branch newbranch

 \$ git checkout newbranch

 \$ git branch

How can you tell we've switched between branches? When we used the
branch command before there was an asterisk next to the master branch.
That's because the asterisk indicates which branch you're currently in.

 

Merging Branches

At some point, the experimental branch may be ready to become part of
the core or two testing branches may be ready to be combined for further
integration testing. The method for combining the changes in two
parallel branches is the merge command.

Activity:  Create and merge a branch

-   ■Create two new branches and list them. 

    -   ◦\$ git branch first 

    -   ◦\$ git branch second 

-   ■Make changes in each new branch and commit them. 

    -   ◦\$ git checkout first 

    -   ◦\$ touch firstnewfile 

    -   ◦\$ git add firstnewfile 

    -   ◦\$ git commit -am "Added firstnewfile to the first branch." 

    -   ◦\$ git checkout second 

    -   ◦\$ touch secondnewfile 

    -   ◦\$ git add secondnewfile 

    -   ◦\$ git commit -am "Added secondnewfile to the second branch." 

 

-   ■Merge the two branches into the core. 

    -   ◦\$ git checkout first 

    -   ◦\$ git merge second 

    -   ◦\$ git checkout master 

    -   ◦\$ git merge first 

 

Copying a Repository

Yesterday, you checked out a git type repository for this boot camp.

 

When you clone the Original repository, the one that is created on your
local machine is a copy, and will behave as a fully fledged local
repository locally. However, with the right configuration, it will be
able to pull changes from collaborators to your local machine and push
your changes to the Original repository. We'll get to that soon, but for
now, let's fork the repository from GitHub.

 

Activity:  Clone a repository from GitHub

-   ■Pick any repository you like. There are many cool projects hosted
    on github. Take a few minutes here, and pick a piece of code. (5
    minutes) 

-   ■Clone it. If you didn't find anything cool, you can chose the
    "instructional" Spoon-Knife repository: 

    -   ◦\$ git clone git@github.com/octocat/Spoon-Knife.git 

-   ■You should see many files download themselves onto your machine.
    Let's make sure it worked. Change directories to the source code and
    list the contents. 

    -   ◦\$ cd Spoon-Knife 

    -   ◦\$ ls  

 

Pulling Updates from the Original Repository

Updating your repository is like voting. You should update early and
often especially if you intend to contribute back to the upstream
repository and particularly before you make or commit any changes. This
will ensure you're working with the most up-to-date version of the
repository. Updating won't overwrite any changes you've made locally
without asking, so don't get nervous. When in doubt, update.

\$ git pull

 

Since we just pulled the repository down, we will be up to date unless
there has been a commit by someone else to the Original repository in
the meantime.
