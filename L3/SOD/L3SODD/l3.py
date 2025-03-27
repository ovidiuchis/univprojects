import os
import shutil
import sys

SOURCE_DIR = 'sursa'
TARGET_DIR = 'dest'

if os.path.exists(TARGET_DIR):
    shutil.rmtree(TARGET_DIR)

shutil.copytree(SOURCE_DIR, TARGET_DIR)

