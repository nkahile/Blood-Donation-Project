    CREATE FUNCTION Is_Eligible(@Student_Code INT) RETURNS CHAR AS
    RETURN
    DECLARE @result CHAR

    IF(Select Is_Eligible FROM Pre_Exam) = 'Y'
        RETURN 'True';
    IF(@result = 'N')
        RETURN 'False'
END;