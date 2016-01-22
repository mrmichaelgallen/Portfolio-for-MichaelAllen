### SQL Library Practical
***

#### Objective
I was assigned a final pratical in my SQL course with The Tech Academy to develop a community libary system. The exercise required that I develop a database with an established flow chart showing the database and relationship. 

#### My Solution
My first step was to map out the relationship of the various relationships in the flow-chart. I then created my dataset by looking for the top 100 american literary works. Taking that information I used Google Sheets to sort the data, adding columns to insert commas between each data column. I then used a webapp to remove all the indents and spaces that Google Sheets inserts, which created a clean csv file which I used the command line to import once my database, tables and fields were created.

I then had to build queries using SQL syntax to with inner joins to answer a set of specific questions from the drill. I was also required to create Stored Procedures to make the queries resusable. 

I have uploaded the *.sql file with my work. 

#### The Result
I got all seven queries to work. The one of the lessons I learned from this drill is that you can get a query to work, but you may not get an answer returend if there is no data related to that query. During my development of the dataset, I missed one of the required items that I was supposed to add. The query work, but there was no returns. It was not until after an instructor asked if I had the data in there that I realized the oversight. Once I imported that book into the database, the queried returned as expected. 
