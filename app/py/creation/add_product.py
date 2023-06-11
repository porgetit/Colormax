import json
from datetime import date


# Function to add a new product
def add_product(data, name, description, subcategory_id, brand, price, quantity, supplier_id):
    product = {}    
    product['product_id'] = len(data['products']) + 1
    product['name'] = str(name)
    product['description'] = str(description)
    product['subcategory_id'] = int(subcategory_id)
    product['brand'] = str(brand)
    product['price'] = float(price)
    product['quantity'] = int(quantity)
    product['supplier_id'] = int(supplier_id)
    product['registration_date'] = product['last_update_date'] = date.today().strftime("%d-%m-%Y")
    
    data['products'].append(product)
    save_data(data)