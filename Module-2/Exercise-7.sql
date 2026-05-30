-- Scenario 1: CustomerManagement Package
CREATE OR REPLACE PACKAGE CustomerManagement AS

    PROCEDURE AddCustomer(
        p_customerid NUMBER,
        p_name VARCHAR2,
        p_dob DATE,
        p_balance NUMBER
    );

    PROCEDURE UpdateCustomerBalance(
        p_customerid NUMBER,
        p_balance NUMBER
    );

    FUNCTION GetCustomerBalance(
        p_customerid NUMBER
    ) RETURN NUMBER;

END CustomerManagement;
/

CREATE OR REPLACE PACKAGE BODY CustomerManagement AS

    PROCEDURE AddCustomer(
        p_customerid NUMBER,
        p_name VARCHAR2,
        p_dob DATE,
        p_balance NUMBER
    )
    IS
    BEGIN

        INSERT INTO Customers(
            CustomerID,
            Name,
            DOB,
            Balance,
            LastModified
        )
        VALUES(
            p_customerid,
            p_name,
            p_dob,
            p_balance,
            SYSDATE
        );

        COMMIT;

    END AddCustomer;

    PROCEDURE UpdateCustomerBalance(
        p_customerid NUMBER,
        p_balance NUMBER
    )
    IS
    BEGIN

        UPDATE Customers
        SET Balance = p_balance
        WHERE CustomerID = p_customerid;

        COMMIT;

    END UpdateCustomerBalance;

    FUNCTION GetCustomerBalance(
        p_customerid NUMBER
    )
    RETURN NUMBER
    IS
        v_balance NUMBER;
    BEGIN

        SELECT Balance
        INTO v_balance
        FROM Customers
        WHERE CustomerID = p_customerid;

        RETURN v_balance;

    END GetCustomerBalance;

END CustomerManagement;
/

-- Scenario 2: EmployeeManagement Package
CREATE OR REPLACE PACKAGE EmployeeManagement AS

    PROCEDURE HireEmployee(
        p_employeeid NUMBER,
        p_name VARCHAR2,
        p_position VARCHAR2,
        p_salary NUMBER,
        p_department VARCHAR2
    );

    PROCEDURE UpdateEmployeeSalary(
        p_employeeid NUMBER,
        p_salary NUMBER
    );

    FUNCTION CalculateAnnualSalary(
        p_employeeid NUMBER
    ) RETURN NUMBER;

END EmployeeManagement;
/

CREATE OR REPLACE PACKAGE BODY EmployeeManagement AS

    PROCEDURE HireEmployee(
        p_employeeid NUMBER,
        p_name VARCHAR2,
        p_position VARCHAR2,
        p_salary NUMBER,
        p_department VARCHAR2
    )
    IS
    BEGIN

        INSERT INTO Employees
        VALUES(
            p_employeeid,
            p_name,
            p_position,
            p_salary,
            p_department,
            SYSDATE
        );

        COMMIT;

    END HireEmployee;

    PROCEDURE UpdateEmployeeSalary(
        p_employeeid NUMBER,
        p_salary NUMBER
    )
    IS
    BEGIN

        UPDATE Employees
        SET Salary = p_salary
        WHERE EmployeeID = p_employeeid;

        COMMIT;

    END UpdateEmployeeSalary;

    FUNCTION CalculateAnnualSalary(
        p_employeeid NUMBER
    )
    RETURN NUMBER
    IS
        v_salary NUMBER;
    BEGIN

        SELECT Salary
        INTO v_salary
        FROM Employees
        WHERE EmployeeID = p_employeeid;

        RETURN v_salary * 12;

    END CalculateAnnualSalary;

END EmployeeManagement;
/

-- Scenario 3: AccountOperations Package
CREATE OR REPLACE PACKAGE AccountOperations AS

    PROCEDURE OpenAccount(
        p_accountid NUMBER,
        p_customerid NUMBER,
        p_type VARCHAR2,
        p_balance NUMBER
    );

    PROCEDURE CloseAccount(
        p_accountid NUMBER
    );

    FUNCTION GetTotalBalance(
        p_customerid NUMBER
    ) RETURN NUMBER;

END AccountOperations;
/

CREATE OR REPLACE PACKAGE BODY AccountOperations AS

    PROCEDURE OpenAccount(
        p_accountid NUMBER,
        p_customerid NUMBER,
        p_type VARCHAR2,
        p_balance NUMBER
    )
    IS
    BEGIN

        INSERT INTO Accounts
        VALUES(
            p_accountid,
            p_customerid,
            p_type,
            p_balance,
            SYSDATE
        );

        COMMIT;

    END OpenAccount;

    PROCEDURE CloseAccount(
        p_accountid NUMBER
    )
    IS
    BEGIN

        DELETE FROM Accounts
        WHERE AccountID = p_accountid;

        COMMIT;

    END CloseAccount;

    FUNCTION GetTotalBalance(
        p_customerid NUMBER
    )
    RETURN NUMBER
    IS
        v_total NUMBER;
    BEGIN

        SELECT SUM(Balance)
        INTO v_total
        FROM Accounts
        WHERE CustomerID = p_customerid;

        RETURN NVL(v_total,0);

    END GetTotalBalance;

END AccountOperations;
/