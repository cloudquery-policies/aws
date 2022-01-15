import hcl2
import json
from collections.abc import MutableMapping, Sequence
import re
from os import listdir
from os.path import isfile, join


def load_file(val):
    filePath = re.findall('\$\{file\("([^"]*)"\)', val)
    if len(filePath) == 1:
        with open('../'+filePath[0], 'r') as file:
            if filePath[0].endswith('.hcl'):
                t = hcl2.load(file)
                return json.loads(json.dumps(t), object_hook=as_complex)
            else:
                return file.read()

    else:
        return val


def create_md(key):
    svc = key.split('.')[0]
    open('../foundational_security/docs/'+svc+".md", 'w').close()
    open('../foundational_security/docs/'+key+".md", 'w').close()


def as_complex(dct):
    if type(dct) is not dict:
        return dct

    returnDict = {}
    for k, v in dct.items():
        if type(v) is not str:
            returnDict[k] = v
            if type(v) is dict and 'query' in v:
                create_md(k)
        elif k == 'doc':
            returnDict[k] = v
        else:
            returnDict[k] = load_file(v)

    return returnDict


with open('../foundational_security/policy.hcl', 'r') as file:
    t = hcl2.load(file)


json.dumps(json.loads(json.dumps(t),
                      object_hook=as_complex), indent=4, sort_keys=True)


with open('../foundational_security/docs/_rawDocs.md') as file:
    markDown = file.read()


docsPath = '../foundational_security/docs'
onlyfiles = [f for f in listdir(docsPath) if isfile(join(docsPath, f))]


perControl = markDown.split('## \[')
for controlDoc in perControl:
    header = controlDoc.splitlines()
    if len(header) < 1 or len(header[0]) == 0:
        continue
    ctrl = re.findall('"fsbp\-([^"]*)"', header[0])
    # print(ctrl[0].upper().replace('-','.')+'.md')
    fileFound = False
    for file in onlyfiles:
        if ctrl[0].startswith('es-'):
            ctrl[0] = ctrl[0].replace('es-', 'Elasticsearch-')
        if file.upper() == ctrl[0].upper().replace('-', '.')+'.MD':
            with open('../foundational_security/docs/'+file, 'w') as file:
                controlDoc = '## \[' + controlDoc
                file.write(controlDoc)
                fileFound = True

    if fileFound == False:
        print(ctrl[0])
    # print(controlDoc)


for file in onlyfiles:
    if True not in [char.isdigit() for char in file]:
        if file == '_rawDocs.md':
            continue
        serviceName = file.strip('.md')
        with open('../foundational_security/docs/'+file, 'w') as fd:
            fd.write((
                f"# Overview "
                f"\n"
                f"\n"
                f"This section contains recommendations for configuring {serviceName} and the related options."
            ))
