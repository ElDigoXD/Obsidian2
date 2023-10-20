       IDENTIFICATION DIVISION.
       PROGRAM-ID. MAINHRMS.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77 CHOICE PIC 9.
       
       screen section.
       01 main-menu.
           03 line 3 column 15 value 
               "*******************************************".
           03 line 5 column 15 value 
               "     HUMAN RESOURCE MANAGEMENT SYSTEM      ".
           03 line 7 column 15 value 
               "*******************************************".
           03 line 10 column 25 value "1. HRMS WRITE".
           03 line 12 column 25 value "2. HRMS READ".
           03 line 14 column 25 value "3. HRMS DELETE".
           03 line 16 column 25 value "4. EXIT".
           03 line 18 column 25 value "ENTER YOUR CHOICE :".
           03 line 18 column 46 using CHOICE.
           

       PROCEDURE DIVISION.
       MAIN-PARA.
           DISPLAY " " AT 0101 ERASE EOS.
           accept main-menu.
           IF CHOICE = 1
              CALL "EMPWRITE"
              CANCEL "EMPWRITE"
              GO TO MAIN-PARA
           ELSE
             IF CHOICE = 2
                CALL "EMPREAD"
                CANCEL "EMPREAD"
                GO TO MAIN-PARA
             else
               IF CHOICE = 3
                 CALL "EMPDELETE"
                 CANCEL "EMPDELETE"
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
           VALUE OF FILE-ID IS "DATA/EMP.DAT".
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
           VALUE OF FILE-ID IS "DATA/LEAVE.DAT".
       01 LEAVEREC.
           02 LEMPID    PIC X(6).
           02 LFMDATE   PIC X(10).
           02 LTODATE   PIC X(10).
           02 LLEVCAT   PIC X(3).

       FD BRANCHFILE
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "DATA/BRANCH.DAT".
       01 BRANCHREC.
           02 BBRID    PIC X(6).
           02 BBRNAME  PIC X(15).
           02 BBRADD   PIC X(30).
           02 BBRPH    PIC X(10).
           02 BEMAIL   PIC X(20).
           02 BMGRNAME PIC X(25).

       FD DESIGNATIONFILE
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "DATA/DESIG.DAT".
       01 DESIGNATIONREC.
           02 DESID    PIC X(6).
           02 DESIGN   PIC X(15).
           02 DESHRT   PIC X(4).

       FD DEPARTMENTFILE
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "DATA/DEPART.DAT".
       01 DEPARTMENTREC.
           02 DEPCODE  PIC X(6).
           02 DEPNAME  PIC X(20).

       FD REVISIONFILE
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "DATA/REVISION.DAT".
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
           VALUE OF FILE-ID IS "DATA/PAYMENT.DAT".
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
           VALUE OF FILE-ID IS "DATA/CONFIRM.DAT".
       01 CONFIRMATIONREC.
           02 CCONID   PIC X(6).
           02 CEMPID   PIC X(6).
           02 CCDATE   PIC X(6).

       FD GRADEFILE
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "DATA/GRADE.DAT".
       01 GRADEREC.
           02 GGRADE   PIC 99.
           02 GDESIGN  PIC X(25).

       FD TRANSFERFILE
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "DATA/TRANSFER.DAT".
       01 TRANSFERREC.
           02 TTRFID   PIC X(6).
           02 TEMPID   PIC X(6).
           02 TOBRID   PIC X(6).
           02 TTRFDT   PIC X(10).

       FD EMPPERSONALFILE
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "DATA/EMPPER.DAT".
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
       
        screen section.
       01 main-para-menu.
           03 line 3 column 10 value 
               "*******************************************".
           03 line 5 column 10 value 
               "     HUMAN RESOURCE MANAGEMENT SYSTEM      ".
           03 line 7 column 10 value 
               "*******************************************".
           03 line 11 column 5 value " 1. EMPLOYEE FILE".
           03 line 12 column 5 value " 2. LEAVE FILE".
           03 line 13 column 5 value " 3. BRANCH FILE".
           03 line 14 column 5 value " 4. DESIGNATION FILE".
           03 line 15 column 5 value " 5. DEPARTMENT FILE".
           03 line 16 column 5 value " 6. REVISION FILE".
           03 line 17 column 5 value " 7. PAYMENT FILE".
           03 line 18 column 5 value " 8. CONFIRMATION FILE".
           03 line 19 column 5 value " 9. GRADE FILE".
           03 line 20 column 5 value "10. TRANSFER FILE".
           03 line 21 column 5 value "11. EMPLOYEE PERSONAL FILE".
           03 line 22 column 5 value "12. EXIT".
           03 line 23 column 25 value "ENTER U R CHOICE :".
           03 line 23 column 45 using CHOICE.

       01 emp-para-select.
           03 line 1 column 1 value "ENTER CODE :".
           03 line 2 column 1 using EEMPID.

       01 emp-para-menu.
           03 line 1 column 1 value " ".
           03 line 1 column 1 value " CODE                 :".
           03 line 1 column 25 from EEMPID.
           03 line 2 column 1 value " NAME                 :".
           03 line 2 column 25 from EEMPNAME.
           03 line 3 column 1 value " ADDRESS              :".
           03 line 3 column 25 from EEMPADDR.
           03 line 4 column 1 value " PHONE                :".
           03 line 4 column 25 from EPHONE.
           03 line 5 column 1 value " DATE OF JOIN         :".
           03 line 5 column 25 from EDOJ.
           03 line 6 column 1 value " DIPLOMA              :".
           03 line 6 column 25 from EDIP.
           03 line 7 column 1 value " UG                   :".
           03 line 7 column 25 from EUG.
           03 line 8 column 1 value " PG                   :".
           03 line 8 column 25 from EPG.
           03 line 9 column 1 value " PROFESSIONAL QUALITY :".
           03 line 9 column 25 from EPROFQ.
           03 line 10 column 1 value " SKILL SET            :".
           03 line 10 column 25 from ESKILL.
           03 line 11 column 1 value " GRADE NUMBER         :".
           03 line 11 column 25 from EGRDNO.
           03 line 12 column 1 value " BRANCH CODE          :".
           03 line 12 column 25 from EBRNID.
           03 line 13 column 1 value " DESIGNATION CODE     :".
           03 line 13 column 25 from EDESID.
           03 line 20 column 10 value 
               "PRESS ENTER TO RETURN TO HRMS READ MENU".

       01 leave-para-select.
           03 line 1 column 1 value " ".
           03 line 1 column 1 value "ENTER CODE :".
           03 line 2 column 1 using LEMPID.

       01 leave-para-menu.
           03 line 1 column 1 value " ".
           03 line 1 column 1 value " CODE           :".
           03 line 1 column 19 from LEMPID.
           03 line 2 column 1 value " DATE           :".
           03 line 2 column 19 from LFMDATE.
           03 line 3 column 1 value " DATE           :".
           03 line 3 column 19 from LTODATE.
           03 line 4 column 1 value " LEAVE CATEGORY :".
           03 line 4 column 19 from LLEVCAT.
           03 line 20 column 10 value 
               "PRESS ENTER TO RETURN TO HRMS READ MENU".

       01 branch-para-select.
           03 line 1 column 1 value " ".
           03 line 1 column 1 value " BRANCH CODE :".
           03 line 2 column 1 using BBRID.

       01 branch-para-menu.
           03 line 1 column 1 value " ".
           03 line 1 column 1 value " BRANCH CODE    :".
           03 line 1 column 19 from BBRID.
           03 line 2 column 1 value " BRANCH NAME    :".
           03 line 2 column 19 from BBRNAME.
           03 line 3 column 1 value " BRANCH ADDRESS :".
           03 line 3 column 19 from BBRADD.
           03 line 4 column 1 value " PHONE          :".
           03 line 4 column 19 from BBRPH.
           03 line 5 column 1 value " E-MAIL         :".
           03 line 5 column 19 from BEMAIL .
           03 line 5 column 1 value " MANAGER NAME   :".
           03 line 5 column 19 from BMGRNAME.
           03 line 20 column 10 value 
               "PRESS ENTER TO RETURN TO HRMS READ MENU".

       01 designation-para-select.
           03 line 1 column 1 value " ".
           03 line 1 column 1 value "ENTER THE DESIGNATION CODE :".
           03 line 2 column 1 using DES.

       01 designation-para-menu.
           03 line 1 column 1 value " ".
           03 line 1 column 1 value " DESIGNATION CODE     :".
           03 line 1 column 25 from DESID.
           03 line 2 column 1 value " DESIGNATION          :".
           03 line 2 column 25 from DESIGN.
           03 line 3 column 1 value " DESIGNATION IN SHORT :".
           03 line 3 column 25 from DESHRT.
           03 line 1 column 1 value ' '.
           03 line 1 column 1 value ' '.

              01 department-para-select.
           03 line 1 column 1 value " ".
           03 line 1 column 1 value "ENTER DEP CODE :".
           03 line 2 column 1 using DEPCODE.

       01 department-para-menu.
           03 line 1 column 1 value " ".
           03 line 1 column 1 value " DEPARTMENT CODE :".
           03 line 1 column 20 from DEPCODE.
           03 line 2 column 1 value " DEPARTMENT NAME :".
           03 line 2 column 20 from DEPNAME.
           03 line 20 column 10 value 
               "PRESS ENTER TO RETURN TO HRMS READ MENU".

       01 revision-para-select.
           03 line 1 column 1 value " ".
           03 line 1 column 1 value "ENTER REVISION CODE:".
           03 line 2 column 1 using RREVID.

       01 revision-para-menu.
           03 line 1 column 1 value " ".
           03 line 1 column 1 value " REVISION CODE           :".
           03 line 1 column 28 from RREVID.
           03 line 2 column 1 value " EMPLOYEE CODE           :".
           03 line 2 column 28 from REMPID.
           03 line 3 column 1 value " DESIGNATION CODE        :".
           03 line 3 column 28 from RDESCODE.
           03 line 4 column 1 value " BASIC                   :".
           03 line 4 column 28 from RBASIC.
           03 line 5 column 1 value " HRA                     :".
           03 line 5 column 28 from RHRA.
           03 line 6 column 1 value " DPA                     :".
           03 line 6 column 28 from RDPA.
           03 line 7 column 1 value " PPA                     :".
           03 line 7 column 28 from RPPA.
           03 line 8 column 1 value " EDUCATIONAL ALLOWANCE   :".
           03 line 8 column 28 from REDUA.
           03 line 9 column 1 value " TECHNICAL JOURNAL       :".
           03 line 9 column 28 from RTECHJR.
           03 line 10 column 1 value " LUNCH ALLOWANCE        :".
           03 line 10 column 27 from RLUNCHA.
           03 line 11 column 1 value " CONVEYANCE             :".
           03 line 11 column 27 from RCONVEY.
           03 line 12 column 1 value " BUSINESS ATTIREMENT    :".
           03 line 12 column 27 from RBUSATR.
           03 line 13 column 1 value " LEAVE TRAVEL ALLOWANCE :".
           03 line 13 column 27 from RLTA.
           03 line 14 column 1 value " PF                     :".
           03 line 14 column 27 from RPF.
           03 line 15 column 1 value " ESI                    :".
           03 line 15 column 27 from RESI.
           03 line 16 column 1 value " REVISED DATE           :".
           03 line 16 column 27 from RREVDATE.
           03 line 20 column 10 value 
               "PRESS ENTER TO RETURN TO HRMS READ MENU".

       01 payment-para-select.
           03 line 1 column 1 value " ".
           03 line 1 column 1 value "ENTER EMP CODE :".
           03 line 2 column 1 using PEMPID.

       01 payment-para-menu.
           03 line 1 column 1 value " ".
           03 line 1 column 1 value " EMPLOYEE CODE                  :".
           03 line 1 column 35 from PEMPID.
           03 line 2 column 1 value " BASIC                          :".
           03 line 2 column 35 from PBASIC.
           03 line 3 column 1 value " DEARNESS ALLOWANCE             :".
           03 line 3 column 35 from PDA.
           03 line 4 column 1 value " CITY COMPENSATORY ALLOWANCE    :".
           03 line 4 column 35 from PCCA.
           03 line 5 column 1 value " HRA                            :".
           03 line 5 column 35 from PHRA.
           03 line 6 column 1 value " DPA                            :".
           03 line 6 column 35 from PDPA.
           03 line 7 column 1 value " PPA                            :".
           03 line 7 column 35 from PPPA.
           03 line 8 column 1 value " EDUCATIONAL ALLOWANCE          :".
           03 line 8 column 35 from PEDUA.
           03 line 9 column 1 value " TECHNICAL JOURNAL              :".
           03 line 9 column 35 from PTECHJR.
           03 line 10 column 1 value " LUNCH ALLOWANCE               :".
           03 line 10 column 34 from PLUNCHA.
           03 line 11 column 1 value " CONVEYANCE                    :".
           03 line 11 column 34 from PCONVEY.
           03 line 12 column 1 value " BUSINESS ATTIREMENT           :".
           03 line 12 column 34 from PBUSATR.
           03 line 13 column 1 value " LEAVE TRAVEL ALLOWANCE        :".
           03 line 13 column 34 from PLTA.
           03 line 14 column 1 value " PF                            :".
           03 line 14 column 34 from PPF.
           03 line 15 column 1 value " ESI                           :".
           03 line 15 column 34 from PESI.
           03 line 16 column 1 value " GRATUITY                      :".
           03 line 16 column 34 from PGRTY.
           03 line 17 column 1 value " PROFESSIONAL TAX              :".
           03 line 17 column 34 from PPTAX.
           03 line 18 column 1 value " INCOME TAX                    :".
           03 line 18 column 34 from PITAX.
           03 line 19 column 1 value " LOAN                          :".
           03 line 19 column 34 from PLOAN.
           03 line 20 column 1 value " LOAN DEDUCTION AMOUNT         :".
           03 line 20 column 34 from PLOANDA.
           03 line 21 column 1 value " OTHER DEDUCTION               :".
           03 line 21 column 34 from POTHERD.
           03 line 22 column 1 value " PERFORMANCE INCENTIVE         :".
           03 line 22 column 34 from PPERINC.
           03 line 23 column 1 value " MEDICAL REIMBURSEMENT         :".
           03 line 23 column 34 from PMEDI.
           03 line 24 column 1 value " BOOK REIMBURSEMENT            :".
           03 line 24 column 34 from PBOOK.

       01 payment-para-menu-2.
           03 line 1 column 1 value " ".
           03 line 1 column 1 value " ENTERTAINMENT                  :".
           03 line 1 column 35 from PENTER.
           03 line 2 column 1 value " PHONE                          :".
           03 line 2 column 35 from PTPH.
           03 line 3 column 1 value " HOUSE RELATED                  :".
           03 line 3 column 35 from PHOUSE.
           03 line 4 column 1 value " VEHICLE MAINTENANCE            :".
           03 line 4 column 35 from PVEHMAN.
           03 line 5 column 1 value " CREDIT CARD                    :".
           03 line 5 column 35 from PCREDIT.
           03 line 6 column 1 value " CLUB                           :".
           03 line 6 column 35 from PCLUB.
           03 line 7 column 1 value " CASUAL LEAVE                   :".
           03 line 7 column 35 from PCL.
           03 line 8 column 1 value " SICK LEAVE                     :".
           03 line 8 column 35 from PSL.
           03 line 9 column 1 value " PAID LEAVE                     :".
           03 line 9 column 35 from PPL.
           03 line 10 column 1 value " LEAVE LOSS OF PAY             :".
           03 line 10 column 34 from PLLOP.
           03 line 11 column 1 value " OTHER LEAVES                  :".
           03 line 11 column 34 from POTHERL.
           03 line 20 column 10 value 
               "PRESS ENTER TO RETURN TO HRMS READ MENU".

       01 confirmation-para-select.
           03 line 1 column 1 value " ".
           03 line 1 column 1 value "ENTER CODE :".
           03 line 2 column 1 using CCONID.

       01 confirmation-para-menu.
           03 line 1 column 1 value " ".
           03 line 1 column 1 value " CONFIRMATION CODE :".
           03 line 1 column 22 from CCONID.
           03 line 2 column 1 value " EMPLOYEE CODE     :".
           03 line 2 column 22 from CEMPID.
           03 line 3 column 1 value " CONFIRMATION DATE :".
           03 line 3 column 22 from CCDATE.
           03 line 20 column 10 value 
               "PRESS ENTER TO RETURN TO HRMS READ MENU".

       01 grade-para-select.
           03 line 1 column 1 value " ".
           03 line 1 column 1 value "ENTER GRADE NO. :".
           03 line 2 column 1 using GR.

       01 grade-para-menu.
           03 line 1 column 1 value " ".
           03 line 1 column 1 value " GRADE NO.   :".
           03 line 1 column 16 from GGRADE.
           03 line 2 column 1 value " DESIGNATION :".
           03 line 2 column 16 from GDESIGN.
           03 line 1 column 1 value ' '.
           03 line 1 column 1 value ' '.
           03 line 1 column 1 value 
               "PRESS ENTER TO RETURN TO HRMS READ MENU".

       01 transfer-para-select.
           03 line 1 column 1 value " ".
           03 line 1 column 1 value "ENTER TRANSFER CODE :".
           03 line 2 column 1 using TTRFID.

       01 transfer-para-menu.
           03 line 1 column 1 value " ".
           03 line 1 column 1 value " TRANSFER CODE     :".
           03 line 1 column 22 from TTRFID.
           03 line 2 column 1 value " EMP CODE          :".
           03 line 2 column 22 from TEMPID.
           03 line 3 column 1 value " OLD BRANCH CODE   :".
           03 line 3 column 22 from TOBRID.
           03 line 4 column 1 value " TRANSFER DATE     :".
           03 line 4 column 22 from TTRFDT.
           03 line 20 column 10 value 
               "PRESS ENTER TO RETURN TO HRMS READ MENU".

       01 emppersonal-para-select.
           03 line 1 column 1 value " ".
           03 line 1 column 1 value "ENTER EMP CODE :".
           03 line 2 column 1 using EPEMPID.

       01 emppersonal-para-menu.
           03 line 1 column 1 value " ".
           03 line 1 column 1 value " EMPLOYEE CODE     :".
           03 line 1 column 22 from EPEMPID.
           03 line 2 column 1 value " TEMPORARY ADDRESS :".
           03 line 2 column 22 from EPTADD.
           03 line 3 column 1 value " PHONE             :".
           03 line 3 column 22 from EPTPH.
           03 line 4 column 1 value " DOB               :".
           03 line 4 column 22 from EPDOB.
           03 line 5 column 1 value " POB               :".
           03 line 5 column 22 from EPPOB.
           03 line 6 column 1 value " LANGUAGE KNOWN    :".
           03 line 6 column 22 from EPLANG.
           03 line 7 column 1 value " BLOOD GROUP       :".
           03 line 7 column 22 from EPBLOOD.
           03 line 8 column 1 value " WEIGHT            :".
           03 line 8 column 22 from EPWEIGHT.
           03 line 9 column 1 value " HEIGHT            :".
           03 line 9 column 22 from EPHEIGHT.
           03 line 10 column 1 value " VISION           :".
           03 line 10 column 21 from EPVISION.
           03 line 11 column 1 value " FATHER'S NAME    :".
           03 line 11 column 21 from EPFATHER.
           03 line 12 column 1 value " DOB OF FATHER    :".
           03 line 12 column 21 from EPDOBF.
           03 line 13 column 1 value " MOTHER'S NAME    :".
           03 line 13 column 21 from EPMOTHER.
           03 line 14 column 1 value " DOB OF MOTHER    :".
           03 line 14 column 21 from EPDOBM.
           03 line 15 column 1 value " SPOUSE NAME      :".
           03 line 15 column 21 from EPSPOUSE.
           03 line 16 column 1 value " CHILD NAME       :".
           03 line 16 column 21 from EPCHILD.
           03 line 17 column 1 value " DOB OF CHILD     :".
           03 line 17 column 21 from EPDOBC.
           03 line 20 column 10 value 
               "PRESS ENTER TO RETURN TO HRMS READ MENU".

       01 invalid-code.
           03 line 1 column 1 value " ".
           03 line 12 column 30 value "INVALID CODE".
           03 line 20 column 10 value 
               "PRESS ENTER TO RETURN TO HRMS READ MENU".
       PROCEDURE DIVISION.
       MAIN-PARA.
           DISPLAY " " AT 0101 ERASE EOS.
           accept main-para-menu.
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
           accept emp-para-select.
           DISPLAY " " AT 0101 ERASE EOS.
           READ EMPFILE INVALID KEY GO TO ERROR-EMP-PARA.
           accept emp-para-menu.
           CLOSE EMPFILE.
           STOP ' '.
           GO TO MAIN-PARA.

       LEAVE-PARA.
           DISPLAY " " AT 0101 ERASE EOS.
           OPEN INPUT LEAVEFILE.
           accept leave-para-select.
           DISPLAY " " AT 0101 ERASE EOS.
           READ LEAVEFILE INVALID KEY GO TO ERROR-LEAVE-PARA.
           accept leave-para-menu.      
           CLOSE LEAVEFILE.
           STOP ' '.
           GO TO MAIN-PARA.

        BRANCH-PARA.
           DISPLAY " " AT 0101 ERASE EOS.
           OPEN INPUT BRANCHFILE.
           accept branch-para-select.
           DISPLAY " " AT 0101 ERASE EOS.
           READ BRANCHFILE INVALID KEY GO TO ERROR-BRANCH-PARA.
           accept branch-para-menu.
           CLOSE BRANCHFILE.
           STOP ' '.
           GO TO MAIN-PARA.

       DESIGNATION-PARA.
           DISPLAY " " AT 0101 ERASE EOS.
           OPEN INPUT DESIGNATIONFILE.
           accept designation-para-select.
           DISPLAY " " AT 0101 ERASE EOS.
           PERFORM DES-READ-PARA UNTIL FSDES = 10.
       DES-READ-PARA.
           READ DESIGNATIONFILE AT END GO TO DES-EXIT-PARA.
           IF DESID = DES
           accept designation-para-menu.
       DES-EXIT-PARA.
           CLOSE DESIGNATIONFILE.
           DISPLAY "PRESS ENTER TO RETURN TO HRMS READ MENU".
           STOP ' '.
           GO TO MAIN-PARA.

       DEPARTMENT-PARA.
           DISPLAY " " AT 0101 ERASE EOS.
           OPEN INPUT DEPARTMENTFILE.
           accept department-para-select.
           DISPLAY " " AT 0101 ERASE EOS.
           READ DEPARTMENTFILE INVALID KEY
                     GO TO ERROR-DEPARTMENT-PARA.
           accept department-para-menu.
           CLOSE DEPARTMENTFILE.
           STOP ' '.
           GO TO MAIN-PARA.

       REVISION-PARA.
           DISPLAY " " AT 0101 ERASE EOS.
           OPEN INPUT REVISIONFILE.
           accept revision-para-select.
           DISPLAY " " AT 0101 ERASE EOS.
           READ REVISIONFILE INVALID KEY
                    GO TO ERROR-REVISION-PARA.
           accept revision-para-menu.
           CLOSE REVISIONFILE.
           STOP ' '.
           GO TO MAIN-PARA.

       PAYMENT-PARA.
           DISPLAY " " AT 0101 ERASE EOS.
           OPEN INPUT PAYMENTFILE.
           accept payment-para-select
           DISPLAY " " AT 0101 ERASE EOS.
           READ PAYMENTFILE INVALID KEY GO TO ERROR-PAYMENT-PARA.
           accept payment-para-menu.
           DISPLAY " " AT 0101 ERASE EOS.
           accept payment-para-menu-2.
           CLOSE PAYMENTFILE.
           STOP ' '.
           GO TO MAIN-PARA.

       CONFIRMATION-PARA.
           DISPLAY " " AT 0101 ERASE EOS.
           OPEN INPUT CONFIRMATIONFILE.
           accept confirmation-para-select.
           DISPLAY " " AT 0101 ERASE EOS.
           READ CONFIRMATIONFILE INVALID KEY
                   GO TO ERROR-CONFIRMATION-PARA.
           accept confirmation-para-menu.
           CLOSE CONFIRMATIONFILE.
           STOP ' '.
           GO TO MAIN-PARA.

       GRADE-PARA.
           DISPLAY " " AT 0101 ERASE EOS.
           OPEN INPUT GRADEFILE.
           accept grade-para-select.
           DISPLAY " " AT 0101 ERASE EOS.
           PERFORM GR-READ-PARA UNTIL FSG = 10.
       GR-READ-PARA.
           READ GRADEFILE AT END GO TO GR-EXIT-PARA.
           IF GGRADE = GR
           accept grade-para-menu.
       GR-EXIT-PARA.
           CLOSE GRADEFILE.
           DISPLAY "PRESS ENTER TO RETURN TO HRMS READ MENU".
           STOP ' '.
           GO TO MAIN-PARA.

       TRANSFER-PARA.
           DISPLAY " " AT 0101 ERASE EOS.
           OPEN INPUT TRANSFERFILE.
           accept transfer-para-select.
           DISPLAY " " AT 0101 ERASE EOS.
           READ TRANSFERFILE INVALID KEY GO TO ERROR-TRANSFER-PARA.
           accept transfer-para-menu.
           CLOSE TRANSFERFILE.
           STOP ' '.
           GO TO MAIN-PARA.

       EMPPERSONAL-PARA.
           DISPLAY " " AT 0101 ERASE EOS.
           OPEN INPUT EMPPERSONALFILE.
           accept emppersonal-para-select.
           DISPLAY " " AT 0101 ERASE EOS.
           READ EMPPERSONALFILE INVALID KEY
                           GO TO ERROR-EMPPERSONAL-PARA.
           accept emppersonal-para-menu.
           CLOSE EMPPERSONALFILE.
           STOP ' '.
           GO TO MAIN-PARA.

       ERROR-EMP-PARA.
           CLOSE EMPFILE.
           DISPLAY " " AT 0101 ERASE EOS.
           accept invalid-code.
           STOP ' '.
           GO TO MAIN-PARA.

       ERROR-LEAVE-PARA.
           CLOSE LEAVEFILE.
           DISPLAY " " AT 0101 ERASE EOS.
           accept invalid-code.
           STOP ' '.
           GO TO MAIN-PARA.

       ERROR-BRANCH-PARA.
           CLOSE BRANCHFILE.
           DISPLAY " " AT 0101 ERASE EOS.
           accept invalid-code.
           STOP ' '.
           GO TO MAIN-PARA.

       ERROR-DEPARTMENT-PARA.
           CLOSE DEPARTMENTFILE.
           DISPLAY " " AT 0101 ERASE EOS.
           accept invalid-code.
           STOP ' '.
           GO TO MAIN-PARA.

       ERROR-REVISION-PARA.
           CLOSE REVISIONFILE.
           DISPLAY " " AT 0101 ERASE EOS.
           accept invalid-code.
           STOP ' '.
           GO TO MAIN-PARA.

       ERROR-PAYMENT-PARA.
           CLOSE PAYMENTFILE.
           DISPLAY " " AT 0101 ERASE EOS.
           accept invalid-code.
           STOP ' '.
           GO TO MAIN-PARA.

       ERROR-CONFIRMATION-PARA.
           CLOSE CONFIRMATIONFILE.
           DISPLAY " " AT 0101 ERASE EOS.
           accept invalid-code.
           STOP ' '.
           GO TO MAIN-PARA.

       ERROR-TRANSFER-PARA.
           CLOSE TRANSFERFILE.
           DISPLAY " " AT 0101 ERASE EOS.
           accept invalid-code.
           STOP ' '.
           GO TO MAIN-PARA.

       ERROR-EMPPERSONAL-PARA.
           CLOSE EMPPERSONALFILE.
           DISPLAY " " AT 0101 ERASE EOS.
           accept invalid-code.
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
           VALUE OF FILE-ID IS "DATA/EMP.DAT".
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
           VALUE OF FILE-ID IS "DATA/LEAVE.DAT".
       01 LEAVEREC.
           02 LEMPID    PIC X(6).
           02 LFMDATE   PIC X(10).
           02 LTODATE   PIC X(10).
           02 LLEVCAT   PIC X(3).

       FD BRANCHFILE
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "DATA/BRANCH.DAT".
       01 BRANCHREC.
           02 BBRID    PIC X(6).
           02 BBRNAME  PIC X(15).
           02 BBRADD   PIC X(30).
           02 BBRPH    PIC X(10).
           02 BEMAIL   PIC X(20).
           02 BMGRNAME PIC X(25).

       FD DESIGNATIONFILE
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "DATA/DESIG.DAT".
       01 DESIGNATIONREC.
           02 DESID    PIC X(6).
           02 DESIGN   PIC X(15).
           02 DESHRT   PIC X(4).

       FD DEPARTMENTFILE
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "DATA/DEPART.DAT".
       01 DEPARTMENTREC.
           02 DEPCODE  PIC X(6).
           02 DEPNAME  PIC X(20).

       FD REVISIONFILE
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "DATA/REVISION.DAT".
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
           VALUE OF FILE-ID IS "DATA/PAYMENT.DAT".
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
           VALUE OF FILE-ID IS "DATA/CONFIRM.DAT".
       01 CONFIRMATIONREC.
           02 CCONID   PIC X(6).
           02 CEMPID   PIC X(6).
           02 CCDATE   PIC X(6).

       FD GRADEFILE
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "DATA/GRADE.DAT".
       01 GRADEREC.
           02 GGRADE   PIC 99.
           02 GDESIGN  PIC X(25).

       FD TRANSFERFILE
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "DATA/TRANSFER.DAT".
       01 TRANSFERREC.
           02 TTRFID   PIC X(6).
           02 TEMPID   PIC X(6).
           02 TOBRID   PIC X(6).
           02 TTRFDT   PIC X(10).

       FD EMPPERSONALFILE
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "DATA/EMPPER.DAT".
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
       
       screen section.
       01 main-para-menu.
           03 line 1 column 1 value " ".
           03 line 3 column 10 value 
               "*******************************************".
           03 line 5 column 10 value 
               "     HUMAN RESOURCE MANAGEMENT SYSTEM      ".
           03 line 7 column 10 value 
               "*******************************************".
           03 line 11 column 5 value " 1. EMPLOYEE FILE".
           03 line 12 column 5 value " 2. LEAVE FILE".
           03 line 13 column 5 value " 3. BRANCH FILE".
           03 line 14 column 5 value " 4. DESIGNATION FILE".
           03 line 15 column 5 value " 5. DEPARTMENT FILE".
           03 line 16 column 5 value " 6. REVISION FILE".
           03 line 17 column 5 value " 7. PAYMENT FILE".
           03 line 18 column 5 value " 8. CONFIRMATION FILE".
           03 line 19 column 5 value " 9. GRADE FILE".
           03 line 20 column 5 value "10. TRANSFER FILE".
           03 line 21 column 5 value "11. EMPLOYEE PERSONAL FILE".
           03 line 22 column 5 value "12. EXIT".
           03 line 23 column 25 value "ENTER U R CHOICE :".
           03 line 23 column 45 using CHOICE.

       01 emp-para-menu.
           03 line 1 column 1 value " ".
           03 line 1 column 1 value "ENTER CODE :".
           03 line 1 column 35 using EEMPID.
           03 line 2 column 1 value "ENTER NAME :".
           03 line 2 column 35 using EEMPNAME.
           03 line 3 column 1 value "ENTER ADDRESS :".
           03 line 3 column 35 using EEMPADDR.
           03 line 4 column 1 value "ENTER PHONE :".
           03 line 4 column 35 using EPHONE.
           03 line 5 column 1 value "ENTER DATE OF JOIN :".
           03 line 5 column 35 using EDOJ.
           03 line 6 column 1 value "ENTER DIPLOMA :".
           03 line 6 column 35 using EDIP.
           03 line 7 column 1 value "ENTER UG :".
           03 line 7 column 35 using EUG.
           03 line 8 column 1 value "ENTER PG :".
           03 line 8 column 35 using EPG.
           03 line 9 column 1 value "ENTER PROFESSIONAL QUALITY :".
           03 line 9 column 35 using EPROFQ.
           03 line 10 column 1 value "ENTER SKILL SET :".
           03 line 10 column 35 using ESKILL.
           03 line 11 column 1 value "ENTER GRADE NUMBER :".
           03 line 11 column 35 using EGRDNO.
           03 line 12 column 1 value "ENTER BRANCH CODE :".
           03 line 12 column 35 using EBRNID.
           03 line 13 column 1 value "ENTER DESIGNATION CODE :".
           03 line 13 column 35 using EDESID.

       01 leave-para-menu.
           03 line 1 column 1 value " ".
           03 line 1 column 1 value "ENTER CODE :".
           03 line 1 column 35 using LEMPID.
           03 line 2 column 1 value "ENTER FROM DATE :".
           03 line 2 column 35 using LFMDATE.
           03 line 3 column 1 value "ENTER TO DATE :".
           03 line 3 column 35 using LTODATE.
           03 line 4 column 1 value "ENTER LEAVE CATEGORY :".
           03 line 4 column 35 using LLEVCAT.

       01 branch-para-menu.
           03 line 1 column 1 value " ".
           03 line 1 column 1 value "ENTER BRANCH CODE :".
           03 line 1 column 35 using BBRID.
           03 line 2 column 1 value "ENTER BRANCH NAME :".
           03 line 2 column 35 using BBRNAME.
           03 line 3 column 1 value "ENTER BRANCH ADDRESS :".
           03 line 3 column 35 using BBRADD.
           03 line 4 column 1 value "ENTER PHONE :".
           03 line 4 column 35 using BBRPH.
           03 line 5 column 1 value "ENTER E-MAIL :".
           03 line 5 column 35 using BEMAIL.
           03 line 5 column 1 value "ENTER MANAGER NAME :".
           03 line 5 column 35 using BMGRNAME.

       01 designation-para-menu.
           03 line 1 column 1 value " ".
           03 line 1 column 1 value "ENTER DESIGNATION CODE :".
           03 line 1 column 35 using DESID.
           03 line 2 column 1 value "ENTER DESIGNATION :".
           03 line 2 column 35 using DESIGN.
           03 line 3 column 1 value "ENTER DES IN SHORT :".
           03 line 3 column 35 using DESHRT.

       01 department-para-menu.
           03 line 1 column 1 value " ".
           03 line 1 column 1 value "ENTER DEPARTMENT CODE :".
           03 line 1 column 35 using DEPCODE.
           03 line 2 column 1 value "ENTER DEPARTMENT NAME :".
           03 line 2 column 35 using DEPNAME.

       01 revision-para-menu.
           03 line 1 column 1 value " ".
           03 line 1 column 1 value "ENTER REVISION CODE :".
           03 line 1 column 35 using RREVID.
           03 line 2 column 1 value "ENTER EMPLOYEE CODE :".
           03 line 2 column 35 using REMPID.
           03 line 3 column 1 value "ENTER DESIGNATION CODE :".
           03 line 3 column 35 using RDESCODE.
           03 line 4 column 1 value "ENTER BASIC :".
           03 line 4 column 35 using RBASIC.
           03 line 5 column 1 value "ENTER HRA :".
           03 line 5 column 35 using RHRA.
           03 line 6 column 1 value "ENTER DPA :".
           03 line 6 column 35 using RDPA.
           03 line 7 column 1 value "ENTER PPA :".
           03 line 7 column 35 using RPPA.
           03 line 8 column 1 value "ENTER EDUCATIONAL ALLOWANCE :".
           03 line 8 column 35 using REDUA.
           03 line 9 column 1 value "ENTER TECH. JOURNAL :".
           03 line 9 column 35 using RTECHJR.
           03 line 10 column 1 value "ENTER LUNCH ALLOWANCE :".
           03 line 10 column 35 using RLUNCHA.
           03 line 11 column 1 value "ENTER CONVEYANCE :".
           03 line 11 column 35 using RCONVEY.
           03 line 12 column 1 value "ENTER BUSINESS ATTIREMENT :".
           03 line 12 column 35 using RBUSATR.
           03 line 13 column 1 value "ENTER LEAVE TRAVEL ALLOWANCE :".
           03 line 13 column 35 using RLTA.
           03 line 14 column 1 value "ENTER PF :".
           03 line 14 column 35 using RPF.
           03 line 15 column 1 value "ENTER ESI :".
           03 line 15 column 35 using RESI.
           03 line 16 column 1 value "ENTER REVISED DATE :".
           03 line 16 column 35 using RREVDATE.

       01 payment-para-menu.
           03 line 1 column 1 value " ".
           03 line 1 column 1 value "ENTER EMPLOYEE CODE :".
           03 line 1 column 35 using PEMPID.
           03 line 2 column 1 value "ENTER BASIC :".
           03 line 2 column 35 using PBASIC.
           03 line 3 column 1 value "ENTER DA :".
           03 line 3 column 35 using PDA.
           03 line 4 column 1 value "ENTER CCA :".
           03 line 4 column 35 using PCCA.
           03 line 5 column 1 value "ENTER HRA :".
           03 line 5 column 35 using PHRA.
           03 line 6 column 1 value "ENTER DPA :".
           03 line 6 column 35 using PDPA.
           03 line 7 column 1 value "ENTER PPA :".
           03 line 7 column 35 using PPPA.
           03 line 8 column 1 value "ENTER EDUCATIONAL ALLOWANCE :".
           03 line 8 column 35 using PEDUA.
           03 line 9 column 1 value "ENTER TECH. JOURNAL :".
           03 line 9 column 35 using PTECHJR.
           03 line 10 column 1 value "ENTER LUNCH ALLOWANCE :".
           03 line 10 column 35 using PLUNCHA.
           03 line 11 column 1 value "ENTER CONVEYANCE :".
           03 line 11 column 35 using PCONVEY.
           03 line 12 column 1 value "ENTER BUSINESS ATTIREMENT :".
           03 line 12 column 35 using PBUSATR.
           03 line 13 column 1 value "ENTER LEAVE TRAVEL ALLOWANCE :".
           03 line 13 column 35 using PLTA.
           03 line 14 column 1 value "ENTER PF :".
           03 line 14 column 35 using PPF.
           03 line 15 column 1 value "ENTER ESI :".
           03 line 15 column 35 using PESI.
           03 line 16 column 1 value "ENTER GRATUITY :".
           03 line 16 column 35 using PGRTY.
           03 line 17 column 1 value "ENTER PROFESSIONAL TAX :".
           03 line 17 column 35 using PPTAX.
           03 line 18 column 1 value "ENTER INCOME TAX :".
           03 line 18 column 35 using PITAX.
           03 line 19 column 1 value "ENTER LOAN :".
           03 line 19 column 35 using PLOAN.
           03 line 20 column 1 value "ENTER LOAN DEDUCTION AMOUNT :".
           03 line 20 column 35 using PLOANDA.
           03 line 21 column 1 value "ENTER OTHER DEDUCTION :".
           03 line 21 column 35 using POTHERD.
           03 line 22 column 1 value "ENTER PERFORMANCE INCENTIVE :".
           03 line 22 column 35 using PPERINC.
           03 line 23 column 1 value "ENTER MEDICAL REIMBURSEMENT :".
           03 line 23 column 35 using PMEDI.
           03 line 24 column 1 value "ENTER BOOK REIMBURSEMENT :".
           03 line 24 column 35 using PBOOK.

       01 payment-para-menu-2.
           03 line 1 column 1 value " ".
           03 line 1 column 1 value "ENTER ENTERTAINMENT :".
           03 line 1 column 35 using PENTER.
           03 line 2 column 1 value "ENTER PHONE :".
           03 line 2 column 35 using PTPH.
           03 line 3 column 1 value "ENTER HOUSE RELATED :".
           03 line 3 column 35 using PHOUSE.
           03 line 4 column 1 value "ENTER VEHICLE MAINTENANCE :".
           03 line 4 column 35 using PVEHMAN.
           03 line 5 column 1 value "ENTER CREDIT CARD :".
           03 line 5 column 35 using PCREDIT.
           03 line 6 column 1 value "ENTER CLUB :".
           03 line 6 column 35 using PCLUB.
           03 line 7 column 1 value "ENTER CLUB :".
           03 line 7 column 35 using PCLUB.
           03 line 8 column 1 value "ENTER CLUB :".
           03 line 8 column 35 using PCLUB.
           03 line 9 column 1 value "ENTER CASUAL LEAVE :".
           03 line 9 column 35 using PCL.
           03 line 10 column 1 value "ENTER SICK LEAVE :".
           03 line 10 column 35 using PSL.
           03 line 11 column 1 value "ENTER PAID LEAVE :".
           03 line 11 column 35 using PPL.
           03 line 12 column 1 value "ENTER LEAVE LOSS OF PAY :".
           03 line 12 column 35 using PLLOP.
           03 line 13 column 1 value "ENTER OTHER LEAVES :".
           03 line 13 column 35 using POTHERL.

       01 confirmation-para-menu.
           03 line 1 column 1 value " ".
           03 line 1 column 1 value "ENTER CONFIRMATION CODE :".
           03 line 1 column 35 using CCONID.
           03 line 2 column 1 value "ENTER EMP CODE :".
           03 line 2 column 35 using CEMPID.
           03 line 3 column 1 value "ENTER CONFIRMATION DATE :".
           03 line 3 column 35 using CCDATE.

       01 grade-para-menu.
           03 line 1 column 1 value " ".
           03 line 1 column 1 value "ENTER GRADE NO. :".
           03 line 1 column 35 using GGRADE.
           03 line 2 column 1 value "ENTER DESIGNATION :".
           03 line 2 column 35 using GDESIGN.

       01 transfer-para-menu.
           03 line 1 column 1 value " ".
           03 line 1 column 1 value "ENTER TRANSFER CODE :".
           03 line 1 column 35 using TTRFID.
           03 line 2 column 1 value "ENTER EMP CODE :".
           03 line 2 column 35 using TEMPID.
           03 line 3 column 1 value "ENTER OLD BRANCH CODE :".
           03 line 3 column 35 using TOBRID.
           03 line 4 column 1 value "ENTER TRANSFER DATE :".
           03 line 4 column 35 using TTRFDT.

       01 emppersonal-para-menu.
           03 line 1 column 1 value " ".
           03 line 1 column 1 value "ENTER EMP CODE :".
           03 line 1 column 35 using EPEMPID.
           03 line 2 column 1 value "ENTER TEMP ADDRESS :".
           03 line 2 column 35 using EPTADD.
           03 line 3 column 1 value "ENTER PHONE :".
           03 line 3 column 35 using EPTPH.
           03 line 4 column 1 value "ENTER DOB :".
           03 line 4 column 35 using EPDOB.
           03 line 5 column 1 value "ENTER POB :".
           03 line 5 column 35 using EPPOB.
           03 line 6 column 1 value "ENTER LANGUAGE KNOWN :".
           03 line 6 column 35 using EPLANG.
           03 line 7 column 1 value "ENTER BLOOD GROUP :".
           03 line 7 column 35 using EPBLOOD.
           03 line 8 column 1 value "ENTER WEIGHT :".
           03 line 8 column 35 using EPWEIGHT.
           03 line 9 column 1 value "ENTER HEIGHT :".
           03 line 9 column 35 using EPHEIGHT.
           03 line 10 column 1 value "ENTER VISION :".
           03 line 10 column 35 using EPVISION.
           03 line 11 column 1 value "ENTER FATHER'S NAME :".
           03 line 11 column 35 using EPFATHER.
           03 line 12 column 1 value "ENTER DOB OF FATHER :".
           03 line 12 column 35 using EPDOBF.
           03 line 13 column 1 value "ENTER MOTHER'S NAME :".
           03 line 13 column 35 using EPMOTHER.
           03 line 14 column 1 value "ENTER DOB OF MOTHER :".
           03 line 14 column 35 using EPDOBM.
           03 line 15 column 1 value "ENTER SPOUSE NAME :".
           03 line 15 column 35 using EPSPOUSE.
           03 line 16 column 1 value "ENTER CHILD NAME :".
           03 line 16 column 35 using EPCHILD.
           03 line 17 column 1 value "ENTER DOB OF CHILD :".
           03 line 17 column 35 using EPDOBC.

       PROCEDURE DIVISION.
       MAIN-PARA.
           DISPLAY " " AT 0101 ERASE EOS.
           accept main-para-menu.
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
           accept emp-para-menu.
           WRITE EMPREC.
           CLOSE EMPFILE.
           GO TO MAIN-PARA.

       LEAVE-PARA.
           DISPLAY " " AT 0101 ERASE EOS.
           OPEN I-O LEAVEFILE.
           IF FSL = 30
              OPEN OUTPUT LEAVEFILE.
           accept leave-para-menu.
           WRITE LEAVEREC.
           CLOSE LEAVEFILE.
           GO TO MAIN-PARA.

       BRANCH-PARA.
           DISPLAY " " AT 0101 ERASE EOS.
           OPEN I-O BRANCHFILE.
           IF FSL = 30
              OPEN OUTPUT BRANCHFILE.
           accept branch-para-menu
           WRITE BRANCHREC.
           CLOSE BRANCHFILE.
           GO TO MAIN-PARA.

       DESIGNATION-PARA.
           DISPLAY " " AT 0101 ERASE EOS.
           OPEN EXTEND DESIGNATIONFILE.
           accept designation-para-menu.
           WRITE DESIGNATIONREC.
           CLOSE DESIGNATIONFILE.
           GO TO MAIN-PARA.

       DEPARTMENT-PARA.
           DISPLAY " " AT 0101 ERASE EOS.
           OPEN I-O DEPARTMENTFILE.
           IF FSDEP = 30
              OPEN OUTPUT DEPARTMENTFILE.
           accept department-para-menu.
           CLOSE DEPARTMENTFILE.
           GO TO MAIN-PARA.

       REVISION-PARA.
           DISPLAY " " AT 0101 ERASE EOS.
           OPEN I-O REVISIONFILE.
           IF FSR = 30
              OPEN OUTPUT REVISIONFILE.
           accept revision-para-menu.
           WRITE REVISIONREC.
           CLOSE REVISIONFILE.
           GO TO MAIN-PARA.

       PAYMENT-PARA.
           DISPLAY " " AT 0101 ERASE EOS.
           OPEN I-O PAYMENTFILE.
           IF FSP = 30
              OPEN OUTPUT PAYMENTFILE.
           accept payment-para-menu.
           DISPLAY " " AT 0101 ERASE EOS.
           accept payment-para-menu-2.
           WRITE PAYMENTREC.
           CLOSE PAYMENTFILE.
           GO TO MAIN-PARA.

       CONFIRMATION-PARA.
           DISPLAY " " AT 0101 ERASE EOS.
           OPEN I-O CONFIRMATIONFILE.
           IF FSC = 30
              OPEN OUTPUT CONFIRMATIONFILE.
           accept confirmation-para-menu.
           WRITE CONFIRMATIONREC.
           CLOSE CONFIRMATIONFILE.
           GO TO MAIN-PARA.

       GRADE-PARA.
           DISPLAY " " AT 0101 ERASE EOS.
           OPEN EXTEND GRADEFILE.
           accept grade-para-menu.
           WRITE GRADEREC.
           CLOSE GRADEFILE.
           GO TO MAIN-PARA.

       TRANSFER-PARA.
           DISPLAY " " AT 0101 ERASE EOS.
           OPEN I-O TRANSFERFILE.
           IF FST = 30
              OPEN OUTPUT TRANSFERFILE.
           accept transfer-para-menu.
           WRITE TRANSFERREC.
           CLOSE TRANSFERFILE.
           GO TO MAIN-PARA.

       EMPPERSONAL-PARA.
           DISPLAY " " AT 0101 ERASE EOS.
           OPEN I-O EMPPERSONALFILE.
           IF FSEP = 30
              OPEN OUTPUT EMPPERSONALFILE.
           accept emppersonal-para-menu.
           WRITE EMPPERSONALREC.
           CLOSE EMPPERSONALFILE.
           GO TO MAIN-PARA.
       END PROGRAM EMPWRITE.

       IDENTIFICATION DIVISION.
       PROGRAM-ID. EMPDELETE.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT EMPFILE ASSIGN TO DISK
           ORGANIZATION IS INDEXED
           ACCESS MODE IS DYNAMIC
           RECORD KEY IS EEMPID
           FILE STATUS IS FSE.

       DATA DIVISION.
       FILE SECTION.
       FD EMPFILE
           LABEL RECORDS ARE STANDARD
           VALUE OF FILE-ID IS "DATA/EMP.DAT".

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

       WORKING-STORAGE SECTION.
       77 FSE   PIC XX.
       77 CHOICE PIC 9.

       screen section.
       01 main-para-menu.
           03 line 3 column 10 value 
               "*******************************************".
           03 line 5 column 10 value 
               "     HUMAN RESOURCE MANAGEMENT SYSTEM      ".
           03 line 7 column 10 value 
               "*******************************************".
           03 line 11 column 5 value " 1. DELETE EMPLOYEE".
           03 line 12 column 5 value " 2. EXIT".
           03 line 13 column 25 value "ENTER U R CHOICE :".
           03 line 13 column 45 using CHOICE.

       01 emp-para-select.
           03 line 1 column 1 value "ENTER CODE :".
           03 line 2 column 1 using EEMPID.

       01 invalid-code.
           03 line 1 column 1 value " ".
           03 line 12 column 30 value "INVALID CODE".
           03 line 20 column 10 value 
               "PRESS ENTER TO RETURN TO HRMS READ MENU".


       PROCEDURE DIVISION.
       MAIN-PARA.
           DISPLAY " " AT 0101 ERASE EOS.
           accept main-para-menu.
           IF CHOICE = 1
              GO TO EMP-PARA
           ELSE
             EXIT PROGRAM.

       EMP-PARA.
           DISPLAY " " AT 0101 ERASE EOS.
           OPEN I-O EMPFILE.
           accept emp-para-select.
           DISPLAY " " AT 0101 ERASE EOS.
           DELETE EMPFILE INVALID KEY GO TO ERROR-EMP-PARA.
           CLOSE EMPFILE.
           GO TO MAIN-PARA.

       ERROR-EMP-PARA.
           CLOSE EMPFILE.
           DISPLAY " " AT 0101 ERASE EOS.
           accept invalid-code.
           GO TO MAIN-PARA.
       END PROGRAM EMPDELETE.
