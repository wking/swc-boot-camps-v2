Version Control with Git (Remote)

 

The online hosting which we will use today is GitHub (which is not the
only place you can use Git).  Let's tour [GitHub](https://github.com/)
now and see what's there; we'll then have each of you create GitHub
accounts.

 

Now let's go ahead and make and clone a new demonstration repository.

 

-   ■Make a new demo repo on GitHub explaining the process as you go
    (probably on your personal account). 

-   ■Have GitHub put in a README so it can be cloned. 

-   ■\$ git clone URL 

-   ■Explain that much like a browser navigates to websites using a URL,
    Git talks to remote repositories using a URL. 

-   ■Explain the different URL options: 

    -   ◦Read/write ssh protocol requires ssh keys, which make it so you
        don't have to enter username/password. 

    -   ◦https protocol takes username/password. 

    -   ◦git protocol is read-only. 

-   ■Now we want to get a copy of this down on all of our computers—git
    clone in an appropriate directory. 

-   ■Have everyone do this via the https URL. 

-   ■ls to show the new directory and cd into it. 

-   ■Compare the local listing to what you see on GitHub. Same for now,
    but not for long! 

 

 

Basics

Conceptually, Git divides your work into three areas.  First, the
working area consists of the files as you actually modify and compose.
 Secondly, the staging area consists of the elements of the next
snapshot—the files as they will be stored permanently.  Finally, the
history consists of all snapshots, like a photo album; each snapshot can
be uniquely identified with a time stamp and a log message.

 

When you actually work inside of a document, you are not concerned about
Git.  Do your work normally, and then exit to the command line.  At this
point, you need to move your work from the working area to the staging
area in logical groups.

 

\$ git add file1.txt file2.log

\$ git commit

You now need to use the text editor you chose previously to record the
rationale for this commit.  (Incidentally, this allows you to group
logical changes by commit rather than updating everything at once, and
this is good form.)

 

Figure 1.  These conceptual divisions of your labor into areas
(unrelated to logical directory structure) form the Git commit model.
 The Git commit model allows you to record changes to your project by
both topic and time, yielding a complete history of updates and
revisions.

 

Let's see how moving things around affects the status of the files:

-   ■\$ nano top-things-to-learn.md \# put title “Top Things We Want to
    Learn” 

-   ■\$ git status \# see untracked file 

-   ■\$ git add top-things-to-learn.md 

-   ■\$ git status \# see tracked but uncommitted file 

-   ■\$ git commit \# add log message 

-   ■\$ git status \# nothing to see here folks 

-   ■\$ git log 

-   ■\$ git log --oneline \# explain commit hash 

 

 

Now we'll add some things and demonstrate git diff:

-   ■\$ nano top-things-to-learn.md \# add list of names 

-   ■\$ git status 

-   ■\$ git diff 

-   ■\$ git add top-things-to-learn.md 

-   ■\$ git diff 

-   ■\$ git commit -m “short commit message” 

 

Now we'll reverse that local commit:

-   ■\$ git log --oneline 

-   ■\$ git reset --soft HEAD\~1 

-   ■\$ git log --oneline 

-   ■\$ git status 

-   ■\$ git commit 

If we had done the same thing but had already committed to the remote
repository, we have to force an overwrite:

-   ■\$ git push --force origin master 

 

Sharing

Figure 2.  The basic movement commands in Git allow one to logically
move existing remote commits to the local working area.

 

 

How many of you work in research groups which mix operating systems in
the workflow?  If you include a Windows system, the way that newlines
are recorded in plain text are different from a Unix derivative.
 Specifically, you will want to set Git to automatically convert your
files to and from the Unix format when they are committed.

\$ git config --global core.autocrlf true   \# for Windows

\$ git config --global core.autocrlf input  \# for Linux

There are also other fancy settings for specific troubles with
whitespace if that becomes a problem in updating, so look into
core.whitespace if that becomes an issue for your group.

