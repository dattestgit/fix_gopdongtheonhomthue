  
  
  
-- <Summary>  
---- Load du lieu cho man hinh Nhan hang cung hoa don khi chon hoa don dau vao  
-- <Param>  
----   
-- <Return>  
----   
-- <Reference>  
---- Nhan hang cung hoa don\Hoa don dau vao\Chon  
-- <History>  
---- Create on 24/10/2025 by TIENHUNG (300277): Man hinh chon hoa don dau vao  
----   
---- Modified on  
-- <Example>  
----  
CREATE PROCEDURE D06P3811  
(   
  
  @UserID   VARCHAR(50),   
  @TransTypeID VARCHAR(50) = '',  
  @FormID   VARCHAR(50) = '',  
  @InputInvoiceID VARCHAR(50) = '',
  @IsGroupingByTaxGroup TINYINT = 0
  
)   
AS   
SET NOCOUNT ON  
BEGIN  
  IF @IsGroupingByTaxGroup =0
  BEGIN
    SELECT  CONVERT(NVARCHAR(250),'') AS HostName, CONVERT(VARCHAR(50),'') AS UserID,   
       CONVERT(VARCHAR(50),'') AS POID,  
       CONVERT(VARCHAR(50),'') AS POItemID,  
       T00.VoucherID AS InputInvoiceID,  
       CONVERT(TINYINT,0) AS IsInherit,   
       CONVERT(VARCHAR(50),'') AS ObjectTypeID,   
       CONVERT(VARCHAR(50),'')  AS ObjectID,   
       T00.CurrencyID,   
       T00.ExchangeRate,  
       CONVERT(INT,0) AS OrderNum,   
       CONVERT(VARCHAR(50),'') AS InventoryID,   
       CONVERT(VARCHAR(50),'') AS Spec01ID,  
       CONVERT(VARCHAR(50),'') AS Spec02ID,  
       CONVERT(VARCHAR(50),'') AS Spec03ID,  
       CONVERT(VARCHAR(50),'') AS Spec04ID,  
       CONVERT(VARCHAR(50),'') AS Spec05ID,  
       CONVERT(VARCHAR(50),'') AS Spec06ID,  
       CONVERT(VARCHAR(50),'') AS Spec07ID,  
       CONVERT(VARCHAR(50),'') AS Spec08ID,  
       CONVERT(VARCHAR(50),'') AS Spec09ID,  
       CONVERT(VARCHAR(50),'') AS Spec10ID,  
       MAX(T00.InventoryName) AS InventoryName, CONVERT(VARCHAR(20),'') AS UnitID,   
       T00.Quantity AS OQuantity,   
       T00.Quantity AS CQuantity,   
       T00.UnitPrice AS UnitPrice,  
       T00.Amount AS OAmount,  
       T00.CAmount AS CAmount,      
       CONVERT(DECIMAL(28,8),0) AS POOQuantity,  
       CONVERT(DECIMAL(28,8),0) AS POCQuantity,  
       CONVERT(DECIMAL(28,8),0) AS OReceivedQuantity,  
       CONVERT(DECIMAL(28,8),0) AS CReceivedQuantity,  
       CONVERT(DECIMAL(28,8),0) AS OPOAmount,   
       CONVERT(DECIMAL(28,8),0) AS CPOAmount,   
       CONVERT(DECIMAL(28,8),0) AS OPORealizedAmount,   
       CONVERT(DECIMAL(28,8),0) AS CPORealizedAmount,   
       CONVERT(DECIMAL(28,8),0) AS OPORemainAmount,   
       CONVERT(DECIMAL(28,8),0) AS CPORemainAmount,   
       CONVERT(DECIMAL(28,8),0) AS ConversionFactor,   
       CONVERT(DECIMAL(28,8),0) AS Volume, CONVERT(DECIMAL(28,8),0) AS Weight, CONVERT(DECIMAL(28,8),0) AS SpecialFee, CONVERT(TINYINT,0) AS IsService,   
       CONVERT(DECIMAL(28,8),0) AS ImpRateTax,   
       CONVERT(DECIMAL(28,8),0) AS SpcRateTax,   
       CONVERT(VARCHAR(50),'') AS VATGroupID,   
       CONVERT(DECIMAL(28,8),0) AS VATRateTax,   
       CONVERT(VARCHAR(20),'') AS AccountID,   
       CONVERT(VARCHAR(20),'') AS MPSVoucherID, CONVERT(VARCHAR(20),'') AS MPSVoucherNo, CONVERT(VARCHAR(20),'') AS ProOrderID, CONVERT(VARCHAR(20),'') AS ProOrderNo,   
       CONVERT(VARCHAR(50),'') AS Ana01ID,   
       CONVERT(VARCHAR(50),'') AS Ana02ID,  
       CONVERT(VARCHAR(50),'') AS Ana03ID,  
       CONVERT(VARCHAR(50),'') AS Ana04ID,  
       CONVERT(VARCHAR(50),'') AS Ana05ID,  
       CONVERT(VARCHAR(50),'') AS Ana06ID,  
       CONVERT(VARCHAR(50),'') AS Ana07ID,  
       CONVERT(VARCHAR(50),'') AS Ana08ID,  
       CONVERT(VARCHAR(50),'') AS Ana09ID,  
       CONVERT(VARCHAR(50),'') AS Ana10ID,  
       CONVERT(INT,0) AS Flag, CONVERT(VARCHAR(20),'') AS FormulaID, CONVERT(VARCHAR(250),'') AS Formula,   
       CONVERT(DECIMAL(28,8),0) AS Num01,   
       CONVERT(DECIMAL(28,8),0) AS Num02,  
       CONVERT(DECIMAL(28,8),0) AS Num03,  
       CONVERT(DECIMAL(28,8),0) AS Num04,  
       CONVERT(DECIMAL(28,8),0) AS Num05,  
       CONVERT(DECIMAL(28,8),0) AS Num06,  
       CONVERT(DECIMAL(28,8),0) AS Num07,  
       CONVERT(DECIMAL(28,8),0) AS Num08,  
       CONVERT(DECIMAL(28,8),0) AS Num09,  
       CONVERT(DECIMAL(28,8),0) AS Num10,  
       CONVERT(VARCHAR(50),'') AS PaymentMethodID, T00.InventoryName AS TransDesc,  
       CONVERT(VARCHAR(20),'') AS DeliveryID , CONVERT(VARCHAR(20),'') AS LCNo,   
       CONVERT(NVARCHAR(250),'') AS VRef1,   
       CONVERT(NVARCHAR(250),'') AS VRef2,   
       CONVERT(NVARCHAR(250),'') AS VRef3,   
       CONVERT(NVARCHAR(250),'') AS VRef4,   
       CONVERT(NVARCHAR(250),'') AS VRef5,   
       CONVERT(DECIMAL(28,8),0) AS NRef1,  
       CONVERT(DECIMAL(28,8),0) AS NRef2,  
       CONVERT(DECIMAL(28,8),0) AS NRef3,  
       CONVERT(DECIMAL(28,8),0) AS NRef4,  
       CONVERT(DECIMAL(28,8),0) AS NRef5,  
       CONVERT(VARCHAR(50),'') AS POVoucherNo,   
       CONVERT(DATETIME,NULL) AS DRef1,   
       CONVERT(DATETIME,NULL) AS DRef2,  
       CONVERT(DATETIME,NULL) AS DRef3,  
       CONVERT(DATETIME,NULL) AS DRef4,  
       CONVERT(DATETIME,NULL) AS DRef5,  
       CONVERT(VARCHAR(50),'') AS PeriodID, CONVERT(VARCHAR(50),'') AS ProductID,  
       CONVERT(NVARCHAR(500), '') AS ProductName,  
       CONVERT(NVARCHAR(500), '') AS ProductShortName,    
       CONVERT(NVARCHAR(500),'') AS OInventoryName,   
       CONVERT(NVARCHAR(500),'') AS Spec01Name,  
       CONVERT(NVARCHAR(500),'') AS Spec02Name,  
       CONVERT(NVARCHAR(500),'') AS Spec03Name,  
       CONVERT(NVARCHAR(500),'') AS Spec04Name,  
       CONVERT(NVARCHAR(500),'') AS Spec05Name,  
       CONVERT(NVARCHAR(500),'') AS Spec06Name,  
       CONVERT(NVARCHAR(500),'') AS Spec07Name,  
       CONVERT(NVARCHAR(500),'') AS Spec08Name,  
       CONVERT(NVARCHAR(500),'') AS Spec09Name,  
       CONVERT(NVARCHAR(500),'') AS Spec10Name,  
       '' AS LRGroupID, CONVERT(BIT,1) AS UseConversionFormula, CONVERT(VARCHAR(500),'') AS ConversionFormula,  
       CONVERT(VARCHAR(50),'') AS LocationNo,  
       CONVERT(DATETIME,NULL) AS LimitDate,   
       CONVERT(DATETIME,NULL) AS ProDate,    
       CONVERT(MONEY,0) AS Tolerance,   
       CONVERT(VARCHAR(50),'') AS MDITransID,   
       CONVERT(VARCHAR(50),'') AS MDIVoucherNo,      
       CONVERT(VARCHAR(50),'') AS OTransType,  
       CONVERT(VARCHAR(50),'') AS OBatchID,  
       CONVERT(VARCHAR(50),'') AS OTransID,       
       CONVERT(NVARCHAR(500),'') AS MStr01,   
       CONVERT(NVARCHAR(500),'') AS MStr02,  
       CONVERT(NVARCHAR(500),'') AS MStr03,  
       CONVERT(NVARCHAR(500),'') AS MStr04,  
       CONVERT(NVARCHAR(500),'') AS MStr05,  
       CONVERT(NVARCHAR(500),'') AS MStr06,  
       CONVERT(NVARCHAR(500),'') AS MStr07,  
       CONVERT(NVARCHAR(500),'') AS MStr08,  
       CONVERT(NVARCHAR(500),'') AS MStr09,  
       CONVERT(NVARCHAR(500),'') AS MStr10,  
       CONVERT(DECIMAL(28,8),0) AS MNum01,  
       CONVERT(DECIMAL(28,8),0) AS MNum02,  
       CONVERT(DECIMAL(28,8),0) AS MNum03,  
       CONVERT(DECIMAL(28,8),0) AS MNum04,  
       CONVERT(DECIMAL(28,8),0) AS MNum05,  
       CONVERT(DECIMAL(28,8),0) AS MNum06,  
       CONVERT(DECIMAL(28,8),0) AS MNum07,  
       CONVERT(DECIMAL(28,8),0) AS MNum08,  
       CONVERT(DECIMAL(28,8),0) AS MNum09,  
       CONVERT(DECIMAL(28,8),0) AS MNum10,  
       CONVERT(DATETIME,NULL) AS MDat01,   
       CONVERT(DATETIME,NULL) AS MDat02,   
       CONVERT(DATETIME,NULL) AS MDat03,   
       CONVERT(DATETIME,NULL) AS MDat04,   
       CONVERT(DATETIME,NULL) AS MDat05,   
       CONVERT(DATETIME,NULL) AS MDat06,   
       CONVERT(DATETIME,NULL) AS MDat07,   
       CONVERT(DATETIME,NULL) AS MDat08,   
       CONVERT(DATETIME,NULL) AS MDat09,  
       CONVERT(DATETIME,NULL) AS MDat10,  
       CONVERT(DECIMAL(28,8),0) AS CFactor,  
       CONVERT(VARCHAR(20),'') AS DebitAccountID,   
       CONVERT(VARCHAR(20),'') AS ProjectID,   
       CONVERT(NVARCHAR(250),'') AS ProjectName,  
       CONVERT(BIT, 0) AS IsDecrease,  
       CONVERT(VARCHAR(50),'') AS TaskID,   
       CONVERT(NVARCHAR(250),'') AS TaskName,  
       CONVERT(VARCHAR(20),'') AS PaymentTermID,   
       CONVERT(DATETIME,NULL) AS DueDate,   
       CONVERT(NVARCHAR(1000),'') AS VoucherDesc,  
       CONVERT(TINYINT,0) AS PricebyCQuantity,  
       T00.CVAT AS VATOAmount,  
       T00.CVAT AS VATCAmount,  
       CONVERT(VARCHAR(20),'') AS POVATGroupID,  
       CONVERT(DECIMAL(28,8),0) AS POUnitPrice, CONVERT(DECIMAL(28,8),0) AS POOAmount,  
       CONVERT(TINYINT,0) AS ByValues,  
       CONVERT(VARCHAR(50),'') AS BudgetID, CONVERT(NVARCHAR(250),'') AS BudgetName,   
       CONVERT(VARCHAR(50),'') AS BudgetItemID, CONVERT(NVARCHAR(250),'') AS BudgetItemName,  
       CONVERT(VARCHAR(50),'') AS POOrderNum,  
       CONVERT(VARCHAR(50),'') AS TransIDWTax, CONVERT(DECIMAL(28,8),0) AS PreOAmountWTax,   
       CONVERT(DECIMAL(28,8),0) AS AmtWTax_InvCur,  
       CONVERT(VARCHAR(50),'') AS DebitAccWTax, CONVERT(VARCHAR(50),'') AS CreditAccWTax,   
       CONVERT(NVARCHAR(250),'') AS TranDescWTax,   
       CONVERT(DECIMAL(28,8),0) AS RateWTax, CONVERT(DECIMAL(28,8),0) AS OAmountWTax, CONVERT(DECIMAL(28,8),0) AS CAmountWTax, CONVERT(VARCHAR(20),'') AS PODetailID,  
       CONVERT(VARCHAR(50),'') AS SOVoucherNo,  
       CONVERT(VARCHAR(50),'') AS PRVoucherNo, CONVERT(NVARCHAR(250),'') AS RequestorName, CONVERT(VARCHAR(50),'') AS LinkBatchID, CONVERT(VARCHAR(50),'') AS LinkTransID,  
       CONVERT(VARCHAR(20),'') AS WareHouseID,  
       CONVERT(VARCHAR(50),'') AS LCode01ID, CONVERT(VARCHAR(50),'') AS LCode02ID, CONVERT(VARCHAR(50),'') as LCode03ID, CONVERT(VARCHAR(50),'') as LCode04ID,  
       CONVERT(VARCHAR(50),'') AS LCode05ID, CONVERT(VARCHAR(50),'') AS LCode06ID, CONVERT(VARCHAR(50),'') as LCode07ID, CONVERT(VARCHAR(50),'') as LCode08ID,  
       CONVERT(VARCHAR(50),'') AS LCode09ID, CONVERT(VARCHAR(50),'') AS LCode10ID,  
       CONVERT(BIT, 0) AS IsPromotion,  
       CONVERT(BIT, 0) AS IsLockPromotion, CONVERT(BIT, 0) ASIsLocation,  
       CONVERT(BIT, 0) AS IsNotEditUnitPrice, CONVERT(VARCHAR(20),'') AS CreditAccountID, CONVERT(VARCHAR(50),'') AS CipID, CONVERT(VARCHAR(50),'') AS CipNo,   
       CONVERT(VARCHAR(500),'') AS DocNoMaster, CONVERT(VARCHAR(20),'') AS SOID,  
       CONVERT(NVARCHAR(1000),'') AS RefCode,   
       T00.SerialNo AS SerialNo,   
       T00.RefNo AS InvoiceNo,   
       T00.RefDate,  
       CONVERT(VARCHAR(50),'') AS DebtManagerTypeID,  
       CONVERT(VARCHAR(50),'') AS DebtManagerID,  
       CONVERT(NVARCHAR(250),'') AS DebtManagerName,  
       CONVERT(VARCHAR(50),'') AS VATObjectTypeID,   
       CONVERT(VARCHAR(50),'') AS VATObjectID,  
       CONVERT(NVARCHAR(250),'') AS VATObjectName,  
       CONVERT(NVARCHAR(500),'') AS VATObjectAddress,  
       CONVERT(VARCHAR(50),'') AS VATNo,  
       T00.InventoryName AS VATTransDesc  
    INTO  #D06P3811_Temp  
    FROM  D95T5000 T00 WITH(NOLOCK)  
    WHERE  T00.VoucherID = @InputInvoiceID  
    ORDER BY T00.TransID  
  END
