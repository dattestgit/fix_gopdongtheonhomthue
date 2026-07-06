  
  
-- D01P2030  
-- <Summary>  
---- Load du lieu HDDV tai D01F2080, D01F2070 (goi trong D95P5000)  
-- <Param>  
----   
-- <Return>  
----   
-- <Reference>  
---- D01/ Nghiep vu/ But toan von bang tien/ Phieu Chi, Phieu Tong hop/ Button Chon hoa don dau vao/ Chon  
-- <History>  
---- Create on 17/04/2026 by THAONGUYEN (307766)  
---- Modified on 12/05/2026 by KHATUAN (): Fix loi tran chuoi TaxTransDesc  
---- Modified on 20/05/2026 by THAONGUYEN (313410): Bo sung dieu kien mac dinh TK No thue, TK Co Thue  
---- Modified on 03/06/2026 by THAONGUYEN (313489): Bo sung load dong tien thue neu D01F2070 khong dung mode moi  
-- <Example>  
---- EXEC D01P2030 'DIGINET', 'LEMONADMIN', 'PMDV-002', '84', 'D01F2080', 'D95F5000', 'ZHAN.PC', ''  
  
ALTER PROCEDURE D01P2030  
(  
 @DivisionID  VARCHAR(50) = '',  
 @UserID   VARCHAR(50) = '',   
 @HostID   VARCHAR(50) = '',  
 @Language  VARCHAR(20) = '',    
 @FormID   VARCHAR(50) = '',  
 @FormCall  VARCHAR(50) = '',  
 @TransTypeID VARCHAR(20) = '',  
 @VoucherID  VARCHAR(50) = '',
 @IsGroupingByTaxGroup  TINYINT = 0 
)  
AS   
SET NOCOUNT ON  
  
DECLARE @StrSQL VARCHAR(MAX) = '', @StrSQL1 VARCHAR(MAX) = '',  
  @StrSQLUpdate VARCHAR(MAX) = '',  
  @StrSQLResult VARCHAR(MAX) = ''  
  
DECLARE @UseD01F2070Other TINYINT = 0  
SELECT @UseD01F2070Other = UseD01F2070Other   
FROM D01T5555 WITH(NOLOCK)  
  
DECLARE @UseCorAccountID TINYINT = 0, @D01Mode TINYINT = 0  
SELECT @UseCorAccountID = UseCorAccountID,  
  @D01Mode = Mode  
FROM D01T5010 WITH(NOLOCK)   
WHERE TransTypeID = @TransTypeID   
  
---- Phan biet form co cot TK No, TK Co, tien, doi tuong thue tren cung 1 dong but toan chi phi hay khong   
---- Neu form D01F2080 hoac D01F2070 moi - LNV khong check BT DON: CO thi set = 1  
DECLARE @UseInfoTax TINYINT = 0   
SET @UseInfoTax = CASE WHEN @FormID = 'D01F2080' OR (@FormID = 'D01F2070' AND @UseD01F2070Other = 1 AND @UseCorAccountID = 0) THEN 1 ELSE 0 END  
  

