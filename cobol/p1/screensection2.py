import re
from typing import List, Self

class ss_element: 
    def from_display(self, display_line: str) -> Self:
        m: re.Match[str] | None
        if m := re.match(r"DISPLAY (\".*\") AT (\d\d)(\d\d)", display_line):
            self.type = "value"
            self.content = m[1]
            self.line = int(m[2])
            self.column = int(m[3])

        elif m := re.match(r"DISPLAY (.*) AT (\d\d)(\d\d)", display_line):
            self.type = "from"
            self.content = m[1]
            self.line = int(m[2])
            self.column = int(m[3])
        elif m := re.match(r"DISPLAY (.*).", display_line):
            self.type = "value"
            self.content = m[1]
            self.line = int(1)
            self.column = int(1)
        else :
            print("unexpected")
            exit()

        return self
    
    def from_accept(self, accept_line: str)-> Self:
        m: re.Match[str] | None
        if m:= re.match(r"ACCEPT (.*) AT (\d\d)(\d\d)", accept_line):
            self.type = "using"
            self.content = m[1]
            self.line = int(m[2])
            self.column = int(m[3])
        else:
            print(f"unexpected accept {accept_line}")
            exit()

        return self
    def __str__(self) -> str:
        if len(self.content) > 38:
            self.content = f"\n               {self.content}"
        return f"line {self.line} column {self.column} {self.type} {self.content}."
    def __repr__(self) -> str:
        return self.__str__();

def emit_ss(elements: List[ss_element]):
    print(f"       01 namenamenamenamenamenamenamenamenamenamenamename.")
    [print(f"           03 {element}") for element in elements]
    print()

file = open("out.cbl")
elements =  []

for line in file.readlines():
    line = line.strip()
    if line == """DISPLAY " " AT 0101 ERASE EOS.""":
        # TODO: add to ss
        emit_ss(elements)
        elements = []
    elif line == """DISPLAY " " AT 0101 ERASE EOS.""":
        pass
    if line.startswith("DISPLAY"):
        elements.append(ss_element().from_display(line))
    elif line.startswith("ACCEPT"):
        elements.append(ss_element().from_accept(line))


emit_ss(elements)
















