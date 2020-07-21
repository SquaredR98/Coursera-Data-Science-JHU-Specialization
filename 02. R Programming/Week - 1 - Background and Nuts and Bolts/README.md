# R Background and Nuts and Bolts

#### Course - 2 of Data Science Specialization on Coursera by Johns Hopkins University

## Overview and History of R

* **R** = dialect of the **S** language
  * S was developed by John Chambers @ Bell Labs
  * initiated in 1976 as internal tool, originally FORTRAN libraries
  * 1988 rewritten in C (version 3 of language)
  * 1998 version 4 (what we use today)
* **History of S**
  * In 1993 Bell Labs gave StatSci (now Insightful Corp.) an exclusive license to develop and sell the S language.
  * In 2004 Insightful purchased the S language from Lucent for $2 million and is the current owner.
  * In 2006, Alcatel purchased Lucent Technologies and is now called Alcatel-Lucent.
  * Insightful sells its implementation of the S language under the product name S-PLUS and has built a number of fancy features (GUIs, mostly) on top of it—hence the “PLUS”.
  * In 2008 Insightful is acquired by TIBCO for $25 million
  * The fundamentals of the S language itself has not changed dramatically since 1998.
  * In 1998, S won the Association for Computing Machinery’s Software System Award.
* **History of R**
  * 1991: Created in New Zealand by Ross Ihaka and Robert Gentleman. Their experience developing R is documented in a 1996 *JCGS* paper.
  * 1993: First announcement of R to the public.
  * 1995: Martin Mächler convinces Ross and Robert to use the GNU General Public License to make R free software.
  * 1996: A public mailing list is created (R-help and R-devel)
  * 1997: The R Core Group is formed (containing some people associated with S-PLUS). The core group controls the source code for R.
  * 2000: R version 1.0.0 is released.
  * 2013: R version 3.0.2 is released on December 2013.
* **R Features**
  * Syntax similar to S, semantics similar to S, runs on any platforms, frequent releasees
  * lean software, functionalities in modular packages, sophisticated graphics capabilities
  * useful for interactive work, powerful programming language
  * active user community and ***FREE*** (4 freedoms)
    * freedom to run the program
    * freedom to study how the program works and adapt it
    * freedom to redistribute copies
    * freedom to improve the program
* **R Drawbacks**
  * 40 year-old technology
  * little built-in support for dynamic/3D graphics
  * functionality based on consumer demand
  * objects generally stored in physical memory (limited by hardware)
* **Design of the R system**
  * 2 conceptual parts: base R from CRAN vs. everything else
  * functionality divided into different packages
    * **base R** contains core functionality and fundamental functions
    * other utility packages included in the base install: `util`, `stats`, `datasets`, ...
    * Recommended packages: `bootclass`, `KernSmooth`, etc
  * 5000+ packages available


## Workspace and Files

* `getwd()` = return current working directory
* `setwd()` = set current working directory
* `?function` = brings up help for that function
* `dir.create("path/foldername", recursive = TRUE)` = create directories/subdirectories
* `unlink(directory, recursive = TRUE)` = delete directory and subdirectories
* `ls()` = list all objects in the local workspace
* `list.files(recursive = TRUE)` = list all, including subdirectories
* `args(function)` = returns arguments for the function
* `file.create("name")` = create file
  * `.exists("name")` = return true/false exists in working directory
  * `.info("name")` = return file info
  * `.info("name")$property` = returns value for the specific attribute
  * `.rename("name1", "name2")` = rename file
  * `.copy("name1", "name2")` = copy file
  * `.path("name1")` = return path of file


## R Console and Evaluation

* `<-` = assignment operator

* `#` = comment

* expression is evaluated after hitting `enter` and result is returned

* autoprinting occurs when you call a variable

  * `print(x)` = explicitly printing

* The output looks like:

  ```R
  [1] 1 2 3 4 5
  ```

  `[1]` at the beginning of the output = which element of the vector is being shown

## R Objects and Data Structures

