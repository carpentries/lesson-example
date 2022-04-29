import logging
import os
from yaml import load
try:
    from yaml import CLoader as Loader
except ImportError:
    from yaml import Loader

log = logging.getLogger(__name__)

#change this to get setup docs

log.info(f"Getting setup info")
os.system(f"git submodule add --force -b main https://github.com/Southampton-RSG-Training/setup-documents.git submodules/setup-documents")
os.system("git submodule update --remote --merge")


# get list of setup.md chunks from _config.yml and apply order to them
# Open the website config, which contains a list of the lessons we want in the
# workshop, then create the directory "submodules" which will contain the files
# for each lesson
with open('_config.yml') as config:
    website_config = load(config, Loader=Loader)
    #select element of the dictionary called setup_docs
    set_up_docs = website_config['setup_docs']

#for each element in the list
#paste into a string 'submodules/setup-documents/markdown'+setup docs element
with open("setup.md", "w") as file_out:
    file_out.write('# Setup for Lesson')
    for i in range(len(set_up_docs)):
        doc = 'submodules/setup-documents/markdown/'+ set_up_docs[i]
        with open(doc, "r") as file_in:
            file_out.write("\n")
            file_out.write(file_in.read())




