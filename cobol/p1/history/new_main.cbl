       IDENTIFICATION DIVISION.
       PROGRAM-ID. MAINHRMS.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77 CHOICE PIC 9.

       PROCEDURE DIVISION.
       MAIN-PARA.
           DISPLAY ERASE.
           DISPLAY "*******************************************" AT 0315.
           DISPLAY "     HUMAN RESOURCE MANAGEMENT SYSTEM      " AT 0515.
           DISPLAY "*******************************************" AT 0715.
           DISPLAY "1. HRMS WRITE" AT 1025.
           DISPLAY "2. HRMS READ" AT 1225.
           DISPLAY "3. EXIT" AT 1425.
           DISPLAY "ENTER YOUR CHOICE :" AT 1625.
           ACCEPT CHOICE AT 1646.
           IF CHOICE = 1
              CALL "EMPWRITE"
              CANCEL "EMPWRITE"
              GO TO MAIN-PARA
           ELSE
             IF CHOICE = 2
                CALL "EMPREAD"
                CANCEL "EMPREAD"
                GO TO MAIN-PARA
             ELSE
                STOP RUN.
       END PROGRAM MAINHRMS.

       IDENTIFICATION DIVISION.
       PROGRAM-ID. EMPREAD.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT EMPFILE ASSIGN TO DISK
           ORGANIZATION IS INDEXED
           ACCESS MODE IS DYNAMIC
           RECORD KEY IS EEMPID
           FILE STATUS IS FSE.

           SELECT LEAVEFILE ASSIGN TO DISK
           ORGANIZATION IS INDEXED
           ACCESS MODE IS DYNAMIC
           RECORD KEY IS LEMPID
           FILE STATUS IS FSL.

           SELECT BRANCHFILE ASSIGN TO DISK
           ORGANIZATION IS INDEXED
           ACCESS MODE IS DYNAMIC
           RECORD KEY IS BBRID
           FILE STATUS IS FSB.

           SELECT DESIGNATIONFILE ASSIGN TO DISK
           ORGANIZATION IS SEQUENTIAL
           ACCESS MODE IS SEQUENTIAL
           FILE STATUS IS FSDES.

           SELECT DEPARTMENTFILE ASSIGN TO DISK
           ORGANIZATION IS INDEXED
           ACCESS MODE IS DYNAMIC
           RECORD KEY IS DEPCODE
           FILE STATUS IS FSDEP.

           SELECT REVISIONFILE ASSIGN TO DISK
           ORGANIZATION IS INDEXED
           ACCESS MODE IS DYNAMIC
           RECORD KEY IS RREVID
           ALTERNATE RECORD KEY IS REMPID
           FILE STATUS IS FSR.

           SELECT PAYMENTFILE ASSIGN TO DISK
           ORGANIZATION IS INDEXED
           ACCESS MODE IS DYNAMIC
           RECORD KEY IS PEMPID
           FILE STATUS IS FSP.

           SELECT CONFIRMATIONFILE ASSIGN TO DISK
           ORGANIZATION IS INDEXED
           ACCESS MODE IS DYNAMIC
           RECORD KEY IS CCONID
           ALTERNATE RECORD KEY IS CEMPID
           FILE STATUS IS FSC.

           SELECT GRADEFILE ASSIGN TO DISK
           ORGANIZATION IS SEQUENTIAL
           ACCESS MODE IS SEQUENTIAL
           FILE STATUS IS FSG.

           SELECT TRANSFERFILE ASSIGN TO DISK
           ORGANIZATION IS INDEXED
           ACCESS MODE IS DYNAMIC
           RECORD KEY IS TTRFID
           FILE STATUS IS FST.

           SELECT EMPPERSONALFILE ASSIGN TO DISK
           ORGANIZATION IS INDEXED
           ACCESS MODE IS DYNAMIC
           RECORD KEY IS EPEMPID
           FILE STATUS IS FSEP.

       DATA DIVISION.
       FILE SECTION.
       FD EMPFILE
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "EMP.DAT".
       01 EMPREC.
           02 EEMPID    PIC X(6).
           02 EEMPNAME  PIC X(25).
           02 EEMPADDR  PIC X(30).
           02 EPHONE    PIC X(10).
           02 EDOJ      PIC X(10).
           02 EDIP      PIC X(10).
           02 EUG       PIC X(4).
           02 EPG       PIC X(4).
           02 EPROFQ    PIC X(4).
           02 ESKILL    PIC X(10).
           02 EGRDNO    PIC 99.
           02 EBRNID    PIC X(6).
           02 EDESID    PIC X(6).

       FD LEAVEFILE
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "LEAVE.DAT".
       01 LEAVEREC.
           02 LEMPID    PIC X(6).
           02 LFMDATE   PIC X(10).
           02 LTODATE   PIC X(10).
           02 LLEVCAT   PIC X(3).

       FD BRANCHFILE
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "BRANCH.DAT".
       01 BRANCHREC.
           02 BBRID    PIC X(6).
           02 BBRNAME  PIC X(15).
           02 BBRADD   PIC X(30).
           02 BBRPH    PIC X(10).
           02 BEMAIL   PIC X(20).
           02 BMGRNAME PIC X(25).

       FD DESIGNATIONFILE
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "DESIG.DAT".
       01 DESIGNATIONREC.
           02 DESID    PIC X(6).
           02 DESIGN   PIC X(15).
           02 DESHRT   PIC X(4).

       FD DEPARTMENTFILE
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "DEPART.DAT".
       01 DEPARTMENTREC.
           02 DEPCODE  PIC X(6).
           02 DEPNAME  PIC X(20).

       FD REVISIONFILE
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "REVISION.DAT".
       01 REVISIONREC.
           02 RREVID   PIC X(6).
           02 REMPID   PIC X(6).
           02 RDESCODE PIC X(6).
           02 RBASIC   PIC 9(6)V99.
           02 RHRA     PIC 9(6)V99.
           02 RDPA     PIC 9(6)V99.
           02 RPPA     PIC 9(6)V99.
           02 REDUA    PIC 9(6)V99.
           02 RTECHJR  PIC 9(6)V99.
           02 RLUNCHA  PIC 9(6)V99.
           02 RCONVEY  PIC 9(6)V99.
           02 RBUSATR  PIC 9(6)V99.
           02 RLTA     PIC 9(6)V99.
           02 RPF      PIC 9(6)V99.
           02 RESI     PIC 9(6)V99.
           02 RREVDATE PIC X(10).

       FD PAYMENTFILE
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "PAYMENT.DAT".
       01 PAYMENTREC.
           02 PEMPID   PIC X(6).
           02 PBASIC   PIC 9(6)V99.
           02 PDA      PIC 9(6)V99.
           02 PCCA     PIC 9(6)V99.
           02 PHRA     PIC 9(6)V99.
           02 PDPA     PIC 9(6)V99.
           02 PPPA     PIC 9(6)V99.
           02 PEDUA    PIC 9(6)V99.
           02 PTECHJR  PIC 9(6)V99.
           02 PLUNCHA  PIC 9(6)V99.
           02 PCONVEY  PIC 9(6)V99.
           02 PBUSATR  PIC 9(6)V99.
           02 PLTA     PIC 9(6)V99.
           02 PPF      PIC 9(6)V99.
           02 PESI     PIC 9(6)V99.
           02 PGRTY    PIC 9(6)V99.
           02 PPTAX    PIC 9(6)V99.
           02 PITAX    PIC 9(6)V99.
           02 PLOAN    PIC 9(8)V99.
           02 PLOANDA  PIC 9(8)V99.
           02 POTHERD  PIC 9(6)V99.
           02 PPERINC  PIC 9(6)V99.
           02 PMEDI    PIC 9(6)V99.
           02 PBOOK    PIC 9(6)V99.
           02 PENTER   PIC 9(6)V99.
           02 PTPH     PIC 9(6)V99.
           02 PHOUSE   PIC 9(6)V99.
           02 PVEHMAN  PIC 9(6)V99.
           02 PCREDIT  PIC 9(6)V99.
           02 PCLUB    PIC 9(6)V99.
           02 PCL      PIC 99.
           02 PSL      PIC 99.
           02 PPL      PIC 99.
           02 PLLOP    PIC 999.
           02 POTHERL  PIC 999.

       FD CONFIRMATIONFILE
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "CONFIRM.DAT".
       01 CONFIRMATIONREC.
           02 CCONID   PIC X(6).
           02 CEMPID   PIC X(6).
           02 CCDATE   PIC X(6).

       FD GRADEFILE
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "GRADE.DAT".
       01 GRADEREC.
           02 GGRADE   PIC 99.
           02 GDESIGN  PIC X(25).

       FD TRANSFERFILE
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "TRANSFER.DAT".
       01 TRANSFERREC.
           02 TTRFID   PIC X(6).
           02 TEMPID   PIC X(6).
           02 TOBRID   PIC X(6).
           02 TTRFDT   PIC X(10).

       FD EMPPERSONALFILE
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "EMPPER.DAT".
       01 EMPPERSONALREC.
           02 EPEMPID  PIC X(6).
           02 EPTADD   PIC X(30).
           02 EPTPH    PIC X(10).
           02 EPDOB    PIC X(10).
           02 EPPOB    PIC X(10).
           02 EPLANG   PIC X(15).
           02 EPBLOOD  PIC X(4).
           02 EPWEIGHT PIC 999.
           02 EPHEIGHT PIC 999.
           02 EPVISION PIC X(15).
           02 EPFATHER PIC X(25).
           02 EPDOBF   PIC X(10).
           02 EPMOTHER PIC X(25).
           02 EPDOBM   PIC X(10).
           02 EPSPOUSE PIC X(25).
           02 EPCHILD  PIC X(25).
           02 EPDOBC   PIC X(10).

       WORKING-STORAGE SECTION.
       77 FSE   PIC XX.
       77 FSL   PIC XX.
       77 FSB   PIC XX.
       77 FSDES PIC XX.
       77 FSDEP PIC XX.
       77 FSR   PIC XX.
       77 FSP   PIC XX.
       77 FSC   PIC XX.
       77 FSG   PIC XX.
       77 FST   PIC XX.
       77 FSEP  PIC XX.
       77 DES   PIC X(6).
       77 GR    PIC 99.
       77 CHOICE PIC 99.

       PROCEDURE DIVISION.
       MAIN-PARA.
           DISPLAY  ERASE.
           DISPLAY  
           "*******************************************" AT 0310.
           DISPLAY  
           "     HUMAN RESOURCE MANAGEMENT SYSTEM      " AT 0510.
           DISPLAY  
           "*******************************************" AT 0710.
           DISPLAY  " 1. EMPLOYEE FILE" AT 1105.
           DISPLAY  " 2. LEAVE FILE" AT 1205.
           DISPLAY  " 3. BRANCH FILE" AT 1305.
           DISPLAY  " 4. DESIGNATION FILE" AT 1405.
           DISPLAY  " 5. DEPARTMENT FILE" AT 1505.
           DISPLAY  " 6. REVISION FILE" AT 1605.
           DISPLAY  " 7. PAYMENT FILE" AT 1705.
           DISPLAY  " 8. CONFIRMATION FILE" AT 1805.
           DISPLAY  " 9. GRADE FILE" AT 1905.
           DISPLAY  "10. TRANSFER FILE" AT 2005.
           DISPLAY  "11. EMPLOYEE PERSONAL FILE" AT 2105.
           DISPLAY  "12. EXIT" AT 2205.
           DISPLAY  "ENTER U R CHOICE :" AT 2325.
           ACCEPT CHOICE AT 2345.
           IF CHOICE = 1
              GO TO EMP-PARA
           ELSE
             IF CHOICE = 2
                GO TO LEAVE-PARA
             ELSE
               IF CHOICE = 3
                  GO TO BRANCH-PARA
               ELSE
                 IF CHOICE = 4
                    GO TO DESIGNATION-PARA
                 ELSE
                   IF CHOICE = 5
                      GO TO DEPARTMENT-PARA
                   ELSE
                     IF CHOICE = 6
                        GO TO REVISION-PARA
                     ELSE
                       IF CHOICE = 7
                          GO TO PAYMENT-PARA
                       ELSE
                          IF CHOICE = 8
                             GO TO CONFIRMATION-PARA
                          ELSE
                            IF CHOICE = 9
                               GO TO GRADE-PARA
                            ELSE
                              IF CHOICE = 10
                                 GO TO TRANSFER-PARA
                              ELSE
                                IF CHOICE = 11
                                   GO TO EMPPERSONAL-PARA
                                 ELSE
                                   EXIT PROGRAM.

       EMP-PARA.
           DISPLAY  ERASE.
           OPEN INPUT EMPFILE.
           DISPLAY "ENTER CODE :".
           ACCEPT EEMPID.
           DISPLAY  ERASE.
           READ EMPFILE INVALID KEY GO TO ERROR-EMP-PARA.
           DISPLAY  " CODE                 :" EEMPID AT 0101.
           DISPLAY  " NAME                 :" EEMPNAME AT 0201.
           DISPLAY  " ADDRESS              :" EEMPADDR AT 0301.
           DISPLAY  " PHONE                :" EPHONE AT 0401.
           DISPLAY  " DATE OF JOIN         :" EDOJ AT 0501.
           DISPLAY  " DIPLOMA              :" EDIP AT 0601.
           DISPLAY  " UG                   :" EUG AT 0701.
           DISPLAY  " PG                   :" EPG AT 0801.
           DISPLAY  " PROFESSIONAL QUALITY :" EPROFQ AT 0901.
           DISPLAY " SKILL SET            :" ESKILL AT 1001.
           DISPLAY " GRADE NUMBER         :" EGRDNO AT 1101.
           DISPLAY " BRANCH CODE          :" EBRNID AT 1201.
           DISPLAY " DESIGNATION CODE     :" EDESID AT 1301.
           CLOSE EMPFILE.
           DISPLAY(20 10)
             "PRESS ENTER TO RETURN TO HRMS READ MENU".
           STOP ' '.
           GO TO MAIN-PARA.

       LEAVE-PARA.
           DISPLAY  ERASE.
           OPEN INPUT LEAVEFILE.
           DISPLAY "ENTER CODE :".
           ACCEPT LEMPID.
           DISPLAY  ERASE.
           READ LEAVEFILE INVALID KEY GO TO ERROR-LEAVE-PARA.
           DISPLAY  " CODE           :" LEMPID AT 0101.
           DISPLAY  " DATE           :" LFMDATE AT 0201.
           DISPLAY  " DATE           :" LTODATE AT 0301.
           DISPLAY  " LEAVE CATEGORY :" LLEVCAT AT 0401.
           CLOSE LEAVEFILE.
           DISPLAY(20 10)
             "PRESS ENTER TO RETURN TO HRMS READ MENU".
           STOP ' '.
           GO TO MAIN-PARA.

        BRANCH-PARA.
           DISPLAY  ERASE.
           OPEN INPUT BRANCHFILE.
           DISPLAY " BRANCH CODE :".
           ACCEPT BBRID.
           DISPLAY  ERASE.
           READ BRANCHFILE INVALID KEY GO TO ERROR-BRANCH-PARA.
           DISPLAY  " BRANCH CODE    :" BBRID AT 0101.
           DISPLAY  " BRANCH NAME    :" BBRNAME AT 0201.
           DISPLAY  " BRANCH ADDRESS :" BBRADD AT 0301.
           DISPLAY  " PHONE          :" BBRPH AT 0401.
           DISPLAY  " E-MAIL         :" BEMAIL  AT 0501.
           DISPLAY  " MANAGER NAME   :" BMGRNAME AT 0501.
           CLOSE BRANCHFILE.
           DISPLAY(20 10)
             "PRESS ENTER TO RETURN TO HRMS READ MENU".
           STOP ' '.
           GO TO MAIN-PARA.

       DESIGNATION-PARA.
           DISPLAY  ERASE.
           OPEN INPUT DESIGNATIONFILE.
           DISPLAY "ENTER THE DESIGNATION CODE :".
           ACCEPT DES.
           DISPLAY  ERASE.
           PERFORM DES-READ-PARA UNTIL FSDES = 10.
       DES-READ-PARA.
           READ DESIGNATIONFILE AT END GO TO DES-EXIT-PARA.
           IF DESID = DES
           DISPLAY(1 1) " DESIGNATION CODE     :" DESID
           DISPLAY(2 1) " DESIGNATION          :" DESIGN
           DISPLAY  " DESIGNATION IN SHORT :" DESHRT AT 0301.
       DES-EXIT-PARA.
           CLOSE DESIGNATIONFILE.
           DISPLAY ' '.
           DISPLAY ' '.
           DISPLAY "PRESS ENTER TO RETURN TO HRMS READ MENU".
           STOP ' '.
           GO TO MAIN-PARA.

       DEPARTMENT-PARA.
           DISPLAY  ERASE.
           OPEN INPUT DEPARTMENTFILE.
           DISPLAY "ENTER DEP CODE :".
           ACCEPT DEPCODE.
           DISPLAY  ERASE.
           READ DEPARTMENTFILE INVALID KEY
                     GO TO ERROR-DEPARTMENT-PARA.
           DISPLAY  " DEPARTMENT CODE :" DEPCODE AT 0101.
           DISPLAY  " DEPARTMENT NAME :" DEPNAME AT 0201.
           CLOSE DEPARTMENTFILE.
           DISPLAY(20 10)
             "PRESS ENTER TO RETURN TO HRMS READ MENU".
           STOP ' '.
           GO TO MAIN-PARA.

       REVISION-PARA.
           DISPLAY  ERASE.
           OPEN INPUT REVISIONFILE.
           DISPLAY "ENTER REVISION CODE:".
           ACCEPT RREVID.
           DISPLAY  ERASE.
           READ REVISIONFILE INVALID KEY
                    GO TO ERROR-REVISION-PARA.
           DISPLAY  " REVISION CODE           :" RREVID AT 0101.
           DISPLAY  " EMPLOYEE CODE           :" REMPID AT 0201.
           DISPLAY  " DESIGNATION CODE        :" RDESCODE AT 0301.
           DISPLAY  " BASIC                   :" RBASIC AT 0401.
           DISPLAY  " HRA                     :" RHRA AT 0501.
           DISPLAY  " DPA                     :" RDPA AT 0601.
           DISPLAY  " PPA                     :" RPPA AT 0701.
           DISPLAY  " EDUCATIONAL ALLOWANCE   :" REDUA AT 0801.
           DISPLAY  " TECHNICAL JOURNAL       :" RTECHJR AT 0901.
           DISPLAY  " LUNCH ALLOWANCE        :" RLUNCHA AT 1001.
           DISPLAY  " CONVEYANCE             :" RCONVEY AT 1101.
           DISPLAY  " BUSINESS ATTIREMENT    :" RBUSATR AT 1201.
           DISPLAY  " LEAVE TRAVEL ALLOWANCE :" RLTA AT 1301.
           DISPLAY  " PF                     :" RPF AT 1401.
           DISPLAY  " ESI                    :" RESI AT 1501.
           DISPLAY  " REVISED DATE           :" RREVDATE AT 1601.
           CLOSE REVISIONFILE.
           DISPLAY(20 10)
             "PRESS ENTER TO RETURN TO HRMS READ MENU".
           STOP ' '.
           GO TO MAIN-PARA.

       PAYMENT-PARA.
           DISPLAY  ERASE.
           OPEN INPUT PAYMENTFILE.
           DISPLAY "ENTER EMP CODE :".
           ACCEPT PEMPID.
           DISPLAY  ERASE.
           READ PAYMENTFILE INVALID KEY GO TO ERROR-PAYMENT-PARA.
           DISPLAY  " EMPLOYEE CODE                  :" PEMPID AT 0101.
           DISPLAY  " BASIC                          :" PBASIC AT 0201.
           DISPLAY  " DEARNESS ALLOWANCE             :" PDA AT 0301.
           DISPLAY  " CITY COMPENSATORY ALLOWANCE    :" PCCA AT 0401.
           DISPLAY  " HRA                            :" PHRA AT 0501.
           DISPLAY  " DPA                            :" PDPA AT 0601.
           DISPLAY  " PPA                            :" PPPA AT 0701.
           DISPLAY  " EDUCATIONAL ALLOWANCE          :" PEDUA AT 0801.
           DISPLAY  " TECHNICAL JOURNAL              :" PTECHJR AT 0901.
           DISPLAY  " LUNCH ALLOWANCE               :" PLUNCHA AT 1001.
           DISPLAY  " CONVEYANCE                    :" PCONVEY AT 1101.
           DISPLAY  " BUSINESS ATTIREMENT           :" PBUSATR AT 1201.
           DISPLAY  " LEAVE TRAVEL ALLOWANCE        :" PLTA AT 1301.
           DISPLAY  " PF                            :" PPF AT 1401.
           DISPLAY  " ESI                           :" PESI AT 1501.
           DISPLAY  " GRATUITY                      :" PGRTY AT 1601.
           DISPLAY  " PROFESSIONAL TAX              :" PPTAX AT 1701.
           DISPLAY  " INCOME TAX                    :" PITAX AT 1801.
           DISPLAY  " LOAN                          :" PLOAN AT 1901.
           DISPLAY  " LOAN DEDUCTION AMOUNT         :" PLOANDA AT 2001.
           DISPLAY  " OTHER DEDUCTION               :" POTHERD AT 2101.
           DISPLAY  " PERFORMANCE INCENTIVE         :" PPERINC AT 2201.
           DISPLAY  " MEDICAL REIMBURSEMENT         :" PMEDI AT 2301.
           DISPLAY  " BOOK REIMBURSEMENT            :" PBOOK AT 2401.
           DISPLAY  ERASE.
           DISPLAY  " ENTERTAINMENT                  :" PENTER AT 0101.
           DISPLAY  " PHONE                          :" PTPH AT 0201.
           DISPLAY  " HOUSE RELATED                  :" PHOUSE AT 0301.
           DISPLAY  " VEHICLE MAINTENANCE            :" PVEHMAN AT 0401.
           DISPLAY  " CREDIT CARD                    :" PCREDIT AT 0501.
           DISPLAY  " CLUB                           :" PCLUB AT 0601.
           DISPLAY  " CASUAL LEAVE                   :" PCL AT 0701.
           DISPLAY  " SICK LEAVE                     :" PSL AT 0801.
           DISPLAY(9 1) " PAID LEAVE                     :" PPL
           DISPLAY  " LEAVE LOSS OF PAY             :" PLLOP AT 1001.
           DISPLAY  " OTHER LEAVES                  :" POTHERL AT 1101.
           CLOSE PAYMENTFILE.
           DISPLAY(20 10)
             "PRESS ENTER TO RETURN TO HRMS READ MENU".
           STOP ' '.
           GO TO MAIN-PARA.

       CONFIRMATION-PARA.
           DISPLAY  ERASE.
           OPEN INPUT CONFIRMATIONFILE.
           DISPLAY "ENTER CODE :".
           ACCEPT CCONID.
           DISPLAY  ERASE.
           READ CONFIRMATIONFILE INVALID KEY
                   GO TO ERROR-CONFIRMATION-PARA.
           DISPLAY  " CONFIRMATION CODE :" CCONID AT 0101.
           DISPLAY  " EMPLOYEE CODE     :" CEMPID AT 0201.
           DISPLAY  " CONFIRMATION DATE :" CCDATE AT 0301.
           CLOSE CONFIRMATIONFILE.
           DISPLAY(20 10)
             "PRESS ENTER TO RETURN TO HRMS READ MENU".
           STOP ' '.
           GO TO MAIN-PARA.

       GRADE-PARA.
           DISPLAY  ERASE.
           OPEN INPUT GRADEFILE.
           DISPLAY "ENTER GRADE NO. :".
           ACCEPT GR.
           DISPLAY  ERASE.
           PERFORM GR-READ-PARA UNTIL FSG = 10.
       GR-READ-PARA.
           READ GRADEFILE AT END GO TO GR-EXIT-PARA.
           IF GGRADE = GR
           DISPLAY  " GRADE NO.   :" GGRADE AT 0101.
           DISPLAY  " DESIGNATION :" GDESIGN AT 0201.
       GR-EXIT-PARA.
           CLOSE GRADEFILE.
           DISPLAY ' '.
           DISPLAY ' '.
           DISPLAY "PRESS ENTER TO RETURN TO HRMS READ MENU".
           STOP ' '.
           GO TO MAIN-PARA.

       TRANSFER-PARA.
           DISPLAY  ERASE.
           OPEN INPUT TRANSFERFILE.
           DISPLAY "ENTER TRANSFER CODE :".
           ACCEPT TTRFID.
           DISPLAY  ERASE.
           READ TRANSFERFILE INVALID KEY GO TO ERROR-TRANSFER-PARA.
           DISPLAY  " TRANSFER CODE     :" TTRFID AT 0101.
           DISPLAY  " EMP CODE          :" TEMPID AT 0201.
           DISPLAY  " OLD BRANCH CODE   :" TOBRID AT 0301.
           DISPLAY  " TRANSFER DATE     :" TTRFDT AT 0401.
           CLOSE TRANSFERFILE.
           DISPLAY(20 10)
             "PRESS ENTER TO RETURN TO HRMS READ MENU".
           STOP ' '.
           GO TO MAIN-PARA.

       EMPPERSONAL-PARA.
           DISPLAY  ERASE.
           OPEN INPUT EMPPERSONALFILE.
           DISPLAY "ENTER EMP CODE :".
           ACCEPT EPEMPID.
           DISPLAY  ERASE.
           READ EMPPERSONALFILE INVALID KEY
                           GO TO ERROR-EMPPERSONAL-PARA.
           DISPLAY  " EMPLOYEE CODE     :" EPEMPID AT 0101.
           DISPLAY  " TEMPORARY ADDRESS :" EPTADD AT 0201.
           DISPLAY  " PHONE             :" EPTPH AT 0301.
           DISPLAY  " DOB               :" EPDOB AT 0401.
           DISPLAY  " POB               :" EPPOB AT 0501.
           DISPLAY  " LANGUAGE KNOWN    :" EPLANG AT 0601.
           DISPLAY  " BLOOD GROUP       :" EPBLOOD AT 0701.
           DISPLAY  " WEIGHT            :" EPWEIGHT AT 0801.
           DISPLAY  " HEIGHT            :" EPHEIGHT AT 0901.
           DISPLAY  " VISION           :" EPVISION AT 1001.
           DISPLAY  " FATHER'S NAME    :" EPFATHER AT 1101.
           DISPLAY  " DOB OF FATHER    :" EPDOBF AT 1201.
           DISPLAY  " MOTHER'S NAME    :" EPMOTHER AT 1301.
           DISPLAY  " DOB OF MOTHER    :" EPDOBM AT 1401.
           DISPLAY  " SPOUSE NAME      :" EPSPOUSE AT 1501.
           DISPLAY  " CHILD NAME       :" EPCHILD AT 1601.
           DISPLAY  " DOB OF CHILD     :" EPDOBC AT 1701.
           CLOSE EMPPERSONALFILE.
           DISPLAY(20 10)
             "PRESS ENTER TO RETURN TO HRMS READ MENU".
           STOP ' '.
           GO TO MAIN-PARA.

       ERROR-EMP-PARA.
           CLOSE EMPFILE.
           DISPLAY  ERASE.
           DISPLAY  "INVALID CODE" AT 1230.
           DISPLAY(20 10)
             "PRESS ENTER TO RETURN TO HRMS READ MENU".
           STOP ' '.
           GO TO MAIN-PARA.

       ERROR-LEAVE-PARA.
           CLOSE LEAVEFILE.
           DISPLAY  ERASE.
           DISPLAY  "INVALID CODE" AT 1230.
           DISPLAY(20 10)
             "PRESS ENTER TO RETURN TO HRMS READ MENU".
           STOP ' '.
           GO TO MAIN-PARA.

       ERROR-BRANCH-PARA.
           CLOSE BRANCHFILE.
           DISPLAY  ERASE.
           DISPLAY  "INVALID CODE" AT 1230.
           DISPLAY(20 10)
             "PRESS ENTER TO RETURN TO HRMS READ MENU".
           STOP ' '.
           GO TO MAIN-PARA.

       ERROR-DEPARTMENT-PARA.
           CLOSE DEPARTMENTFILE.
           DISPLAY  ERASE.
           DISPLAY  "INVALID CODE" AT 1230.
           DISPLAY(20 10)
             "PRESS ENTER TO RETURN TO HRMS READ MENU".
           STOP ' '.
           GO TO MAIN-PARA.

       ERROR-REVISION-PARA.
           CLOSE REVISIONFILE.
           DISPLAY  ERASE.
           DISPLAY  "INVALID CODE" AT 1230.
           DISPLAY(20 10)
             "PRESS ENTER TO RETURN TO HRMS READ MENU".
           STOP ' '.
           GO TO MAIN-PARA.

       ERROR-PAYMENT-PARA.
           CLOSE PAYMENTFILE.
           DISPLAY  ERASE.
           DISPLAY  "INVALID CODE" AT 1230.
           DISPLAY(20 10)
             "PRESS ENTER TO RETURN TO HRMS READ MENU".
           STOP ' '.
           GO TO MAIN-PARA.

       ERROR-CONFIRMATION-PARA.
           CLOSE CONFIRMATIONFILE.
           DISPLAY  ERASE.
           DISPLAY  "INVALID CODE" AT 1230.
           DISPLAY(20 10)
             "PRESS ENTER TO RETURN TO HRMS READ MENU".
           STOP ' '.
           GO TO MAIN-PARA.

       ERROR-TRANSFER-PARA.
           CLOSE TRANSFERFILE.
           DISPLAY  ERASE.
           DISPLAY  "INVALID CODE" AT 1230.
           DISPLAY(20 10)
             "PRESS ENTER TO RETURN TO HRMS READ MENU".
           STOP ' '.
           GO TO MAIN-PARA.

       ERROR-EMPPERSONAL-PARA.
           CLOSE EMPPERSONALFILE.
           DISPLAY  ERASE.
           DISPLAY  "INVALID CODE" AT 1230.
           DISPLAY(20 10)
             "PRESS ENTER TO RETURN TO HRMS READ MENU".
           STOP ' '.
           GO TO MAIN-PARA.
       END PROGRAM EMPREAD.
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EMPWRITE.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT EMPFILE ASSIGN TO DISK
           ORGANIZATION IS INDEXED
           ACCESS MODE IS DYNAMIC
           RECORD KEY IS EEMPID
           FILE STATUS IS FSO.

           SELECT LEAVEFILE ASSIGN TO DISK
           ORGANIZATION IS INDEXED
           ACCESS MODE IS DYNAMIC
           RECORD KEY IS LEMPID
           FILE STATUS IS FSL.

           SELECT BRANCHFILE ASSIGN TO DISK
           ORGANIZATION IS INDEXED
           ACCESS MODE IS DYNAMIC
           RECORD KEY IS BBRID
           FILE STATUS IS FSB.

           SELECT DESIGNATIONFILE ASSIGN TO DISK
           ORGANIZATION IS SEQUENTIAL
           ACCESS MODE IS SEQUENTIAL
           FILE STATUS IS FSDES.

           SELECT DEPARTMENTFILE ASSIGN TO DISK
           ORGANIZATION IS INDEXED
           ACCESS MODE IS DYNAMIC
           RECORD KEY IS DEPCODE
           FILE STATUS IS FSDEP.

           SELECT REVISIONFILE ASSIGN TO DISK
           ORGANIZATION IS INDEXED
           ACCESS MODE IS DYNAMIC
           RECORD KEY IS RREVID
           ALTERNATE RECORD KEY IS REMPID
           FILE STATUS IS FSR.

           SELECT PAYMENTFILE ASSIGN TO DISK
           ORGANIZATION IS INDEXED
           ACCESS MODE IS DYNAMIC
           RECORD KEY IS PEMPID
           FILE STATUS IS FSP.

           SELECT CONFIRMATIONFILE ASSIGN TO DISK
           ORGANIZATION IS INDEXED
           ACCESS MODE IS DYNAMIC
           RECORD KEY IS CCONID
           ALTERNATE RECORD KEY IS CEMPID
           FILE STATUS IS FSC.

           SELECT GRADEFILE ASSIGN TO DISK
           ORGANIZATION IS SEQUENTIAL
           ACCESS MODE IS SEQUENTIAL
           FILE STATUS IS FSG.

           SELECT TRANSFERFILE ASSIGN TO DISK
           ORGANIZATION IS INDEXED
           ACCESS MODE IS DYNAMIC
           RECORD KEY IS TTRFID
           FILE STATUS IS FST.

           SELECT EMPPERSONALFILE ASSIGN TO DISK
           ORGANIZATION IS INDEXED
           ACCESS MODE IS DYNAMIC
           RECORD KEY IS EPEMPID
           FILE STATUS IS FSEP.

       DATA DIVISION.
       FILE SECTION.
       FD EMPFILE
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "EMP.DAT".
       01 EMPREC.
           02 EEMPID    PIC X(6).
           02 EEMPNAME  PIC X(25).
           02 EEMPADDR  PIC X(30).
           02 EPHONE    PIC X(10).
           02 EDOJ      PIC X(10).
           02 EDIP      PIC X(10).
           02 EUG       PIC X(4).
           02 EPG       PIC X(4).
           02 EPROFQ    PIC X(4).
           02 ESKILL    PIC X(10).
           02 EGRDNO    PIC 99.
           02 EBRNID    PIC X(6).
           02 EDESID    PIC X(6).

       FD LEAVEFILE
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "LEAVE.DAT".
       01 LEAVEREC.
           02 LEMPID    PIC X(6).
           02 LFMDATE   PIC X(10).
           02 LTODATE   PIC X(10).
           02 LLEVCAT   PIC X(3).

       FD BRANCHFILE
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "BRANCH.DAT".
       01 BRANCHREC.
           02 BBRID    PIC X(6).
           02 BBRNAME  PIC X(15).
           02 BBRADD   PIC X(30).
           02 BBRPH    PIC X(10).
           02 BEMAIL   PIC X(20).
           02 BMGRNAME PIC X(25).

       FD DESIGNATIONFILE
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "DESIG.DAT".
       01 DESIGNATIONREC.
           02 DESID    PIC X(6).
           02 DESIGN   PIC X(15).
           02 DESHRT   PIC X(4).

       FD DEPARTMENTFILE
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "DEPART.DAT".
       01 DEPARTMENTREC.
           02 DEPCODE  PIC X(6).
           02 DEPNAME  PIC X(20).

       FD REVISIONFILE
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "REVISION.DAT".
       01 REVISIONREC.
           02 RREVID   PIC X(6).
           02 REMPID   PIC X(6).
           02 RDESCODE PIC X(6).
           02 RBASIC   PIC 9(6)V99.
           02 RHRA     PIC 9(6)V99.
           02 RDPA     PIC 9(6)V99.
           02 RPPA     PIC 9(6)V99.
           02 REDUA    PIC 9(6)V99.
           02 RTECHJR  PIC 9(6)V99.
           02 RLUNCHA  PIC 9(6)V99.
           02 RCONVEY  PIC 9(6)V99.
           02 RBUSATR  PIC 9(6)V99.
           02 RLTA     PIC 9(6)V99.
           02 RPF      PIC 9(6)V99.
           02 RESI     PIC 9(6)V99.
           02 RREVDATE PIC X(10).

       FD PAYMENTFILE
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "PAYMENT.DAT".
       01 PAYMENTREC.
           02 PEMPID   PIC X(6).
           02 PBASIC   PIC 9(6)V99.
           02 PDA      PIC 9(6)V99.
           02 PCCA     PIC 9(6)V99.
           02 PHRA     PIC 9(6)V99.
           02 PDPA     PIC 9(6)V99.
           02 PPPA     PIC 9(6)V99.
           02 PEDUA    PIC 9(6)V99.
           02 PTECHJR  PIC 9(6)V99.
           02 PLUNCHA  PIC 9(6)V99.
           02 PCONVEY  PIC 9(6)V99.
           02 PBUSATR  PIC 9(6)V99.
           02 PLTA     PIC 9(6)V99.
           02 PPF      PIC 9(6)V99.
           02 PESI     PIC 9(6)V99.
           02 PGRTY    PIC 9(6)V99.
           02 PPTAX    PIC 9(6)V99.
           02 PITAX    PIC 9(6)V99.
           02 PLOAN    PIC 9(8)V99.
           02 PLOANDA  PIC 9(8)V99.
           02 POTHERD  PIC 9(6)V99.
           02 PPERINC  PIC 9(6)V99.
           02 PMEDI    PIC 9(6)V99.
           02 PBOOK    PIC 9(6)V99.
           02 PENTER   PIC 9(6)V99.
           02 PTPH     PIC 9(6)V99.
           02 PHOUSE   PIC 9(6)V99.
           02 PVEHMAN  PIC 9(6)V99.
           02 PCREDIT  PIC 9(6)V99.
           02 PCLUB    PIC 9(6)V99.
           02 PCL      PIC 99.
           02 PSL      PIC 99.
           02 PPL      PIC 99.
           02 PLLOP    PIC 999.
           02 POTHERL  PIC 999.

       FD CONFIRMATIONFILE
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "CONFIRM.DAT".
       01 CONFIRMATIONREC.
           02 CCONID   PIC X(6).
           02 CEMPID   PIC X(6).
           02 CCDATE   PIC X(6).

       FD GRADEFILE
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "GRADE.DAT".
       01 GRADEREC.
           02 GGRADE   PIC 99.
           02 GDESIGN  PIC X(25).

       FD TRANSFERFILE
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "TRANSFER.DAT".
       01 TRANSFERREC.
           02 TTRFID   PIC X(6).
           02 TEMPID   PIC X(6).
           02 TOBRID   PIC X(6).
           02 TTRFDT   PIC X(10).

       FD EMPPERSONALFILE
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "EMPPER.DAT".
       01 EMPPERSONALREC.
           02 EPEMPID  PIC X(6).
           02 EPTADD   PIC X(30).
           02 EPTPH    PIC X(10).
           02 EPDOB    PIC X(10).
           02 EPPOB    PIC X(10).
           02 EPLANG   PIC X(15).
           02 EPBLOOD  PIC X(4).
           02 EPWEIGHT PIC 999.
           02 EPHEIGHT PIC 999.
           02 EPVISION PIC X(15).
           02 EPFATHER PIC X(25).
           02 EPDOBF   PIC X(10).
           02 EPMOTHER PIC X(25).
           02 EPDOBM   PIC X(10).
           02 EPSPOUSE PIC X(25).
           02 EPCHILD  PIC X(25).
           02 EPDOBC   PIC X(10).

       WORKING-STORAGE SECTION.
       77 FSO   PIC XX.
       77 FSL   PIC XX.
       77 FSB   PIC XX.
       77 FSDES PIC XX.
       77 FSDEP PIC XX.
       77 FSR   PIC XX.
       77 FSP   PIC XX.
       77 FSC   PIC XX.
       77 FSG   PIC XX.
       77 FST   PIC XX.
       77 FSEP  PIC XX.
       77 CHOICE PIC 99.

       PROCEDURE DIVISION.
       MAIN-PARA.
           DISPLAY  ERASE.
           DISPLAY  
           "*******************************************" AT 0310.
           DISPLAY  
           "     HUMAN RESOURCE MANAGEMENT SYSTEM      " AT 0510.
           DISPLAY  
           "*******************************************" AT 0710.
           DISPLAY  " 1. EMPLOYEE FILE" AT 1105.
           DISPLAY  " 2. LEAVE FILE" AT 1205.
           DISPLAY  " 3. BRANCH FILE" AT 1305.
           DISPLAY  " 4. DESIGNATION FILE" AT 1405.
           DISPLAY  " 5. DEPARTMENT FILE" AT 1505.
           DISPLAY  " 6. REVISION FILE" AT 1605.
           DISPLAY  " 7. PAYMENT FILE" AT 1705.
           DISPLAY  " 8. CONFIRMATION FILE" AT 1805.
           DISPLAY  " 9. GRADE FILE" AT 1905.
           DISPLAY  "10. TRANSFER FILE" AT 2005.
           DISPLAY  "11. EMPLOYEE PERSONAL FILE" AT 2105.
           DISPLAY  "12. EXIT" AT 2205.
           DISPLAY  "ENTER U R CHOICE :" AT 2325.
           ACCEPT(23 45) CHOICE.
           IF CHOICE = 1
              GO TO EMP-PARA
           ELSE
             IF CHOICE = 2
                GO TO LEAVE-PARA
             ELSE
               IF CHOICE = 3
                  GO TO BRANCH-PARA
               ELSE
                 IF CHOICE = 4
                    GO TO DESIGNATION-PARA
                 ELSE
                   IF CHOICE = 5
                      GO TO DEPARTMENT-PARA
                   ELSE
                     IF CHOICE = 6
                        GO TO REVISION-PARA
                     ELSE
                       IF CHOICE = 7
                          GO TO PAYMENT-PARA
                       ELSE
                          IF CHOICE = 8
                             GO TO CONFIRMATION-PARA
                          ELSE
                            IF CHOICE = 9
                               GO TO GRADE-PARA
                            ELSE
                              IF CHOICE = 10
                                 GO TO TRANSFER-PARA
                              ELSE
                                IF CHOICE = 11
                                   GO TO EMPPERSONAL-PARA
                                 ELSE
                                   EXIT PROGRAM.

       EMP-PARA.
           DISPLAY  ERASE.
           OPEN I-O EMPFILE.
           IF FSO = 30
              OPEN OUTPUT EMPFILE.
           DISPLAY  "ENTER CODE :" AT 0101.
           ACCEPT(1 35) EEMPID.
           DISPLAY  "ENTER NAME :" AT 0201.
           ACCEPT(2 35) EEMPNAME.
           DISPLAY  "ENTER ADDRESS :" AT 0301.
           ACCEPT(3 35) EEMPADDR.
           DISPLAY  "ENTER PHONE :" AT 0401.
           ACCEPT(4 35) EPHONE.
           DISPLAY  "ENTER DATE OF JOIN :" AT 0501.
           ACCEPT(5 35) EDOJ.
           DISPLAY  "ENTER DIPLOMA :" AT 0601.
           ACCEPT(6 35) EDIP.
           DISPLAY  "ENTER UG :" AT 0701.
           ACCEPT(7 35) EUG.
           DISPLAY  "ENTER PG :" AT 0801.
           ACCEPT(8 35) EPG.
           DISPLAY  "ENTER PROFESSIONAL QUALITY :" AT 0901.
           ACCEPT(9 35) EPROFQ.
           DISPLAY  "ENTER SKILL SET :" AT 1001.
           ACCEPT(10 35) ESKILL.
           DISPLAY  "ENTER GRADE NUMBER :" AT 1101.
           ACCEPT(11 35) EGRDNO.
           DISPLAY  "ENTER BRANCH CODE :" AT 1201.
           ACCEPT(12 35) EBRNID.
           DISPLAY  "ENTER DESIGNATION CODE :" AT 1301.
           ACCEPT(13 35) EDESID.
           WRITE EMPREC.
           CLOSE EMPFILE.
           GO TO MAIN-PARA.

       LEAVE-PARA.
           DISPLAY  ERASE.
           OPEN I-O LEAVEFILE.
           IF FSL = 30
              OPEN OUTPUT LEAVEFILE.
           DISPLAY  "ENTER CODE :" AT 0101.
           ACCEPT(1 35) LEMPID.
           DISPLAY  "ENTER FROM DATE :" AT 0201.
           ACCEPT(2 35) LFMDATE.
           DISPLAY  "ENTER TO DATE :" AT 0301.
           ACCEPT(3 35) LTODATE.
           DISPLAY  "ENTER LEAVE CATEGORY :" AT 0401.
           ACCEPT(4 35) LLEVCAT.
           WRITE LEAVEREC.
           CLOSE LEAVEFILE.
           GO TO MAIN-PARA.

       BRANCH-PARA.
           DISPLAY  ERASE.
           OPEN I-O BRANCHFILE.
           IF FSL = 30
              OPEN OUTPUT BRANCHFILE.
           DISPLAY  "ENTER BRANCH CODE :" AT 0101.
           ACCEPT(1 35) BBRID.
           DISPLAY  "ENTER BRANCH NAME :" AT 0201.
           ACCEPT(2 35) BBRNAME.
           DISPLAY  "ENTER BRANCH ADDRESS :" AT 0301.
           ACCEPT(3 35) BBRADD.
           DISPLAY  "ENTER PHONE :" AT 0401.
           ACCEPT(4 35) BBRPH.
           DISPLAY  "ENTER E-MAIL :" AT 0501.
           ACCEPT(5 35) BEMAIL.
           DISPLAY  "ENTER MANAGER NAME :" AT 0501.
           ACCEPT(5 35) BMGRNAME.
           WRITE BRANCHREC.
           CLOSE BRANCHFILE.
           GO TO MAIN-PARA.

       DESIGNATION-PARA.
           DISPLAY  ERASE.
           OPEN EXTEND DESIGNATIONFILE.
           DISPLAY  "ENTER DESIGNATION CODE :" AT 0101.
           ACCEPT(1 35) DESID.
           DISPLAY  "ENTER DESIGNATION :" AT 0201.
           ACCEPT(2 35) DESIGN.
           DISPLAY  "ENTER DES IN SHORT :" AT 0301.
           ACCEPT(3 35) DESHRT.
           WRITE DESIGNATIONREC.
           CLOSE DESIGNATIONFILE.
           GO TO MAIN-PARA.

       DEPARTMENT-PARA.
           DISPLAY  ERASE.
           OPEN I-O DEPARTMENTFILE.
           IF FSDEP = 30
              OPEN OUTPUT DEPARTMENTFILE.
           DISPLAY  "ENTER DEPARTMENT CODE :" AT 0101.
           ACCEPT(1 35) DEPCODE.
           DISPLAY  "ENTER DEPARTMENT NAME :" AT 0201.
           ACCEPT(2 35) DEPNAME.
           WRITE DEPARTMENTREC.
           CLOSE DEPARTMENTFILE.
           GO TO MAIN-PARA.

       REVISION-PARA.
           DISPLAY  ERASE.
           OPEN I-O REVISIONFILE.
           IF FSR = 30
              OPEN OUTPUT REVISIONFILE.
           DISPLAY  "ENTER REVISION CODE :" AT 0101.
           ACCEPT(1 35) RREVID.
           DISPLAY  "ENTER EMPLOYEE CODE :" AT 0201.
           ACCEPT(2 35) REMPID.
           DISPLAY  "ENTER DESIGNATION CODE :" AT 0301.
           ACCEPT(3 35) RDESCODE.
           DISPLAY  "ENTER BASIC :" AT 0401.
           ACCEPT(4 35) RBASIC.
           DISPLAY  "ENTER HRA :" AT 0501.
           ACCEPT(5 35) RHRA.
           DISPLAY  "ENTER DPA :" AT 0601.
           ACCEPT(6 35) RDPA.
           DISPLAY  "ENTER PPA :" AT 0701.
           ACCEPT(7 35) RPPA.
           DISPLAY  "ENTER EDUCATIONAL ALLOWANCE :" AT 0801.
           ACCEPT(8 35) REDUA.
           DISPLAY  "ENTER TECH. JOURNAL :" AT 0901.
           ACCEPT(9 35) RTECHJR.
           DISPLAY  "ENTER LUNCH ALLOWANCE :" AT 1001.
           ACCEPT(10 35) RLUNCHA.
           DISPLAY  "ENTER CONVEYANCE :" AT 1101.
           ACCEPT(11 35) RCONVEY.
           DISPLAY  "ENTER BUSINESS ATTIREMENT :" AT 1201.
           ACCEPT(12 35) RBUSATR.
           DISPLAY  "ENTER LEAVE TRAVEL ALLOWANCE :" AT 1301.
           ACCEPT(13 35) RLTA.
           DISPLAY  "ENTER PF :" AT 1401.
           ACCEPT(14 35) RPF.
           DISPLAY  "ENTER ESI :" AT 1501.
           ACCEPT(15 35) RESI.
           DISPLAY  "ENTER REVISED DATE :" AT 1601.
           ACCEPT(16 35) RREVDATE.
           WRITE REVISIONREC.
           CLOSE REVISIONFILE.
           GO TO MAIN-PARA.

       PAYMENT-PARA.
           DISPLAY  ERASE.
           OPEN I-O PAYMENTFILE.
           IF FSP = 30
              OPEN OUTPUT PAYMENTFILE.
           DISPLAY  "ENTER EMPLOYEE CODE :" AT 0101.
           ACCEPT(1 35) PEMPID.
           DISPLAY  "ENTER BASIC :" AT 0201.
           ACCEPT(2 35) PBASIC.
           DISPLAY  "ENTER DA :" AT 0301.
           ACCEPT(3 35) PDA.
           DISPLAY  "ENTER CCA :" AT 0401.
           ACCEPT(4 35) PCCA.
           DISPLAY  "ENTER HRA :" AT 0501.
           ACCEPT(5 35) PHRA.
           DISPLAY  "ENTER DPA :" AT 0601.
           ACCEPT(6 35) PDPA.
           DISPLAY  "ENTER PPA :" AT 0701.
           ACCEPT(7 35) PPPA.
           DISPLAY  "ENTER EDUCATIONAL ALLOWANCE :" AT 0801.
           ACCEPT(8 35) PEDUA.
           DISPLAY  "ENTER TECH. JOURNAL :" AT 0901.
           ACCEPT(9 35) PTECHJR.
           DISPLAY  "ENTER LUNCH ALLOWANCE :" AT 1001.
           ACCEPT(10 35) PLUNCHA.
           DISPLAY  "ENTER CONVEYANCE :" AT 1101.
           ACCEPT(11 35) PCONVEY.
           DISPLAY  "ENTER BUSINESS ATTIREMENT :" AT 1201.
           ACCEPT(12 35) PBUSATR.
           DISPLAY  "ENTER LEAVE TRAVEL ALLOWANCE :" AT 1301.
           ACCEPT(13 35) PLTA.
           DISPLAY  "ENTER PF :" AT 1401.
           ACCEPT(14 35) PPF.
           DISPLAY  "ENTER ESI :" AT 1501.
           ACCEPT(15 35) PESI.
           DISPLAY  "ENTER GRATUITY :" AT 1601.
           ACCEPT(16 35) PGRTY.
           DISPLAY  "ENTER PROFESSIONAL TAX :" AT 1701.
           ACCEPT(17 35) PPTAX.
           DISPLAY  "ENTER INCOME TAX :" AT 1801.
           ACCEPT(18 35) PITAX.
           DISPLAY  "ENTER LOAN :" AT 1901.
           ACCEPT(19 35) PLOAN.
           DISPLAY  "ENTER LOAN DEDUCTION AMOUNT :" AT 2001.
           ACCEPT(20 35) PLOANDA.
           DISPLAY  "ENTER OTHER DEDUCTION :" AT 2101.
           ACCEPT(21 35) POTHERD.
           DISPLAY  "ENTER PERFORMANCE INCENTIVE :" AT 2201.
           ACCEPT(22 35) PPERINC.
           DISPLAY  "ENTER MEDICAL REIMBURSEMENT :" AT 2301.
           ACCEPT(23 35) PMEDI.
           DISPLAY  "ENTER BOOK REIMBURSEMENT :" AT 2401.
           ACCEPT(24 35) PBOOK.
           DISPLAY  ERASE.
           DISPLAY  "ENTER ENTERTAINMENT :" AT 0101.
           ACCEPT(1 35) PENTER.
           DISPLAY  "ENTER PHONE :" AT 0201.
           ACCEPT(2 35) PTPH.
           DISPLAY  "ENTER HOUSE RELATED :" AT 0301.
           ACCEPT(3 35) PHOUSE.
           DISPLAY  "ENTER VEHICLE MAINTENANCE :" AT 0401.
           ACCEPT(4 35) PVEHMAN.
           DISPLAY  "ENTER CREDIT CARD :" AT 0501.
           ACCEPT(5 35) PCREDIT.
           DISPLAY  "ENTER CLUB :" AT 0601.
           ACCEPT(6 35) PCLUB.
           DISPLAY  "ENTER CLUB :" AT 0701.
           ACCEPT(7 35) PCLUB.
           DISPLAY  "ENTER CLUB :" AT 0801.
           ACCEPT(8 35) PCLUB.
           DISPLAY  "ENTER CASUAL LEAVE :" AT 0901.
           ACCEPT(9 35) PCL.
           DISPLAY  "ENTER SICK LEAVE :" AT 1001.
           ACCEPT(10 35) PSL.
           DISPLAY  "ENTER PAID LEAVE :" AT 1101.
           ACCEPT(11 35) PPL.
           DISPLAY  "ENTER LEAVE LOSS OF PAY :" AT 1201.
           ACCEPT(12 35) PLLOP.
           DISPLAY  "ENTER OTHER LEAVES :" AT 1301.
           ACCEPT(13 35) POTHERL.
           WRITE PAYMENTREC.
           CLOSE PAYMENTFILE.
           GO TO MAIN-PARA.

       CONFIRMATION-PARA.
           DISPLAY  ERASE.
           OPEN I-O CONFIRMATIONFILE.
           IF FSC = 30
              OPEN OUTPUT CONFIRMATIONFILE.
           DISPLAY  "ENTER CONFIRMATION CODE :" AT 0101.
           ACCEPT(1 35) CCONID.
           DISPLAY  "ENTER EMP CODE :" AT 0201.
           ACCEPT(2 35) CEMPID.
           DISPLAY  "ENTER CONFIRMATION DATE :" AT 0301.
           ACCEPT(3 35) CCDATE.
           WRITE CONFIRMATIONREC.
           CLOSE CONFIRMATIONFILE.
           GO TO MAIN-PARA.

       GRADE-PARA.
           DISPLAY  ERASE.
           OPEN EXTEND GRADEFILE.
           DISPLAY  "ENTER GRADE NO. :" AT 0101.
           ACCEPT(1 35) GGRADE.
           DISPLAY  "ENTER DESIGNATION :" AT 0201.
           ACCEPT(2 35) GDESIGN.
           WRITE GRADEREC.
           CLOSE GRADEFILE.
           GO TO MAIN-PARA.

       TRANSFER-PARA.
           DISPLAY  ERASE.
           OPEN I-O TRANSFERFILE.
           IF FST = 30
              OPEN OUTPUT TRANSFERFILE.
           DISPLAY  "ENTER TRANSFER CODE :" AT 0101.
           ACCEPT(1 35) TTRFID.
           DISPLAY  "ENTER EMP CODE :" AT 0201.
           ACCEPT(2 35) TEMPID.
           DISPLAY  "ENTER OLD BRANCH CODE :" AT 0301.
           ACCEPT(3 35) TOBRID.
           DISPLAY  "ENTER TRANSFER DATE :" AT 0401.
           ACCEPT(4 35) TTRFDT.
           WRITE TRANSFERREC.
           CLOSE TRANSFERFILE.
           GO TO MAIN-PARA.

       EMPPERSONAL-PARA.
           DISPLAY  ERASE.
           OPEN I-O EMPPERSONALFILE.
           IF FSEP = 30
              OPEN OUTPUT EMPPERSONALFILE.
           DISPLAY  "ENTER EMP CODE :" AT 0101.
           ACCEPT(1 35) EPEMPID.
           DISPLAY  "ENTER TEMP ADDRESS :" AT 0201.
           ACCEPT(2 35) EPTADD.
           DISPLAY  "ENTER PHONE :" AT 0301.
           ACCEPT(3 35) EPTPH.
           DISPLAY  "ENTER DOB :" AT 0401.
           ACCEPT(4 35) EPDOB.
           DISPLAY  "ENTER POB :" AT 0501.
           ACCEPT(5 35) EPPOB.
           DISPLAY  "ENTER LANGUAGE KNOWN :" AT 0601.
           ACCEPT(6 35) EPLANG.
           DISPLAY  "ENTER BLOOD GROUP :" AT 0701.
           ACCEPT(7 35) EPBLOOD.
           DISPLAY  "ENTER WEIGHT :" AT 0801.
           ACCEPT(8 35) EPWEIGHT.
           DISPLAY  "ENTER HEIGHT :" AT 0901.
           ACCEPT(9 35) EPHEIGHT.
           DISPLAY  "ENTER VISION :" AT 1001.
           ACCEPT(10 35) EPVISION.
           DISPLAY  "ENTER FATHER'S NAME :" AT 1101.
           ACCEPT(11 35) EPFATHER.
           DISPLAY  "ENTER DOB OF FATHER :" AT 1201.
           ACCEPT(12 35) EPDOBF.
           DISPLAY  "ENTER MOTHER'S NAME :" AT 1301.
           ACCEPT(13 35) EPMOTHER.
           DISPLAY  "ENTER DOB OF MOTHER :" AT 1401.
           ACCEPT(14 35) EPDOBM.
           DISPLAY  "ENTER SPOUSE NAME :" AT 1501.
           ACCEPT(15 35) EPSPOUSE.
           DISPLAY  "ENTER CHILD NAME :" AT 1601.
           ACCEPT(16 35) EPCHILD.
           DISPLAY  "ENTER DOB OF CHILD :" AT 1701.
           ACCEPT(17 35) EPDOBC.
           WRITE EMPPERSONALREC.
           CLOSE EMPPERSONALFILE.
           GO TO MAIN-PARA.
       
       END PROGRAM EMPWRITE.
