---
layout: lesson
root: ../..
github_username: jdblischak
bootcamp_slug: 2013-10-17-uic
Title: Data processing example
---

# Title: A bit more shell

## Download and open lesson material:

Open your terminal or Gitbash, and enter  

	cd                    # changes to your home directory
	curl http://giladlab.uchicago.edu/data/Metahit_index.txt > Metahit_index.txt

## What's going on?

The curl command sends an HTTP request and dumps the result to standard out.  Here, we redirect the output of curl to `Metahit_index.txt`

## Sanity check
The above command *should* have downloaded a data table.  Let's check that the data are in the expected format--tab-delimeted text.
	head Metahit_index.txt
	4475667.3	MH0001	Denmark	female	49	25.55	N	20203603	human-associated habitat
	4475668.3	MH0002	Denmark	female	59	27.28	N	20203603	human-associated habitat
	...
If this is what you see, you have the right table.  If not, you may need to troubleshoot why curl didn't give you what you were expecting.

## Let's move and copy the data:
Let's move the data into the repo directory. This is what we would do if it were really our project: we'd have a folder named "Future Nature Paper" and place our data in it, rather than clogging up our home directory. The command `mv` moves the data:

	mv Metahit_index.txt ~/{{page.bootcamp_slug}}
	
Move the other three python scripts we downloaded to the same directory.
	
Another thing `mv` can do is change the name of a file. For instance, if you wanted to rename your data you could type:

	mv Metahit_index.txt IMPORTANT_Metahit_index.txt
	
This is clearly very important data. Let's make a back up of the data so that while we're making python scripts and running them we don't accidentally destroy the data.

	cp IMPORTANT_Metahit_index.txt Metahit_index.txt
	
While we are working through python examples in a bit, if you happen to damage your file, now you have a back up you can revert to. 

## Let's explore the data:

	less Metahit_index.txt
		
You'll see the data has several columns: 
1. identifier 
2. another identifier 
3. country of origin
4. sex
5. age
6. BMI
7. disease status
8. PMID of the Metahit paper
9. sampling location

Let's look at the bottom of the file using `tail`:
	
	tail Metahit_index.txt

How many individuals are in this study?

	wc -l Metahit_index.txt

## Grep

One very cool function that you can run in the shell is `grep`. `grep` is a search tool, which will search for words you enter line by line. For instance, in our data we have Danish individuals and Spanish individuals. If we want to see the data for just the Spanish individuals we can type:

	grep Spain Metahit_index.txt
	
If we wanted to see only females:

	grep female Metahit_index.txt
	
What happens if we want to see only males?

	
## Piping

We didn't properly get to explore piping yesterday. Let's explore piping to get preliminary summary statistics on this data. Piping is essentially chaining together commands one after the other in your computer and you will get as output only the very final data coming out of the last command. So, we can use the pipe, grep, and word count command to do some interesting things:

How many women were in the study?

	grep female Metahit_index.txt | wc -l
	
* * * *
**Short Exercise**

	
1. Find how many Spanish people were in the study.

2. Pull out all of the information for only the first five people that did not have a disease in the dataset and save it to a file in your home directory called 5_spanish_participants.txt. 
	

* * * * 
