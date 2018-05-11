#Conditional Statements

number<-37
if (number>100){            #if condition is true
  print("greater than 100") #perform this function
}else{                      #if condition is false
  print("less than 100")    #perform alternative action
}
print("finished checking")

  #Comparison Operators:
    #greater than >
    #less than >
    #equal to == (double equals because one equals is an assignment operator)
    #not equal to !=
    #greater than or equal to >=
    #less than or equal to <=

number<-150
if (number>100){            #if condition is true
  print("greater than 100") #perform this function
}

  #More than 1 test in a conditional statement

number<--3
if (number>0){
  print(1)
}else if (number<0){
  print(-1)
}else{
  print(0)
}

  #Combine tests

number1<--15
number2<--40

    #"and"
if(number1>=0&number2>=0){
  print("both numbers are positive")
}else{
  print("at least one is negative")
}
    #"or" (the | symbol)
if(number1>=0|number2>=0){
  print("at least one number is positive")
}else{
  print("at least one number is negative")
}