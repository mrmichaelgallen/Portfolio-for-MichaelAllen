#
# 1. Create a database table in RAM named Roster that includes the fields 'Name', 'Species' and 'IQ'
#

import sqlite3

connection=sqlite3.connect("Roster_Database.db")

c = connection.cursor()

c.executescript("CREATE TABLE Roster(Name TEXT, Species TEXT, IQ INT)")


#
# 2. Populate your new table with the following values:
#    1 - Jean-Baptiste Zorg, Human, 122
#    2 - Korben Dallas, Meat Popsiscle, 100
#    3 - Ak'not, Mangalore, -5
#

import sqlite3

rosterVALUES=(
    ('Jean-Baptist', 'Human', '122'),
    ('Korben Dallas','Meat Popsicle','100'),
    ('Ak\'not', 'Mangalore','-5')
)

connection=sqlite3.connect("Roster_Database.db")

c = connection.cursor()

c.executemany("INSERT INTO Roster VALUES(?,?,?)", rosterVALUES)

connection.commit()


#
# 3. Update the Species of Korben Dallas to be Human
#

import sqlite3

connection=sqlite3.connect("Roster_Database.db")

c = connection.cursor()

c.execute("UPDATE Roster SET Species=? WHERE Name=? AND IQ=?",
              ('Human', 'Korben Dallas', '100'))

connection.commit()


#
# 4. Display the names and IQs of everyone in the table who is classified as Human
#

import sqlite3

connection=sqlite3.connect("Roster_Database.db")

c = connection.cursor()

c.execute("SELECT Name, IQ FROM Roster WHERE Species == 'Human'")

for row in c.fetchall():

    print row



