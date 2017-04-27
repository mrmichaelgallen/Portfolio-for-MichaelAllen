### Python - Running Pace Calculator
***

#### Objective
To build a text based running pace calculator where the user enters miles and time to get a desired pace.

#### Steps Taken
My primary focus was making a simple program to get the functionality to work. For distance I converted the user input for distance into a float considering a lot of races have decimals like 26.2 or 13.1 when using miles. 

For the time, I took the time format split the hours, minutes and seconds so that I can get a total number of seconds which I used to divide against the distance. Then I divided that number by 60, rounded, then converted to a string so I could split the minutes and seconds. This allowed me to times the number by 0.6 to get accurate seconds. 

I also did not want to use any modules for this first version to help me improve my Python programming. 

Here is the [Running Pace Calculator](Python_RunningPaceCalculator.py). 

#### The Result
I got it to work accurately giving the user a correct minutes per mile pace. While the first version of this program works, in future versions I need to address possible erroneous user inputs, which I willl use conditional statements and try/excepts to validate. I also want to make enhancements by turning from a text based version to a compiled GUI version as well as giving the option for the user to change it kilometers. 

I am very positive there is a more efficient way to program this pace calculator, so I will be refactoring it in the future.

[Return to portfolio](https://github.com/mrmichaelgallen/Portfolio-for-MichaelAllen/)

