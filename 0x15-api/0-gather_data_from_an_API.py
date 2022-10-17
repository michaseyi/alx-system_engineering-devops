#!/usr/bin/python3
"""This script given employee ID, returns information about his/her
TODO list progress"""

from functools import reduce
import requests
import sys

if __name__ == '__main__':
    base_url = 'https://jsonplaceholder.typicode.com'
    user_id = sys.argv[1]
    user = requests.get(base_url + '/users/{}'.format(user_id)).json()
    params = {'userId': user_id}
    todos = requests.get(base_url + '/todos', params=params).json()
    completed_todos = [todo for todo in todos if todo.get('completed')]
    print('Employee {} is done with tasks({}/{}):'.format(
        user.get('name'),
        len(completed_todos),
        len(todos)
    ))
    for todo in completed_todos:
        print('\t {}'.format(todo.get('title')))
