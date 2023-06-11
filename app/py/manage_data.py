import json

# Function to load data from the JSON file
def load_data():
    with open('app\data\products.json') as file:
        data = json.load(file)
    return data

# Function to save data to the JSON file
def save_data(data):
    with open('app\data\products.json', 'w') as file:
        json.dump(data, file, indent=2)

# Function to add a new product
def add_product(data):
    product = {}
    product['product_id'] = len(data['products']) + 1
    product['product_name'] = input('Product Name: ')
    product['description'] = input('Description: ')
    product['subcategory_id'] = int(input('Subcategory ID: '))
    product['brand'] = input('Brand: ')
    product['price'] = float(input('Price: '))
    product['quantity'] = int(input('Quantity: '))
    product['supplier_id'] = int(input('Supplier ID: '))
    product['registration_date'] = input('Registration Date: ')
    product['last_update_date'] = input('Last Update Date: ')

    data['products'].append(product)
    save_data(data)

# Function to add a new category
def add_category(data):
    category = {}
    category['category_id'] = len(data['categories']) + 1
    category['category_name'] = input('Category Name: ')
    category['spanish_translation'] = input('Spanish Translation: ')

    data['categories'].append(category)
    save_data(data)

# Function to add a new subcategory
def add_subcategory(data):
    subcategory = {}
    subcategory['subcategory_id'] = len(data['subcategories']) + 1
    subcategory['subcategory_name'] = input('Subcategory Name: ')
    subcategory['category_id'] = int(input('Category ID: '))
    subcategory['spanish_translation'] = input('Spanish Translation: ')

    data['subcategories'].append(subcategory)
    save_data(data)

# Function to add a new supplier
def add_supplier(data):
    supplier = {}
    supplier['supplier_id'] = len(data['suppliers']) + 1
    supplier['supplier_name'] = input('Supplier Name: ')
    supplier['contact_name'] = input('Contact Name: ')
    supplier['contact_email'] = input('Contact Email: ')
    supplier['contact_phone'] = input('Contact Phone: ')
    supplier['address'] = input('Address: ')
    supplier['city'] = input('City: ')
    supplier['state'] = input('State: ')
    supplier['country'] = input('Country: ')

    data['suppliers'].append(supplier)
    save_data(data)

# Load the existing data from the JSON file
data = load_data()

# Display options for adding data
print("1. Add Product")
print("2. Add Category")
print("3. Add Subcategory")
print("4. Add Supplier")

# Prompt user for their choice
choice = input("Enter your choice: ")

# Perform the corresponding action based on the user's choice
if choice == '1':
    add_product(data)
elif choice == '2':
    add_category(data)
elif choice == '3':
    add_subcategory(data)
elif choice == '4':
    add_supplier(data)
else:
    print("Invalid choice.")

# Save the updated data to the JSON file
save_data(data)

print("Data saved successfully.")
