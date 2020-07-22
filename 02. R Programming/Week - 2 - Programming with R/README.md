# Week - 2 Programming with R

## Control Structures

- Control structures in R allows us to control the flow of execution of a series of R expressions.
- Basically, control structures allows us to put some “logic” into our R code, rather than just always executing the same R code every time. 
- Control structures allows us to respond to inputs or to features of the data and execute different R expressions accordingly.
- Commonly used control structures are
  - `if` and `else`: testing a condition and acting on it
  - `for`: execute a loop a fixed number of times
  - `while`: execute a loop while a condition is true
  - `repeat`: execute an infinite loop (must break out of it to stop)
  - `break`: break the execution of a loop
  - `next`: skip an iteration of a loop

### **`if else`** 

- The `if-else` combination is probably the most commonly used control structure in R (or perhaps
  any language). 

- This structure allows us to test a condition and act on it depending on whether it’s true or false.

- The following code does nothing if the condition is false.  

  ```python
  if(<condition>) {
  	## do something
  }
  ## Continue with rest of code
  ```

- If we want to execute an action when the condition is false, then we need an `else` clause:

  ```python
  if(<condition>) {
  	## do something
  }
  else {
  	## do something else
  }
  ```

- We can have a series of tests by following the initial `if` with any number of `else ifs`:

  ```  python
  if(<condition1>) {
  	## do something
  } else if(<condition2>) {
  	## do something different
  } else {
  	## do something different
  }
  ```

- A valid example of if/else structure:

  ```python
  ## Generate a uniform random number
  x <- runif(1, 0, 10)
  if(x > 3) {
  	y <- 10
  } else {
  	y <- 0
  }
  ```

- The value of `y` is set depending on whether `x > 3` or not. This expression can also be written in a
  different way as follows:

  ```python
  y <- if(x > 3) {
  	10
  } else {
  	0
  }
  ```

  