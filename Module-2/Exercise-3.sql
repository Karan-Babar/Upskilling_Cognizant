-- Scenario 1: ProcessMonthlyInterest
CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest
IS
BEGIN

    UPDATE Accounts
    SET Balance = Balance + (Balance * 0.01)
    WHERE AccountType = 'Savings';

    COMMIT;

    DBMS_OUTPUT.PUT_LINE(
        'Monthly interest processed successfully.'
    );

END;
/

-- Scenario 2: UpdateEmployeeBonus
CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus(
    p_department IN VARCHAR2,
    p_bonus_percentage IN NUMBER
)
IS
BEGIN

    UPDATE Employees
    SET Salary =
        Salary + (Salary * p_bonus_percentage / 100)
    WHERE Department = p_department;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE(
        'Bonus applied successfully.'
    );

END;
/

-- Scenario 3: TransferFunds
CREATE OR REPLACE PROCEDURE TransferFunds(
    p_from_account IN NUMBER,
    p_to_account IN NUMBER,
    p_amount IN NUMBER
)
IS
    v_balance NUMBER;
BEGIN

    SELECT Balance
    INTO v_balance
    FROM Accounts
    WHERE AccountID = p_from_account;

    IF v_balance < p_amount THEN

        RAISE_APPLICATION_ERROR(
            -20002,
            'Insufficient balance'
        );

    END IF;

    UPDATE Accounts
    SET Balance = Balance - p_amount
    WHERE AccountID = p_from_account;

    UPDATE Accounts
    SET Balance = Balance + p_amount
    WHERE AccountID = p_to_account;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE(
        'Funds transferred successfully.'
    );

EXCEPTION

    WHEN OTHERS THEN

        ROLLBACK;

        DBMS_OUTPUT.PUT_LINE(
            SQLERRM
        );

END;
/