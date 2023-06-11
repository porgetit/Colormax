import json

# Function to save data to the JSON file
def save_data(data):
    with open('app\data\products.json', 'w') as file:
        json.dump(data, file, indent=2)