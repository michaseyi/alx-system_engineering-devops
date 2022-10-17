#!/usr/bin/python3
"""This script given employee ID, records all the tasks owned by
this employee in a csv file"""

import requests
import sys

if __name__ == '__main__':
    base_url = 'https://jsonplaceholder.typicode.com'
    user_id = sys.argv[1]
    user = requests.get(base_url + '/users/{}'.format(user_id)).json()
    params = {'userId': user_id}
    todos = requests.get(base_url + '/todos', params=params).json()

    with open('{}.csv'.format(user_id), mode="w") as file:
        for todo in todos:
            file.write('"{}", "{}", "{}", "{}"\n'.format(
                user_id,
                user.get('username'),
                todo.get('completed'),
                todo.get('title'),
            ))
