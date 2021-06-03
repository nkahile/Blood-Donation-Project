    CREATE TRIGGER Teacher_Update_Quantity 
    ON Teacher_Donated_Info
    AFTER INSERT AS
    BEGIN
    DECLARE @Type CHAR
    SELECT TOP 1 @Type = Blood_Type FROM Teacher_Donated_Info ORDER BY Teacher_Code DESC
        IF (@Type) = 'A'
            
            UPDATE Blood_Bag_Quantity
                SET A_Type_Fulfilled = A_Type_Fulfilled-1; 
        
        IF (@Type) = 'B'
            
            UPDATE Blood_Bag_Quantity
                SET B_Type_Fulfilled = B_Type_Fulfilled-1; 
        
        IF (@Type) = 'AB'
            
            UPDATE Blood_Bag_Quantity
                SET AB_Type_Fulfilled = AB_Type_Fulfilled-1; 
        
        IF (@Type) = 'O'
            
            UPDATE Blood_Bag_Quantity
                SET O_Type_Fulfilled = O_Type_Fulfilled-1; 
        
    END
GO
------------------------------------
DROP TRIGGER Teacher_Update_Quantity;
------------------------------------