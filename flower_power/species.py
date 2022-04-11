#!/usr/bin/env python3

import requests

def list_some_species():
    return [
        'tulip',
        'lilac',
        'sunflower'
    ]

def list_many_species():
    res = requests.get('https://gist.githubusercontent.com/researchranks/ffe24c33df30e64f51271ddec83b4af6/raw/0e15dabe9b54611288cf92f93e1bfa288e150448/flower-and-plant-names.csv')
    return res.splitlines()