IF @FormCall = 'D95F5000' AND @IsGroupingByTaxGroup=1
BEGIN
	 SET @StrSQL = '  
	 SELECT  '''' AS VoucherID, '''' AS BatchID, '''' AS TransID,  
		T95.ObjectNameRecipient AS SenderReceiver, (SELECT TOP 1 DivisionNameU FROM D91T0016 WITH(NOLOCK) WHERE DivisionID = '''+@DivisionID+''') AS SRDivisionName,   
		T95.AddressRecipient AS SRAddress, '''' AS AttachmentNo,  
		NULL AS VoucherDate, CONVERT(NVARCHAR(500), '''') AS VoucherDesc,  
		1 AS OrdinaryNo, SUM(T95.CAmount) AS OAmount, SUM(T95.CAmount) AS CAmount,  
		T1.DebitAccountID AS DebitAccountID,  
		T1.CreditAccountID AS CreditAccountID,  
		CASE WHEN T1.Mode = 2 THEN D.GroupID ELSE C.GroupID END AS GroupID,  
    
		1 AS ExchangeRate,  MAX(T95.InventoryName) AS RefDesc, T95.RefDate AS RefDate,     
		CONVERT(NVARCHAR(500), MAX(T1.TransDescU)) AS TransDesc,   T95.RefNo AS RefNo,  T95.SerialNo AS Serial,  
  
		-->>>>>>>>>>> Tab 1. Doi tuong  
  
		T95.ObjectTypeID AS ObjectTypeID,  T95.ObjectID AS ObjectID,   T95.ObjectName AS ObjectName,  
		'''' AS VATObjectTypeID, '''' AS VATObjectID,   '''' AS VATObjectName,  
		T95.TaxCode AS VATNo ,   T95.ObjectAddress AS ObjAddress, MAX(T95.BankAccountNo) AS BankAccountNo, T95.ObjectAddress AS VATObjectAddress,  
  
		-->>>>>>>>>>>> Tab 2. Thue  
  
		E.VATGroupID AS VATGroupID, CASE WHEN T95.VATRate <= 0 THEN 0 ELSE T95.VATRate/100 END AS RateTax,   '''' As TaxTransID,  CONVERT(VARCHAR(500), '''') AS TaxTransDesc,  
		SUM(T95.CVAT) AS TaxOAmount,   SUM(T95.CVAT) AS TaxCAmount,   
		 CASE WHEN MAX(T1.DefaultTaxObject) = 1 THEN T95.ObjectTypeID ELSE '''' END AS TaxObjectTypeID,   
		 CASE WHEN MAX(T1.DefaultTaxObject) = 1 THEN T95.ObjectID ELSE '''' END AS TaxObjectID,  

		MAX(T1.DefaultTaxObject) AS DefaultTaxObject,  
		CASE WHEN ISNULL(T1.VATInOut, '''') = '''' THEN CONVERT(TINYINT, 0) ELSE T1.VATInOut END AS VATInOut,   
		T1.VATType AS VATType,    
		T1.VATTypeID AS VATTypeID,     
		MAX(D91.DescriptionU) AS VATInOutName,    
		MAX(D92.DescriptionU) AS VATTypeName,   
		MAX(D93.DescriptionU) AS VATTypeIDName,       
		CASE WHEN MAX(T1.Mode) = 2 OR (T1.Mode = 0 AND (ISNULL(T1.VATInOut, '''') = '''' OR T1.VATInOut = 0)) THEN ISNULL(T1.VATInAccountID,'''') ELSE T1.DebitAccountID END AS TaxDebitAccountID,  
		CASE WHEN MAX(T1.Mode) = 2 OR (T1.Mode = 0 AND (ISNULL(T1.VATInOut, '''') = '''' OR T1.VATInOut = 0)) THEN T1.CreditAccountID ELSE ISNULL(T1.VATOutAccountID,'''') END AS TaxCreditAccountID,  
    
		-- >>>>>>>>>> Tab 3 . Thanh tien   
		SUM(T95.CAmount) + SUM(T95.CVAT) AS TotalOAmount,   
		SUM(T95.CAmount) + SUM(T95.CVAT) AS TotalCAmount,  
  
		-- >>>>>>>>>> Tab 4. Khoan muc  
		MAX(T1.DefaultAna01ID) AS Ana01ID, MAX(T1.DefaultAna02ID) AS Ana02ID, MAX(T1.DefaultAna03ID) AS Ana03ID, MAX(T1.DefaultAna04ID) AS Ana04ID , MAX(T1.DefaultAna05ID) AS Ana05ID,  
		MAX(T1.DefaultAna06ID) AS Ana06ID, MAX(T1.DefaultAna07ID) AS Ana07ID, MAX(T1.DefaultAna08ID) AS Ana08ID, MAX(T1.DefaultAna09ID) AS Ana09ID, MAX(T1.DefaultAna10ID) AS Ana10ID,  
		MAX(T1.DefaultAna01ID) AS DefaultAna01ID, MAX(T1.DefaultAna02ID) AS DefaultAna02ID, MAX(T1.DefaultAna03ID) AS DefaultAna03ID, MAX(T1.DefaultAna04ID) AS DefaultAna04ID, MAX(T1.DefaultAna05ID) AS DefaultAna05ID ,  
		MAX(T1.DefaultAna06ID), MAX(T1.DefaultAna07ID) AS DefaultAna07ID, MAX(T1.DefaultAna08ID) AS DefaultAna08ID, MAX(T1.DefaultAna09ID) AS DefaultAna09ID, MAX(T1.DefaultAna10ID) AS DefaultAna10ID,  
		MAX(T1.DefaultCashFlowID) AS DefaultCashFlowID,  
  
		-- >>>>>>>>>>Tab 5 Khac  
		NULL AS DueDate ,  '''' AS LCNo,     '''' AS PeriodID,   
		'''' AS BillNo ,  '''' AS ProductID,    '''' AS CardNo,  
		NULL AS Ref01, NULL AS Ref02, NULL AS Ref03, NULL AS Ref04, NULL AS Ref05,      
		'''' AS CipID,  '''' AS CipNo, 0 AS ExceedTaxAmount , '''' AS VATBankAccountNo,  
		T95.PaymentMethodID AS PaymentMethodID,   
	 '  
	 SET @StrSQL = @StrSQL + '  
		--->>>>>> Cot An tren luoi  
		0 As IsTax,'''' As CreateUserID, NULL  As CreateDate,   
		CONVERT(VARCHAR(20), '''') AS TaxDebitGroupID, CONVERT(VARCHAR(20), '''') AS TaxCreditGroupID,   
		'''' AS CorBatchID, '''' As ModuleID, '''' As BatchIDPlan, '''' As TransIDPlan,  
		'''' As TaxBatchIDPlan,'''' As TaxTransIDPlan, 0 As IsPlan, MAX(T95.InventoryName) AS VATItemName,  
		'''' as DebtManagerID,'''' AS DebtManagerTypeID,  
		'''' As POID, '''' As SOID,'''' As POVoucherNo , '''' As SOVoucherNo,'''' As IdentityBatchID,  
		Convert(Money, 0) As OAmountOffsetD01F2040, Convert(Money, 0) As CAmountOffsetD01F2040,  
		'''' as TransactionTypeID, '''' AS ProjectID, '''' AS ProjectName, '''' AS TaskID, '''' AS TaskName,   
		'''' AS CashFlowID, CONVERT(TINYINT, 0) AS IsNotEditLine,   
		MAX(T1.ImplementatD04) AS ImplementatD04, MAX(T1.ImplementatD03) AS ImplementatD03,  
		'''' AS BudgetID, '''' AS BudgetItemID, '''' AS BudgetName, '''' AS BudgetItemName,   
		'''' AS PaymentBatchID, '''' AS PaymentRefBatchID, CONVERT(TINYINT, 0) AS LockAnalysis, '''' AS PropertyProductID,  
		CONVERT(TINYINT, 0) AS IsMatchingCR, '''' AS PContractID, '''' AS PContractNo,  
		MAX(T1.IsObligeProject) AS IsObligeProject,   
		T95.VoucherID AS OBatchID, MAX(T95.TransID) AS OTransID, ''D95_InputInvoice'' AS OTransType, '''' AS OVoucherNo,  
		'''' AS BankReference, NULL AS PostingDate, '''' AS TransNarrative,  
		'''' AS SContractID, '''' AS  SContractNo,     
		'''' AS UNCBatchID, '''' AS UNCTransID, MAX(T1.IsEditTransDesc) AS IsEditTransDesc,  
		CASE WHEN T1.DebitAccountID = D.AccountID AND D.OffAccount = 1 THEN CONVERT(bit, 1) ELSE CONVERT(bit, 0) END AS OffAccountDebit,   
		CASE WHEN T1.CreditAccountID = C.AccountID AND C.OffAccount = 1 THEN CONVERT(bit, 1) ELSE CONVERT(bit, 0) END AS OffAccountCredit,  
		0 AS IsInherit, MAX(T1.IsLockAccAna) AS IsLockAccAna, CONVERT(TINYINT, 0) As IsLockAmountFromRequiment, NULL AS RefundDueDate, MAX(T1.IsInheritAccountFromRequest) AS IsInheritAccountFromRequest,   
		''VND'' AS CurrencyID, CONVERT(TINYINT, 0) AS Operator,CONVERT(VARCHAR(50),'''') AS BankTransNumber, CONVERT(VARCHAR(50), '''') AS PaymentTermID,   
		MAX(T1.UseVDescIsTransDesc) AS UseVDescIsTransDesc, MAX(T1.CopyDescriptionVAT) AS CopyDescriptionVAT,  
       
		---- Tra them truong cho mode Tong hop  
		T95.ObjectName AS ObjName,  
		CONVERT(BIT, 0) AS IsFee, '''' AS LinkFeeNo,  
		CONVERT(VARCHAR(20), '''') AS DebitObjectTypeID, CONVERT(VARCHAR(20), '''') AS DebitObjectID, CONVERT(NVARCHAR(500), '''') AS DebitObjectName,  
		CONVERT(VARCHAR(20), '''') AS CreditObjectTypeID, CONVERT(VARCHAR(20), '''') AS CreditObjectID, CONVERT(NVARCHAR(500), '''') AS CreditObjectName,  
		CONVERT(BIT, 0) AS DefaultInfoDebit,   

	 '  
	 SET @StrSQL = @StrSQL + '  
	 INTO  #D95T5000  
	 FROM    D95T5000 T95 WITH(NOLOCK)  
	 INNER JOIN D91T9009 T91 WITH(NOLOCK)  
	   ON T95.VoucherID = T91.Key01ID   
	 INNER JOIN (SELECT TOP 1 * FROM D01T5010 WITH(NOLOCK) WHERE TransTypeID = '''+@TransTypeID+''') T1  
	   ON 1 = 1  
	 LEFT JOIN D90T0001 D WITH(NOLOCK) ON D.AccountID = T1.DebitAccountID    
	 LEFT JOIN D90T0001 C WITH(NOLOCK) ON C.AccountID = T1.CreditAccountID    
	 LEFT JOIN D91T9000 D91 WITH(NOLOCK) ON CASE WHEN ISNULL(T1.VATInOut, '''') = '''' THEN CONVERT(TINYINT, 0) ELSE T1.VATInOut END = D91.Code AND D91.Type = 1000   
		AND D91.Language = '+STR(@Language)+'  
	 LEFT JOIN D91T9000 D92 WITH(NOLOCK) ON T1.VATType = D92.Code AND D92.Type = CASE WHEN T1.VATInOut = 0 THEN 1002 ELSE 1003 END   
		AND D92.Language = '+STR(@Language)+'  
	 LEFT JOIN D91T9000 D93 WITH(NOLOCK) ON T1.VATTypeID = D93.Code AND D93.Type = CASE WHEN T1.VATInOut = 0 THEN 1001 ELSE 1004 END   
		AND D93.Language = '+STR(@Language)+'  
	 LEFT JOIN D91T0040 E WITH(NOLOCK) ON E.VATGroupID = T95.VATGroupID   
	 WHERE  T91.UserID = '''+@UserID+'''   
	   AND T91.HostID = '''+@HostID+'''   
	   AND T91.FormID = ''D95F5000''   
	   AND T91.Key02ID = '''+@FormID+'''  
	   AND T95.IsCreated = 0  
	   AND T95.Amount <> 0  
	   GROUP BY T95.RefNo,T95.RefDate,T95.SerialNo,T95.VatGroup

	   ,T95.ObjectTypeID,		T95.ObjectName,T95.TaxCode,T95.ObjectAddress,T95.ObjectID,T95.VATGroupID,T95.VATRate,T1.CreditAccountID,
			T1.DebitAccountID,D.AccountID,C.AccountID,D.OffAccount,C.OffAccount
			,T95.ObjectNameRecipient,E.VATGroupID,
			T95.AddressRecipient,D.GroupID,T1.Mode,C.GroupID,T1.VATInOut,T1.VATType,T1.VATTypeID,T1.VATInAccountID,T1.VATOutAccountID
	 '  
	 
	 IF @FormID='D01F2070' AND (@UseD01F2070Other=0 OR (@UseD01F2070Other=1 AND @UseCorAccountID=1))
	 BEGIN
	 SET @StrSQL=@StrSQL+'
	 '
	 END

	 SET @StrSQLUpdate = '  
	 UPDATE  T1  
	 SET   T1.TaxDebitGroupID = T2.GroupID  
	 FROM  #D95T5000 T1  
	 INNER JOIN D90T0001 T2 WITH(NOLOCK)  
	   ON T1.TaxDebitAccountID = T2.AccountID  
  
	 UPDATE  T1  
	 SET   T1.TaxCreditGroupID = T2.GroupID  
	 FROM  #D95T5000 T1  
	 INNER JOIN D90T0001 T2 WITH(NOLOCK)  
	   ON T1.TaxCreditAccountID = T2.AccountID  
     
	 UPDATE  T1  
	 SET   T1.ObjectTypeID = CASE WHEN ISNULL(T1.ObjectTypeID, '''') = '''' THEN Ob.ObjectTypeID ELSE T1.ObjectTypeID END  
		, T1.ObjectID = CASE WHEN ISNULL(T1.ObjectID, '''')  = '''' THEN Ob.ObjectID  ELSE T1.ObjectID  END      
		, T1.ObjectName = CASE WHEN ISNULL(T1.ObjectName, '''')  = '''' THEN Ob.ObjectNameU ELSE T1.ObjectName  END  
		, T1.ObjName = CASE WHEN ISNULL(T1.ObjName, '''')  = '''' THEN Ob.ObjectNameU ELSE T1.ObjectName  END  
		, T1.TaxObjectTypeID = CASE WHEN T1.DefaultTaxObject = 1 THEN Ob.ObjectTypeID ELSE T1.TaxObjectTypeID END  
		, T1.TaxObjectID  = CASE WHEN T1.DefaultTaxObject = 1 THEN Ob.ObjectID  ELSE T1.TaxObjectID END  
	 
	 FROM  #D95T5000 T1  
	 INNER JOIN Object Ob WITH(NOLOCK)  
	 ON   T1.VATNo = Ob.VATNo  
	 WHERE  Ob.Disabled = 0  
	 AND   (ISNULL(T1.ObjectID, '''') = '''' OR ISNULL(T1.TAXObjectID, '''') = '''')    
	 '  

	  ---- Neu thiet lap he thong co check su dung D01F2070 dang moi va LNV mode tong hop khong check but toan don thi update DT Co = DT  
		  IF @UseD01F2070Other = 1 AND @UseCorAccountID = 0  AND @FormID='D01F2070'
		  BEGIN   
		   SET @StrSQLUpdate = @StrSQLUpdate + '   
		   UPDATE #D95T5000     
		   SET  DebitObjectTypeID = ObjectTypeID, DebitObjectID = ObjectID, DebitObjectName = ObjectName,  
			 CreditObjectTypeID = ObjectTypeID, CreditObjectID = ObjectID, CreditObjectName = ObjectName  
		   '
		  END  
	 
  
		 IF @VoucherID <> ''  
		 BEGIN  
		  SET @StrSQLUpdate = @StrSQLUpdate + '   
		  UPDATE #D95T5000     
		  SET  TransDesc = T.VoucherDescU  
		  FROM D01T5000 T  
		  WHERE T.VoucherID = '''+@VoucherID+'''  
		   AND UseVDescIsTransDesc = 1    
  
		  UPDATE #D95T5000     
		  SET  TaxTransDesc = TransDesc  
		  WHERE CopyDescriptionVAT = 1  
     
		  '  
		 END  
  
		 SET @StrSQLResult = '   
		 SELECT * FROM #D95T5000  
		 ORDER BY RefDate,TRY_CONVERT(INT,RefNo)
  
		 DELETE FROM D91T9009 WHERE UserID = '''+@UserID+''' AND HostID = '''+@HostID+''' AND FormID = ''D95F5000''  
		 '  
  
		 --PRINT @StrSQL  
		 --PRINT @StrSQLUpdate  
		 --PRINT @StrSQLResult  
		  EXEC (@StrSQL + @StrSQLUpdate + @StrSQLResult)  
		  RETURN;
END

IF @FormCall = 'D95F5000'  
BEGIN  
 SET @StrSQL = '  
 SELECT  '''' AS VoucherID, '''' AS BatchID, '''' AS TransID,  
    T95.ObjectNameRecipient AS SenderReceiver, (SELECT TOP 1 DivisionNameU FROM D91T0016 WITH(NOLOCK) WHERE DivisionID = '''+@DivisionID+''') AS SRDivisionName,   
    T95.AddressRecipient AS SRAddress, '''' AS AttachmentNo,  
    NULL AS VoucherDate, CONVERT(NVARCHAR(500), '''') AS VoucherDesc,  
    1 AS OrdinaryNo,   T95.CAmount AS OAmount,   T95.CAmount AS CAmount,  
    T1.DebitAccountID AS DebitAccountID,  
    T1.CreditAccountID AS CreditAccountID,  
    CASE WHEN T1.Mode = 2 THEN D.GroupID   
      WHEN T1.Mode = 1 THEN C.GroupID   
      ELSE '''' END AS GroupID,  
    
    1 AS ExchangeRate,  T95.InventoryName AS RefDesc, T95.RefDate AS RefDate,     
    CONVERT(NVARCHAR(500), T1.TransDescU)) AS TransDesc,   T95.RefNo AS RefNo,  T95.SerialNo AS Serial,  
  
    -->>>>>>>>>>> Tab 1. Doi tuong  
  
    T95.ObjectTypeID AS ObjectTypeID,  T95.ObjectID AS ObjectID,   T95.ObjectName AS ObjectName,  
    '''' AS VATObjectTypeID, '''' AS VATObjectID,   '''' AS VATObjectName,  
    T95.TaxCode AS VATNo ,   T95.ObjectAddress AS ObjAddress,  T95.BankAccountNo AS BankAccountNo, T95.ObjectAddress AS VATObjectAddress,  
  
    -->>>>>>>>>>>> Tab 2. Thue  
  
    E.VATGroupID AS VATGroupID, CASE WHEN T95.VATRate <= 0 THEN 0 ELSE T95.VATRate/100 END AS RateTax,   '''' As TaxTransID,  CONVERT(VARCHAR(500), '''') AS TaxTransDesc,  
    ROUND(T95.CVAT, 0) AS TaxOAmount,   ROUND(T95.CVAT, 0) AS TaxCAmount,   
    '+ CASE WHEN @UseInfoTax = 1 THEN '   
     CASE WHEN T1.DefaultTaxObject = 1 THEN T95.ObjectTypeID ELSE '''' END AS TaxObjectTypeID,   
     CASE WHEN T1.DefaultTaxObject = 1 THEN T95.ObjectID ELSE '''' END AS TaxObjectID,  
    '  
    ELSE '  
     CONVERT(VARCHAR(20), '''') AS TaxObjectTypeID,  
     CONVERT(VARCHAR(20), '''') AS TaxObjectID,  
    '   
    END +'    
    T1.DefaultTaxObject,  
    CASE WHEN ISNULL(T1.VATInOut, '''') = '''' THEN CONVERT(TINYINT, 0) ELSE T1.VATInOut END AS VATInOut,   
    T1.VATType AS VATType,    
    T1.VATTypeID AS VATTypeID,     
    D91.DescriptionU AS VATInOutName,    
    D92.DescriptionU AS VATTypeName,   
    D93.DescriptionU AS VATTypeIDName,       
    CASE WHEN T1.Mode = 2 OR (T1.Mode = 0 AND (ISNULL(T1.VATInOut, '''') = '''' OR T1.VATInOut = 0)) THEN ISNULL(T1.VATInAccountID,'''') ELSE T1.DebitAccountID END AS TaxDebitAccountID,  
    CASE WHEN T1.Mode = 2 OR (T1.Mode = 0 AND (ISNULL(T1.VATInOut, '''') = '''' OR T1.VATInOut = 0)) THEN T1.CreditAccountID ELSE ISNULL(T1.VATOutAccountID,'''') END AS TaxCreditAccountID,  
    
    -- >>>>>>>>>> Tab 3 . Thanh tien   
    '+ CASE WHEN @UseInfoTax = 1 THEN 'ROUND(T95.CAmount, 0) + ROUND(T95.CVAT, 0)' ELSE '0' END +' AS TotalOAmount,   
    '+ CASE WHEN @UseInfoTax = 1 THEN 'ROUND(T95.CAmount, 0) + ROUND(T95.CVAT, 0)' ELSE '0' END +' AS TotalCAmount,  
  
    -- >>>>>>>>>> Tab 4. Khoan muc  
    T1.DefaultAna01ID AS Ana01ID, T1.DefaultAna02ID AS Ana02ID, T1.DefaultAna03ID AS Ana03ID, T1.DefaultAna04ID AS Ana04ID , T1.DefaultAna05ID AS Ana05ID,  
    T1.DefaultAna06ID AS Ana06ID, T1.DefaultAna07ID AS Ana07ID, T1.DefaultAna08ID AS Ana08ID, T1.DefaultAna09ID AS Ana09ID, T1.DefaultAna10ID AS Ana10ID,  
    T1.DefaultAna01ID, T1.DefaultAna02ID, T1.DefaultAna03ID, T1.DefaultAna04ID, T1.DefaultAna05ID,  
    T1.DefaultAna06ID, T1.DefaultAna07ID, T1.DefaultAna08ID, T1.DefaultAna09ID, T1.DefaultAna10ID,  
    T1.DefaultCashFlowID,  
  
    -- >>>>>>>>>>Tab 5 Khac  
    NULL AS DueDate ,  '''' AS LCNo,     '''' AS PeriodID,   
    '''' AS BillNo ,  '''' AS ProductID,    '''' AS CardNo,  
    NULL AS Ref01, NULL AS Ref02, NULL AS Ref03, NULL AS Ref04, NULL AS Ref05,      
    '''' AS CipID,  '''' AS CipNo, 0 AS ExceedTaxAmount , '''' AS VATBankAccountNo,  
    T95.PaymentMethodID AS PaymentMethodID,   
 '  
 SET @StrSQL = @StrSQL + '  
    --->>>>>> Cot An tren luoi  
    0 As IsTax,'''' As CreateUserID, NULL  As CreateDate,   
    CONVERT(VARCHAR(20), '''') AS TaxDebitGroupID, CONVERT(VARCHAR(20), '''') AS TaxCreditGroupID,   
    '''' AS CorBatchID, '''' As ModuleID, '''' As BatchIDPlan, '''' As TransIDPlan,  
    '''' As TaxBatchIDPlan,'''' As TaxTransIDPlan, 0 As IsPlan, T95.InventoryName AS VATItemName,  
    '''' as DebtManagerID,'''' AS DebtManagerTypeID,  
    '''' As POID, '''' As SOID,'''' As POVoucherNo , '''' As SOVoucherNo,'''' As IdentityBatchID,  
    Convert(Money, 0) As OAmountOffsetD01F2040, Convert(Money, 0) As CAmountOffsetD01F2040,  
    '''' as TransactionTypeID, '''' AS ProjectID, '''' AS ProjectName, '''' AS TaskID, '''' AS TaskName,   
    '''' AS CashFlowID, CONVERT(TINYINT, 0) AS IsNotEditLine,   
    T1.ImplementatD04, T1.ImplementatD03,  
    '''' AS BudgetID, '''' AS BudgetItemID, '''' AS BudgetName, '''' AS BudgetItemName,   
    '''' AS PaymentBatchID, '''' AS PaymentRefBatchID, CONVERT(TINYINT, 0) AS LockAnalysis, '''' AS PropertyProductID,  
    CONVERT(TINYINT, 0) AS IsMatchingCR, '''' AS PContractID, '''' AS PContractNo,  
    T1.IsObligeProject,   
    T95.VoucherID AS OBatchID, T95.TransID AS OTransID, ''D95_InputInvoice'' AS OTransType, '''' AS OVoucherNo,  
    '''' AS BankReference, NULL AS PostingDate, '''' AS TransNarrative,  
    '''' AS SContractID, '''' AS  SContractNo,     
    '''' AS UNCBatchID, '''' AS UNCTransID, T1.IsEditTransDesc,  
    CASE WHEN T1.DebitAccountID = D.AccountID AND D.OffAccount = 1 THEN CONVERT(bit, 1) ELSE CONVERT(bit, 0) END AS OffAccountDebit,   
    CASE WHEN T1.CreditAccountID = C.AccountID AND C.OffAccount = 1 THEN CONVERT(bit, 1) ELSE CONVERT(bit, 0) END AS OffAccountCredit,  
    0 AS IsInherit, T1.IsLockAccAna, CONVERT(TINYINT, 0) As IsLockAmountFromRequiment, NULL AS RefundDueDate, T1.IsInheritAccountFromRequest,   
    ''VND'' AS CurrencyID, CONVERT(TINYINT, 0) AS Operator,CONVERT(VARCHAR(50),'''') AS BankTransNumber, CONVERT(VARCHAR(50), '''') AS PaymentTermID,   
    T1.UseVDescIsTransDesc, T1.CopyDescriptionVAT,  
       
    ---- Tra them truong cho mode Tong hop  
    T95.ObjectName AS ObjName,  
    CONVERT(BIT, 0) AS IsFee, '''' AS LinkFeeNo,  
    CONVERT(VARCHAR(20), '''') AS DebitObjectTypeID, CONVERT(VARCHAR(20), '''') AS DebitObjectID, CONVERT(NVARCHAR(500), '''') AS DebitObjectName,  
    CONVERT(VARCHAR(20), '''') AS CreditObjectTypeID, CONVERT(VARCHAR(20), '''') AS CreditObjectID, CONVERT(NVARCHAR(500), '''') AS CreditObjectName,  
    CONVERT(BIT, 0) AS DefaultInfoDebit,   
    CONVERT(VARCHAR(20), '''') AS CorAccountID, CONVERT(VARCHAR(20), '''') AS CorGroupID,  
    ISNULL(D.GroupID, '''') AS DebitGroupID, ISNULL(C.GroupID, '''') AS CreditGroupID,  
    ROW_NUMBER() OVER (ORDER BY T95.RefDate, TRY_CONVERT(INT, T95.RefNo)) AS RN  
 '  
 SET @StrSQL = @StrSQL + '  
 INTO  #D95T5000  
 FROM    D95T5000 T95 WITH(NOLOCK)  
 INNER JOIN D91T9009 T91 WITH(NOLOCK)  
   ON T95.VoucherID = T91.Key01ID   
 INNER JOIN (SELECT TOP 1 * FROM D01T5010 WITH(NOLOCK) WHERE TransTypeID = '''+@TransTypeID+''') T1  
   ON 1 = 1  
 LEFT JOIN D90T0001 D WITH(NOLOCK) ON D.AccountID = T1.DebitAccountID    
 LEFT JOIN D90T0001 C WITH(NOLOCK) ON C.AccountID = T1.CreditAccountID    
 LEFT JOIN D91T9000 D91 WITH(NOLOCK) ON CASE WHEN ISNULL(T1.VATInOut, '''') = '''' THEN CONVERT(TINYINT, 0) ELSE T1.VATInOut END = D91.Code AND D91.Type = 1000   
    AND D91.Language = '+STR(@Language)+'  
 LEFT JOIN D91T9000 D92 WITH(NOLOCK) ON T1.VATType = D92.Code AND D92.Type = CASE WHEN T1.VATInOut = 0 THEN 1002 ELSE 1003 END   
    AND D92.Language = '+STR(@Language)+'  
 LEFT JOIN D91T9000 D93 WITH(NOLOCK) ON T1.VATTypeID = D93.Code AND D93.Type = CASE WHEN T1.VATInOut = 0 THEN 1001 ELSE 1004 END   
    AND D93.Language = '+STR(@Language)+'  
 LEFT JOIN D91T0040 E WITH(NOLOCK) ON E.VATGroupID = T95.VATGroupID   
 WHERE  T91.UserID = '''+@UserID+'''   
   AND T91.HostID = '''+@HostID+'''   
   AND T91.FormID = ''D95F5000''   
   AND T91.Key02ID = '''+@FormID+'''  
   AND T95.IsCreated = 0  
   AND T95.Amount <> 0  
 '  
  
 SET @StrSQLUpdate = '  
 UPDATE  T1  
 SET   T1.TaxDebitGroupID = T2.GroupID  
 FROM  #D95T5000 T1  
 INNER JOIN D90T0001 T2 WITH(NOLOCK)  
   ON T1.TaxDebitAccountID = T2.AccountID  
  
 UPDATE  T1  
 SET   T1.TaxCreditGroupID = T2.GroupID  
 FROM  #D95T5000 T1  
 INNER JOIN D90T0001 T2 WITH(NOLOCK)  
   ON T1.TaxCreditAccountID = T2.AccountID  
     
 UPDATE  T1  
 SET   T1.ObjectTypeID = CASE WHEN ISNULL(T1.ObjectTypeID, '''') = '''' THEN Ob.ObjectTypeID ELSE T1.ObjectTypeID END  
    , T1.ObjectID = CASE WHEN ISNULL(T1.ObjectID, '''')  = '''' THEN Ob.ObjectID  ELSE T1.ObjectID  END      
    , T1.ObjectName = CASE WHEN ISNULL(T1.ObjectName, '''')  = '''' THEN Ob.ObjectNameU ELSE T1.ObjectName  END  
    , T1.ObjName = CASE WHEN ISNULL(T1.ObjName, '''')  = '''' THEN Ob.ObjectNameU ELSE T1.ObjectName  END  
 '+ CASE WHEN @UseInfoTax = 1 THEN '     
    , T1.TaxObjectTypeID = CASE WHEN T1.DefaultTaxObject = 1 THEN Ob.ObjectTypeID ELSE T1.TaxObjectTypeID END  
    , T1.TaxObjectID  = CASE WHEN T1.DefaultTaxObject = 1 THEN Ob.ObjectID  ELSE T1.TaxObjectID END  
 '   
 ELSE '' END +'  
 FROM  #D95T5000 T1  
 INNER JOIN Object Ob WITH(NOLOCK)  
 ON   T1.VATNo = Ob.VATNo  
 WHERE  Ob.Disabled = 0  
 AND   (ISNULL(T1.ObjectID, '''') = '''' OR ISNULL(T1.TAXObjectID, '''') = '''')    
 '  
  
 IF @FormID = 'D01F2070'  
 BEGIN   
  ---- Neu thiet lap he thong co check su dung D01F2070 dang moi va LNV mode tong hop khong check but toan don thi update DT Co = DT  
  IF @UseD01F2070Other = 1 AND @UseCorAccountID = 0  
  BEGIN   
   SET @StrSQLUpdate = @StrSQLUpdate + '   
   UPDATE #D95T5000     
   SET  DebitObjectTypeID = ObjectTypeID, DebitObjectID = ObjectID, DebitObjectName = ObjectName,  
     CreditObjectTypeID = ObjectTypeID, CreditObjectID = ObjectID, CreditObjectName = ObjectName  
   '  
  END  
  ELSE  
  BEGIN   
   SET @StrSQLUpdate = @StrSQLUpdate + '  
   ---- Bang tam chua du lieu cua nhung dong co tien thue <> 0  
   SELECT  *   
   INTO  #D95T5000_Tax  
   FROM  #D95T5000  
   WHERE  TaxCAmount <> 0  
  
   UPDATE  #D95T5000_Tax  
   SET   OAmount = TaxOAmount, CAmount = TaxCAmount,  
      DebitAccountID = TaxDebitAccountID, CreditAccountID = TaxCreditAccountID,   
      DebitGroupID = TaxDebitGroupID, CreditGroupID = TaxCreditGroupID,   
      OrdinaryNo = 2  
  
   ---- Insert du lieu thue vao bang (vi D01F2070 mode cu, D01F2070 mode moi - BT DON: KHONG CO TAB THUE)  
   INSERT INTO #D95T5000  
   SELECT * FROM #D95T5000_Tax  
  
   UPDATE #D95T5000  
   SET  TaxOAmount = 0, TaxCAmount = 0,  
     TaxDebitAccountID = '''', TaxCreditAccountID = '''',  
     TaxDebitGroupID = '''', TaxCreditGroupID = ''''  
  
   DROP TABLE #D95T5000_Tax  
   '  
  END  
 END  
  
 IF @VoucherID <> ''  
 BEGIN  
  SET @StrSQLUpdate = @StrSQLUpdate + '   
  UPDATE #D95T5000     
  SET  TransDesc = T.VoucherDescU  
  FROM D01T5000 T  
  WHERE T.VoucherID = '''+@VoucherID+'''  
   AND UseVDescIsTransDesc = 1    
  
  UPDATE #D95T5000     
  SET  TaxTransDesc = TransDesc  
  WHERE CopyDescriptionVAT = 1  
     
  '  
 END  
  
 SET @StrSQLResult = '   
 SELECT * FROM #D95T5000  
 ORDER BY RN, OrdinaryNo   
  
 DROP TABLE #D95T5000  
  
 DELETE FROM D91T9009 WHERE UserID = '''+@UserID+''' AND HostID = '''+@HostID+''' AND FormID = ''D95F5000''  
 '  
  
 --PRINT @StrSQL  
 --PRINT @StrSQLUpdate  
 --PRINT @StrSQLResult  
 EXEC (@StrSQL + @StrSQLUpdate + @StrSQLResult)  
END  
  
  
  
