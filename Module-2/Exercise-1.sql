-- Scenario 1
-- Neither customer is above 60.
-- Let's insert one.

INSERT INTO Customers
VALUES (
    3,
    'Robert Wilson',
    TO_DATE('1955-08-10','YYYY-MM-DD'),
    20000,
    SYSDATE
);

INSERT INTO Loans
VALUES (
    2,
    3,
    10000,
    8,
    SYSDATE,
    ADD_MONTHS(SYSDATE,36)
);

COMMIT;

-- solution
DECLARE
    v_age NUMBER;
BEGIN

    FOR cust IN (
        SELECT CustomerID,
               DOB
        FROM Customers
    )
    LOOP

        v_age :=
            FLOOR(
                MONTHS_BETWEEN(
                    SYSDATE,
                    cust.DOB
                ) / 12
            );

        IF v_age > 60 THEN

            UPDATE Loans
            SET InterestRate = InterestRate - 1
            WHERE CustomerID = cust.CustomerID;

        END IF;

    END LOOP;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE(
        'Loan interest rates updated.'
    );

END;
/

-- Scenario 2
ALTER TABLE Customers
ADD IsVIP VARCHAR2(5);

BEGIN

    FOR cust IN (
        SELECT CustomerID,
               Balance
        FROM Customers
    )
    LOOP

        IF cust.Balance > 10000 THEN

            UPDATE Customers
            SET IsVIP = 'TRUE'
            WHERE CustomerID = cust.CustomerID;

        ELSE

            UPDATE Customers
            SET IsVIP = 'FALSE'
            WHERE CustomerID = cust.CustomerID;

        END IF;

    END LOOP;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE(
        'VIP status updated successfully.'
    );

END;
/

-- Scenario 3
INSERT INTO Loans
VALUES (
    3,
    1,
    3000,
    6,
    SYSDATE,
    SYSDATE + 15
);
COMMIT;

BEGIN

    FOR loan_rec IN (

        SELECT c.Name,
               l.LoanID,
               l.EndDate

        FROM Customers c
        JOIN Loans l
        ON c.CustomerID = l.CustomerID

        WHERE l.EndDate
        BETWEEN SYSDATE
        AND SYSDATE + 30

    )
    LOOP

        DBMS_OUTPUT.PUT_LINE(

            'Reminder: Dear '
            || loan_rec.Name
            || ', Loan ID '
            || loan_rec.LoanID
            || ' is due on '
            || TO_CHAR(
                loan_rec.EndDate,
                'DD-MON-YYYY'
            )

        );

    END LOOP;

END;
/