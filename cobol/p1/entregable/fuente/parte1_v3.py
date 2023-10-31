'''
Author: Diego Sanz Fuertes 
Copyright: Copyright 2023, Diego Sanz Fuertes 
'''

import re

def third_try():
    old = open("old.cbl")
    new = open("out.cbl", "wt")

    current_program: str | None = None

    while line := old.readline():
        # screen erase
        line = re.sub(r"DISPLAY ?\(.*\) ?ERASE", "DISPLAY \" \" AT 0101 ERASE EOS", line)

        # Display line and col
        ## Multiline Display
        if re.search(r"DISPLAY ?\(.*\)\n", line):
            line = line + old.readline().lstrip()

        line = re.sub(r"DISPLAY ?\((.*)\) ?\n?(.*)\.", r"DISPLAY \2 AT \1.", line)
        line = re.sub(r"DISPLAY ?\((.*)\) ?\n?(.*)", r"DISPLAY \2 AT \1.", line)
        
        # Display cannot show multiple values
        if match := re.search(r"DISPLAY ? \"(.*)\" (.*) AT (.*) (.*)\.", line):
            #new.write(f"DISPLAY \"{match[1]}\" AT {match[3]}")
            a = (f"           DISPLAY \"{match[1]}\" AT {match[3]} {match[4]}.\n")
            a = re.sub(r"AT (\d\d) (\d\d)", r"AT \1\2", a)
            a = re.sub(r"AT (\d\d) (\d)", r"AT \g<1>0\2", a)
            a = re.sub(r"AT (\d) (\d\d)", r"AT 0\1\2", a)
            a = re.sub(r"AT (\d) (\d)", r"AT 0\g<1>0\2", a)
            new.write(a)
            line = (f"           DISPLAY {match[2]} AT {match[3]} {int(match[4])+ 1 +len(match[1])}.\n")

        # Accept line and col
        line = re.sub(r"ACCEPT (\w+)", r"ACCEPT \1 AT 0201", line) # To avoid overwriting
        line = re.sub(r"ACCEPT ?\((.*)\) ?(.*)\.", r"ACCEPT \2 AT \1.", line)

 

        # At llcc
        line = re.sub(r"AT (\d\d) (\d\d)", r"AT \1\2", line)
        line = re.sub(r"AT (\d\d) (\d)", r"AT \g<1>0\2", line)
        line = re.sub(r"AT (\d) (\d\d)", r"AT 0\1\2", line)
        line = re.sub(r"AT (\d) (\d)", r"AT 0\g<1>0\2", line)

        # end program
        if line.lstrip().startswith("IDENTIFICATION DIVISION."):
            if current_program is not None:
                new.write(f"       END PROGRAM {current_program}")
                current_program = None
        elif line.lstrip().startswith("PROGRAM-ID."):
            current_program = line.lstrip().split(' ')[1]

        new.write(line)

    if current_program is not None:
        new.write(f"       END PROGRAM {current_program}")






def second_try():
    old = open("old.cbl")
    new = open("out.cbl", "wt")

    current_program: str | None = None
    while line := old.readline():
        # screen erase
        line = re.sub(r"DISPLAY ?\(.*\) ?ERASE", "DISPLAY \" \" AT 0101 ERASE EOS", line)
        
        # Accept to avoid overwriting
        line = re.sub(r"ACCEPT (\w+)", r"ACCEPT \1 AT 0201", line) 
        
        # end program
        if line.lstrip().startswith("IDENTIFICATION DIVISION."):
            if current_program is not None:
                new.write(f"       END PROGRAM {current_program}")
                current_program = None
        elif line.lstrip().startswith("PROGRAM-ID."):
            current_program = line.lstrip().split(' ')[1]

        new.write(line)

    if current_program is not None:
        new.write(f"       END PROGRAM {current_program}")

def first_try():
    old = open("old.cbl")
    new = open("out.cbl", "wt")

    current_program: str | None = None

    while line := old.readline():
        # screen erase
        line = re.sub(r"DISPLAY ?\(.*\) ?ERASE", "DISPLAY \" \" AT 0101 ERASE EOS", line)

        # Display line and col
        ## Multiline Display
        if re.search(r"DISPLAY ?\(.*\)\n", line):
            line = line + old.readline().lstrip()

        line = re.sub(r"DISPLAY ?\((.*)\) ?\n?(.*)\.", r"DISPLAY \2 AT \1.", line)
        line = re.sub(r"DISPLAY ?\((.*)\) ?\n?(.*)", r"DISPLAY \2 AT \1.", line)



        # Accept line and col
        line = re.sub(r"ACCEPT (\w+)", r"ACCEPT \1 AT 0201", line) # To avoid overwriting
        line = re.sub(r"ACCEPT ?\((.*)\) ?(.*)\.", r"ACCEPT \2 AT \1.", line)

        # At llcc
        line = re.sub(r"AT (\d\d) (\d\d)", r"AT \1\2", line)
        line = re.sub(r"AT (\d\d) (\d)", r"AT \g<1>0\2", line)
        line = re.sub(r"AT (\d) (\d\d)", r"AT 0\1\2", line)
        line = re.sub(r"AT (\d) (\d)", r"AT 0\g<1>0\2", line)

        # end program
        if line.lstrip().startswith("IDENTIFICATION DIVISION."):
            if current_program is not None:
                new.write(f"       END PROGRAM {current_program}")
                current_program = None
        elif line.lstrip().startswith("PROGRAM-ID."):
            current_program = line.lstrip().split(' ')[1]

        new.write(line)

    if current_program is not None:
        new.write(f"       END PROGRAM {current_program}")




third_try()
    