-- Scenario 1: GenerateMonthlyStatements
DECLARE

    CURSOR GenerateMonthlyStatements IS
        SELECT
            t.TransactionID,
            a.CustomerID,
            t.Amount,
            t.TransactionType,
            t.TransactionDate
        FROM Transactions t
        JOIN Accounts a
            ON t.AccountID = a.AccountID
        WHERE EXTRACT(MONTH FROM t.TransactionDate)
              = EXTRACT(MONTH FROM SYSDATE)
          AND EXTRACT(YEAR FROM t.TransactionDate)
              = EXTRACT(YEAR FROM SYSDATE);

BEGIN

    FOR txn IN GenerateMonthlyStatements
    LOOP

        DBMS_OUTPUT.PUT_LINE(
            'Customer ID: ' || txn.CustomerID ||
            ' | Transaction ID: ' || txn.TransactionID ||
            ' | Amount: ' || txn.Amount ||
            ' | Type: ' || txn.TransactionType
        );

    END LOOP;

END;
/

-- Scenario 2: ApplyAnnualFee
DECLARE

    CURSOR ApplyAnnualFee IS
        SELECT AccountID, Balance
        FROM Accounts;

BEGIN

    FOR acc IN ApplyAnnualFee
    LOOP

        UPDATE Accounts
        SET Balance = Balance - 100
        WHERE AccountID = acc.AccountID;

    END LOOP;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE(
        'Annual maintenance fee applied.'
    );

END;
/

-- Scenario 3: UpdateLoanInterestRates
DECLARE

    CURSOR UpdateLoanInterestRates IS
        SELECT LoanID,
               InterestRate
        FROM Loans;

BEGIN

    FOR loan_rec IN UpdateLoanInterestRates
    LOOP

        UPDATE Loans
        SET InterestRate =
            InterestRate + 0.5
        WHERE LoanID =
            loan_rec.LoanID;

    END LOOP;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE(
        'Loan interest rates updated.'
    );

END;
/