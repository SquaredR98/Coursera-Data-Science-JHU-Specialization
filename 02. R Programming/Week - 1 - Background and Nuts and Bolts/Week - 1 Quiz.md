# Week - 1 Quiz

**Question 1**

R was developed by statisticians working at

- [ ] Johns Hopkins University
- [x] The University of Auckland
- [ ] Harvard University
- [ ] Microsoft

**Question 2**

The definition of free software consists of four freedoms (freedoms 0 through 3). Which of the following is NOT one of the freedoms that are part of the definition? Select all that apply.

- [ ] The freedom to improve the program, and release your improvements to the public, so that the whole community benefits. 
- [x] The freedom to restrict access to the source code for the software. 
- [x] The freedom to prevent users from using the software for undesirable purposes. 
- [x] The freedom to sell the software for any price. 
- [ ] The freedom to study how the program works, and adapt it to your needs. 
- [ ] The freedom to run the program, for any purpose. 
- [ ] The freedom to redistribute copies so you can help your neighbor.

**Question 3**

In R the following are all atomic data types EXCEPT: (Select all that apply)

- [ ] numeric			 
- [x] list
- [ ] character
- [ ] complex
- [x] data frame
- [ ] integer
- [ ] table
- [x] array
- [x] matrix
- [x] logical		

**Question 4**

If I execute the expression `x <- 4` in R, what is the class of the object `x` as determined by the `class()` function?

- [ ] integer
- [ ] character
- [ ] mixed
- [x] numeric
- [ ] logical

**Question 5**

What is the class of the object defined by the expression `x <- c(4, "a", TRUE)`?

- [ ] integer
- [x] character
- [ ] mixed
- [ ] numeric
- [ ] logical

**Question 6**

If I have two vectors `x <- c(1,3, 5)` and `y <- c(3, 2, 10)`, what is produced by the expression `cbind(x, y)`?

- [x] a matrix with 2 columns and 3 rows
- [ ] a 2 by 2 matrix
- [ ] a 2by 3 matrix
- [ ] a vector of length 2
- [ ] a vector of length 3
- [ ] a 3 by 3 matrix 

**Question 7**

A key property of vectors in R is that

- [ ] a vector cannot have attributes like dimensions
- [x] elements of a vector all must of the same class
- [ ] the length of the vector must be less than 32, 768
- [ ] elements of a vector can be of different classes
- [ ] elements of vector can only be character or numeric

**Question 8**

Suppose I have a list defined as `x <- list(2, "a", "b", TRUE)`. What does `x[[1]]` give me? Select all that apply.

- [ ] a list containing the number 2
- [ ] a list containing the numeric vector of length 1
- [ ] a character vector containing the the element "2"
- [x] a numeric vector containing the element 2.
- [ ] a numeric vector of length 1

**Question 9**

Suppose I have a vector `x <- 1:4` and a vector `y <- 2`. What is produced by the expression `x + y`?

- [ ] an integer vector with elements 3, 2, 3, 4.
- [ ] an integer vector with elements 3, 2, 3, 6.
- [ ] a numeric vector with elements 3, 2, 3, 6.
- [ ] a numeric vector with elements 3, 4, 5, 6.
- [ ] a numeric vector with elements 3, 2, 3, 4.
- [ ] a numeric vector with elements 1, 2, 3, 6.

**Question 10**

Suppose I have a vector `x <- c(3, 5, 1, 10, 12, 6)` and I want to set all elements of this vector that are less than 6 to be equal to zero. What R code achieves this? Select all that apply.

- [x] x[x < 6] <- 0
- [ ] x[x > 6] <- 0
- [ ] x[x < 6] == 0
- [ ] x[x > 0] <- 6
- [x] x[x <= 5] <- 0
- [ ] x[x == 0] <- 6
- [x] x[x %in% 1:5] <- 0
- [ ] x[x == 6] <- 0
- [ ] x[x == 0] < 6
- [ ] x[x != 6] <- 0
- [ ] x[x >= 6] <- 0

**Question 11**

Use the [Week 1 Quiz Data Set](https://d396qusza40orc.cloudfront.net/rprog/data/quiz1_data.zip) to answer questions 11-20.

In the dataset provided for this Quiz, what are the column names of the dataset?

- [ ] Month, Day, Temp, Wind
- [ ] 1, 2, 3, 4, 5, 6
- [ ] Ozone, Solar.R, Wind
- [x] Ozone, Solar.R, Wind, Temp, Month, Day

**Question 12**

Extract the first 2 rows of the data frame and print them to the console. What does the output look like?

- [x] ```python
    Ozone Solar.R Wind Temp Month Day
  1    41     190  7.4   67     5   1
  2    36     118  8.0   72     5   2
  ```

- [ ] ```python
    Ozone Solar.R Wind Temp Month Day
  1    18     224 13.8   67     9  17
  2    NA     258  9.7   81     7  22
  ```

- [ ] ```python
    Ozone Solar.R Wind Temp Month Day
  1    18     224 13.8   67     9  17
  2    NA     258  9.7   81     7  22
  ```

- [ ] ```python
    Ozone Solar.R Wind Temp Month Day
  1     7      NA  6.9   74     5  11
  2    35     274 10.3   82     7  17
  ```

**Question 13**

How many observations (i.e. rows) are in this data frame?

- [x] 153
- [ ] 160
- [ ] 45
- [ ] 129

**Question 14**

Extract the **last** 2 rows of the data frame and print them to the console. What does the output look like?

- [ ] ```python
      Ozone Solar.R Wind Temp Month Day
  152    31     244 10.9   78     8  19
  153    29     127  9.7   82     6   7
  ```

- [ ] ```python
  	Ozone Solar.R Wind Temp Month Day
  152    11      44  9.7   62     5  20
  153   108     223  8.0   85     7  25
  ```

- [ ] ```python
  	Ozone Solar.R Wind Temp Month Day
  152    11      44  9.7   62     5  20
  153   108     223  8.0   85     7  25
  ```

- [ ] ```python
  	Ozone Solar.R Wind Temp Month Day
  152    11      44  9.7   62     5  20
  153   108     223  8.0   85     7  25
  ```

**Question 15**

What is the value of Ozone in the 47th row?

- [ ] 18
- [x] 21 
- [ ] 34 
- [ ] 63

**Question 16**

How many missing values are in the Ozone column of this data frame?

- [ ] 78
- [x] 37
- [ ] 43
- [ ] 9

**Question 17**

What is the mean of the Ozone column in this dataset? Exclude missing values (coded as NA) from this calculation.

- [ ] 53.2
- [x] 42.1
- [ ] 31.5
- [ ] 18.0

**Question 18**

Extract the subset of rows of the data frame where Ozone values are above 31 and Temp values are above 90. What is the mean of Solar.R in this subset?

- [ ] 185.9
- [ ] 205.0
- [ ] 334.0
- [x] 212.8

Question 19

What is the mean of "Temp" when "Month" is equal to 6?

- [ ] 90.2
- [x] 79.1
- [ ] 75.3
- [ ] 85.6

**Question 20**

What was the maximum ozone value in the month of May (i.e. Month is equal to 5)?

- [x] 115
- [ ] 97
- [ ] 18
- [ ] 100