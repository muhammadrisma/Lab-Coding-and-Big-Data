count = 1
username = "admin"
password = "admin"

for i in range(3):
    print("*** Hello! Welcome To Coding and Big Data Apps! ***\n")
    uName = input("Username : ")
    pw = input("Password : ")
    if (uName == username and pw == password):
        print("~~ Welcome Back Admin :) ~~\n")
        break
    else:
        if (count < 3):
            print("Wrong username and password!!")
            print(3 - count,"more attempt left!!\n")
        else:
            print("Sorry you have reach 3 times.")
            print("Please try again in 30 seconds!")
            break
    count += 1