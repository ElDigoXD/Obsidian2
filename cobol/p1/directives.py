
import re
from typing import Protocol


def count_indent(line: str) -> int:
    count = 0
    for c in line:
        if c != ' ':
            return count
        count = count + 1
    
    return 0

class Directive(Protocol):
    indent: int
    line_number: int
    source_str: str
    
    def __str__(self) -> str:
        print("__str__ not implemented")
        exit()
        
    def __repr__(self) -> str:
        return self.source_str

class Unknown(Directive):
    indent: int
    line_number: int
    source_str: str

    def __init__(self, source_str:str, line_number:int) -> None:
        self.indent = count_indent(source_str)
        self.line_number = line_number
        self.source_str = source_str.strip()

    def __str__(self) -> str:
       return f"{' ' * self.indent}{self.source_str}"
class ProgramStart(Unknown):
    pass
class ProgramEnd(Unknown):
    pass
class If(Unknown):
    pass
class Erase(Unknown):
    pass
    
class Accept(Directive):
    indent: int
    line_number: int
    source_str:str
    d_type:str
    content: str
    line: int
    column: int
    
    def __init__(self, source_str:str, line_number:int) -> None:
        self.indent = count_indent(source_str)
        self.line_number = line_number
        self.source_str = source_str.strip()
        if m:= re.match(r"ACCEPT (.*) AT (\d\d)(\d\d)", self.source_str):
            self.d_type = "using"
            self.content = m[1]
            self.line = int(m[2])
            self.column = int(m[3])
        else:
            print("ERRPR")
            exit()

    def __str__(self) -> str:
       return f"{' ' * self.indent}ACCEPT {self.content} AT {self.line:>02}{self.column:>02}."

    def to_ss(self) -> str:
        if len(self.content) > 38:
            self.content = f"\n               {self.content}"
        return f"line {self.line} column {self.column} {self.d_type} {self.content}."


class Display(Directive):
    indent: int
    line_number: int
    source_str:str
    d_type:str
    content: str
    line: int
    column: int

    def __init__(self, source_str:str, line_number:int) -> None:
        self.indent = count_indent(source_str)
        self.line_number = line_number
        self.source_str = source_str.strip()
        m: re.Match[str] | None
        if m := re.match(r"DISPLAY (\".*\") AT (\d\d)(\d\d)", self.source_str):
            self.d_type = "value"
            self.content = m[1]
            self.line = int(m[2])
            self.column = int(m[3])
        elif m := re.match(r"DISPLAY (.*) AT (\d\d)(\d\d)", self.source_str):
            self.d_type = "from"
            self.content = m[1]
            self.line = int(m[2])
            self.column = int(m[3])
        elif m := re.match(r"DISPLAY (.*).", self.source_str):
            self.d_type = "value"
            self.content = m[1]
            self.line = int(1)
            self.column = int(1)
        else :
            print("unexpected" + self.source_str)
            exit()
        
    def __str__(self) -> str:
       return f"{' ' * self.indent}DISPLAY {self.content} AT {self.line:>02}{self.column:>02}."

    def to_ss(self) -> str:
        if len(self.content) > 38:
            self.content = f"\n               {self.content}"
        return f"line {self.line} column {self.column} {self.d_type} {self.content}."
