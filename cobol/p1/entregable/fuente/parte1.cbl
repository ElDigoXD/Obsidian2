       IDENTIFICATION DIVISION.
       PROGRAM-ID. MAINHRMS.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77 CHOICE PIC 9.

       PROCEDURE DIVISION.
       MAIN-PARA.
           DISPLAY " " AT 0101 ERASE EOS.
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
           DISPLAY " " AT 0101 ERASE EOS.
           DISPLAY "*******************************************" AT 0310.
           DISPLAY "     HUMAN RESOURCE MANAGEMENT SYSTEM      " AT 0510.
           DISPLAY "*******************************************" AT 0710.
           DISPLAY " 1. EMPLOYEE FILE" AT 1105.
           DISPLAY " 2. LEAVE FILE" AT 1205.
           DISPLAY " 3. BRANCH FILE" AT 1305.
           DISPLAY " 4. DESIGNATION FILE" AT 1405.
           DISPLAY " 5. DEPARTMENT FILE" AT 1505.
           DISPLAY " 6. REVISION FILE" AT 1605.
           DISPLAY " 7. PAYMENT FILE" AT 1705.
           DISPLAY " 8. CONFIRMATION FILE" AT 1805.
           DISPLAY " 9. GRADE FILE" AT 1905.
           DISPLAY "10. TRANSFER FILE" AT 2005.
           DISPLAY "11. EMPLOYEE PERSONAL FILE" AT 2105.
           DISPLAY "12. EXIT" AT 2205.
           DISPLAY "ENTER U R CHOICE :" AT 2325.
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
           DISPLAY " " AT 0101 ERASE EOS.
           OPEN INPUT EMPFILE.
           DISPLAY "ENTER CODE :".
           ACCEPT EEMPID AT 0201.
           DISPLAY " " AT 0101 ERASE EOS.
           READ EMPFILE INVALID KEY GO TO ERROR-EMP-PARA.
           DISPLAY " CODE                 :" AT 0101.
           DISPLAY EEMPID AT 0125.
           DISPLAY " NAME                 :" AT 0201.
           DISPLAY EEMPNAME AT 0225.
           DISPLAY " ADDRESS              :" AT 0301.
           DISPLAY EEMPADDR AT 0325.
           DISPLAY " PHONE                :" AT 0401.
           DISPLAY EPHONE AT 0425.
           DISPLAY " DATE OF JOIN         :" AT 0501.
           DISPLAY EDOJ AT 0525.
           DISPLAY " DIPLOMA              :" AT 0601.
           DISPLAY EDIP AT 0625.
           DISPLAY " UG                   :" AT 0701.
           DISPLAY EUG AT 0725.
           DISPLAY " PG                   :" AT 0801.
           DISPLAY EPG AT 0825.
           DISPLAY " PROFESSIONAL QUALITY :" AT 0901.
           DISPLAY EPROFQ AT 0925.
           DISPLAY " SKILL SET            :" AT 1001.
           DISPLAY ESKILL AT 1025.
           DISPLAY " GRADE NUMBER         :" AT 1101.
           DISPLAY EGRDNO AT 1125.
           DISPLAY " BRANCH CODE          :" AT 1201.
           DISPLAY EBRNID AT 1225.
           DISPLAY " DESIGNATION CODE     :" AT 1301.
           DISPLAY EDESID AT 1325.
           CLOSE EMPFILE.
           DISPLAY "PRESS ENTER TO RETURN TO HRMS READ MENU" AT 2010.
           STOP ' '.
           GO TO MAIN-PARA.

       LEAVE-PARA.
           DISPLAY " " AT 0101 ERASE EOS.
           OPEN INPUT LEAVEFILE.
           DISPLAY "ENTER CODE :".
           ACCEPT LEMPID AT 0201.
           DISPLAY " " AT 0101 ERASE EOS.
           READ LEAVEFILE INVALID KEY GO TO ERROR-LEAVE-PARA.
           DISPLAY " CODE           :" AT 0101.
           DISPLAY LEMPID AT 0119.
           DISPLAY " DATE           :" AT 0201.
           DISPLAY LFMDATE AT 0219.
           DISPLAY " DATE           :" AT 0301.
           DISPLAY LTODATE AT 0319.
           DISPLAY " LEAVE CATEGORY :" AT 0401.
           DISPLAY LLEVCAT AT 0419.
           CLOSE LEAVEFILE.
           DISPLAY "PRESS ENTER TO RETURN TO HRMS READ MENU" AT 2010.
           STOP ' '.
           GO TO MAIN-PARA.

        BRANCH-PARA.
           DISPLAY " " AT 0101 ERASE EOS.
           OPEN INPUT BRANCHFILE.
           DISPLAY " BRANCH CODE :".
           ACCEPT BBRID AT 0201.
           DISPLAY " " AT 0101 ERASE EOS.
           READ BRANCHFILE INVALID KEY GO TO ERROR-BRANCH-PARA.
           DISPLAY " BRANCH CODE    :" AT 0101.
           DISPLAY BBRID AT 0119.
           DISPLAY " BRANCH NAME    :" AT 0201.
           DISPLAY BBRNAME AT 0219.
           DISPLAY " BRANCH ADDRESS :" AT 0301.
           DISPLAY BBRADD AT 0319.
           DISPLAY " PHONE          :" AT 0401.
           DISPLAY BBRPH AT 0419.
           DISPLAY " E-MAIL         :" AT 0501.
           DISPLAY BEMAIL  AT 0519.
           DISPLAY " MANAGER NAME   :" AT 0501.
           DISPLAY BMGRNAME AT 0519.
           CLOSE BRANCHFILE.
           DISPLAY "PRESS ENTER TO RETURN TO HRMS READ MENU" AT 2010.
           STOP ' '.
           GO TO MAIN-PARA.

       DESIGNATION-PARA.
           DISPLAY " " AT 0101 ERASE EOS.
           OPEN INPUT DESIGNATIONFILE.
           DISPLAY "ENTER THE DESIGNATION CODE :".
           ACCEPT DES AT 0201.
           DISPLAY " " AT 0101 ERASE EOS.
           PERFORM DES-READ-PARA UNTIL FSDES = 10.
       DES-READ-PARA.
           READ DESIGNATIONFILE AT END GO TO DES-EXIT-PARA.
           IF DESID = DES
           DISPLAY " DESIGNATION CODE     :" AT 0101.
           DISPLAY DESID AT 0125.
           DISPLAY " DESIGNATION          :" AT 0201.
           DISPLAY DESIGN AT 0225.
           DISPLAY " DESIGNATION IN SHORT :" AT 0301.
           DISPLAY DESHRT AT 0325.
       DES-EXIT-PARA.
           CLOSE DESIGNATIONFILE.
           DISPLAY ' '.
           DISPLAY ' '.
           DISPLAY "PRESS ENTER TO RETURN TO HRMS READ MENU".
           STOP ' '.
           GO TO MAIN-PARA.

       DEPARTMENT-PARA.
           DISPLAY " " AT 0101 ERASE EOS.
           OPEN INPUT DEPARTMENTFILE.
           DISPLAY "ENTER DEP CODE :".
           ACCEPT DEPCODE AT 0201.
           DISPLAY " " AT 0101 ERASE EOS.
           READ DEPARTMENTFILE INVALID KEY
                     GO TO ERROR-DEPARTMENT-PARA.
           DISPLAY " DEPARTMENT CODE :" AT 0101.
           DISPLAY DEPCODE AT 0120.
           DISPLAY " DEPARTMENT NAME :" AT 0201.
           DISPLAY DEPNAME AT 0220.
           CLOSE DEPARTMENTFILE.
           DISPLAY "PRESS ENTER TO RETURN TO HRMS READ MENU" AT 2010.
           STOP ' '.
           GO TO MAIN-PARA.

       REVISION-PARA.
           DISPLAY " " AT 0101 ERASE EOS.
           OPEN INPUT REVISIONFILE.
           DISPLAY "ENTER REVISION CODE:".
           ACCEPT RREVID AT 0201.
           DISPLAY " " AT 0101 ERASE EOS.
           READ REVISIONFILE INVALID KEY
                    GO TO ERROR-REVISION-PARA.
           DISPLAY " REVISION CODE           :" AT 0101.
           DISPLAY RREVID AT 0128.
           DISPLAY " EMPLOYEE CODE           :" AT 0201.
           DISPLAY REMPID AT 0228.
           DISPLAY " DESIGNATION CODE        :" AT 0301.
           DISPLAY RDESCODE AT 0328.
           DISPLAY " BASIC                   :" AT 0401.
           DISPLAY RBASIC AT 0428.
           DISPLAY " HRA                     :" AT 0501.
           DISPLAY RHRA AT 0528.
           DISPLAY " DPA                     :" AT 0601.
           DISPLAY RDPA AT 0628.
           DISPLAY " PPA                     :" AT 0701.
           DISPLAY RPPA AT 0728.
           DISPLAY " EDUCATIONAL ALLOWANCE   :" AT 0801.
           DISPLAY REDUA AT 0828.
           DISPLAY " TECHNICAL JOURNAL       :" AT 0901.
           DISPLAY RTECHJR AT 0928.
           DISPLAY " LUNCH ALLOWANCE        :" AT 1001.
           DISPLAY RLUNCHA AT 1027.
           DISPLAY " CONVEYANCE             :" AT 1101.
           DISPLAY RCONVEY AT 1127.
           DISPLAY " BUSINESS ATTIREMENT    :" AT 1201.
           DISPLAY RBUSATR AT 1227.
           DISPLAY " LEAVE TRAVEL ALLOWANCE :" AT 1301.
           DISPLAY RLTA AT 1327.
           DISPLAY " PF                     :" AT 1401.
           DISPLAY RPF AT 1427.
           DISPLAY " ESI                    :" AT 1501.
           DISPLAY RESI AT 1527.
           DISPLAY " REVISED DATE           :" AT 1601.
           DISPLAY RREVDATE AT 1627.
           CLOSE REVISIONFILE.
           DISPLAY "PRESS ENTER TO RETURN TO HRMS READ MENU" AT 2010.
           STOP ' '.
           GO TO MAIN-PARA.

       PAYMENT-PARA.
           DISPLAY " " AT 0101 ERASE EOS.
           OPEN INPUT PAYMENTFILE.
           DISPLAY "ENTER EMP CODE :".
           ACCEPT PEMPID AT 0201.
           DISPLAY " " AT 0101 ERASE EOS.
           READ PAYMENTFILE INVALID KEY GO TO ERROR-PAYMENT-PARA.
           DISPLAY " EMPLOYEE CODE                  :" AT 0101.
           DISPLAY PEMPID AT 0135.
           DISPLAY " BASIC                          :" AT 0201.
           DISPLAY PBASIC AT 0235.
           DISPLAY " DEARNESS ALLOWANCE             :" AT 0301.
           DISPLAY PDA AT 0335.
           DISPLAY " CITY COMPENSATORY ALLOWANCE    :" AT 0401.
           DISPLAY PCCA AT 0435.
           DISPLAY " HRA                            :" AT 0501.
           DISPLAY PHRA AT 0535.
           DISPLAY " DPA                            :" AT 0601.
           DISPLAY PDPA AT 0635.
           DISPLAY " PPA                            :" AT 0701.
           DISPLAY PPPA AT 0735.
           DISPLAY " EDUCATIONAL ALLOWANCE          :" AT 0801.
           DISPLAY PEDUA AT 0835.
           DISPLAY " TECHNICAL JOURNAL              :" AT 0901.
           DISPLAY PTECHJR AT 0935.
           DISPLAY " LUNCH ALLOWANCE               :" AT 1001.
           DISPLAY PLUNCHA AT 1034.
           DISPLAY " CONVEYANCE                    :" AT 1101.
           DISPLAY PCONVEY AT 1134.
           DISPLAY " BUSINESS ATTIREMENT           :" AT 1201.
           DISPLAY PBUSATR AT 1234.
           DISPLAY " LEAVE TRAVEL ALLOWANCE        :" AT 1301.
           DISPLAY PLTA AT 1334.
           DISPLAY " PF                            :" AT 1401.
           DISPLAY PPF AT 1434.
           DISPLAY " ESI                           :" AT 1501.
           DISPLAY PESI AT 1534.
           DISPLAY " GRATUITY                      :" AT 1601.
           DISPLAY PGRTY AT 1634.
           DISPLAY " PROFESSIONAL TAX              :" AT 1701.
           DISPLAY PPTAX AT 1734.
           DISPLAY " INCOME TAX                    :" AT 1801.
           DISPLAY PITAX AT 1834.
           DISPLAY " LOAN                          :" AT 1901.
           DISPLAY PLOAN AT 1934.
           DISPLAY " LOAN DEDUCTION AMOUNT         :" AT 2001.
           DISPLAY PLOANDA AT 2034.
           DISPLAY " OTHER DEDUCTION               :" AT 2101.
           DISPLAY POTHERD AT 2134.
           DISPLAY " PERFORMANCE INCENTIVE         :" AT 2201.
           DISPLAY PPERINC AT 2234.
           DISPLAY " MEDICAL REIMBURSEMENT         :" AT 2301.
           DISPLAY PMEDI AT 2334.
           DISPLAY " BOOK REIMBURSEMENT            :" AT 2401.
           DISPLAY PBOOK AT 2434.
           DISPLAY " " AT 0101 ERASE EOS.
           DISPLAY " ENTERTAINMENT                  :" AT 0101.
           DISPLAY PENTER AT 0135.
           DISPLAY " PHONE                          :" AT 0201.
           DISPLAY PTPH AT 0235.
           DISPLAY " HOUSE RELATED                  :" AT 0301.
           DISPLAY PHOUSE AT 0335.
           DISPLAY " VEHICLE MAINTENANCE            :" AT 0401.
           DISPLAY PVEHMAN AT 0435.
           DISPLAY " CREDIT CARD                    :" AT 0501.
           DISPLAY PCREDIT AT 0535.
           DISPLAY " CLUB                           :" AT 0601.
           DISPLAY PCLUB AT 0635.
           DISPLAY " CASUAL LEAVE                   :" AT 0701.
           DISPLAY PCL AT 0735.
           DISPLAY " SICK LEAVE                     :" AT 0801.
           DISPLAY PSL AT 0835.
           DISPLAY " PAID LEAVE                     :" AT 0901.
           DISPLAY PPL AT 0935.
           DISPLAY " LEAVE LOSS OF PAY             :" AT 1001.
           DISPLAY PLLOP AT 1034.
           DISPLAY " OTHER LEAVES                  :" AT 1101.
           DISPLAY POTHERL AT 1134.
           CLOSE PAYMENTFILE.
           DISPLAY "PRESS ENTER TO RETURN TO HRMS READ MENU" AT 2010.
           STOP ' '.
           GO TO MAIN-PARA.

       CONFIRMATION-PARA.
           DISPLAY " " AT 0101 ERASE EOS.
           OPEN INPUT CONFIRMATIONFILE.
           DISPLAY "ENTER CODE :".
           ACCEPT CCONID AT 0201.
           DISPLAY " " AT 0101 ERASE EOS.
           READ CONFIRMATIONFILE INVALID KEY
                   GO TO ERROR-CONFIRMATION-PARA.
           DISPLAY " CONFIRMATION CODE :" AT 0101.
           DISPLAY CCONID AT 0122.
           DISPLAY " EMPLOYEE CODE     :" AT 0201.
           DISPLAY CEMPID AT 0222.
           DISPLAY " CONFIRMATION DATE :" AT 0301.
           DISPLAY CCDATE AT 0322.
           CLOSE CONFIRMATIONFILE.
           DISPLAY "PRESS ENTER TO RETURN TO HRMS READ MENU" AT 2010.
           STOP ' '.
           GO TO MAIN-PARA.

       GRADE-PARA.
           DISPLAY " " AT 0101 ERASE EOS.
           OPEN INPUT GRADEFILE.
           DISPLAY "ENTER GRADE NO. :".
           ACCEPT GR AT 0201.
           DISPLAY " " AT 0101 ERASE EOS.
           PERFORM GR-READ-PARA UNTIL FSG = 10.
       GR-READ-PARA.
           READ GRADEFILE AT END GO TO GR-EXIT-PARA.
           IF GGRADE = GR
           DISPLAY " GRADE NO.   :" AT 0101.
           DISPLAY GGRADE AT 0116.
           DISPLAY " DESIGNATION :" AT 0201.
           DISPLAY GDESIGN AT 0216.
       GR-EXIT-PARA.
           CLOSE GRADEFILE.
           DISPLAY ' '.
           DISPLAY ' '.
           DISPLAY "PRESS ENTER TO RETURN TO HRMS READ MENU".
           STOP ' '.
           GO TO MAIN-PARA.

       TRANSFER-PARA.
           DISPLAY " " AT 0101 ERASE EOS.
           OPEN INPUT TRANSFERFILE.
           DISPLAY "ENTER TRANSFER CODE :".
           ACCEPT TTRFID AT 0201.
           DISPLAY " " AT 0101 ERASE EOS.
           READ TRANSFERFILE INVALID KEY GO TO ERROR-TRANSFER-PARA.
           DISPLAY " TRANSFER CODE     :" AT 0101.
           DISPLAY TTRFID AT 0122.
           DISPLAY " EMP CODE          :" AT 0201.
           DISPLAY TEMPID AT 0222.
           DISPLAY " OLD BRANCH CODE   :" AT 0301.
           DISPLAY TOBRID AT 0322.
           DISPLAY " TRANSFER DATE     :" AT 0401.
           DISPLAY TTRFDT AT 0422.
           CLOSE TRANSFERFILE.
           DISPLAY "PRESS ENTER TO RETURN TO HRMS READ MENU" AT 2010.
           STOP ' '.
           GO TO MAIN-PARA.

       EMPPERSONAL-PARA.
           DISPLAY " " AT 0101 ERASE EOS.
           OPEN INPUT EMPPERSONALFILE.
           DISPLAY "ENTER EMP CODE :".
           ACCEPT EPEMPID AT 0201.
           DISPLAY " " AT 0101 ERASE EOS.
           READ EMPPERSONALFILE INVALID KEY
                           GO TO ERROR-EMPPERSONAL-PARA.
           DISPLAY " EMPLOYEE CODE     :" AT 0101.
           DISPLAY EPEMPID AT 0122.
           DISPLAY " TEMPORARY ADDRESS :" AT 0201.
           DISPLAY EPTADD AT 0222.
           DISPLAY " PHONE             :" AT 0301.
           DISPLAY EPTPH AT 0322.
           DISPLAY " DOB               :" AT 0401.
           DISPLAY EPDOB AT 0422.
           DISPLAY " POB               :" AT 0501.
           DISPLAY EPPOB AT 0522.
           DISPLAY " LANGUAGE KNOWN    :" AT 0601.
           DISPLAY EPLANG AT 0622.
           DISPLAY " BLOOD GROUP       :" AT 0701.
           DISPLAY EPBLOOD AT 0722.
           DISPLAY " WEIGHT            :" AT 0801.
           DISPLAY EPWEIGHT AT 0822.
           DISPLAY " HEIGHT            :" AT 0901.
           DISPLAY EPHEIGHT AT 0922.
           DISPLAY " VISION           :" AT 1001.
           DISPLAY EPVISION AT 1021.
           DISPLAY " FATHER'S NAME    :" AT 1101.
           DISPLAY EPFATHER AT 1121.
           DISPLAY " DOB OF FATHER    :" AT 1201.
           DISPLAY EPDOBF AT 1221.
           DISPLAY " MOTHER'S NAME    :" AT 1301.
           DISPLAY EPMOTHER AT 1321.
           DISPLAY " DOB OF MOTHER    :" AT 1401.
           DISPLAY EPDOBM AT 1421.
           DISPLAY " SPOUSE NAME      :" AT 1501.
           DISPLAY EPSPOUSE AT 1521.
           DISPLAY " CHILD NAME       :" AT 1601.
           DISPLAY EPCHILD AT 1621.
           DISPLAY " DOB OF CHILD     :" AT 1701.
           DISPLAY EPDOBC AT 1721.
           CLOSE EMPPERSONALFILE.
           DISPLAY "PRESS ENTER TO RETURN TO HRMS READ MENU" AT 2010.
           STOP ' '.
           GO TO MAIN-PARA.

       ERROR-EMP-PARA.
           CLOSE EMPFILE.
           DISPLAY " " AT 0101 ERASE EOS.
           DISPLAY "INVALID CODE" AT 1230.
           DISPLAY "PRESS ENTER TO RETURN TO HRMS READ MENU" AT 2010.
           STOP ' '.
           GO TO MAIN-PARA.

       ERROR-LEAVE-PARA.
           CLOSE LEAVEFILE.
           DISPLAY " " AT 0101 ERASE EOS.
           DISPLAY "INVALID CODE" AT 1230.
           DISPLAY "PRESS ENTER TO RETURN TO HRMS READ MENU" AT 2010.
           STOP ' '.
           GO TO MAIN-PARA.

       ERROR-BRANCH-PARA.
           CLOSE BRANCHFILE.
           DISPLAY " " AT 0101 ERASE EOS.
           DISPLAY "INVALID CODE" AT 1230.
           DISPLAY "PRESS ENTER TO RETURN TO HRMS READ MENU" AT 2010.
           STOP ' '.
           GO TO MAIN-PARA.

       ERROR-DEPARTMENT-PARA.
           CLOSE DEPARTMENTFILE.
           DISPLAY " " AT 0101 ERASE EOS.
           DISPLAY "INVALID CODE" AT 1230.
           DISPLAY "PRESS ENTER TO RETURN TO HRMS READ MENU" AT 2010.
           STOP ' '.
           GO TO MAIN-PARA.

       ERROR-REVISION-PARA.
           CLOSE REVISIONFILE.
           DISPLAY " " AT 0101 ERASE EOS.
           DISPLAY "INVALID CODE" AT 1230.
           DISPLAY "PRESS ENTER TO RETURN TO HRMS READ MENU" AT 2010.
           STOP ' '.
           GO TO MAIN-PARA.

       ERROR-PAYMENT-PARA.
           CLOSE PAYMENTFILE.
           DISPLAY " " AT 0101 ERASE EOS.
           DISPLAY "INVALID CODE" AT 1230.
           DISPLAY "PRESS ENTER TO RETURN TO HRMS READ MENU" AT 2010.
           STOP ' '.
           GO TO MAIN-PARA.

       ERROR-CONFIRMATION-PARA.
           CLOSE CONFIRMATIONFILE.
           DISPLAY " " AT 0101 ERASE EOS.
           DISPLAY "INVALID CODE" AT 1230.
           DISPLAY "PRESS ENTER TO RETURN TO HRMS READ MENU" AT 2010.
           STOP ' '.
           GO TO MAIN-PARA.

       ERROR-TRANSFER-PARA.
           CLOSE TRANSFERFILE.
           DISPLAY " " AT 0101 ERASE EOS.
           DISPLAY "INVALID CODE" AT 1230.
           DISPLAY "PRESS ENTER TO RETURN TO HRMS READ MENU" AT 2010.
           STOP ' '.
           GO TO MAIN-PARA.

       ERROR-EMPPERSONAL-PARA.
           CLOSE EMPPERSONALFILE.
           DISPLAY " " AT 0101 ERASE EOS.
           DISPLAY "INVALID CODE" AT 1230.
           DISPLAY "PRESS ENTER TO RETURN TO HRMS READ MENU" AT 2010.
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
           DISPLAY " " AT 0101 ERASE EOS.
           DISPLAY "*******************************************" AT 0310.
           DISPLAY "     HUMAN RESOURCE MANAGEMENT SYSTEM      " AT 0510.
           DISPLAY "*******************************************" AT 0710.
           DISPLAY " 1. EMPLOYEE FILE" AT 1105.
           DISPLAY " 2. LEAVE FILE" AT 1205.
           DISPLAY " 3. BRANCH FILE" AT 1305.
           DISPLAY " 4. DESIGNATION FILE" AT 1405.
           DISPLAY " 5. DEPARTMENT FILE" AT 1505.
           DISPLAY " 6. REVISION FILE" AT 1605.
           DISPLAY " 7. PAYMENT FILE" AT 1705.
           DISPLAY " 8. CONFIRMATION FILE" AT 1805.
           DISPLAY " 9. GRADE FILE" AT 1905.
           DISPLAY "10. TRANSFER FILE" AT 2005.
           DISPLAY "11. EMPLOYEE PERSONAL FILE" AT 2105.
           DISPLAY "12. EXIT" AT 2205.
           DISPLAY "ENTER U R CHOICE :" AT 2325.
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
           DISPLAY " " AT 0101 ERASE EOS.
           OPEN I-O EMPFILE.
           IF FSO = 30
              OPEN OUTPUT EMPFILE.
           DISPLAY "ENTER CODE :" AT 0101.
           ACCEPT EEMPID AT 0135.
           DISPLAY "ENTER NAME :" AT 0201.
           ACCEPT EEMPNAME AT 0235.
           DISPLAY "ENTER ADDRESS :" AT 0301.
           ACCEPT EEMPADDR AT 0335.
           DISPLAY "ENTER PHONE :" AT 0401.
           ACCEPT EPHONE AT 0435.
           DISPLAY "ENTER DATE OF JOIN :" AT 0501.
           ACCEPT EDOJ AT 0535.
           DISPLAY "ENTER DIPLOMA :" AT 0601.
           ACCEPT EDIP AT 0635.
           DISPLAY "ENTER UG :" AT 0701.
           ACCEPT EUG AT 0735.
           DISPLAY "ENTER PG :" AT 0801.
           ACCEPT EPG AT 0835.
           DISPLAY "ENTER PROFESSIONAL QUALITY :" AT 0901.
           ACCEPT EPROFQ AT 0935.
           DISPLAY "ENTER SKILL SET :" AT 1001.
           ACCEPT ESKILL AT 1035.
           DISPLAY "ENTER GRADE NUMBER :" AT 1101.
           ACCEPT EGRDNO AT 1135.
           DISPLAY "ENTER BRANCH CODE :" AT 1201.
           ACCEPT EBRNID AT 1235.
           DISPLAY "ENTER DESIGNATION CODE :" AT 1301.
           ACCEPT EDESID AT 1335.
           WRITE EMPREC.
           CLOSE EMPFILE.
           GO TO MAIN-PARA.

       LEAVE-PARA.
           DISPLAY " " AT 0101 ERASE EOS.
           OPEN I-O LEAVEFILE.
           IF FSL = 30
              OPEN OUTPUT LEAVEFILE.
           DISPLAY "ENTER CODE :" AT 0101.
           ACCEPT LEMPID AT 0135.
           DISPLAY "ENTER FROM DATE :" AT 0201.
           ACCEPT LFMDATE AT 0235.
           DISPLAY "ENTER TO DATE :" AT 0301.
           ACCEPT LTODATE AT 0335.
           DISPLAY "ENTER LEAVE CATEGORY :" AT 0401.
           ACCEPT LLEVCAT AT 0435.
           WRITE LEAVEREC.
           CLOSE LEAVEFILE.
           GO TO MAIN-PARA.

       BRANCH-PARA.
           DISPLAY " " AT 0101 ERASE EOS.
           OPEN I-O BRANCHFILE.
           IF FSL = 30
              OPEN OUTPUT BRANCHFILE.
           DISPLAY "ENTER BRANCH CODE :" AT 0101.
           ACCEPT BBRID AT 0135.
           DISPLAY "ENTER BRANCH NAME :" AT 0201.
           ACCEPT BBRNAME AT 0235.
           DISPLAY "ENTER BRANCH ADDRESS :" AT 0301.
           ACCEPT BBRADD AT 0335.
           DISPLAY "ENTER PHONE :" AT 0401.
           ACCEPT BBRPH AT 0435.
           DISPLAY "ENTER E-MAIL :" AT 0501.
           ACCEPT BEMAIL AT 0535.
           DISPLAY "ENTER MANAGER NAME :" AT 0501.
           ACCEPT BMGRNAME AT 0535.
           WRITE BRANCHREC.
           CLOSE BRANCHFILE.
           GO TO MAIN-PARA.

       DESIGNATION-PARA.
           DISPLAY " " AT 0101 ERASE EOS.
           OPEN EXTEND DESIGNATIONFILE.
           DISPLAY "ENTER DESIGNATION CODE :" AT 0101.
           ACCEPT DESID AT 0135.
           DISPLAY "ENTER DESIGNATION :" AT 0201.
           ACCEPT DESIGN AT 0235.
           DISPLAY "ENTER DES IN SHORT :" AT 0301.
           ACCEPT DESHRT AT 0335.
           WRITE DESIGNATIONREC.
           CLOSE DESIGNATIONFILE.
           GO TO MAIN-PARA.

       DEPARTMENT-PARA.
           DISPLAY " " AT 0101 ERASE EOS.
           OPEN I-O DEPARTMENTFILE.
           IF FSDEP = 30
              OPEN OUTPUT DEPARTMENTFILE.
           DISPLAY "ENTER DEPARTMENT CODE :" AT 0101.
           ACCEPT DEPCODE AT 0135.
           DISPLAY "ENTER DEPARTMENT NAME :" AT 0201.
           ACCEPT DEPNAME AT 0235.
           WRITE DEPARTMENTREC.
           CLOSE DEPARTMENTFILE.
           GO TO MAIN-PARA.

       REVISION-PARA.
           DISPLAY " " AT 0101 ERASE EOS.
           OPEN I-O REVISIONFILE.
           IF FSR = 30
              OPEN OUTPUT REVISIONFILE.
           DISPLAY "ENTER REVISION CODE :" AT 0101.
           ACCEPT RREVID AT 0135.
           DISPLAY "ENTER EMPLOYEE CODE :" AT 0201.
           ACCEPT REMPID AT 0235.
           DISPLAY "ENTER DESIGNATION CODE :" AT 0301.
           ACCEPT RDESCODE AT 0335.
           DISPLAY "ENTER BASIC :" AT 0401.
           ACCEPT RBASIC AT 0435.
           DISPLAY "ENTER HRA :" AT 0501.
           ACCEPT RHRA AT 0535.
           DISPLAY "ENTER DPA :" AT 0601.
           ACCEPT RDPA AT 0635.
           DISPLAY "ENTER PPA :" AT 0701.
           ACCEPT RPPA AT 0735.
           DISPLAY "ENTER EDUCATIONAL ALLOWANCE :" AT 0801.
           ACCEPT REDUA AT 0835.
           DISPLAY "ENTER TECH. JOURNAL :" AT 0901.
           ACCEPT RTECHJR AT 0935.
           DISPLAY "ENTER LUNCH ALLOWANCE :" AT 1001.
           ACCEPT RLUNCHA AT 1035.
           DISPLAY "ENTER CONVEYANCE :" AT 1101.
           ACCEPT RCONVEY AT 1135.
           DISPLAY "ENTER BUSINESS ATTIREMENT :" AT 1201.
           ACCEPT RBUSATR AT 1235.
           DISPLAY "ENTER LEAVE TRAVEL ALLOWANCE :" AT 1301.
           ACCEPT RLTA AT 1335.
           DISPLAY "ENTER PF :" AT 1401.
           ACCEPT RPF AT 1435.
           DISPLAY "ENTER ESI :" AT 1501.
           ACCEPT RESI AT 1535.
           DISPLAY "ENTER REVISED DATE :" AT 1601.
           ACCEPT RREVDATE AT 1635.
           WRITE REVISIONREC.
           CLOSE REVISIONFILE.
           GO TO MAIN-PARA.

       PAYMENT-PARA.
           DISPLAY " " AT 0101 ERASE EOS.
           OPEN I-O PAYMENTFILE.
           IF FSP = 30
              OPEN OUTPUT PAYMENTFILE.
           DISPLAY "ENTER EMPLOYEE CODE :" AT 0101.
           ACCEPT PEMPID AT 0135.
           DISPLAY "ENTER BASIC :" AT 0201.
           ACCEPT PBASIC AT 0235.
           DISPLAY "ENTER DA :" AT 0301.
           ACCEPT PDA AT 0335.
           DISPLAY "ENTER CCA :" AT 0401.
           ACCEPT PCCA AT 0435.
           DISPLAY "ENTER HRA :" AT 0501.
           ACCEPT PHRA AT 0535.
           DISPLAY "ENTER DPA :" AT 0601.
           ACCEPT PDPA AT 0635.
           DISPLAY "ENTER PPA :" AT 0701.
           ACCEPT PPPA AT 0735.
           DISPLAY "ENTER EDUCATIONAL ALLOWANCE :" AT 0801.
           ACCEPT PEDUA AT 0835.
           DISPLAY "ENTER TECH. JOURNAL :" AT 0901.
           ACCEPT PTECHJR AT 0935.
           DISPLAY "ENTER LUNCH ALLOWANCE :" AT 1001.
           ACCEPT PLUNCHA AT 1035.
           DISPLAY "ENTER CONVEYANCE :" AT 1101.
           ACCEPT PCONVEY AT 1135.
           DISPLAY "ENTER BUSINESS ATTIREMENT :" AT 1201.
           ACCEPT PBUSATR AT 1235.
           DISPLAY "ENTER LEAVE TRAVEL ALLOWANCE :" AT 1301.
           ACCEPT PLTA AT 1335.
           DISPLAY "ENTER PF :" AT 1401.
           ACCEPT PPF AT 1435.
           DISPLAY "ENTER ESI :" AT 1501.
           ACCEPT PESI AT 1535.
           DISPLAY "ENTER GRATUITY :" AT 1601.
           ACCEPT PGRTY AT 1635.
           DISPLAY "ENTER PROFESSIONAL TAX :" AT 1701.
           ACCEPT PPTAX AT 1735.
           DISPLAY "ENTER INCOME TAX :" AT 1801.
           ACCEPT PITAX AT 1835.
           DISPLAY "ENTER LOAN :" AT 1901.
           ACCEPT PLOAN AT 1935.
           DISPLAY "ENTER LOAN DEDUCTION AMOUNT :" AT 2001.
           ACCEPT PLOANDA AT 2035.
           DISPLAY "ENTER OTHER DEDUCTION :" AT 2101.
           ACCEPT POTHERD AT 2135.
           DISPLAY "ENTER PERFORMANCE INCENTIVE :" AT 2201.
           ACCEPT PPERINC AT 2235.
           DISPLAY "ENTER MEDICAL REIMBURSEMENT :" AT 2301.
           ACCEPT PMEDI AT 2335.
           DISPLAY "ENTER BOOK REIMBURSEMENT :" AT 2401.
           ACCEPT PBOOK AT 2435.
           DISPLAY " " AT 0101 ERASE EOS.
           DISPLAY "ENTER ENTERTAINMENT :" AT 0101.
           ACCEPT PENTER AT 0135.
           DISPLAY "ENTER PHONE :" AT 0201.
           ACCEPT PTPH AT 0235.
           DISPLAY "ENTER HOUSE RELATED :" AT 0301.
           ACCEPT PHOUSE AT 0335.
           DISPLAY "ENTER VEHICLE MAINTENANCE :" AT 0401.
           ACCEPT PVEHMAN AT 0435.
           DISPLAY "ENTER CREDIT CARD :" AT 0501.
           ACCEPT PCREDIT AT 0535.
           DISPLAY "ENTER CLUB :" AT 0601.
           ACCEPT PCLUB AT 0635.
           DISPLAY "ENTER CLUB :" AT 0701.
           ACCEPT PCLUB AT 0735.
           DISPLAY "ENTER CLUB :" AT 0801.
           ACCEPT PCLUB AT 0835.
           DISPLAY "ENTER CASUAL LEAVE :" AT 0901.
           ACCEPT PCL AT 0935.
           DISPLAY "ENTER SICK LEAVE :" AT 1001.
           ACCEPT PSL AT 1035.
           DISPLAY "ENTER PAID LEAVE :" AT 1101.
           ACCEPT PPL AT 1135.
           DISPLAY "ENTER LEAVE LOSS OF PAY :" AT 1201.
           ACCEPT PLLOP AT 1235.
           DISPLAY "ENTER OTHER LEAVES :" AT 1301.
           ACCEPT POTHERL AT 1335.
           WRITE PAYMENTREC.
           CLOSE PAYMENTFILE.
           GO TO MAIN-PARA.

       CONFIRMATION-PARA.
           DISPLAY " " AT 0101 ERASE EOS.
           OPEN I-O CONFIRMATIONFILE.
           IF FSC = 30
              OPEN OUTPUT CONFIRMATIONFILE.
           DISPLAY "ENTER CONFIRMATION CODE :" AT 0101.
           ACCEPT CCONID AT 0135.
           DISPLAY "ENTER EMP CODE :" AT 0201.
           ACCEPT CEMPID AT 0235.
           DISPLAY "ENTER CONFIRMATION DATE :" AT 0301.
           ACCEPT CCDATE AT 0335.
           WRITE CONFIRMATIONREC.
           CLOSE CONFIRMATIONFILE.
           GO TO MAIN-PARA.

       GRADE-PARA.
           DISPLAY " " AT 0101 ERASE EOS.
           OPEN EXTEND GRADEFILE.
           DISPLAY "ENTER GRADE NO. :" AT 0101.
           ACCEPT GGRADE AT 0135.
           DISPLAY "ENTER DESIGNATION :" AT 0201.
           ACCEPT GDESIGN AT 0235.
           WRITE GRADEREC.
           CLOSE GRADEFILE.
           GO TO MAIN-PARA.

       TRANSFER-PARA.
           DISPLAY " " AT 0101 ERASE EOS.
           OPEN I-O TRANSFERFILE.
           IF FST = 30
              OPEN OUTPUT TRANSFERFILE.
           DISPLAY "ENTER TRANSFER CODE :" AT 0101.
           ACCEPT TTRFID AT 0135.
           DISPLAY "ENTER EMP CODE :" AT 0201.
           ACCEPT TEMPID AT 0235.
           DISPLAY "ENTER OLD BRANCH CODE :" AT 0301.
           ACCEPT TOBRID AT 0335.
           DISPLAY "ENTER TRANSFER DATE :" AT 0401.
           ACCEPT TTRFDT AT 0435.
           WRITE TRANSFERREC.
           CLOSE TRANSFERFILE.
           GO TO MAIN-PARA.

       EMPPERSONAL-PARA.
           DISPLAY " " AT 0101 ERASE EOS.
           OPEN I-O EMPPERSONALFILE.
           IF FSEP = 30
              OPEN OUTPUT EMPPERSONALFILE.
           DISPLAY "ENTER EMP CODE :" AT 0101.
           ACCEPT EPEMPID AT 0135.
           DISPLAY "ENTER TEMP ADDRESS :" AT 0201.
           ACCEPT EPTADD AT 0235.
           DISPLAY "ENTER PHONE :" AT 0301.
           ACCEPT EPTPH AT 0335.
           DISPLAY "ENTER DOB :" AT 0401.
           ACCEPT EPDOB AT 0435.
           DISPLAY "ENTER POB :" AT 0501.
           ACCEPT EPPOB AT 0535.
           DISPLAY "ENTER LANGUAGE KNOWN :" AT 0601.
           ACCEPT EPLANG AT 0635.
           DISPLAY "ENTER BLOOD GROUP :" AT 0701.
           ACCEPT EPBLOOD AT 0735.
           DISPLAY "ENTER WEIGHT :" AT 0801.
           ACCEPT EPWEIGHT AT 0835.
           DISPLAY "ENTER HEIGHT :" AT 0901.
           ACCEPT EPHEIGHT AT 0935.
           DISPLAY "ENTER VISION :" AT 1001.
           ACCEPT EPVISION AT 1035.
           DISPLAY "ENTER FATHER'S NAME :" AT 1101.
           ACCEPT EPFATHER AT 1135.
           DISPLAY "ENTER DOB OF FATHER :" AT 1201.
           ACCEPT EPDOBF AT 1235.
           DISPLAY "ENTER MOTHER'S NAME :" AT 1301.
           ACCEPT EPMOTHER AT 1335.
           DISPLAY "ENTER DOB OF MOTHER :" AT 1401.
           ACCEPT EPDOBM AT 1435.
           DISPLAY "ENTER SPOUSE NAME :" AT 1501.
           ACCEPT EPSPOUSE AT 1535.
           DISPLAY "ENTER CHILD NAME :" AT 1601.
           ACCEPT EPCHILD AT 1635.
           DISPLAY "ENTER DOB OF CHILD :" AT 1701.
           ACCEPT EPDOBC AT 1735.
           WRITE EMPPERSONALREC.
           CLOSE EMPPERSONALFILE.
           GO TO MAIN-PARA.
       END PROGRAM EMPWRITE.
