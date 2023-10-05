#!/usr/bin/python3
'''
The script that generates a tgz archive from the contents of the web_static
folder of the AirBnB Clone repository
'''

from datetime import datetime
from fabric.api import local
from os.path import isdir


def do_pack():
