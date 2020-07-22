# Week - 2 Programming with R

## Control Structures

* Common structures are
  * `if`, `else` = testing a condition
  * `for` = execute a loop a fixed number of times
  * `while` = execute a loop while a condition is true
  * `repeat` = execute an infinite loop
  * `break` = break the execution of a loop
  * `next` = skip an iteration of a loop
  * `return` = exit a function
* **Note**: Control structures are primarily useful for writing programs; for command-line interactive work, the `apply` functions are more useful

### `if - else`

```r
# basic structure
if(<condition>) {
    ## do something
} else {
    ## do something else
}

# if tree
if(<condition1>) {
    ## do something
} else if(<condition2>) {
    ## do something different
} else {
    ## do something different
}
```

* `y <- if(x>3){10} else {0}` = slightly different implementation than normal, focus on assigning value

### `for`

```{r}
# basic structure
for(i in 1:10) {
    # print(i)
}

# nested for loops
x <- matrix(1:6, 2, 3)
for(i in seq_len(nrow(x))) {
    for(j in seq_len(ncol(x))) {
        # print(x[i, j])
    }
}
```

* `for(letter in x)` = loop through letter in character vector
* `seq_along(vector)` = create a number sequence from 1 to length of the vector
* `seq_len(length)` = create a number sequence that starts at 1 and ends at length specified

### `while`

```{r}
count <- 0
while(count < 10) {
    # print(count)
    count <- count + 1
}
```

* conditions can be combined with logical operators

### `repeat` and `break`

* `repeat` initiates an infinite loop
* not commonly used in statistical applications but they do have their uses
* The only way to exit a `repeat` loop is to call `break`

```r
x0 <- 1
tol <- 1e-8
repeat {
    x1 <- computeEstimate()
    if(abs(x1 - x0) < tol) {
        break
    } else {
        x0 <- x1 # requires algorithm to converge
    }
}
```

* **Note**: The above loop is a bit dangerous because there’s no guarantee it will stop.
  * Better to set a hard limit on the number of iterations (e.g. using a `for` loop) and then report whether convergence was achieved or not.


### `next` and `return`

* `next` = (no parentheses) skips an element, to continue to the next iteration
* `return` = signals that a function should exit and return a given value

```{r}
for(i in 1:100) {
    if(i <= 20) {
        ## Skip the first 20 iterations
        next
    }
    ## Do something here
}
```

## Functions

* `name <- function(arg1, arg2, …){ }`
  * inputs can be specified with default values by `arg1 = 10`
  * it is possible to define an argument to `NULL`
  * returns **last expression** of function
  * many functions have `na.rm`, can be set to `TRUE` to remove `NA` values from calculation
* structure

```r
f <- function(<arguments>) {
    ## Do something interesting
}
```

* function are first class object and can be **treated like other objects** (pass into other functions)
  * functions can be nested, so that you can define a function inside of another function
* function have named arguments (i.e. `x = mydata`) which can be used to specifiy **default values**
  * `sd(x = mydata)` (matching by name)
* formal arguments = arguments included in the functional definition
  * `formals()` = returns all formal arguments
  * not all functional call specifies all arguments, some can be missing and may have default values
  * `args()` = return all arguments you can specify
  * multiple arguments inputted in random orders (R performs positional matching) $\rightarrow$ not recommended
  * argument matching order: exact $\rightarrow$ partial $\rightarrow$ positional
    - *partial* = instead of typing `data = x`, use `d = x`
* **Lazy Evaluation**
  * R will evaluate as needed, so everything executes until an error occurs
    * `f <- function (a, b) {a^2}`
    * if b is not used in the function, calling `f(5)` will not produce an error
* `...` argument
  * used to extend other functions by representing the rest of the arguments
  * generic functions use `...` to pass extra arguments (i.e. `mean = 1, sd = 2`)
  * necessary when the number of arguments passed can not be known in advance
    * functions that use `...` = `paste()`, `cat()`
  * **Note**: arguments coming after `...` must be explicitly matched and cannot be partially matched.

## Scoping

* scoping rules determine how a value is associated with a free variable in a function
* **free variables** = variables not explicitly defined in the function (not arguments, or local variables - variable defined in the function)
* R uses **lexical/static scoping**
  * common alternative = **dynamic scoping**
  * **lexical scoping** = values of free vars are searched in the environment in which the function is defined
    * environment = collection of symbol/value pairs (`x = 3.14`)
      * each package has its own environment
      * only environment **without** parent environment is the *empty environment*
  * **closure/function closure** = function + associated environment
* search order for free variable
  1. environment where the function is defined
  2. parent environment
  3. ... (repeat if multiple parent environments)
  4. top level environment: global environment (workspace) or namespace package
  5. empty environment $\rightarrow$ produce error
* when a function/variable is called, R searches through the following list to match the first result
  1. `.GlobalEnv`
  2. `package:stats `
  3. `package:graphics`
  4. `package:grDeviced`
  5. `package:utils`
  6. `package:datasets`
  7. `package:methods`
  8. `Autoloads`
  9. `package:base`
* **order matters**
  * `.GlobalEnv` = everything defined in the current workspace
  * any package that gets loaded with `library()` gets put in position 2 of the above search list
  * namespaces are separate for functions and non-functions
    * possible for object c and function c to coexist

### Scoping Example

```{r}
make.power <- function(n) {
    pow <- function(x) {
         x^n
    }
    pow
}
cube <- make.power(3)   # defines a function with only n defined (x^3)
square <- make.power(2) # defines a function with only n defined (x^2)
cube(3)                 # defines x = 3
square(3)               # defines x = 3

# returns the free variables in the function
ls(environment(cube))

# retrieves the value of n in the cube function
get("n", environment(cube))
```

### Lexical vs Dynamic Scoping Example

```{r}
y <- 10
f <- function(x) {
    y <- 2
    y^2 + g(x)
}
g <- function(x) {
    x*y
}
```

* **Lexical Scoping**

  1. `f(3)` $\rightarrow$ calls `g(x)`
  2. `y` isn’t defined locally in `g(x)` $\rightarrow$ searches in parent environment (working environment/global workspace)
  3. finds `y` $\rightarrow$ `y = 10`

* **Dynamic Scoping**

  1. `f(3)` $\rightarrow$ calls `g(x)`
  2. `y` isn’t defined locally in `g(x)` $\rightarrow$ searches in calling environment (f function)
  3. find `y` $\rightarrow$ `y <- 2`

  * **parent frame** = refers to calling environment in R, environment from which the function was called

* **Note**: when the defining environment and calling environment is the same, lexical and dynamic scoping produces the same result.

* **Consequences of Lexical Scoping**

  * all objects must be carried in memory
  * all functions carry pointer to their defining environment (memory address)

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

## Dates and Times

 * `Date` = date class, stored as number of days since 1970-01-01
 * `POSIXct` = time class, stored as number of seconds since 1970-01-01
 * `POSIXlt` = time class, stored as list of sec min hours
 * `Sys.Date()` = today's date
 * `unclass(obj)` = returns what obj looks like internally
 * `Sys.time()` = current time in POSIXct class
 * `t2 <- as.POSIXlt(Sys.time())` = time in POSIXlt class
   * `t2$min` = return min of time (only works for POSIXlt class)
 * `weekdays(date)`, `months(date)`, `quarters(date)` = returns weekdays, months, and quarters of time/date inputed
 * `strptime(string, "%B %d, %Y %H:%M")` = convert string into time format using the format specified
 * `difftime(time1, time2, units = 'days')` = difference in times by the specified unit