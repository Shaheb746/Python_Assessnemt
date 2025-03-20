numbers = input("Enter a list of number: ").split()
numbers = [int(num) for num in numbers]

largest_number = max(numbers)

print("the largest number in list is :", largest_number)