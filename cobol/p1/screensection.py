input = """
           DISPLAY "ENTER CODE :" AT 0101.
           ACCEPT EEMPID AT 0201.
"""

import re
from typing import List, Self

class ss_element: 
    def from_display(self, display_line: str)-> Self:
        m: re.Match[str] | None
        if m := re.match(r"DISPLAY (\".*\") AT (\d\d)(\d\d)", display_line):
            self.type = "value"
        elif m := re.match(r"DISPLAY (.*) AT (\d\d)(\d\d)", display_line):
            self.type = "from"
        else:
            print("unexpected display")
            exit()

        self.content = m[1]
        self.line = int(m[2])
        self.column = int(m[3])

        return self
    
    def from_accept(self, accept_line: str)-> Self:
        m: re.Match[str] | None
        if m:= re.match(r"ACCEPT (.*) AT (\d\d)(\d\d)", accept_line):
            self.type = "using"
            self.content = m[1]
            self.line = int(m[2])
            self.column = int(m[3])
        else:
            print("unexpected display")
            exit()

        return self

    def __str__(self) -> str:
        if len(self.content) > 38:
            self.content = f"\n               {self.content}"
        return f"line {self.line} column {self.column} {self.type} {self.content}."
    def __repr__(self) -> str:
        return self.__str__();
elements =  []

def emit_ss(elements: List[ss_element]):
    print(f"       screen section.")
    print(f"       01 namenamenamenamenamenamenamenamenamenamenamename.")
    [print(f"           03 {element}") for element in elements]


for line in input.splitlines():
    line = line.strip()
    if line =="""DISPLAY " " AT 0101 ERASE EOS.""":
        continue
    if line.startswith("DISPLAY"):
        elements.append( ss_element().from_display(line))
    elif line.startswith("ACCEPT"):
        elements.append(ss_element().from_accept(line))


emit_ss(elements)
