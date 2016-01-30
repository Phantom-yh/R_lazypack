#This is a literate programming version of the full tutorial. 
#The full tutorial contains a little more information (e.g., a note on how to install R).

### R Basics


## Vectors

#Vectors are a core data structure in R, and are created with `c()`. Elements in a vector must be of the same type.
numbers = c(23, 13, 5, 7, 31)
names = c("edwin", "alice", "bob")

#Elements are indexed starting at 1, and are accessed with `[]` notation.
numbers[1] # 23
names[1] # edwin
numbers[1:2] # 23 13
names[-1] # "alice" "bob", all but the 1st element.
numbers[numbers > 10] # all elements greater than 10.
names[names %in% c("a", "bob", "alice")]  # elements in the given set.


## Data frames

#[Data frames](http://www.r-tutor.com/r-introduction/data-frame) are like matrices, 
# but with named columns of different types (similar to [database tables](http://code.google.com/p/sqldf/)).
# Those different types of elements should be the same dimension.
books = data.frame(
  title = c("harry potter", "war and peace", "lord of the rings"),
  author = c("rowling", "tolstoy", "tolkien"),
  num_pages = c("350", "875", "500")
)

#You can access columns of a data frame with `$`.
books$title # c("harry potter", "war and peace", "lord of the rings")
books$author[1] # "rowling"

#You can also create new columns with `$`.
books$num_bought_today = c(10, 5, 8)
books$num_bought_yesterday = c(18, 13, 20)

books$total_num_bought = books$num_bought_today + books$num_bought_yesterday


## read.table

#Suppose you want to import a TSV file into R as a data frame.
#For example, consider the [`data/students.tsv`] (https://github.com/echen/r-tutorial/blob/master/data/students.tsv) file 
# (with columns describing each student's age, test score, and name).

#We can import this file into R using [`read.table()`]
students = read.table(
  "data/students.tsv", 
  header = F, 
  sep = "\t", 
  col.names = c("age", "score", "name")
)

#where
#* `header = F` means that the file does not contain a header (`F` is shorthand for `FALSE`)
#* `sep = "\t"` means that the file is tab-delimited
#* `col.names = c("age", "score", "name")` tells R the column names
#We can now access the different columns in the data frame with `students$age`, `students$score`, and `students$name`.


## save
# We can save the specific objects in the XDR platform independent binary platform.
save("numbers", file = "data")

#where
# save(..., list = character(),
# file = stop("'file' must be specified"),
# ascii = FALSE, version = NULL, envir = parent.frame(),
# compress = isTRUE(!ascii), compression_level,
# eval.promises = TRUE, precheck = TRUE)


## cat
# Outputs the objects, concatenating the representations. 
# cat performs much less conversion than print.

## sample iter from possion distribution.
iter <- stats::rpois(1, lambda = 10)
## print an informative message
cat("iteration = ", iter <- iter + 1, "\n")

# where
# cat(... , file = "", sep = " ", fill = FALSE, labels = NULL,
#    append = FALSE)


