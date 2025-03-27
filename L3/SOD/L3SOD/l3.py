import os
from shutil import rmtree,copytree,ignore_patterns
import sys

SOURCE_DIR = 'sursa'
TARGET_DIR = 'dest'

if os.path.exists(TARGET_DIR):
    shutil.rmtree(TARGET_DIR)

shutil.copytree(SOURCE_DIR, TARGET_DIR,ignore=ignore_patterns('*.txt'))

