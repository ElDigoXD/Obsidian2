from pprint import pprint
import re
from typing import List, Protocol
from directives import Accept, Directive, Erase, Display, Unknown

out = open("out.cbl")

document: List[Directive] = []
for i, line in enumerate(out.readlines()):
    if line.strip().startswith("DISPLAY"):
        if "ERASE EOS" in line:
            document.append(Erase(line, i))
        else:
            document.append(Display(line, i))
    elif line.strip().startswith("ACCEPT"):
        document.append(Accept(line, i))
    else:    
        document.append(Unknown(line, i))

programs:dict[str, List[Directive]] = {}
curr_program: str = ""
for i, d in enumerate(document):
    if isinstance(d, Unknown) and d.source_str.startswith("IDENTIFICATION DIVISION."):
        curr_program = document[i+1].source_str.strip(" .").split()[1];
        
    programs.setdefault(curr_program, []).append(d);
    
    
            
#print()
#[print(l) for l in programs.get("EMPREAD", [])]

programs_paras: dict[str, dict[str, List[Directive]]] = {}

for name, directives in programs.items():
    paras: dict[str, List[Directive]] = {}
    curr_para = None
    for d in directives:
        if isinstance(d, Unknown) and re.search(r"^\w+-PARA", d.source_str):
            curr_para = d.source_str.strip(".")
        if curr_para is not None:
            paras.setdefault(curr_para, []).append(d)
        if isinstance(d, Unknown) and re.search(r"^GO TO \w+-PARA", d.source_str):
            curr_para = None
    programs_paras.setdefault(name, paras)
    
pprint(programs_paras)


for _, paras in programs_paras.items():
    pprint(paras)
    for para_name, para in paras.items():
        for d in para:
            if isinstance(d, Display) or isinstance(d, Accept):
                print(d.to_ss())
    exit()


#[print(l) for l in document]