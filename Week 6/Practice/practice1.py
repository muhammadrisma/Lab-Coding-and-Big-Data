'''
currentYear = 2018
birthYear = int(input("Enter your birth year :"))
Age = currentYear - birthYear
print("Your age is :",Age)

'''
'''
age = int(input("How old are you :"))
hadSim = input("Do you have SIM (yes/no) :")

if age >= 19 and hadSim == "yes":
    print("Congrats, you are able to drive the vehicle")
elif age >= 17 and hadSim != "yes":
    print("Sorry, you must having SIM first")
else:
    print("Sorry, you are not able to drive the vehicle")

'''
birthYear = int(input("What year you born in ?:"))

if (birthYear%2) == 0:
    print("Even")
else:
    print("Odd")