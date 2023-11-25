import random

def generate_random_decimal(total_length, decimal_points):
    if total_length <= decimal_points:
        raise ValueError("Total length should be greater than the number of decimal points.")
    
    integer_part_length = total_length - decimal_points
    integer_part = str(random.randint(10 ** (integer_part_length - 1), 10 ** integer_part_length - 1))
    decimal_part = ''.join(str(random.randint(0, 9)) for _ in range(decimal_points))

    return float(f"{integer_part}.{decimal_part}")

# Example usage for NUMBER(22,2)
total_length = 22
decimal_points = 2
random_decimal = generate_random_decimal(total_length, decimal_points)
print(f"Random Decimal (NUMBER(22,2)): {random_decimal}")