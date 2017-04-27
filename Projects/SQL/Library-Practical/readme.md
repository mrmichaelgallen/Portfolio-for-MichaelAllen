### SQL Library Practical
***

#### Objective
I was assigned a final practical in my SQL course with The Tech Academy to develop a community libary system. The exercise required that I develop a database with an established flow chart showing the database and relationship. 

#### Steps Taken
My first step was to map out the relationship of the various relationships in the flow-chart. I then created my dataset by looking for the top 100 american literary works. Taking that information I used Google Sheets to sort the data, adding columns to insert commas between each data column. I then used a webapp to remove all the indents and spaces that Google Sheets inserts, which created a clean csv file which I used the command line to import once my database, tables and fields were created.

I then had to build queries using SQL syntax to with inner joins to answer a set of specific questions from the drill. I was also required to create Stored Procedures to make the queries resusable. 

I have uploaded the [sql file](SQLQuery_OregonLibraryTest.sql) with my work. 

#### The Result
I got all seven queries to work. One of the lessons I learned from this drill is that you can get a query to work, but you may not get an answer returned if there is no data related to that query. During my development of the dataset, I missed one of the required items that I was supposed to add. The query worked, but there was no returns. It was not until after an instructor asked if I had the data in there that I realized the oversight. Once I imported that book into the library database, the queried returned as expected. It was a powerful lesson that one can write working code, but that doesn't mean you will get the expected outcome. I learned that I would have to look an issue with my code form many angles.  

[Return to portfolio](https://github.com/mrmichaelgallen/Portfolio-for-MichaelAllen/)
