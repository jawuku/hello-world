# Hello program from exercise in Statistics (the Easier Way)
# 3rd edition by Nicole Radziwill

hello1 <- function() {
    print("Hello World!")
}

hello2 <- function() {
    name <- readline(prompt = "Please enter your name: ")
    sprintf("Good Morning, %s.", name)
}

hello3 <- function() {
    print(" What is your name?")
    name <- scan("", what = "character")
    sprintf("Greetings %s! How are you?", name)
}

announce <- function(intro) {
    sprintf("My name is %s.", intro)
}

hello1()

hello2()

hello3()

announce("Jason")
