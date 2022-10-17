#!/usr/bin/python3
"""This script records all the tasks owned each employee in a json file"""

import json
import requests

if __name__ == '__main__':
    base_url = 'https://jsonplaceholder.typicode.com'
    users = requests.get(base_url + '/users').json()
    todos = requests.get(base_url + '/todos').json()

    json_data = {
        user.get('id'): [
            {
                'username': user.get('username'),
                'task': todo.get('title'),
                'completed': todo.get('completed')
            }
            for todo in todos 
                if user.get('id') == todo.get('userId')
        ]
        for user in users
    }
    with open('todo_all_employees.json', mode='w') as file:
        json.dump(json_data, file)
