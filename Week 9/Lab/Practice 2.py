number = int(input("Please input the starting number : "))

for number in range(number, 10, 2):

    if number == 7:
        print("Lucky Seven")
        break
    else:
        print(f'The Number is : {number}')    