[http://git-scm.com/book/en/Customizing-Git-Git-Configuration](http://git-scm.com/book/en/Customizing-Git-Git-Configuration)

 

-   ■\$ git remote 

-   ■\$ git remote --verbose 

 

Branching

Look at GitHub—it has one branch called “master”.  Branches allow
independent development environments (to discuss later).  The local
branch is found as:

-   ■\$ git branch 

 

When Git communicates with a remote repository, it needs to know which
branch is changing.  In this case, we'll just stick with “master”.

 

Pushing & Pulling

The push command sends data (the commits and associated files) to a
remote repository.  We must specify the remote name and the branch name.
 What are those?

-   ■\$ git push origin master 

Pull is the reciprocal command to update your local copy with the remote
data.

-   ■\$ git pull origin master 

(If this didn't work because students had commits, have them use git
reset –hard.)

 

Collaborating

-   ■Pick a student to add their top thing to learn to the list: 

-   ■Add them to the collaborator list on the demo repo. 

-   ■Edit, save, add, commit, push 

-   ■Have everyone pull. 

 

Rebasing with No Conflicts

-   ■Have another student add their thing and push. 

-   ■Make a change to the README file before pulling. 

-   ■Try to push. 

-   ■On the white board draw the situation: my repo and the remote repo
    have different development histories and Git doesn't know how to
    pull things together. 

-   ■It would be nice if I could move my local change after the remote
    change. (Draw picture.) There's a command for that! 

    -   ◦\$ git fetch origin \# get information from remote repo but
        don't integrate it locally like pull 

    -   ◦\$ git rebase origin/master \# origin/master is how we specify
        the fetched data 

-   ■This replays my local changes on top of the state of the remote
    repo. 

    -   ◦\$ git log --oneline \# now my change is after the remote
        change. 

    -   ◦\$ git push origin master 

-   ■Have everyone pull. 

 

 

Rebasing with Conflicts

-   ■Again, have a student add his or her things and push. 

-   ■Before pulling make a change in the same place in the same file. 

-   ■Try to rebase as above. 

-   ■Explain the conflict message Git prints out (“Automatic merge
    failed; fix conflicts and then commit the result.”). 

-   ■Show the conflict messages in the file (“git diff”; “git status”)
    and how to clean it up (inside of the file). 

-   ■Continue the rebase and push the result. 

-   ■Have everyone pull. 

 

Version Control Basics

Developing in branches

Often you want to leave a stable version of your code alone while you
make some potentially disruptive changes. Or you and someone else are
working on the code and you want to be able to work without worrying
what others are doing.

 

Activity

-   ■It's going to take a long time to get everyone's top thing to learn
    onto the list one at a time, so the room is going to break out into
    groups and each come up with their own list. 

-   ■So that they can all do this and then push their result to GitHub,
    each group is going to work in their own, isolated branch. 

 

Making a New Branch

Note: The [Learn Git Branching
app](http://pcottle.github.io/learnGitBranching/?NODEMO) can be a useful
way to illustrate this part of the lesson.

-   ■\$ git branch 

-   ■\$ git branch group1 \# make a new branch 

-   ■\$ git checkout group1 \# switch to it 

-   ■\$ git branch 

-   ■Make a change and push it (specify new branch name in push
    command). 

-   ■\$ git checkout master 

-   ■Show how to browse different branches on GitHub. 

-   ■Have each group select a unique branch name, switch to it, and add
    their things to the list. Then push the results. 

 

Resolving the Changes

-   ■Browse all of the new branches on GitHub. 

-   ■Illustrate the situation on the Learn Git Branching app. 

-   ■\$ git checkout master 

-   ■\$ git fetch origin \# grab all new branches 

-   ■Pick a branch, then git merge branch-name.  (This should be
    smooth.) 

-   ■Illustrate the situation on the Learn Git Branching app. 

-   ■Pick the next branch and git merge branch-name-2.  Resolve
    conflicts, add, and commit, then merge again. 

-   ■Illustrate the situation on the Learn Git Branching app. 

-   ■Repeat as necessary, then push the final result to GitHub. 

 

Pull Requests

If you are collaborating on different branches of a project, from time
to time you will need to signal each other that there are sections of
code or data which need to be consolidated back into the “master”
version.  This is accomplished via a pull request, which messages to the
lead researcher that you have a branch with significant contributions to
merge back in.

 

Typically you fork or branch the repository.  You go to GitHub.com and
navigate to the repository with changes (make sure you've pushed your
local changes).  Switch to your branch and click “Compare & review”.
 Review the information and then submit it with a comment to start the
discussion.

 

And we eat our own dog food:  this is how we developed and coördinated
the materials for this boot camp.

 

Miscellanea

 \$ git commit --amend

 \$ git mv/rm/cp \#reminder

 

Next Actions

If you have existing data and you wish to create a repository for it
using Git, follow these steps:

-   ■Consolidate your files into your preferred directory strucure (if
    not already). 

-   ■\$ cd \~/projects/research\_dir 

-   ■\$ git init 

-   ■\$ git add . 

 

Licensing Content

Now SWC waxes evangelical:  the opposite of “open” isn't closed, it's
“broken”.  The free availability of data sets on which published
research is based accelerates discovery and dissemination.  See if the
following sounds familiar:

 

-   ■A scientist collects some data and stores it on a machine that is
    occasionally backed up by her department. 

-   ■She then writes or modifies a few small programs (which also reside
    on her machine) to analyze that data. 

-   ■Once she has some results, she writes them up and submits her
    paper. She might include her data---a growing number of journals
    require this---but she probably doesn't include her code. 

-   ■Time passes. 

-   ■The journal sends her reviews written anonymously by a handful of
    other people in her field. She revises her paper to satisfy them,
    during which time she might also modify the scripts she wrote
    earlier, and resubmits. 

-   ■More time passes. 

-   ■The paper is eventually published. It might include a link to an
    online copy of her data, but the paper itself will be behind a
    paywall: only people who have personal or institutional access will
    be able to read it. 

 

For a growing number of scientists, though, the process looks like this:

-   ■The data that the scientist collects is stored in an open access
    repository like figshare or Dryad as soon as it's collected, and
    given its own DOI. 

-   ■The scientist creates a new repository on GitHub to hold her work. 

-   ■As she does her analysis, she pushes changes to her scripts (and
    possibly some output files) to that repository. She also uses the
    repository for her paper; that repository is then the hub for
    collaboration with her colleagues. 

-   ■When she's happy with the state of her paper, she posts a version
    to arXiv or some other preprint server to invite feedback from
    peers. 

-   ■Based on that feedback, she may post several revisions before
    finally submitting her paper to a journal. 

-   ■The published paper includes links to her preprint and to her code
    and data repositories, which makes it much easier for other
    scientists to use her work as starting point for their own
    research. 

 

Studies have shown that the more open model accelerates discovery, and
that more open work is more widely cited. However, people who want to
work this way need to make some decisions about what exactly "open"
means in practice.

 

Licensing

There are several kinds of license for software and publications.
 Basically, these allow you to share your code or data or publications
with the source, but with certain responsibilities laid upon the
distributor to continue to pass along that source under a similar
sharing agreement.

(talk about GPL, CC, Public Domain, etc. if time)

 

You should include a LICENSE file in the root directory of your project,
as well as a CITATION file with preferred citation data.

 

Hosting

Hosting is another major concern:  we want data to be trackable and
accessible for years if not decades.  One option is for the lab, the
department, or the university to provide a server, manage accounts and
backups, and so on. The main benefit of this is that it clarifies who
owns what, which is particularly important if any of the material is
sensitive (i.e., relates to experiments involving human subjects or may
be used in a patent application). The main drawbacks are the cost of
providing the service and its longevity: a scientist who has spent ten
years collecting data would like to be sure that data will still be
available ten years from now, but that's well beyond the lifespan of
most of the grants that fund academic infrastructure.

 

The alternative is to use a public hosting service like GitHub,
BitBucket, Google Code, or SourceForge. All of these allow people to
create repositories through a web interface, and also provide mailing
lists, ways to keep track of who's doing what, and so on. They all
benefit from economies of scale and network effects: it's easier to run
one large service well than to run many smaller services to the same
standard, and it's also easier for people to collaborate if they're
using the same service, not least because it gives them fewer passwords
to remember.

 

However, all of these services place some constraints on people's work.
In particular, they give users a choice: if they're willing to share
their work with others, it will be hosted for free, but if they want
privacy, they have to pay. Sharing might seem like the only valid choice
for science, but many institutions may not allow researchers to do this,
either because they want to protect future patent applications or simply
because what's new is often also frightening.

 

Ownership

Who actually owns your work?  Do you have the right to distribute it
freely or as open source?  Most of the time it seems that researchers
operate under the dictum that it is easier to get forgiveness than
permission, but it pays to enquire with the university's intellectual
property office.
