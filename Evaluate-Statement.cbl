       IDENTIFICATION DIVISION.
       PROGRAM-ID. EVALUATE-DEMO.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 STUDENT-MARKS PIC 999 VALUE 83.
       01 STUDENT-GRADE PIC X.
       01 DAY-NUMBER PIC 9 VALUE 3.
       PROCEDURE DIVISION.
           EVALUATE TRUE
               WHEN STUDENT-MARKS >= 90
                   MOVE "A" TO STUDENT-GRADE
               WHEN STUDENT-MARKS >= 75
                   MOVE "B" TO STUDENT-GRADE
               WHEN STUDENT-MARKS >= 60
                   MOVE "C" TO STUDENT-GRADE
               WHEN STUDENT-MARKS >= 40
                   MOVE "D" TO STUDENT-GRADE
               WHEN OTHER
                   MOVE "F" TO STUDENT-GRADE
           END-EVALUATE.
           DISPLAY "GRADE: " STUDENT-GRADE.
           EVALUATE DAY-NUMBER
               WHEN 1 DISPLAY "MONDAY"
               WHEN 2 DISPLAY "TUESDAY"
               WHEN 3 DISPLAY "WEDNESDAY"
               WHEN 4 DISPLAY "THURSDAY"
               WHEN 5 DISPLAY "FRIDAY"
               WHEN 6 THRU 7 DISPLAY "WEEKEND"
               WHEN OTHER DISPLAY "INVALID DAY"
           END-EVALUATE.
           STOP RUN.
