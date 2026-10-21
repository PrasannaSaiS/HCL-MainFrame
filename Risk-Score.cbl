IDENTIFICATION DIVISION.
       PROGRAM-ID. SIMPLE-RISK-SCORE.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 INDICATOR-1       PIC 9(1) VALUE 0.
       01 INDICATOR-2       PIC 9(1) VALUE 0.
       01 INDICATOR-3       PIC 9(1) VALUE 0.
       
       01 POINTS-1          PIC S9(5) VALUE 0.
       01 POINTS-2          PIC S9(5) VALUE 0.
       01 POINTS-3          PIC S9(5) VALUE 0.
       
       01 LOW-THRESHOLD     PIC S9(5) VALUE 0.
       01 HIGH-THRESHOLD    PIC S9(5) VALUE 0.
       
       01 RISK-SCORE        PIC 9(6) VALUE 0.
       01 CLEAN-SCORE       PIC Z(5)9.

       PROCEDURE DIVISION.
       MAIN-LOGIC.
           ACCEPT INDICATOR-1.
           ACCEPT INDICATOR-2.
           ACCEPT INDICATOR-3.
           ACCEPT POINTS-1.
           ACCEPT POINTS-2.
           ACCEPT POINTS-3.
           ACCEPT LOW-THRESHOLD.
           ACCEPT HIGH-THRESHOLD.

           IF (INDICATOR-1 NOT = 0 AND INDICATOR-1 NOT = 1) OR
              (INDICATOR-2 NOT = 0 AND INDICATOR-2 NOT = 1) OR
              (INDICATOR-3 NOT = 0 AND INDICATOR-3 NOT = 1) OR
              POINTS-1 < 0 OR
              POINTS-2 < 0 OR
              POINTS-3 < 0 OR
              LOW-THRESHOLD < 0 OR
              HIGH-THRESHOLD < LOW-THRESHOLD
               
               DISPLAY "INVALID CONFIGURATION"
               STOP RUN
           END-IF.

           COMPUTE RISK-SCORE = (INDICATOR-1 * POINTS-1) +
                                (INDICATOR-2 * POINTS-2) +
                                (INDICATOR-3 * POINTS-3).

           MOVE RISK-SCORE TO CLEAN-SCORE.
           DISPLAY "SCORE: " FUNCTION TRIM(CLEAN-SCORE).

           IF RISK-SCORE <= LOW-THRESHOLD
               DISPLAY "RISK BAND: LOW"
           ELSE
               IF RISK-SCORE <= HIGH-THRESHOLD
                   DISPLAY "RISK BAND: MEDIUM"
               ELSE
                   DISPLAY "RISK BAND: HIGH"
               END-IF
           END-IF.

           STOP RUN.
