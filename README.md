# Movie or Book?
![Sauron](Images/Sauron.jpg)


## Introduction.
---
I have allways been a huge fan of both movies and books, and have allways wondered what's better, the author version of a story or the directors view of it.

It's a very polemic topic as many people defend that book versions are allways the better representation with little to no exceptions.

## Why?
---
 * Im currently attending the [Data Analitics](https://www.ironhack.com/en) bootcamp at IronHack  Madrid and this is my first project there.

 * I love reading books as well as seeing movies, so i thought this would be a great idea to start my programing career.

## How?
---
* Im going to start with a base dataset that contains the top 1000 movies at imdb, ill clean it and use everything that might be interesting for this analysis

* Ill use aswell Seleneum as my web scraping tool to get all of the books that these movies might come from.

## Methodology.
---
* I picked a dataset from kaggle that was pretty complete and didn't need too much cleaning, so i could dedicate more time to my book scraping.

* The website that i used Seleneum on to scrap is called Goodreads, its a huge social media book website with lots of information about any book you could imagine, most likely if the book exists it's on Goodreads.

* I needed a few functions to clean the movies dataset and aswell to run my seleneum so i decided to use a data pipeline to keep the code cleaner and clearer, its called [Resources.py](https://github.com/Slivered/Proyecto_ETL/blob/main/rsc/Resources.py) inside rsc folder.

* After i prepared all of this data i used it to make a few graphs to represent the questions i had and i made my conclusions based on them.

## Conclusions.
---
* In one of my graphs i wanted to know if the top movies of imdb that are adaptations of books are better ranked than the books themselves, and to my surprise it was actualy true, most of these movies are better ranked than their counterpart books.

![Top_Movies](Images/Top_Movies.png)

* Another question that needed answer is: What is the genre that sees more adaptations to the big screen?, i thought it would be action movies, or maybie terror but to my surprise it was actually Drama, and not just Drama, but all of it's versions as it's the most popular genre by far.

* And what about popularity? Are movies more popular than books? or the original version is actually the more poppular version?.
Well, the answer is simple, movies are more popular than books, maybe  becouse it's easyer to watch a 2h movie than to read a 20h book or maybe there are other reasons that influence the popularity of these books and movies, but that's an analysis for another day.

* Lastly maybe the biggest question of them all: What has the best average rating? is it the movie adaptation? or is it actually the original books?. To see the answer of this question and more i invite you to see my [conclusion.me](https://github.com/Slivered/Proyecto_ETL/blob/main/Conclusions/Conclusions.md) notebook that has all the of the answers.
[pandas](https://pandas.pydata.org/docs/)