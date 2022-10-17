#!/usr/bin/python3
"""This script given employee ID, records all the tasks owned by
this employee in a json file"""

import json
import requests
import sys

if __name__ == '__main__':
    base_url = 'https://jsonplaceholder.typicode.com'
    user_id = sys.argv[1]
    user = requests.get(base_url + '/users/{}'.format(user_id)).json()
    params = {'userId': user_id}
    todos = requests.get(base_url + '/todos', params=params).json()

    with open('{}.json'.format(user_id), mode="w") as file:
        json_data = {user_id: [{
            'task': todo.get('title'),
            'completed': todo.get('completed'),
            'username': user.get('username')
        } for todo in todos]}
        json.dump(json_data, file)
