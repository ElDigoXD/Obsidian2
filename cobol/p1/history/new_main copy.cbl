       IDENTIFICATION DIVISION.
       PROGRAM-ID. MAINHRMS.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77 CHOICE PIC 9.

       PROCEDURE DIVISION.
       MAIN-PARA.
           DISPLAY ERASE.
           DISPLAY "*******************************************".
           DISPLAY "     HUMAN RESOURCE MANAGEMENT SYSTEM      ".
           DISPLAY "*******************************************".
           DISPLAY "1. HRMS WRITE".
           DISPLAY "2. HRMS READ".
           DISPLAY "3. EXIT".
           DISPLAY "ENTER YOUR CHOICE :".
           ACCEPT CHOICE.
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
           CLEAR.
           DISPLAY "*******************************************".
           DISPLAY "     HUMAN RESOURCE MANAGEMENT SYSTEM      ".
           DISPLAY "*******************************************".
           DISPLAY " 1. EMPLOYEE FILE".
           DISPLAY " 2. LEAVE FILE".
           DISPLAY " 3. BRANCH FILE".
           DISPLAY " 4. DESIGNATION FILE".
           DISPLAY " 5. DEPARTMENT FILE".
           DISPLAY " 6. REVISION FILE".
           DISPLAY " 7. PAYMENT FILE".
           DISPLAY " 8. CONFIRMATION FILE".
           DISPLAY " 9. GRADE FILE".
           DISPLAY "10. TRANSFER FILE".
           DISPLAY "11. EMPLOYEE PERSONAL FILE".
           DISPLAY "12. EXIT".
           DISPLAY "ENTER U R CHOICE :".
           ACCEPT CHOICE.
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
           CLEAR.
           OPEN INPUT EMPFILE.
           DISPLAY "ENTER CODE :".
           ACCEPT EEMPID.
           CLEAR.
           READ EMPFILE INVALID KEY GO TO ERROR-EMP-PARA.
           DISPLAY " CODE                 :" EEMPID.
           DISPLAY " NAME                 :" EEMPNAME.
           DISPLAY " ADDRESS              :" EEMPADDR.
           DISPLAY " PHONE                :" EPHONE.
           DISPLAY " DATE OF JOIN         :" EDOJ.
           DISPLAY " DIPLOMA              :" EDIP.
           DISPLAY " UG                   :" EUG.
           DISPLAY " PG                   :" EPG.
           DISPLAY " PROFESSIONAL QUALITY :" EPROFQ.
           DISPLAY" SKILL SET            :" ESKILL.
           DISPLAY" GRADE NUMBER         :" EGRDNO.
           DISPLAY" BRANCH CODE          :" EBRNID.
           DISPLAY" DESIGNATION CODE     :" EDESID.
           CLOSE EMPFILE.
           DISPLAY
             "PRESS ENTER TO RETURN TO HRMS READ MENU".
           STOP ' '.
           GO TO MAIN-PARA.

       LEAVE-PARA.
           CLEAR.
           OPEN INPUT LEAVEFILE.
           DISPLAY "ENTER CODE :".
           ACCEPT LEMPID.
           CLEAR.
           READ LEAVEFILE INVALID KEY GO TO ERROR-LEAVE-PARA.
           DISPLAY " CODE           :" LEMPID.
           DISPLAY " DATE           :" LFMDATE.
           DISPLAY " DATE           :" LTODATE.
           DISPLAY " LEAVE CATEGORY :" LLEVCAT.
           CLOSE LEAVEFILE.
           DISPLAY
             "PRESS ENTER TO RETURN TO HRMS READ MENU".
           STOP ' '.
           GO TO MAIN-PARA.

        BRANCH-PARA.
           CLEAR.
           OPEN INPUT BRANCHFILE.
           DISPLAY " BRANCH CODE :".
           ACCEPT BBRID.
           CLEAR.
           READ BRANCHFILE INVALID KEY GO TO ERROR-BRANCH-PARA.
           DISPLAY " BRANCH CODE    :" BBRID.
           DISPLAY " BRANCH NAME    :" BBRNAME.
           DISPLAY " BRANCH ADDRESS :" BBRADD.
           DISPLAY " PHONE          :" BBRPH.
           DISPLAY " E-MAIL         :" BEMAIL .
           DISPLAY " MANAGER NAME   :" BMGRNAME.
           CLOSE BRANCHFILE.
           DISPLAY
             "PRESS ENTER TO RETURN TO HRMS READ MENU".
           STOP ' '.
           GO TO MAIN-PARA.

       DESIGNATION-PARA.
           CLEAR.
           OPEN INPUT DESIGNATIONFILE.
           DISPLAY "ENTER THE DESIGNATION CODE :".
           ACCEPT DES.
           CLEAR.
           PERFORM DES-READ-PARA UNTIL FSDES = 10.
       DES-READ-PARA.
           READ DESIGNATIONFILE AT END GO TO DES-EXIT-PARA.
           IF DESID = DES
           DISPLAY " DESIGNATION CODE     :" DESID
           DISPLAY " DESIGNATION          :" DESIGN
           DISPLAY " DESIGNATION IN SHORT :" DESHRT.
       DES-EXIT-PARA.
           CLOSE DESIGNATIONFILE.
           DISPLAY ' '.
           DISPLAY ' '.
           DISPLAY "PRESS ENTER TO RETURN TO HRMS READ MENU".
           STOP ' '.
           GO TO MAIN-PARA.

       DEPARTMENT-PARA.
           CLEAR.
           OPEN INPUT DEPARTMENTFILE.
           DISPLAY "ENTER DEP CODE :".
           ACCEPT DEPCODE.
           CLEAR.
           READ DEPARTMENTFILE INVALID KEY
                     GO TO ERROR-DEPARTMENT-PARA.
           DISPLAY " DEPARTMENT CODE :" DEPCODE.
           DISPLAY " DEPARTMENT NAME :" DEPNAME.
           CLOSE DEPARTMENTFILE.
           DISPLAY
             "PRESS ENTER TO RETURN TO HRMS READ MENU".
           STOP ' '.
           GO TO MAIN-PARA.

       REVISION-PARA.
           CLEAR.
           OPEN INPUT REVISIONFILE.
           DISPLAY "ENTER REVISION CODE:".
           ACCEPT RREVID.
           CLEAR.
           READ REVISIONFILE INVALID KEY
                    GO TO ERROR-REVISION-PARA.
           DISPLAY " REVISION CODE           :" RREVID.
           DISPLAY " EMPLOYEE CODE           :" REMPID.
           DISPLAY " DESIGNATION CODE        :" RDESCODE.
           DISPLAY " BASIC                   :" RBASIC.
           DISPLAY " HRA                     :" RHRA.
           DISPLAY " DPA                     :" RDPA.
           DISPLAY " PPA                     :" RPPA.
           DISPLAY " EDUCATIONAL ALLOWANCE   :" REDUA.
           DISPLAY " TECHNICAL JOURNAL       :" RTECHJR.
           DISPLAY " LUNCH ALLOWANCE        :" RLUNCHA.
           DISPLAY " CONVEYANCE             :" RCONVEY.
           DISPLAY " BUSINESS ATTIREMENT    :" RBUSATR.
           DISPLAY " LEAVE TRAVEL ALLOWANCE :" RLTA.
           DISPLAY " PF                     :" RPF.
           DISPLAY " ESI                    :" RESI.
           DISPLAY " REVISED DATE           :" RREVDATE.
           CLOSE REVISIONFILE.
           DISPLAY
             "PRESS ENTER TO RETURN TO HRMS READ MENU".
           STOP ' '.
           GO TO MAIN-PARA.

       PAYMENT-PARA.
           CLEAR.
           OPEN INPUT PAYMENTFILE.
           DISPLAY "ENTER EMP CODE :".
           ACCEPT PEMPID.
           CLEAR.
           READ PAYMENTFILE INVALID KEY GO TO ERROR-PAYMENT-PARA.
           DISPLAY " EMPLOYEE CODE                  :" PEMPID.
           DISPLAY " BASIC                          :" PBASIC.
           DISPLAY " DEARNESS ALLOWANCE             :" PDA.
           DISPLAY " CITY COMPENSATORY ALLOWANCE    :" PCCA.
           DISPLAY " HRA                            :" PHRA.
           DISPLAY " DPA                            :" PDPA.
           DISPLAY " PPA                            :" PPPA.
           DISPLAY " EDUCATIONAL ALLOWANCE          :" PEDUA.
           DISPLAY " TECHNICAL JOURNAL              :" PTECHJR.
           DISPLAY " LUNCH ALLOWANCE               :" PLUNCHA.
           DISPLAY " CONVEYANCE                    :" PCONVEY.
           DISPLAY " BUSINESS ATTIREMENT           :" PBUSATR.
           DISPLAY " LEAVE TRAVEL ALLOWANCE        :" PLTA.
           DISPLAY " PF                            :" PPF.
           DISPLAY " ESI                           :" PESI.
           DISPLAY " GRATUITY                      :" PGRTY.
           DISPLAY " PROFESSIONAL TAX              :" PPTAX.
           DISPLAY " INCOME TAX                    :" PITAX.
           DISPLAY " LOAN                          :" PLOAN.
           DISPLAY " LOAN DEDUCTION AMOUNT         :" PLOANDA.
           DISPLAY " OTHER DEDUCTION               :" POTHERD.
           DISPLAY " PERFORMANCE INCENTIVE         :" PPERINC.
           DISPLAY " MEDICAL REIMBURSEMENT         :" PMEDI.
           DISPLAY " BOOK REIMBURSEMENT            :" PBOOK.
           CLEAR.
           DISPLAY " ENTERTAINMENT                  :" PENTER.
           DISPLAY " PHONE                          :" PTPH.
           DISPLAY " HOUSE RELATED                  :" PHOUSE.
           DISPLAY " VEHICLE MAINTENANCE            :" PVEHMAN.
           DISPLAY " CREDIT CARD                    :" PCREDIT.
           DISPLAY " CLUB                           :" PCLUB.
           DISPLAY " CASUAL LEAVE                   :" PCL.
           DISPLAY " SICK LEAVE                     :" PSL.
           DISPLAY " PAID LEAVE                     :" PPL
           DISPLAY " LEAVE LOSS OF PAY             :" PLLOP.
           DISPLAY " OTHER LEAVES                  :" POTHERL.
           CLOSE PAYMENTFILE.
           DISPLAY
             "PRESS ENTER TO RETURN TO HRMS READ MENU".
           STOP ' '.
           GO TO MAIN-PARA.

       CONFIRMATION-PARA.
           CLEAR.
           OPEN INPUT CONFIRMATIONFILE.
           DISPLAY "ENTER CODE :".
           ACCEPT CCONID.
           CLEAR.
           READ CONFIRMATIONFILE INVALID KEY
                   GO TO ERROR-CONFIRMATION-PARA.
           DISPLAY " CONFIRMATION CODE :" CCONID.
           DISPLAY " EMPLOYEE CODE     :" CEMPID.
           DISPLAY " CONFIRMATION DATE :" CCDATE.
           CLOSE CONFIRMATIONFILE.
           DISPLAY
             "PRESS ENTER TO RETURN TO HRMS READ MENU".
           STOP ' '.
           GO TO MAIN-PARA.

       GRADE-PARA.
           CLEAR.
           OPEN INPUT GRADEFILE.
           DISPLAY "ENTER GRADE NO. :".
           ACCEPT GR.
           CLEAR.
           PERFORM GR-READ-PARA UNTIL FSG = 10.
       GR-READ-PARA.
           READ GRADEFILE AT END GO TO GR-EXIT-PARA.
           IF GGRADE = GR
           DISPLAY " GRADE NO.   :" GGRADE.
           DISPLAY " DESIGNATION :" GDESIGN.
       GR-EXIT-PARA.
           CLOSE GRADEFILE.
           DISPLAY ' '.
           DISPLAY ' '.
           DISPLAY "PRESS ENTER TO RETURN TO HRMS READ MENU".
           STOP ' '.
           GO TO MAIN-PARA.

       TRANSFER-PARA.
           CLEAR.
           OPEN INPUT TRANSFERFILE.
           DISPLAY "ENTER TRANSFER CODE :".
           ACCEPT TTRFID.
           CLEAR.
           READ TRANSFERFILE INVALID KEY GO TO ERROR-TRANSFER-PARA.
           DISPLAY " TRANSFER CODE     :" TTRFID.
           DISPLAY " EMP CODE          :" TEMPID.
           DISPLAY " OLD BRANCH CODE   :" TOBRID.
           DISPLAY " TRANSFER DATE     :" TTRFDT.
           CLOSE TRANSFERFILE.
           DISPLAY
             "PRESS ENTER TO RETURN TO HRMS READ MENU".
           STOP ' '.
           GO TO MAIN-PARA.

       EMPPERSONAL-PARA.
           CLEAR.
           OPEN INPUT EMPPERSONALFILE.
           DISPLAY "ENTER EMP CODE :".
           ACCEPT EPEMPID.
           CLEAR.
           READ EMPPERSONALFILE INVALID KEY
                           GO TO ERROR-EMPPERSONAL-PARA.
           DISPLAY " EMPLOYEE CODE     :" EPEMPID.
           DISPLAY " TEMPORARY ADDRESS :" EPTADD.
           DISPLAY " PHONE             :" EPTPH.
           DISPLAY " DOB               :" EPDOB.
           DISPLAY " POB               :" EPPOB.
           DISPLAY " LANGUAGE KNOWN    :" EPLANG.
           DISPLAY " BLOOD GROUP       :" EPBLOOD.
           DISPLAY " WEIGHT            :" EPWEIGHT.
           DISPLAY " HEIGHT            :" EPHEIGHT.
           DISPLAY " VISION           :" EPVISION.
           DISPLAY " FATHER'S NAME    :" EPFATHER.
           DISPLAY " DOB OF FATHER    :" EPDOBF.
           DISPLAY " MOTHER'S NAME    :" EPMOTHER.
           DISPLAY " DOB OF MOTHER    :" EPDOBM.
           DISPLAY " SPOUSE NAME      :" EPSPOUSE.
           DISPLAY " CHILD NAME       :" EPCHILD.
           DISPLAY " DOB OF CHILD     :" EPDOBC.
           CLOSE EMPPERSONALFILE.
           DISPLAY
             "PRESS ENTER TO RETURN TO HRMS READ MENU".
           STOP ' '.
           GO TO MAIN-PARA.

       ERROR-EMP-PARA.
           CLOSE EMPFILE.
           CLEAR.
           DISPLAY "INVALID CODE".
           DISPLAY
             "PRESS ENTER TO RETURN TO HRMS READ MENU".
           STOP ' '.
           GO TO MAIN-PARA.

       ERROR-LEAVE-PARA.
           CLOSE LEAVEFILE.
           CLEAR.
           DISPLAY "INVALID CODE".
           DISPLAY
             "PRESS ENTER TO RETURN TO HRMS READ MENU".
           STOP ' '.
           GO TO MAIN-PARA.

       ERROR-BRANCH-PARA.
           CLOSE BRANCHFILE.
           CLEAR.
           DISPLAY "INVALID CODE".
           DISPLAY
             "PRESS ENTER TO RETURN TO HRMS READ MENU".
           STOP ' '.
           GO TO MAIN-PARA.

       ERROR-DEPARTMENT-PARA.
           CLOSE DEPARTMENTFILE.
           CLEAR.
           DISPLAY "INVALID CODE".
           DISPLAY
             "PRESS ENTER TO RETURN TO HRMS READ MENU".
           STOP ' '.
           GO TO MAIN-PARA.

       ERROR-REVISION-PARA.
           CLOSE REVISIONFILE.
           CLEAR.
           DISPLAY "INVALID CODE".
           DISPLAY
             "PRESS ENTER TO RETURN TO HRMS READ MENU".
           STOP ' '.
           GO TO MAIN-PARA.

       ERROR-PAYMENT-PARA.
           CLOSE PAYMENTFILE.
           CLEAR.
           DISPLAY "INVALID CODE".
           DISPLAY
             "PRESS ENTER TO RETURN TO HRMS READ MENU".
           STOP ' '.
           GO TO MAIN-PARA.

       ERROR-CONFIRMATION-PARA.
           CLOSE CONFIRMATIONFILE.
           CLEAR.
           DISPLAY "INVALID CODE".
           DISPLAY
             "PRESS ENTER TO RETURN TO HRMS READ MENU".
           STOP ' '.
           GO TO MAIN-PARA.

       ERROR-TRANSFER-PARA.
           CLOSE TRANSFERFILE.
           CLEAR.
           DISPLAY "INVALID CODE".
           DISPLAY
             "PRESS ENTER TO RETURN TO HRMS READ MENU".
           STOP ' '.
           GO TO MAIN-PARA.

       ERROR-EMPPERSONAL-PARA.
           CLOSE EMPPERSONALFILE.
           CLEAR.
           DISPLAY "INVALID CODE".
           DISPLAY
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
           CLEAR.
           DISPLAY "*******************************************".
           DISPLAY "     HUMAN RESOURCE MANAGEMENT SYSTEM      ".
           DISPLAY "*******************************************".
           DISPLAY " 1. EMPLOYEE FILE".
           DISPLAY " 2. LEAVE FILE".
           DISPLAY " 3. BRANCH FILE".
           DISPLAY " 4. DESIGNATION FILE".
           DISPLAY " 5. DEPARTMENT FILE".
           DISPLAY " 6. REVISION FILE".
           DISPLAY " 7. PAYMENT FILE".
           DISPLAY " 8. CONFIRMATION FILE".
           DISPLAY " 9. GRADE FILE".
           DISPLAY "10. TRANSFER FILE".
           DISPLAY "11. EMPLOYEE PERSONAL FILE".
           DISPLAY "12. EXIT".
           DISPLAY "ENTER U R CHOICE :".
           ACCEPT CHOICE.
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
           CLEAR.
           OPEN I-O EMPFILE.
           IF FSO = 30
              OPEN OUTPUT EMPFILE.
           DISPLAY "ENTER CODE :".
           ACCEPT EEMPID.
           DISPLAY "ENTER NAME :".
           ACCEPT EEMPNAME.
           DISPLAY "ENTER ADDRESS :".
           ACCEPT EEMPADDR.
           DISPLAY "ENTER PHONE :".
           ACCEPT EPHONE.
           DISPLAY "ENTER DATE OF JOIN :".
           ACCEPT EDOJ.
           DISPLAY "ENTER DIPLOMA :".
           ACCEPT EDIP.
           DISPLAY "ENTER UG :".
           ACCEPT EUG.
           DISPLAY "ENTER PG :".
           ACCEPT EPG.
           DISPLAY "ENTER PROFESSIONAL QUALITY :".
           ACCEPT EPROFQ.
           DISPLAY "ENTER SKILL SET :".
           ACCEPT ESKILL.
           DISPLAY "ENTER GRADE NUMBER :".
           ACCEPT EGRDNO.
           DISPLAY "ENTER BRANCH CODE :".
           ACCEPT EBRNID.
           DISPLAY "ENTER DESIGNATION CODE :".
           ACCEPT EDESID.
           WRITE EMPREC.
           CLOSE EMPFILE.
           GO TO MAIN-PARA.

       LEAVE-PARA.
           CLEAR.
           OPEN I-O LEAVEFILE.
           IF FSL = 30
              OPEN OUTPUT LEAVEFILE.
           DISPLAY "ENTER CODE :".
           ACCEPT LEMPID.
           DISPLAY "ENTER FROM DATE :".
           ACCEPT LFMDATE.
           DISPLAY "ENTER TO DATE :".
           ACCEPT LTODATE.
           DISPLAY "ENTER LEAVE CATEGORY :".
           ACCEPT LLEVCAT.
           WRITE LEAVEREC.
           CLOSE LEAVEFILE.
           GO TO MAIN-PARA.

       BRANCH-PARA.
           CLEAR.
           OPEN I-O BRANCHFILE.
           IF FSL = 30
              OPEN OUTPUT BRANCHFILE.
           DISPLAY "ENTER BRANCH CODE :".
           ACCEPT BBRID.
           DISPLAY "ENTER BRANCH NAME :".
           ACCEPT BBRNAME.
           DISPLAY "ENTER BRANCH ADDRESS :".
           ACCEPT BBRADD.
           DISPLAY "ENTER PHONE :".
           ACCEPT BBRPH.
           DISPLAY "ENTER E-MAIL :".
           ACCEPT BEMAIL.
           DISPLAY "ENTER MANAGER NAME :".
           ACCEPT BMGRNAME.
           WRITE BRANCHREC.
           CLOSE BRANCHFILE.
           GO TO MAIN-PARA.

       DESIGNATION-PARA.
           CLEAR.
           OPEN EXTEND DESIGNATIONFILE.
           DISPLAY "ENTER DESIGNATION CODE :".
           ACCEPT DESID.
           DISPLAY "ENTER DESIGNATION :".
           ACCEPT DESIGN.
           DISPLAY "ENTER DES IN SHORT :".
           ACCEPT DESHRT.
           WRITE DESIGNATIONREC.
           CLOSE DESIGNATIONFILE.
           GO TO MAIN-PARA.

       DEPARTMENT-PARA.
           CLEAR.
           OPEN I-O DEPARTMENTFILE.
           IF FSDEP = 30
              OPEN OUTPUT DEPARTMENTFILE.
           DISPLAY "ENTER DEPARTMENT CODE :".
           ACCEPT DEPCODE.
           DISPLAY "ENTER DEPARTMENT NAME :".
           ACCEPT DEPNAME.
           WRITE DEPARTMENTREC.
           CLOSE DEPARTMENTFILE.
           GO TO MAIN-PARA.

       REVISION-PARA.
           CLEAR.
           OPEN I-O REVISIONFILE.
           IF FSR = 30
              OPEN OUTPUT REVISIONFILE.
           DISPLAY "ENTER REVISION CODE :".
           ACCEPT RREVID.
           DISPLAY "ENTER EMPLOYEE CODE :".
           ACCEPT REMPID.
           DISPLAY "ENTER DESIGNATION CODE :".
           ACCEPT RDESCODE.
           DISPLAY "ENTER BASIC :".
           ACCEPT RBASIC.
           DISPLAY "ENTER HRA :".
           ACCEPT RHRA.
           DISPLAY "ENTER DPA :".
           ACCEPT RDPA.
           DISPLAY "ENTER PPA :".
           ACCEPT RPPA.
           DISPLAY "ENTER EDUCATIONAL ALLOWANCE :".
           ACCEPT REDUA.
           DISPLAY "ENTER TECH. JOURNAL :".
           ACCEPT RTECHJR.
           DISPLAY "ENTER LUNCH ALLOWANCE :".
           ACCEPT RLUNCHA.
           DISPLAY "ENTER CONVEYANCE :".
           ACCEPT RCONVEY.
           DISPLAY "ENTER BUSINESS ATTIREMENT :".
           ACCEPT RBUSATR.
           DISPLAY "ENTER LEAVE TRAVEL ALLOWANCE :".
           ACCEPT RLTA.
           DISPLAY "ENTER PF :".
           ACCEPT RPF.
           DISPLAY "ENTER ESI :".
           ACCEPT RESI.
           DISPLAY "ENTER REVISED DATE :".
           ACCEPT RREVDATE.
           WRITE REVISIONREC.
           CLOSE REVISIONFILE.
           GO TO MAIN-PARA.

       PAYMENT-PARA.
           CLEAR.
           OPEN I-O PAYMENTFILE.
           IF FSP = 30
              OPEN OUTPUT PAYMENTFILE.
           DISPLAY "ENTER EMPLOYEE CODE :".
           ACCEPT PEMPID.
           DISPLAY "ENTER BASIC :".
           ACCEPT PBASIC.
           DISPLAY "ENTER DA :".
           ACCEPT PDA.
           DISPLAY "ENTER CCA :".
           ACCEPT PCCA.
           DISPLAY "ENTER HRA :".
           ACCEPT PHRA.
           DISPLAY "ENTER DPA :".
           ACCEPT PDPA.
           DISPLAY "ENTER PPA :".
           ACCEPT PPPA.
           DISPLAY "ENTER EDUCATIONAL ALLOWANCE :".
           ACCEPT PEDUA.
           DISPLAY "ENTER TECH. JOURNAL :".
           ACCEPT PTECHJR.
           DISPLAY "ENTER LUNCH ALLOWANCE :".
           ACCEPT PLUNCHA.
           DISPLAY "ENTER CONVEYANCE :".
           ACCEPT PCONVEY.
           DISPLAY "ENTER BUSINESS ATTIREMENT :".
           ACCEPT PBUSATR.
           DISPLAY "ENTER LEAVE TRAVEL ALLOWANCE :".
           ACCEPT PLTA.
           DISPLAY "ENTER PF :".
           ACCEPT PPF.
           DISPLAY "ENTER ESI :".
           ACCEPT PESI.
           DISPLAY "ENTER GRATUITY :".
           ACCEPT PGRTY.
           DISPLAY "ENTER PROFESSIONAL TAX :".
           ACCEPT PPTAX.
           DISPLAY "ENTER INCOME TAX :".
           ACCEPT PITAX.
           DISPLAY "ENTER LOAN :".
           ACCEPT PLOAN.
           DISPLAY "ENTER LOAN DEDUCTION AMOUNT :".
           ACCEPT PLOANDA.
           DISPLAY "ENTER OTHER DEDUCTION :".
           ACCEPT POTHERD.
           DISPLAY "ENTER PERFORMANCE INCENTIVE :".
           ACCEPT PPERINC.
           DISPLAY "ENTER MEDICAL REIMBURSEMENT :".
           ACCEPT PMEDI.
           DISPLAY "ENTER BOOK REIMBURSEMENT :".
           ACCEPT PBOOK.
           CLEAR.
           DISPLAY "ENTER ENTERTAINMENT :".
           ACCEPT PENTER.
           DISPLAY "ENTER PHONE :".
           ACCEPT PTPH.
           DISPLAY "ENTER HOUSE RELATED :".
           ACCEPT PHOUSE.
           DISPLAY "ENTER VEHICLE MAINTENANCE :".
           ACCEPT PVEHMAN.
           DISPLAY "ENTER CREDIT CARD :".
           ACCEPT PCREDIT.
           DISPLAY "ENTER CLUB :".
           ACCEPT PCLUB.
           DISPLAY "ENTER CLUB :".
           ACCEPT PCLUB.
           DISPLAY "ENTER CLUB :".
           ACCEPT PCLUB.
           DISPLAY "ENTER CASUAL LEAVE :".
           ACCEPT PCL.
           DISPLAY "ENTER SICK LEAVE :".
           ACCEPT PSL.
           DISPLAY "ENTER PAID LEAVE :".
           ACCEPT PPL.
           DISPLAY "ENTER LEAVE LOSS OF PAY :".
           ACCEPT PLLOP.
           DISPLAY "ENTER OTHER LEAVES :".
           ACCEPT POTHERL.
           WRITE PAYMENTREC.
           CLOSE PAYMENTFILE.
           GO TO MAIN-PARA.

       CONFIRMATION-PARA.
           CLEAR.
           OPEN I-O CONFIRMATIONFILE.
           IF FSC = 30
              OPEN OUTPUT CONFIRMATIONFILE.
           DISPLAY "ENTER CONFIRMATION CODE :".
           ACCEPT CCONID.
           DISPLAY "ENTER EMP CODE :".
           ACCEPT CEMPID.
           DISPLAY "ENTER CONFIRMATION DATE :".
           ACCEPT CCDATE.
           WRITE CONFIRMATIONREC.
           CLOSE CONFIRMATIONFILE.
           GO TO MAIN-PARA.

       GRADE-PARA.
           CLEAR.
           OPEN EXTEND GRADEFILE.
           DISPLAY "ENTER GRADE NO. :".
           ACCEPT GGRADE.
           DISPLAY "ENTER DESIGNATION :".
           ACCEPT GDESIGN.
           WRITE GRADEREC.
           CLOSE GRADEFILE.
           GO TO MAIN-PARA.

       TRANSFER-PARA.
           CLEAR.
           OPEN I-O TRANSFERFILE.
           IF FST = 30
              OPEN OUTPUT TRANSFERFILE.
           DISPLAY "ENTER TRANSFER CODE :".
           ACCEPT TTRFID.
           DISPLAY "ENTER EMP CODE :".
           ACCEPT TEMPID.
           DISPLAY "ENTER OLD BRANCH CODE :".
           ACCEPT TOBRID.
           DISPLAY "ENTER TRANSFER DATE :".
           ACCEPT TTRFDT.
           WRITE TRANSFERREC.
           CLOSE TRANSFERFILE.
           GO TO MAIN-PARA.

       EMPPERSONAL-PARA.
           CLEAR.
           OPEN I-O EMPPERSONALFILE.
           IF FSEP = 30
              OPEN OUTPUT EMPPERSONALFILE.
           DISPLAY "ENTER EMP CODE :".
           ACCEPT EPEMPID.
           DISPLAY "ENTER TEMP ADDRESS :".
           ACCEPT EPTADD.
           DISPLAY "ENTER PHONE :".
           ACCEPT EPTPH.
           DISPLAY "ENTER DOB :".
           ACCEPT EPDOB.
           DISPLAY "ENTER POB :".
           ACCEPT EPPOB.
           DISPLAY "ENTER LANGUAGE KNOWN :".
           ACCEPT EPLANG.
           DISPLAY "ENTER BLOOD GROUP :".
           ACCEPT EPBLOOD.
           DISPLAY "ENTER WEIGHT :".
           ACCEPT EPWEIGHT.
           DISPLAY "ENTER HEIGHT :".
           ACCEPT EPHEIGHT.
           DISPLAY "ENTER VISION :".
           ACCEPT EPVISION.
           DISPLAY "ENTER FATHER'S NAME :".
           ACCEPT EPFATHER.
           DISPLAY "ENTER DOB OF FATHER :".
           ACCEPT EPDOBF.
           DISPLAY "ENTER MOTHER'S NAME :".
           ACCEPT EPMOTHER.
           DISPLAY "ENTER DOB OF MOTHER :".
           ACCEPT EPDOBM.
           DISPLAY "ENTER SPOUSE NAME :".
           ACCEPT EPSPOUSE.
           DISPLAY "ENTER CHILD NAME :".
           ACCEPT EPCHILD.
           DISPLAY "ENTER DOB OF CHILD :".
           ACCEPT EPDOBC.
           WRITE EMPPERSONALREC.
           CLOSE EMPPERSONALFILE.
           GO TO MAIN-PARA.
       END PROGRAM EMPWRITE.
