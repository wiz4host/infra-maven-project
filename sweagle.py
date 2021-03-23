

#python3 sweagle.py sweagle.json sweaglekeyname pipeline-params ORGANIZATION_NAME

import json
import sys

filename      = sys.argv[1]
workspacename = sys.argv[2]
keymain       = sys.argv[3]
keyname       = sys.argv[4]

def readjsonfile(filename):
    with open(filename, 'r') as infile:
        datain = json.load(infile)
        infile.close()
    return datain

filedata_r = readjsonfile(filename)

#print (filedata_r['sweaglekeyname']['pipeline-params']['ORGANIZATION_NAME'])

keyval = filedata_r[workspacename][keymain][keyname]

print (keyval)
