-- Scenario 1: CalculateAge
CREATE OR REPLACE FUNCTION CalculateAge(
    p_dob DATE
)
RETURN NUMBER
IS
    v_age NUMBER;
BEGIN

    v_age :=
        FLOOR(
            MONTHS_BETWEEN(
                SYSDATE,
                p_dob
            ) / 12
        );

    RETURN v_age;

END;
/

-- Scenario 2: CalculateMonthlyInstallment
CREATE OR REPLACE FUNCTION CalculateMonthlyInstallment(
    p_loan_amount NUMBER,
    p_interest_rate NUMBER,
    p_years NUMBER
)
RETURN NUMBER
IS
    v_monthly_installment NUMBER;
BEGIN

    v_monthly_installment :=
        (p_loan_amount +
         (p_loan_amount * p_interest_rate / 100))
         / (p_years * 12);

    RETURN ROUND(
        v_monthly_installment,
        2
    );

END;
/

-- Scenario 3: HasSufficientBalance
CREATE OR REPLACE FUNCTION HasSufficientBalance(
    p_account_id NUMBER,
    p_amount NUMBER
)
RETURN VARCHAR2
IS
    v_balance NUMBER;
BEGIN

    SELECT Balance
    INTO v_balance
    FROM Accounts
    WHERE AccountID = p_account_id;

    IF v_balance >= p_amount THEN
        RETURN 'TRUE';
    ELSE
        RETURN 'FALSE';
    END IF;

EXCEPTION

    WHEN NO_DATA_FOUND THEN
        RETURN 'ACCOUNT NOT FOUND';

END;
/