#!/usr/bin/env python
"""Check Python in lesson episodes for PEP8 compliance.

First, lesson pages are converted to Python, then these files are checked for
PEP8 compatibility using the `pep8` script. This script is designed to be run
from the lesson root directory.

To test this script, execute

    nosetests bin/check_pep8.py
"""

from __future__ import division, print_function
import os
import subprocess
import argparse
import time
import sys


def comment_line(line):
    """Comment a line."""
    if line:
        return "# " + line
    else:
        return "#"


def md2py(fpath_md):
    """Convert Markdown file to Python, commenting everything except code
    blocks. Output file is in the same directory with `.md` replacing `.py`.
    """
    py_text = ""
    fpath_py = fpath_md.replace(".md", ".py")
    inblock = False
    with open(fpath_md) as f:
        for line in f:
            if line.strip().startswith("~~~ {.python}"):
                py_text += comment_line(line)
                inblock = True
            elif line.strip() == "~~~":
                py_text += comment_line(line)
                inblock = False
            elif inblock:
                py_text += line
            else:
                py_text += comment_line(line).rstrip() + "\n"
    with open(fpath_py, "w") as f:
        f.write(py_text)


def test_md2py(rm=True):
    """Test the md2py function on known input."""
    fpath_md = "bin/test/test_md_to_py.md"
    fpath_py_ref = "bin/test/test_md_to_py_ref.py"
    fpath_py = "bin/test/test_md_to_py.py"
    md2py(fpath_md)
    with open(fpath_py_ref) as f:
        py_ref = f.read()
    with open(fpath_py) as f:
        py = f.read()
    if rm:
        os.remove(fpath_py)
    assert py == py_ref


def check_page(fpath, rm=True, ignore=["E501", "W291", "E402", "E302"]):
    """Convert a lesson page from Markdown to Python and check it for PEP8
    compliance.
    """
    print("Checking", fpath, "for PEP8 compliance... ", end="")
    fpath_py = fpath.replace(".md", ".py")
    # Convert the lesson to Python
    md2py(fpath)
    # Run the pep8 script on the newly generated Python file
    cmd = ["pep8", fpath_py]
    if ignore:
        cmd += ["--ignore", ",".join(ignore)]
    try:
        r = subprocess.check_output(cmd, stderr=subprocess.STDOUT).decode()
    except subprocess.CalledProcessError as e:
        r = e.output.decode()
    if rm:
        os.remove(fpath_py)
    if r:
        print("\n" + r)
        return False
    else:
        print("ok")
        return True


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Run PEP8 check on files.")
    parser.add_argument("files", nargs="+", help="Which files to test")
    parser.add_argument("--keep-temp", default=False, action="store_true",
                        help="Keep temporary Python files")
    parser.add_argument("-i", "--ignore", nargs="*",
                        default=["E501", "W291", "E402", "E302"],
                        help='Which PEP8 errors to ignore. Defaults are \
                             ["E501", "W291", "E402", "E302"]')
    args = parser.parse_args()

    t0 = time.time()
    failed = []
    for f in args.files:
        r = check_page(f, rm=not args.keep_temp, ignore=args.ignore)
        if not r:
            failed.append(f)

    print("\n-----------------------------------------------------------------"
          "-----")
    te = time.time() - t0
    print("Checked {} files in {:.3f} s\n".format(len(args.files), te))
    if failed:
        print("Failed:", failed)
        sys.exit("PEP8 check failed")
    else:
        print("OK")
