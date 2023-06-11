import json

# Function to load data from the JSON file
def load_data():
    with open('app\data\products.json') as file:
        data = json.load(file)
    return data