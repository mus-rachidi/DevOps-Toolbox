import random
import string

def generate_password(length):
    # Define the set of allowed characters
    allowed_characters = string.printable.replace('/', '').replace('@', '').replace('"', '').replace(' ', '')

    # Generate a random password
    password = ''.join(random.choice(allowed_characters) for _ in range(length))

    return password

# Generate a password of length 10
password = generate_password(30)
print("Generated Password:", password)