ELSE
  BEGIN
       SELECT  T00.VoucherID AS InputInvoiceID,
            MIN(T00.SerialNo) AS SerialNo,
            MIN(T00.RefNo) AS InvoiceNo,
            MIN(T00.RefDate) AS RefDate,
            MIN(T00.InventoryName) AS InventoryName,
            SUM(T00.Quantity) AS OQuantity,
            SUM(T00.Amount) AS OAmount,
            SUM(T00.CVAT) AS VATOAmount,
            ISNULL(T00.VATGroupID, CONVERT(VARCHAR(50), T00.VATRate*100) + '%') AS VATGroupID,
            T00.VATRate AS VATRateTax,
            -- giữ các cột khác nguyên
            MIN(T00.PaymentMethodName) AS PaymentMethodName
    INTO #D06P3811_Temp
    FROM D95T5000 T00 WITH(NOLOCK)
    WHERE T00.VoucherID = @InputInvoiceID
    GROUP BY T00.VoucherID, ISNULL(T00.VATGroupID, CONVERT(VARCHAR(50), T00.VATRate*100)), T00.VATRate
  END
  UPDATE  T1  
  SET   T1.PaymentMethodID = ISNULL(T.PaymentMethodID, ''),  
     T1.VATRateTax = T.VATRate/100,  
     T1.VATGroupID = ISNULL(T2.VATGroupID, ''),  
     T1.VATObjectTypeID = ISNULL(Obj.ObjectTypeID, ''),  
     T1.VATObjectID = ISNULL(Obj.ObjectID, ''),  
     T1.VATObjectName = ISNULL(T.ObjectName, ''),  
     T1.VATObjectAddress = ISNULL(T.ObjectAddress, ''),  
     T1.ObjectTypeID = ISNULL(Obj.ObjectTypeID, ''),  
     T1.ObjectID = ISNULL(Obj.ObjectID, ''),  
     T1.DebtManagerTypeID = ISNULL(Obj.DebtManagerTypeID, ''),  
     T1.DebtManagerID = ISNULL(Obj.DebtManagerID, ''),  
     T1.DebtManagerName = ISNULL(Obj1.ObjectNameU, ''),  
     T1.VATNo = ISNULL(T.TaxCode, ''),  
     T1.CurrencyID = ISNULL(T1.CurrencyID, 'VND')  
  FROM  #D06P3811_Temp T1  
  INNER JOIN (SELECT  TOP 1   
        T5.SerialNo AS SerialNo,  
        T5.RefNo AS InvoiceNo,  
        T5.RefDate AS InvoiceDate,  
        T5.VoucherID,  
        T5.PaymentMethodName,  
        T8.PaymentMethodID,  
        T5.InventoryName,  
        T5.VATRate AS VATRate,  
        T5.CurrencyID,  
        T5.ExchangeRate,  
        T5.ObjectName,  
        T5.ObjectAddress,  
        T5.TaxCode  
     FROM  D95T5000 T5 WITH(NOLOCK)  
     LEFT JOIN D91T0080 T8 WITH(NOLOCK)   
      ON  T5.PaymentMethodName = T8.PaymentMethodNameU  
     WHERE  VoucherID = @InputInvoiceID  
     ORDER BY T5.TransID  
     ) T  
    ON 1 = 1  
  LEFT JOIN D91T0040 T2 WITH(NOLOCK)   
    ON T.VATRate = T2.RateTax * 100  
  LEFT JOIN dbo.Object Obj WITH(NOLOCK)  
   ON  T.TaxCode = Obj.VATNo  
   AND  Obj.ObjectTypeID = 'CC'  
   AND  Obj.Disabled = 0  
  LEFT JOIN Object Obj1 WITH(NOLOCK)  
   ON  Obj1.IsDebtManager = 1  
     AND Obj.DebtManagerTypeID = Obj1.ObjectTypeID  
     AND Obj.DebtManagerID = Obj1.ObjectID  
  
  SELECT  *  
  FROM  #D06P3811_Temp  
END  
