file_name = input("Enter the file name: ")

try: 
    with open(file_name, 'r', encoding='utf-8') as file:
        content = file.read()

        num_lines = content.count("\n")+1
        num_words = len(content.split())
        num_char = len(content)


        print(f"File analysis of {file_name} :")
        print(f"Number of lines: {num_lines}")
        print(f"Number of words: {num_words}")
        print(f"Number of characters: {num_char}")
except FileNotFoundError: 
    print(f"Error: file {file_name} not found. ")