* 5 basic/**atomic classes** of objects:
  1. character
  2. numeric
  3. integer
  4. complex
  5. logical
* **Numbers**
  * numbers generally treated as `numeric` objects (double precision real numbers - decimals)
  * Integer objects can be created by adding `L` to the end of a number(ex. `1L`)
  * `Inf` = infinity, can be used in calculations
  * `NaN` = not a number/undefined
  * `sqrt(value)` = square root of value
* **Variables**
  * `variable <- value` = assignment of a value to a variable name

### Vectors and Lists

* **atomic vector** = contains one data type, most basic object

  * `vector <- c(value1, value2, ...)` = creates a vector with specified values
  * `vector1*vector2` = element by element multiplication (rather than matrix multiplication)
    * if the vectors are of different lengths, shorter vector will be recycled until the longer runs out
    * computation on vectors/between vectors (`+`, `-`, `==`, `/`, etc.) are done element by element by default
    * `%*%` = force matrix multiplication between vectors/matrices
  * `vector("class", n)` = creates empty vector of length n and specified class
    - `vector("numeric", 3)` = creates 0 0 0

* `c()` = concatenate

  * `T, F` = shorthand for `TRUE` and `FALSE`
  * `1+0i` = complex numbers

* **explicit coercion**

  * `as.numeric(x)`, `as.logical(x)`, `as.character(x)`, `as.complex(x)` = convert object from one class to another
  * nonsensible coercion will result in NA (ex. `as.numeric(c("a", "b")`)
  * `as.list(data.frame)` = converts a `data.frame` object into a `list` object
  * `as.character(list)` = converts list into a character vector

* **implicit coercion**

  * matrix/vector can only contain one data type, so when attempting to create matrix/vector with different classes, forced coercion occurs to make every element to same class

    * *least common denominator* is the approach used (basically everything is converted to a class that all values can take, numbers $\rightarrow$ characters) and *no errors generated*
    * coercion occurs to make every element to same class (implicit)

    - `x <- c(NA, 2, "D")` will create a vector of character class

* `list()` = special vector wit different classes of elements

  - `list` = vector of objects of different classes

  * elements of list use `[[]]`, elements of other vectors use `[]`

* **logical vectors** = contain values `TRUE`, `FALSE`, and `NA`, values are generated as result of logical conditions comparing two objects/values

* `paste(characterVector, collapse = " ")` = join together elements of the vector and separating with the `collapse` parameter

* `paste(vec1, vec2, sep = " ")` = join together different vectors and separating with the `sep` parameter

  * ***Note**: vector recycling applies here too *
  * `LETTERS`, `letters`= predefined vectors for all 26 upper and lower letters

* `unique(values)` = returns vector with all duplicates removed

### Matrices and Data Frames

* `matrix` can contain **only 1** type of data
* `data.frame` can contain **multiple**
* `matrix(values, nrow = n, ncol = m)` = creates a n by m matrix
  * constructed **COLUMN WISE** $\rightarrow$ the elements are placed into the matrix from top to bottom for each column, and by column from left to right
  * matrices can also be created by adding the dimension attribute to vector
    * `dim(m) <- c(2, 5)`
  * matrices can also be created by binding columns and rows
    * `rbind(x, y)`, `cbind(x, y)`  = combine rows/columns; can be used on vectors or matrices
  * `*` and `/` = element by element computation between two matrices
    * `%*%` = matrix multiplication
* `dim(obj)` = dimensions of an object (returns `NULL` if a vector)
  * `dim(obj) <- c(4, 5)` = assign `dim` attribute to an object
    * if object is a vector, R converts the vector to a n by m matrix (i.e. 4 rows by 5 column from the example command)
      * ***Note**: if n by m is larger than length of vector, then an error is returned*
    * ***example***

```R
# initiate a vector
x <-c(NA, 1, "cx", NA, 2, "dsa")
class(x)
x

# convert to matrix
dim(x) <- c(3, 2)
class(x)
x
```

* `data.frame(var = 1:4, var2 = c(….))` = creates a data frame
  * `nrow()`, `ncol()` = returns row and column numbers
  * `data.frame(vector, matrix)` = takes any number of arguments and returns a single object of class "data.frame" composed of original objects
  * `as.data.frame(obj)` = converts object to data frame
  * data frames store tabular data
  * special type of list where every list has the same length (can be of different type)
  * data frames are usually created through `read.table()` and `read.csv()`
  * `data.matrix()` = converts a data frame to matrix.
* `colMeans(matrix)` or `rowMeans(matrix)` = returns means of the columns/rows of a matrix/dataframe in a vector
* `as.numeric(rownames(df))` = returns row indices for rows of a data frame with unnamed rows
* **attributes**
  * objects can have attributes: `names`, `dimnames`, `row.names`, `dim` (matrices, arrays), `class`, `length`, or any user-defined ones
  * `attributes(obj)`, `class(obj)` = return attributes/class for an R object
  * `attr(object, "attribute") <- "value"` = creates/assigns a value to a new/existing attribute for the object
  * `names` attribute
    * all objects can have names
    * `names(x)` = returns names (`NULL` if no name exists)
      * `names(x) <- c("a", …)` = can be used to assign names to vectors
    * `list(a = 1, b = 2, …)` = `a`, `b` are names
    * `dimnames(matrix) <- list(c("a", "b"), c("c" , "d"))` = assign names to matrices
      * use list of two vectors: row, column in that order
  * `colnames(data.frame)` = return column names (can be used to set column names as well, similar to `dim()`)
  * `row.names` = names of rows in the data frame (attribute)

### Arrays

* multi-dimensional collection of data with $k$ dimensions
  * matrix = 2 dimensional array
* `array(data, dim, dimnames)`
  - `data` = data to be stored in array
  - `dim` = dimensions of the array
    + `dim = c(2, 2, 5)` = 3 dimensional array $\rightarrow$ creates 5 2x2 array
  - `dimnames` = add names to the dimensions
    + input must be a `list`
    + every element of the `list` must correspond in length to the dimensions of the array
    + `dimnames(x) <- list(c("a", "b"), c("c", "d"), c("e", "f", "g", "h", "i"))` = set the names for row, column, and third dimension respectively (2 x 2 x 5 in this case)
* `dim()` function can be used to create arrays from vectors or matrices
  - `x <- rnorm(20); dim(x) <- c(2, 2, 5)` = converts a 20 element vector to a 2x2x5 array

### Factors

* factors are used to represent *categorical data* (integer vector where each value has a label)
* 2 types: **unordered** vs **ordered**
* treated specially by `lm()`, `glm()`
* Factors easier to understand because they self describe (vs. 1 and 2)
* `factor(c("a", "b"), levels = c("1", "2"))` = creates factor
  * `levels()` argument can be used to specify baseline levels vs other levels
    * **Note**: without explicit specification, R uses alphabetical order
  * `table(factorVar)` = how many of each are in the factor

## Missing Values

* `NaN` or `NA` = missing values
  * `NaN` = undefined mathematical operations
  * `NA` = any value not available or missing in the statistical sense
    -  any operations with `NA` results in `NA`
    -  NA can have different classes potentially (integer, character, etc)
  * **Note**: NaN is an NA value, but NA is not NaN
* `is.na()`, `is.nan()` = use to test if each element of the vector is `NA` and `NaN`
  * **Note**: cannot compare `NA` (with `==`) as it is not a value but a **placeholder** for a quantity that is not available
* `sum(my_na)` = sum of a logical vector (`TRUE` = 1 and `FALSE` = 0) is effectively the number of `TRUE`s

* **Removing `NA` Values**
  * `is.na()` = creates logical vector where T is where value exists, F is `NA`
    * subsetting with the above result can return only the non NA elements
  * `complete.cases(obj1, obj2)` = creates logical vector where `TRUE` is where both values exist, and `FALSE` is where any is `NA`
    * can be used on data frames as well
    * `complete.cases(data.frame)` = creates logical vectors indicating which observation/row is good
    * `data.frame[logicalVector, ]` = returns all observations with complete data

* **Imputing Missing Values** = replacing missing values with estimates (can be averages from all other data with the similar conditions)

## Sequence of Numbers

* `1:20` = creates a sequence of numbers from first number to second number
  * works in descending order as well
  * increment = 1
* `?':'` = enclose help for operators
* `seq(1, 20, by=0.5)` = sequence 1 to 20 by increment of .5
  * `length=30` argument can be used to specify number of values generated
* `length(variable)` = length of vector/sequence
* `seq_along(vector)` or `seq(along.with = vector)` = create vector that is same length as another vector
* `rep(0, times = 40)` = creates a vector with 40 zeroes
  * `rep(c(1, 2), times = 10)` = repeats combination of numbers 10 times
  * `rep(c(1, 2), each = 10)` = repeats first value 10 times followed by second value 10 times

## Reading Tabular Data

* `read.table(), read.csv()` = most common, read text files (rows, col) return data frame
* `readLines()` = read lines of text, returns character vector
* `source(file)` = read R code
* `dget()` = read R code files (R objects that have been reparsed)
* `load()`, `unserialize()` = read binary objects
* writing data
  * `write.table()`, `writeLines()`, `dump()`, `put()`, `save()`, `serialize()`
* `read.table()` arguments:
  * `file` = name of file/connection
  * `header` = indicator if file contains header
  * `sep` = string indicating how columns are separated
  * `colClasses` = character vector indicating what each column is in terms of class
  * `nrows` = number of rows in dataset
  * `comment.char` = char indicating beginning of comment
  * `skip` = number of lines to skip in the beginning
  * `stringsAsFactors` = defaults to TRUE, should characters be coded as Factor
* `read.table` can be used without any other argument to create data.frame
  * telling R what type of variables are in each column is helpful for larger datasets (efficiency)
  * `read.csv()` = `read.table` except default sep is comma (`read.table` default is `sep = " "` and `header = TRUE`)

### Larger Tables

 * **Note**: help page for `read.table` important
 * need to know how much RAM is required $\rightarrow$ calculating memory requirements
   * `numRow` x `numCol` x 8 bytes/numeric value = size required in bytes
   * double the above results and convert into GB = amount of memory recommended
 * set `comment.char = ""` to save time if there are no comments in the file
 * specifying `colClasses` can make reading data much faster
 * `nrow = n` = number of rows to read in (can help with memory usage)
   * `initial <- read.table("file", rows = 100)` = read first 100 lines
   * `classes <- sapply(initial, class)` = determine what classes the columns are
   * `tabAll <- read.table("file", colClasses = classes)` = load in the entire file with determined classes

### Textual Data Formats

 * `dump` and `dput` preserve metadata
 * text formats are editable, not space efficient, and work better with version control system (they can only track changes in text files)
 * `dput(obj, file = "file.R")` = creates R code to store all data and meta data in "file.R" (ex. data, class, names, row.names)
 * `dget("file.R")` = loads the file/R code and reconstructs the R object
 * `dput` can only be used on one object, where as `dump` can be used on multiple objects
 * `dump(c("obj1", "obj2"), file= "file2.R")` = stores two objects
 * `source("file2.R")` = loads the objects

### Interfaces to the Outside World

* `url()` = function can read from webpages
* `file()` = read uncompressed files
* `gzfile(), bzfile()` = read compressed files (gzip, bzip2)
* `file(description = "", open = "")` = file syntax, creates connection
  * `description` = description of file
  * `open` = r -readonly, w - writing, a - appending, rb/wb/ab - reading/writing/appending binary
  * `close()` = closes connection
  * `readLines()` = can be used to read lines after connection has been established
* `download.file(fileURL, destfile = "fileName", method = "curl")`
  - `fileURL` = url of the file that needs to be downloaded
  - `destfile = "fileName"` = specifies where the file is to be saved
    + `dir/fileName` = directories can be referenced here
  - `method = "curl"` = necessary for downloading files from "https://" links on Macs
    + `method = "auto"` = should work on all other machines

## Subsetting

* R uses **one based index** $\rightarrow$ starts counting at $1$
  * `x[0]` returns `numeric(0)`, not error
  * `x[3000]` returns `NA` (not out of bounds/error)
* `[]` = always returns object of same class, can select more than one element of an object (ex. `[1:2]`)
* `[[]]` = can extract one element from list or data frame, returned object not necessarily list/dataframe
* `$` = can extract elements from list/dataframe that have names associated with it, not necessarily same class

### Vectors

* `x[1:10]` = first 10 elements of vector x
* `x[is.na(x)]` = returns all NA elements
* `x[!is.na(x)]` = returns all non NA elements
  * `x > 0` = would return logical vector comparing all elements to 0 (`TRUE`/`FALSE` for all values except for NA and `NA` for NA elements (NA a placeholder)
* `x[x>"a"]` = selects all elements bigger than a (lexicographical order in place)
* `x[logicalIndex]` = select all elements where logical index = TRUE
* `x[-c(2, 10)]` = returns everything **but** the second and tenth element
* `vect <- c(a = 1, b = 2, c = 3)` = names values of a vector with corresponding names
* `names(vect)` = returns element names for object
  * `names(vet) <- c("a", "b", "c")` = assign/change names of vector
* `identical(obj1, obj2)` = returns TRUE if two objects are exactly equal
* `all.equal(obj1, obj2)` = returns TRUE if two objects are near equal

### Lists

* `x <- list(foo = 1:4, bar = 0.6)`
* `x[1]` or `x["foo"]` = returns the list object `foo`
* `x[[2]]` or `x[["bar"]]` or `x$bar` = returns the content of the second element from the list (in this case vector without name attribute)
  * ***Note**: `$` can’t extract multiple elements *
* `x[c(1, 3)]` = extract multiple elements of list
* `x[[name]]` = extract using variable, where as `$` must match name of element
* `x[[c(1, 3)]]` or `x[[1]][[3]]` = extracted nested elements of list third element of the first object extracted from the list

### Matrices

* `x[1, 2]` = extract the (row, column) element
  * `x[,2]` or `x[1,]` = extract the entire column/row
* `x[ , 11:17]` = subset the x `data.frame` with all rows, but only 11 to 17 columns
* when an element from the matrix is retrieved, a vector is returned
  * behavior can be turned off (force return a matrix) by adding `drop = FALSE`
    * `x[1, 2, drop = F]`

### Partial Matching

* works with `[[]]` and `$`
* `$` automatically partial matches the name (`x$a`)
* `[[]]` can partial match by adding exact = `FALSE`
  * `x[["a", exact = false]]`

## Logic

* `<`, `>=` = less than, greater or equal to
* `==` = exact equality
* `!=` = inequality
* `A | B` = union
* `A & B` = intersection
* `!` = negation
* `&` or `|` evaluates every instance/element in vector
* `&&` or `||` evaluate only first element
  * ***Note**: All AND operators are evaluated before OR operators *
* `isTRUE(condition)` = returns `TRUE` or `FALSE` of the condition
* `xor(arg1, arg2)` = exclusive OR, one argument must equal `TRUE` one must equal `FALSE`
* `which(condition)` = find the indices of elements that satisfy the condition (TRUE)
* `any(condition)` = `TRUE` if one or more of the elements in logical vector is `TRUE`
* `all(condition)` = `TRUE` if all of the elements in logical vector is `TRUE`


## Understanding Data

* use `class()`, `dim()`, `nrow()`, `ncol()`, `names()` to understand dataset
  * `object.size(data.frame)` = returns how much space the dataset is occupying in memory
* `head(data.frame, 10)`, `tail(data.frame, 10)` = returns first/last 10 rows of data; default = 6
* `summary()` = provides different output for each variable, depending on class,
  * for numerical variables, displays min max, mean median, etx.
  * for categorical (factor) variables, displays number of times each value occurs
* `table(data.frame$variable)` = table of all values of the variable, and how many observations there are for each
  * ***Note**: mean for variables that only have values 1 and 0 = proportion of success*
* `str(data.frame)` = structure of data, provides data class, num of observations vs variables, and name of class of each variable and preview of its contents
  * compactly display the internal structure of an R object
  * "What’s in this object"
  * well-suited to compactly display the contents of lists

+ `view(data.frame)` = opens and view the content of the data frame