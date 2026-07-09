  
  
  
  
  
  
  
  
  
  
  
-- <Summary>  
----   
-- <Param>  
----   
-- <Return>  
----   
-- <Reference>  
---- Noi goi: D04\Truy van\Phat sinh TH\Popup menu Xem/Sua-D04F2320  
-- <History>  
-- Created by Nguyen Binh Minh 01/08/2007  
-- Description: Do du lieu cho man hinh nghiep vu PS TH khi Xem/Sua  
---- Modified on 28/01/2008 by Tang Le nguyen . Sua truong VatobjectTypeID--> VATObjectTypeID  
---- Modified on 01/04/2008 by Nguyen Binh Minh :Sua loi xem lai cac phieu da nhap khong co loai nghiep vu bao loi (AllowMultiCurrency is null)   
---- Modified on 29/09/2008 by Bui Huu Le : Them truong CreateUserID,CreateDate,LastModifyUserID,LastModifyDate  
---- Modified on 06/11/2008 by Bui Huu Le : Bo sung truong ordinaryno   
---- Modified on 23/03/2009 by Le Thi Thu Hien : Order by OrdinaryNo  
---- Modified on 25/03/2009 by Le Thi Thu Hien : Lay truong BatchID  
---- Modified on 03/06/2009 by Le Thi Thu Hien : Them truong VATObjectAdress  
---- Modified on 22/07/2009 by Le Thi Thu Hien : Them truong L/CNo  
---- Modified on 18/12/2009 by Le Thi Thu Hien : Them truong Ten doi tuong  
---- Modified on 03/02/2010 by Le Thi Thu Hien : Them truong IsOut  
---- Modified on 26/02/2010 by Le Thi Thu Hien : Dao vi tri COALESCE(DebitObjectID, CreditObjectID, T03.ObjectID)de tranh truong hop rong  
---- Modified on 11/01/2011 by Le Thi Thu Hien : Bo sung BankAccountNo  
---- Modified on 12/10/2011 by Thi Hiep : Bo sung cot InventoryID, InventoryName  
---- Modified on 11/11/2011 by Ngo Thi Huan: Bo sung truong EmployeeID (ID: 44208)  
---- Modified on 08/12/2011 by Thi Hiep (ID: 43948): Chuyen Unicode  
---- Modified on 29/03/2012 by Thi Hiep(ID:47674): Sap xep theo OrdinaryNo khi do nguon len luoi de Xem hoac Sua  
---- Modified on 03/04/2012 by Thi Hiep(ID:47619): Bo sung CASE WHEN khi lay truong IsMultiCurrency (uu tien xet tinh da te trong phieu truoc)  
---- Modified on 01/10/2012 by Thi Hiep(ID:47302): Bo sung truong thong tin Du an, hang muc (ProjectID, ProjectName, TaskID, TaskName)  
---- Modified on 25/06/2013 by Tuyen Nguyen (ID 55840): Bo sung truong Ma LCTT (CashFlowID)  
---- Modified on 13/12/2013 by Phuong Thao (ID 62056): Sua kieu du truong RefDate  
---- Modified on 16/01/2014 by Lai Van Duy(ID 61737): Bo sung ModuleID khi do nguon Master  
---- Modified on 17/03/2014 by Phuong Thao(ID 63672): Bo sung Hang muc, ngan sach  
---- Modified on 10/06/2013 by Phuong Thao (ID 66484): Bo where theo @TranMonth, @TranYear, tra them truong TranMonth, TranYear de truyen vao store in  
---- Modified on 16/10/2014 by VAN TAM (69139): Bo sung Lockanalysis  
---- Modified on 02/03/2015 by Hai Dang (ID 72754): Bo sung SBatchID, STransID, STransType, OBatchID, OTransID, OTransType, OVoucherNo  
---- Modified on 30/03/2015 by Phuong Thao (ID 74235): Bo sung PropertyProductID  
---- Modified on 25/06/2015 by Hoang Anh (76570): Bo sung DebtManagerTypeID, DebtManagerID  
---- Modified on 22/07/2015 by Phuong Thao (ID 77336): Bo sung BankID  
---- Modified on 25/05/2016 by Kim Quyen (ID 87414): Bo sung PContractID, PContractNo , SContractID , SContractNo voi @Source = 1,2  
---- Modified on 10/11/2016 by Nhu Han: Bo sung CRVoucherID  
---- Modified on 16/01/2017 by Hong Nhi (ID 94839): Bo sung TransactionTypeID, GroupID khi load master  
---- Modified on 20/02/2017 by Hoang Anh (ID 92646): Bo sung cac thong tin bo sung   
---- Modified on 16/07/2018 by GIANGLAM (ID 108556): Bo sung trả ra hai truong OffAccountDebit, OffAccountCredit khi @Source <> 0  
---- Modified on 05/12/2020 by TRITHONG (ID 147317): Bo sung truong IsInherit de ke thua phieu  
---- Modified on 25/03/2022 by DINHKHANH (ID 224609): Bo sung mac dinh nguoi lap khi ke thua   
---- Modified on 14/06/2022 by DINHKHANH (ID 242717): Mac dinh @UserID = ''  
---- Modified on 12/06/2024 by KHATUAN (279093): Bo sung tra ra them Locked,Cancel,PeriodID  
---- Modified on 11/07/2024 by THAONGUYEN (281564): Set lai CreateDate, CreateUserID, LastModifyUserID, LastModifyDate khi @IsInherit = 1  
---- Modified on 19/09/2025 by THAONGUYEN (300280): Bo sung @TransTypeID, @FormID, @OBatchID  
---- Modified on 17/10/2025 by KHATUAN (302989): Chinh sua lay thong tin doi tuong  (  @FormID = 'D95F5000' )  
---- Modified on 19/01/2026 by KHATUAN (304974, 304976): Bo sung khong load du lieu dong = 0 khi chon HDDV va mac dinh 10 cot khoan muc  (  @FormID = 'D95F5000' )  
---- Modified on 11/12/2026 by KHATUAN (): Bo sung khi chinh sua thong tin doi tuong care theo Loai doi tuong va loai doi tuong thue (  @FormID = 'D95F5000' )  
---- Modified on 11/02/2026 by THAONGUYEN (307425): Bo sung update lai hoa don dau vao (D95T5000)  
---- Modified on 12/02/2026 by KHATUAN (): Chinh sua update Loai doi tuong va Loai doi tuong thue   
---- Modified on 25/02/2026 by HAN (305407): Bo sung load du lieu tu D80F2115 ( Nhap nhanh tu Excel )  
-- <Example>  
-- Exec D04P2331 'THHA', '04', 6, 2008, '04GR0A000000024', 2  
--Exec D04P2331 'TUONGAN', '04', 11, 2011, '04GR0J000000035', 0  
  
--Exec D04P2331 'TUONGAN', '04', 11, 2011, '04GR0J000000035', 1  
ALTER PROCEDURE D04P2341  
(  
 @DivisionID AS varchar(20),  
 @ModuleID AS varchar(20),  
 @TranMonth AS tinyint,  
 @TranYear AS int,  
 @GroupID AS varchar(20),  
 @Source AS tinyint ,  
--0: Master, 1: Luoi 1, 2: Luoi 2  
 @CodeTable AS TINYINT = 0,  
 @IsInherit AS TINYINT = 0,  
 @UserID AS varchar(50) = '',  
 @TransTypeID VARCHAR(50) = '',  
 @FormID VARCHAR(50) = '',  
 @OBatchID NVARCHAR(4000) = ''  
)  
AS  
SET NOCOUNT ON  
DECLARE @U VARCHAR(1)  
SET     @U  = CASE WHEN @CodeTable = 0 THEN '' ELSE 'U' END  
DECLARE @TransactionTypeID AS NVARCHAR(500)
DECLARE @sSQL AS Nvarchar(MAX)  
DECLARE @sSQL1 AS Nvarchar(MAX)  
DECLARE @sSQL2 AS Nvarchar(MAX)  
DECLARE @sSQL3 AS varchar(MAX) = ''  
 

---- Load du lieu tu D95F5000   
IF @FormID='D04F2325'
BEGIN   
 SET @TransactionTypeID = (SELECT TransactionTypeID FROM D04T1320 WITH(NOLOCK) WHERE TransTypeID = @TransTypeID)  
  
 SET @sSQL=  
 '  
 SELECT  CONVERT(TINYINT, 0) AS OrderNo,   
    MAX(T95.InventoryName) AS ItemName,   
    '+ CASE WHEN @TransactionTypeID = 'DBT' THEN ' '''' ' ELSE ' MAX(T04.CorAccountID) ' END +' AS DebitAccountID,   
    '+ CASE WHEN @TransactionTypeID = 'DBT' THEN ' MAX(T04.CorAccountID) ' ELSE ' '''' ' END +' AS CreditAccountID,   
    SUM(T95.Amount) AS OriginalAmount, SUM(T95.Amount) AS ConvertedAmount,           
    ISNULL(T95.ObjectTypeID,'''')  AS ObjectTypeID, ISNULL(T95.ObjectID,'''') AS ObjectID , ISNULL(T95.ObjectName,'''')  AS ObjectName  
          
  
    ,CASE WHEN ISNULL(MAX(T1320.DefaultAna01ID), '''') = '''' THEN  CONVERT(VARCHAR(20),'''') ELSE MAX(T1320.DefaultAna01ID) END AS Ana01ID  
    ,CASE WHEN ISNULL(MAX(T1320.DefaultAna02ID), '''') = '''' THEN  CONVERT(VARCHAR(20),'''') ELSE MAX(T1320.DefaultAna02ID) END AS Ana02ID  
    ,CASE WHEN ISNULL(MAX(T1320.DefaultAna03ID), '''') = '''' THEN  CONVERT(VARCHAR(20),'''') ELSE MAX(T1320.DefaultAna03ID) END AS Ana03ID  
    ,CASE WHEN ISNULL(MAX(T1320.DefaultAna04ID), '''') = '''' THEN  CONVERT(VARCHAR(20),'''') ELSE MAX(T1320.DefaultAna04ID) END AS Ana04ID  
    ,CASE WHEN ISNULL(MAX(T1320.DefaultAna05ID), '''') = '''' THEN  CONVERT(VARCHAR(20),'''') ELSE MAX(T1320.DefaultAna05ID) END AS Ana05ID  
    ,CASE WHEN ISNULL(MAX(T1320.DefaultAna06ID), '''') = '''' THEN  CONVERT(VARCHAR(20),'''') ELSE MAX(T1320.DefaultAna06ID) END AS Ana06ID  
    ,CASE WHEN ISNULL(MAX(T1320.DefaultAna07ID), '''') = '''' THEN  CONVERT(VARCHAR(20),'''') ELSE MAX(T1320.DefaultAna07ID) END AS Ana07ID  
    ,CASE WHEN ISNULL(MAX(T1320.DefaultAna08ID), '''') = '''' THEN  CONVERT(VARCHAR(20),'''') ELSE MAX(T1320.DefaultAna08ID) END AS Ana08ID  
    ,CASE WHEN ISNULL(MAX(T1320.DefaultAna09ID), '''') = '''' THEN  CONVERT(VARCHAR(20),'''') ELSE MAX(T1320.DefaultAna09ID) END AS Ana09ID  
    ,CASE WHEN ISNULL(MAX(T1320.DefaultAna10ID), '''') = '''' THEN  CONVERT(VARCHAR(20),'''') ELSE MAX(T1320.DefaultAna10ID) END AS Ana10ID  
  											  
    , T95.VATGroupID, T95.VATRate/100 AS RateTax, MAX(T04.VATAccountID) AS VATAccountID, MAX(T95.InventoryName) AS VATItemDesc,   
    SUM(T95.CVAT) AS OVATAmount, SUM(T95.CVAT) AS CVATAmount,  
    CONVERT(VARCHAR(20),'''') AS VATAuthorityTypeID, CONVERT(VARCHAR(20),'''') AS VATAuthorityID, CONVERT(NVARCHAR(500),'''') AS VATAuthorityName,  
            CONVERT(VARCHAR(20),'''') AS CipID, CONVERT(VARCHAR(20),'''') AS CipNo,  
    CONVERT(VARCHAR(20),'''') AS PeriodID,       
    CONVERT(MONEY,0) AS ExceedTaxAmount,  
    CONVERT(VARCHAR(50),'''') AS RPTransactionID,   
    CONVERT(VARCHAR(50),'''') AS VATRPTransactionID,  
    '''' AS CreateUserID, GETDATE() AS CreateDate, '''' AS LastModifyUserID, GETDATE() AS LastModifyDate,  
	0 AS OrdinaryNo,  
	'

	SET @sSQL2=
	'
    MAX(T95.BankAccountNo) AS BankAccountNo,  
    CONVERT(VARCHAR(50),'''') AS LCNo,  
    CONVERT(VARCHAR(50),'''') AS InventoryID, CONVERT(NVARCHAR(500), '''') AS InventoryName,  
    CONVERT(VARCHAR(50),'''') AS POID, CONVERT(VARCHAR(50),'''') AS SOID,      
    CONVERT(VARCHAR(50),'''') AS POVoucherNo, CONVERT(VARCHAR(50),'''') AS SOVoucherNo,  
    CONVERT(VARCHAR(50),'''') AS ProjectID, CONVERT(NVARCHAR(500), '''') AS ProjectName,  
    CONVERT(VARCHAR(50),'''') AS TaskID, CONVERT(NVARCHAR(500), '''') AS TaskName, CONVERT(VARCHAR(50),'''') AS CashFlowID,  
    CONVERT(VARCHAR(50),'''') AS GroupID, CONVERT(VARCHAR(50),'''') AS BatchID, ''04'' AS ModuleID,  
    CONVERT(VARCHAR(50),'''') AS BudgetID, CONVERT(VARCHAR(50),'''') AS BudgetName,  
    CONVERT(VARCHAR(50),'''') AS BudgetItemID, CONVERT(VARCHAR(50),'''') AS BudgetItemName,  
    CONVERT(VARCHAR(50),'''') AS CRVoucherID,  
    CONVERT(VARCHAR(50),'''') AS PropertyProductID, CONVERT(Tinyint,0) As LockAnalysis,  
    CONVERT(VARCHAR(50),'''') AS SBatchID, CONVERT(VARCHAR(50),'''') AS STransID, CONVERT(VARCHAR(50),'''') AS STransType,  
    T95.VoucherID AS OBatchID, T95.TransID AS OTransID, ''D95_InputInvoice'' AS OTransType, CONVERT(VARCHAR(50),'''') AS OVoucherNo,  
    CONVERT(VARCHAR(50),'''') AS PContractID, CONVERT(VARCHAR(50),'''') AS PContractNo,  
    CONVERT(VARCHAR(50),'''') AS SContractID, CONVERT(VARCHAR(50),'''') AS SContractNo,  
    '''' AS RefStr01, '''' AS RefStr02, '''' AS RefStr03, '''' AS RefStr04, '''' AS RefStr05,  
    NULL AS RefNum01, NULL AS RefNum02, NULL AS RefNum03, NULL AS RefNum04, NULL AS RefNum05,  
    NULL AS RefDate01, NULL AS RefDate02, NULL AS RefDate03, NULL AS RefDate04, NULL AS RefDate05,  
    CASE WHEN T04.AccountID = D90D.AccountID AND D90D.OffAccount = 1 THEN CONVERT(bit, 1) ELSE CONVERT(bit, 0) END AS OffAccountDebit,   
    CASE WHEN T04.CorAccountID = D90C.AccountID AND D90C.OffAccount = 1 THEN CONVERT(bit, 1) ELSE CONVERT(bit, 0) END AS OffAccountCredit,  
    0 AS IsInherit,  
    ---- Master: Tab Thong tin chung  
    MAX(T95.SerialNo) AS Serial, T95.RefNo, CONVERT(VARCHAR(20),T95.RefDate,103) AS RefDate,   
    ''VND'' AS CurrencyID, 1 AS ExchangeRate,   
    T95.PaymentMethodID, T95.PaymentMethodName,  
    ---- Master: Tab Thue GTGT      
    ISNULL(T95.ObjectTypeID,'''')  AS VATObjectTypeID,ISNULL(T95.ObjectID,'''')  AS VATObjectID, ISNULL(T95.ObjectName,'''') AS VATObjectName,T95.ObjectAddress AS Object_Address, T95.TaxCode AS VATNo, '''' AS VATItemName,  
    T1320.DefaultVATAuthority  


 INTO  #Result_D04F2326  
 FROM   D95T5000 T95 WITH(NOLOCK)  
 LEFT JOIN (SELECT TOP 1 * FROM D04T1321 WITH(NOLOCK) WHERE TransTypeID = '''+@TransTypeID+''' AND D_C <> '''') T04   
   ON 1 = 1  
 LEFT JOIN D90T0001 D90D WITH(NOLOCK) ON T04.AccountID = D90D.AccountID  
 LEFT JOIN D90T0001 D90C WITH(NOLOCK) ON T04.CorAccountID = D90C.AccountID   
 LEFT JOIN (SELECT TOP 1 * FROM D04T1320 WITH(NOLOCK) WHERE TransTypeID = '''+@TransTypeID+''' ) T1320   
   ON 1 = 1  
 WHERE  T95.VoucherID = '''+@OBatchID+'''  
 AND   T95.Amount <> 0  
 AND   T95.IsCreated = 0  
 GROUP BY T95.RefNo,T95.RefDate,T95.SerialNo,T95.VoucherID,T95.VatGroup,T95.ObjectTypeID,T95.ObjectName,T95.TaxCode
 ,T95.ObjectAddress,T95.ObjectID,T95.VATGroupID,T95.VATRate,T04.CorAccountID,T04.AccountID,D90D.AccountID,D90C.OffAccount,D90D.OffAccount,D90C.AccountID  
 '

  SET @sSQL3=
  ' 
 --UPDATE  T1  
 --SET   T1.ObjectID   = '''' ,  
 --   T1.ObjectTypeID  = '''' ,  
 --   T1.VATObjectID  = '''' ,  
 --   T1.VATObjectTypeID = ''''  
 --FROM  #Result_D04F2326 T1  
 --WHERE  NOT EXISTS ( SELECT 1 FROM Object T2 WITH(NOLOCK) WHERE T1.ObjectTypeID = T2.ObjectTypeID AND T1.ObjectID = T2.ObjectID )  
 --AND   T1.ObjectTypeID <> ''''   
 --AND   T1.ObjectID <> ''''   
  
 --UPDATE T1  
 --SET     T1.ObjectTypeID      = T2.ObjectTypeID,  
 --  T1.ObjectID          = T2.ObjectID,  
 --  T1.ObjectName        = CASE WHEN T1.ObjectName = '''' THEN T2.ObjectNameU ELSE T1.ObjectName END,  
 --  T1.VATObjectTypeID   = T2.ObjectTypeID,  
 --  T1.VATObjectID       = T2.ObjectID,  
 --  T1.VATObjectName     = CASE WHEN T1.VATObjectName = '''' THEN T2.ObjectNameU ELSE T1.VATObjectName END  
 --FROM    #Result_D04F2326 T1  
 --OUTER APPLY (  
 -- SELECT TOP 1 T2.ObjectTypeID, T2.ObjectID, T2.ObjectNameU  
 -- FROM  Object T2 WITH(NOLOCK)  
 -- WHERE  T1.VATNo = T2.VATNo  
 --  AND  T2.Disabled = 0  
 -- ORDER BY T2.ObjectTypeID ASC  
 --) T2  
 --WHERE   ISNULL(T1.ObjectTypeID,'''') = ''''  
 -- OR  ISNULL(T1.ObjectID,'''') = ''''  
  
 UPDATE  #Result_D04F2326  
 SET   VATAuthorityTypeID = ObjectTypeID,  
    VATAuthorityID = ObjectID,  
    VATAuthorityName = ObjectName  
 WHERE  DefaultVATAuthority = 1  
  
 SELECT  *   
 FROM  #Result_D04F2326  
   
 '  
 --PRINT @sSQL  
 EXEC(@sSQL+@sSQL2+@sSQL3)
 RETURN  
END  
  

IF @Source=0 --- Load du lieu Master  
 BEGIN  
  SET @sSQL='  
   DECLARE @IsMultiCurrency AS tinyint  
   IF ( SELECT COUNT(*)   
     FROM ( SELECT  DISTINCT CurrencyID, ExchangeRate   
      FROM  D04T0003 with(nolock)  
      WHERE  GroupID = ''' + @GroupID + '''   
       AND DivisionID = '''+@DivisionID+'''         
       AND TransactionTypeID=''SGT''  
       ) AS A  
    ) > 1  
    SET @IsMultiCurrency = 1  
   ELSE  
    SET @IsMultiCurrency = 0  
  
   SELECT  TOP 1    
     T03.TranMonth, T03.TranYear,  
     T03.TransTypeID, T20.TransTypeName'+@U+' AS TransTypeName,   
     T03.VoucherTypeID, T03.VoucherID,       T03.VoucherDate,   
     T03.DAGroupID,   
     Notes'+@U+' AS Notes,   
          CurrencyID,  ExchangeRate,   
     ISNULL(T20.AllowMultiCurrency,0) As AllowMultiCurrency,   
     CASE WHEN @IsMultiCurrency = 1 THEN @IsMultiCurrency ELSE ISNULL(T20.AllowMultiCurrency,0) END AS IsMultiCurrency,   
     ' + CASE WHEN @IsInherit = 1   
      THEN ' '''' AS CreateUserID, NULL AS CreateDate, '''' AS LastModifyUserID, NULL AS LastModifyDate, '  
      ELSE ' T03.CreateUserID, T03.CreateDate, T03.LastModifyUserID, T03.LastModifyDate, '   
      END + '  
     T03.InventoryID,  
     T03.InventoryName'+@U+' AS InventoryName,  
     T03.EmployeeID, Convert(varchar(1000),'''') AS EmployeeName, T03.ModuleID,  
     T03.BankID,   
     T03.TransactionTypeID,  
     T03.GroupID,  
     T20.IsAccountingOffAccount,  
     T03.IsInherit,T03.Locked, T03.Cancel,  
       REPLACE(STR(T03.TranMonth, 2), '' '', ''0'') + ''/'' + STR(T03.TranYear, 4) AS PeriodID  
   INTO #D04P2331Master    
   FROM   D04T0003 T03 With ( NoLock )  
   LEFT JOIN  D04T1320 T20 WITH(NOLOCK)  
    ON  T03.TransTypeID = T20.TransTypeID  
   LEFT JOIN Object Obj WITH(NOLOCK)  
    ON T03.EmployeeID = Obj.ObjectID and Obj.ObjectTypeID = ''NV''  
   WHERE   T03.GroupID = '''+@GroupID+'''   
     AND T03.DivisionID = '''+@DivisionID+'''        
     AND T03.TransactionTypeID = ''SGT''  
     
   UPDATE  #D04P2331Master   
   SET EmployeeName = Obj.ObjectName'+@U+'  
   FROM Object Obj   
   WHERE ISNULL(EmployeeID,'''') = Obj.ObjectID and Obj.ObjectTypeID = ''NV''  
     
   '+CASE WHEN @IsInherit = 1 THEN '  
    UPDATE  #D04P2331Master  
    SET   ModuleID = ''04'',GroupID = '''', VoucherID = '''', VoucherDate = GETDATE(), IsInherit = 1  
      
    UPDATE   #D04P2331Master   
    SET   EmployeeID = Obj.ObjectID,  
       EmployeeName = Obj.ObjectNameU        
    FROM  Object Obj WITH (NOLOCK)  
    WHERE  Obj.L3UserID = '''+@UserID+'''  
    ' ELSE '' END +'  
        
   SELECT * FROM #D04P2331Master   
     
   DROP Table #D04P2331Master  
   '  
  EXEC(@sSQL)  
     
 END    
  
ELSE -- Load du lieu luoi 1, luoi 2  
 BEGIN  
      ---Tao Cau truc  
      SET @sSQL1 ='  
   SELECT  OrdinaryNo,   
     ItemName'+@U+' AS ItemName,   
     '+CASE WHEN @Source=1 THEN 'DebitAccountID' ELSE 'CreditAccountID' END+' AS AccountID,  
     CorAccountID,   
     OriginalAmount,   ConvertedAmount,   
           COALESCE(T03.ObjectID, DebitObjectID, CreditObjectID ) AS ObjectID,   
     COALESCE(T03.ObjectTypeID, DebitObjectTypeID, CreditObjectTypeID ) AS ObjectTypeID,  
     OB.ObjectName'+@U+' AS ObjectName,   
     T03.CurrencyID,   T03.ExchangeRate,   
     T03.Serial,    T03.RefNo,                 
     T03.RefDate,   
     CONVERT(varchar(10), T03.DueDate, 103) AS DueDate,   
          T03.Ana01ID, T03.Ana02ID, T03.Ana03ID, T03.Ana04ID, T03.Ana05ID,   
          T03.Ana06ID, T03.Ana07ID, T03.Ana08ID, T03.Ana09ID, T03.Ana10ID,   
          T03.VATTypeID,    T03.VATGroupID,     T03.VATItemName'+@U+' AS VATItemName,  D91.IsOut,   
     T03.VATObjectTypeID,  T03.VATObjectID,   
     T03.Object_Name'+@U+' AS VATObjectName,  
     T03.Object_Address'+@U+' AS VATObjectAddress,   
     T03.VATNo,  
          T03.CipID,    D02.CipNo,   
     PeriodID,   
     T03.DiscountID,   T03.PaymentMethodID,  
     V10.Operator,    V10.OriginalDecimal,   V10.ExchangeRateDecimal,        
     T03.BatchID,    T03.RPTransactionID,   
     Convert(varchar(50),'''') AS GroupID,     Convert(varchar(50),'''') AS TransactionID,   
     T03.LCNo,  
     --T03.CreateUserID, T03.CreateDate,T03.LastModifyUserID,T03.LastModifyDate,  
     CONVERT(VARCHAR(50), '''') AS CreateUserID, CONVERT(DATETIME, NULL) AS CreateDate, CONVERT(VARCHAR(50), '''') AS LastModifyUserID, CONVERT(DATETIME, NULL) AS LastModifyDate,  
     T03.POID,  
     T03.SOID,  
     ISNULL(D06.VoucherNo,'''')  As POVoucherNo,  
     ISNULL(D05.VoucherNum,'''') As SOVoucherNo,  
     ISNULL(T03.BankAccountNo, '''') AS BankAccountNo,  
     T03.InventoryID,  
     T03.InventoryName'+@U+' AS InventoryName,  
     T03.ProjectID,     T03.ProjectName'+@U+' AS ProjectName,  
     T03.TaskID,      T03.TaskName'+@U+' AS TaskName,  
     T03.CashFlowID,   
     T03.BudgetID,     T03.BudgetName,  
     T03.BudgetItemID,      T03.BudgetItemName,  
     CONVERT(Tinyint,0) As LockAnalysis,  
     T03.SBatchID,  T03.STransID, T03.STransType,  
     T03.OBatchID, T03.OTransID, T03.OTransType, T03.OVoucherNo,  
     T03.PropertyProductID,  
     T03.DebtManagerTypeID,  
     T03.DebtManagerID,  
     CONVERT(NVARCHAR(250),'''') AS DebtManagerName,  
     T03.PContractID, T03.PContractNo , T03.SContractID , T03.SContractNo,  
     CONVERT(varchar(50), '''') AS CRVoucherID,  
     T04.RefStr01, T04.RefStr02, T04.RefStr03, T04.RefStr04, T04.RefStr05,  
     T04.RefNum01, T04.RefNum02, T04.RefNum03, T04.RefNum04, T04.RefNum05,  
     T04.RefDate01, T04.RefDate02, T04.RefDate03, T04.RefDate04, T04.RefDate05,  
     CASE WHEN T03.DebitAccountID  = D90D.AccountID AND D90D.OffAccount = 1 THEN CONVERT(bit, 1) ELSE CONVERT(bit, 0) END AS OffAccountDebit,   
     CASE WHEN T03.CreditAccountID  = D90C.AccountID AND D90C.OffAccount = 1 THEN CONVERT(bit, 1) ELSE CONVERT(bit, 0) END AS OffAccountCredit,  
     T03.IsInherit  
  
   INTO #D04P2331Grid  
   FROM   D04T0003 T03 With ( NoLock )  
   LEFT JOIN  D02T0100 D02 WITH(NOLOCK)  
    ON  D02.CipID = T03.CipID  
   LEFT JOIN  D91V0010 V10 WITH(NOLOCK)  
    ON  T03.CurrencyID = V10.CurrencyID  
   LEFT JOIN  Object OB WITH(NOLOCK)  
    ON OB.ObjectTypeID = T03.ObjectTypeID  
     AND OB.ObjectID = T03.ObjectID  
   LEFT JOIN D91T9001 D91 WITH(NOLOCK)  
    ON D91.VATTypeID = T03.VATTypeID  
   LEFT JOIN  D06T2510 D06 WITH(NOLOCK) ON T03.POID=D06.POID AND D06.[Status] IN (1,2,3,4)   
   LEFT JOIN  D05T0016 D05 WITH(NOLOCK) ON T03.SOID=D05.QuotationID  AND D05.STATUS <> ''0100000000'' AND D05.ProfessionKind=''O''  
   LEFT JOIN D04T0004 T04 WITH(NOLOCK)   
    ON T03.RPTransactionID = T04.RPTransactionID   
    AND T03.GroupID = T04.GroupID   
    AND T03.BatchID = T04.BatchID  
    AND T03.DivisionID = T04.DivisionID  
   LEFT JOIN D90T0001 D90D ON T03.DebitAccountID = D90D.AccountID  
   LEFT JOIN D90T0001 D90C ON T03.CreditAccountID = D90C.AccountID  
   WHERE  1 =0   
   '  
  
      IF @FormID = 'D95F5000' -- Load du lieu tu D95F5000  
   BEGIN   
      SET @sSQL2 ='  
   INSERT #D04P2331Grid   
       (OrdinaryNo,    ItemName,      
       AccountID,     CorAccountID,       
       OriginalAmount,    ConvertedAmount,   
             ObjectID,      ObjectTypeID,   ObjectName,   
       CurrencyID,     ExchangeRate,    Serial,      
       RefNo,       RefDate,       
       DueDate,   
            Ana01ID, Ana02ID, Ana03ID, Ana04ID, Ana05ID,   
            Ana06ID, Ana07ID, Ana08ID, Ana09ID, Ana10ID,   
            VATTypeID,      VATGroupID,    VATItemName,    
            IsOut,      VATObjectTypeID,   VATObjectID,   
       VATObjectName,          VATObjectAddress,   
       VATNo,           CipID,      
       --D02.CipNo,   
       PeriodID,      DiscountID,    PaymentMethodID,  
       Operator,      OriginalDecimal,   ExchangeRateDecimal,        
       BatchID,      RPTransactionID,   
       GroupID,      TransactionID,    LCNo,  
       CreateUserID,    CreateDate,    LastModifyUserID,   LastModifyDate,      
       POID,      SOID,  
       POVoucherNo,    SOVoucherNo,  
       BankAccountNo,      
       InventoryID,   InventoryName,  
       ProjectID,    ProjectName,    TaskID,     TaskName,  
       CashFlowID,  
       BudgetID,    BudgetName,  
       BudgetItemID,   BudgetItemName,  LockAnalysis,  
       SBatchID, STransID, STransType,  
       OBatchID, OTransID, OTransType, OVoucherNo,  
       PropertyProductID,  
       DebtManagerTypeID, DebtManagerID, DebtManagerName,  
       PContractID, PContractNo , SContractID , SContractNo,  
       CRVoucherID,  
       RefStr01, RefStr02, RefStr03, RefStr04, RefStr05,  
       RefNum01, RefNum02, RefNum03, RefNum04, RefNum05,  
       RefDate01, RefDate02, RefDate03, RefDate04, RefDate05,  
       OffAccountDebit,  
       OffAccountCredit,   
       IsInherit  
       )  
   '  
   SET @sSQL3 = '  
   SELECT  0 AS OrdinaryNo,MAX(T95.InventoryName) AS ItemName,    
      T04.AccountID AS AccountID,T04.CorAccountID AS CorAccountID,     
      SUM(T95.Amount) AS OriginalAmount,   SUM(T95.Amount) AS ConvertedAmount,   
            T95.ObjectID,     T95.ObjectTypeID,  T95.ObjectName,    
      ''VND'' AS CurrencyID,   1 AS ExchangeRate,   T95.SerialNo AS Serial,      
      T95.RefNo,      T95.RefDate,       
      NULL AS DueDate   
           --,'''' AS Ana01ID, '''' AS Ana02ID, '''' AS Ana03ID, '''' AS Ana04ID, '''' AS Ana05ID,   
           --'''' AS Ana06ID, '''' AS Ana07ID, '''' AS Ana08ID, '''' AS Ana09ID, '''' AS Ana10ID   
      ,CASE WHEN ISNULL(MAX(T1320.DefaultAna01ID), '''') = '''' THEN  CONVERT(VARCHAR(20),'''') ELSE MAX(T1320.DefaultAna01ID) END AS Ana01ID  
      ,CASE WHEN ISNULL(MAX(T1320.DefaultAna02ID), '''') = '''' THEN  CONVERT(VARCHAR(20),'''') ELSE MAX(T1320.DefaultAna02ID) END AS Ana02ID  
      ,CASE WHEN ISNULL(MAX(T1320.DefaultAna03ID), '''') = '''' THEN  CONVERT(VARCHAR(20),'''') ELSE MAX(T1320.DefaultAna03ID) END AS Ana03ID  
      ,CASE WHEN ISNULL(MAX(T1320.DefaultAna04ID), '''') = '''' THEN  CONVERT(VARCHAR(20),'''') ELSE MAX(T1320.DefaultAna04ID) END AS Ana04ID  
      ,CASE WHEN ISNULL(MAX(T1320.DefaultAna05ID), '''') = '''' THEN  CONVERT(VARCHAR(20),'''') ELSE MAX(T1320.DefaultAna05ID) END AS Ana05ID  
      ,CASE WHEN ISNULL(MAX(T1320.DefaultAna06ID), '''') = '''' THEN  CONVERT(VARCHAR(20),'''') ELSE MAX(T1320.DefaultAna06ID) END AS Ana06ID  
      ,CASE WHEN ISNULL(MAX(T1320.DefaultAna07ID), '''') = '''' THEN  CONVERT(VARCHAR(20),'''') ELSE MAX(T1320.DefaultAna07ID) END AS Ana07ID  
      ,CASE WHEN ISNULL(MAX(T1320.DefaultAna08ID), '''') = '''' THEN  CONVERT(VARCHAR(20),'''') ELSE MAX(T1320.DefaultAna08ID) END AS Ana08ID  
      ,CASE WHEN ISNULL(MAX(T1320.DefaultAna09ID), '''') = '''' THEN  CONVERT(VARCHAR(20),'''') ELSE MAX(T1320.DefaultAna09ID) END AS Ana09ID  
      ,CASE WHEN ISNULL(MAX(T1320.DefaultAna10ID), '''') = '''' THEN  CONVERT(VARCHAR(20),'''') ELSE MAX(T1320.DefaultAna10ID) END AS Ana10ID  
           ,T04.VATTypeID AS VATTypeID,    T95.VATGroupID,   MAX(T95.InventoryName) AS VATItemName,    
           ISNULL(T04.VATInOut, 0) AS IsOut,    
      T95.ObjectTypeID AS VATObjectTypeID, T95.ObjectID AS VATObjectID, T95.ObjectName AS VATObjectName,          
      T95.ObjectAddress AS VATObjectAddress,   
      T95.TaxCode AS VATNo,  '''' AS CipID,      
      --D02.CipNo,   
      '''' AS PeriodID,    '''' AS DiscountID,   MAX(T95.PaymentMethodID) AS PaymentMethodID,  
      0 AS Operator,     0 AS OriginalDecimal,  0 AS ExchangeRateDecimal,        
      '''' AS BatchID,    '''' AS RPTransactionID,   
      '''' AS GroupID,    '''' AS TransactionID,  '''' AS LCNo,  
      '''' AS CreateUserID,  NULL AS CreateDate,  '''' AS LastModifyUserID,   NULL AS LastModifyDate,      
      '''' AS POID,    '''' AS SOID,  
      '''' AS POVoucherNo,  '''' AS SOVoucherNo,  
      MAX(T95.BankAccountNo) AS BankAccountNo,      
      '''' AS InventoryID,  '''' AS InventoryName,  
      '''' AS ProjectID,   '''' AS ProjectName, '''' AS TaskID,  '''' AS TaskName,  
      '''' AS CashFlowID,  
      '''' AS BudgetID,   '''' AS BudgetName,  
      '''' AS BudgetItemID,  '''' AS BudgetItemName,  0 AS LockAnalysis,  
      '''' AS SBatchID,  '''' AS STransID, '''' AS STransType,  
      T95.VoucherID AS OBatchID,MAX(T95.TransID) AS OTransID, ''D95_InputInvoice'' AS OTransType, '''' AS OVoucherNo,  
      '''' AS PropertyProductID,  
      '''' AS DebtManagerTypeID, '''' AS DebtManagerID, '''' AS DebtManagerName,  
      '''' AS PContractID, '''' AS PContractNo, '''' AS SContractID, '''' ASSContractNo,  
      '''' AS CRVoucherID,  
      '''' AS RefStr01, '''' AS RefStr02, '''' AS RefStr03, '''' AS RefStr04, '''' AS RefStr05,  
      NULL AS RefNum01, NULL AS RefNum02, NULL AS  RefNum03, NULL AS RefNum04, NULL AS RefNum05,  
      NULL AS RefDate01, NULL AS RefDate02, NULL AS RefDate03, NULL AS RefDate04, NULL AS RefDate05,  
      CASE WHEN T04.AccountID = D90D.AccountID AND D90D.OffAccount = 1 THEN CONVERT(bit, 1) ELSE CONVERT(bit, 0) END AS OffAccountDebit,   
      CASE WHEN T04.CorAccountID = D90C.AccountID AND D90C.OffAccount = 1 THEN CONVERT(bit, 1) ELSE CONVERT(bit, 0) END AS OffAccountCredit,  
      0 AS IsInherit  
    '  
   SET @sSQL3 = @sSQL3 + N'  
   FROM  D95T5000 T95 WITH(NOLOCK)  
   LEFT JOIN (SELECT TOP 1 T21.* FROM D04T1321 T21 WITH(NOLOCK) WHERE T21.TransTypeID = '''+@TransTypeID+''' AND T21.[D_C] = '''+CASE WHEN @Source = 1 THEN 'D' ELSE 'C' END+''') T04  
     ON 1 = 1  
   LEFT JOIN D90T0001 D90D WITH(NOLOCK) ON T04.AccountID = D90D.AccountID  
   LEFT JOIN D90T0001 D90C WITH(NOLOCK) ON T04.CorAccountID = D90C.AccountID   
   LEFT JOIN (SELECT TOP 1 * FROM D04T1320 WITH(NOLOCK) WHERE TransTypeID = '''+@TransTypeID+''' ) T1320   
   ON 1 = 1  
   WHERE  CHARINDEX('';''+T95.VoucherID+'';'', '';''+'''+@OBatchID+'''+'';'') > 0  
   AND   T95.Amount <> 0  
   AND   T95.IsCreated = 0  
   GROUP BY T95.RefNo,T95.RefDate,T95.SerialNo,T95.VoucherID,T95.VatGroup,T95.ObjectTypeID,T95.ObjectName,T95.TaxCode,
	T95.ObjectAddress,T95.ObjectID,T95.VATGroupID,T95.VATRate,T04.CorAccountID,T04.AccountID,D90D.AccountID,D90C.OffAccount,D90D.OffAccount,D90C.AccountID,T04.VATTypeID,T04.VATInOut
   '  
   SET @sSQL3 = @sSQL3 + '  
   UNION ALL  
   SELECT  1 AS OrdinaryNo,  MAX(T95.InventoryName) AS ItemName,    
      T04.AccountID AS AccountID,   T04.CorAccountID AS CorAccountID,     
      SUM(T95.CVAT) AS OriginalAmount,   SUM(T95.CVAT) AS ConvertedAmount,   
         MAX(T95.ObjectID) ObjectID,     T95.ObjectTypeID,  T95.ObjectName,           
      ''VND'' AS CurrencyID,   1 AS ExchangeRate,   T95.SerialNo AS Serial,      
      T95.RefNo,      T95.RefDate,       
      NULL AS DueDate  
           --,'''' AS Ana01ID, '''' AS Ana02ID, '''' AS Ana03ID, '''' AS Ana04ID, '''' AS Ana05ID,   
           --'''' AS Ana06ID, '''' AS Ana07ID, '''' AS Ana08ID, '''' AS Ana09ID, '''' AS Ana10ID   
      ,CASE WHEN ISNULL(MAX(T1320.DefaultAna01ID), '''') = '''' THEN  CONVERT(VARCHAR(20),'''') ELSE MAX(T1320.DefaultAna01ID) END AS Ana01ID  
      ,CASE WHEN ISNULL(MAX(T1320.DefaultAna02ID), '''') = '''' THEN  CONVERT(VARCHAR(20),'''') ELSE MAX(T1320.DefaultAna02ID) END AS Ana02ID  
      ,CASE WHEN ISNULL(MAX(T1320.DefaultAna03ID), '''') = '''' THEN  CONVERT(VARCHAR(20),'''') ELSE MAX(T1320.DefaultAna03ID) END AS Ana03ID  
      ,CASE WHEN ISNULL(MAX(T1320.DefaultAna04ID), '''') = '''' THEN  CONVERT(VARCHAR(20),'''') ELSE MAX(T1320.DefaultAna04ID) END AS Ana04ID  
      ,CASE WHEN ISNULL(MAX(T1320.DefaultAna05ID), '''') = '''' THEN  CONVERT(VARCHAR(20),'''') ELSE MAX(T1320.DefaultAna05ID) END AS Ana05ID  
      ,CASE WHEN ISNULL(MAX(T1320.DefaultAna06ID), '''') = '''' THEN  CONVERT(VARCHAR(20),'''') ELSE MAX(T1320.DefaultAna06ID) END AS Ana06ID  
      ,CASE WHEN ISNULL(MAX(T1320.DefaultAna07ID), '''') = '''' THEN  CONVERT(VARCHAR(20),'''') ELSE MAX(T1320.DefaultAna07ID) END AS Ana07ID  
      ,CASE WHEN ISNULL(MAX(T1320.DefaultAna08ID), '''') = '''' THEN  CONVERT(VARCHAR(20),'''') ELSE MAX(T1320.DefaultAna08ID) END AS Ana08ID  
      ,CASE WHEN ISNULL(MAX(T1320.DefaultAna09ID), '''') = '''' THEN  CONVERT(VARCHAR(20),'''') ELSE MAX(T1320.DefaultAna09ID) END AS Ana09ID  
      ,CASE WHEN ISNULL(MAX(T1320.DefaultAna10ID), '''') = '''' THEN  CONVERT(VARCHAR(20),'''') ELSE MAX(T1320.DefaultAna10ID) END AS Ana10ID  
  
           ,T04.VATTypeID AS VATTypeID,MAX(T95.VATGroupID), MAX(T95.InventoryName) AS VATItemName,    
           ISNULL(T04.VATInOut, 0) AS IsOut,    
      MAX(T95.ObjectTypeID) AS VATObjectTypeID,MAX(T95.ObjectID) AS VATObjectID,MAX(T95.ObjectName) AS VATObjectName,       
	  T95.ObjectAddress AS VATObjectAddress,   
      T95.TaxCode AS VATNo,  '''' AS CipID,      
      --D02.CipNo,   
      '''' AS PeriodID,    '''' AS DiscountID, MAX(T95.PaymentMethodID) PaymentMethodID,  
      0 AS Operator,     0 AS OriginalDecimal,  0 AS ExchangeRateDecimal,        
      '''' AS BatchID,    '''' AS RPTransactionID,   
      '''' AS GroupID,    '''' AS TransactionID,  '''' AS LCNo,  
      '''' AS CreateUserID,  NULL AS CreateDate,  '''' AS LastModifyUserID,   NULL AS LastModifyDate,      
      '''' AS POID,    '''' AS SOID,  
      '''' AS POVoucherNo,  '''' AS SOVoucherNo,  
      MAX(T95.BankAccountNo) BankAccountNo,      
      '''' AS InventoryID,  '''' AS InventoryName,  
      '''' AS ProjectID,   '''' AS ProjectName, '''' AS TaskID,  '''' AS TaskName,  
      '''' AS CashFlowID,  
      '''' AS BudgetID,   '''' AS BudgetName,  
      '''' AS BudgetItemID,  '''' AS BudgetItemName,  0 AS LockAnalysis,  
      '''' AS SBatchID,  '''' AS STransID, '''' AS STransType,  
      T95.VoucherID AS OBatchID,MAX(T95.TransID) AS OTransID, ''D95_InputInvoice'' AS OTransType, '''' AS OVoucherNo,  
      '''' AS PropertyProductID,  
      '''' AS DebtManagerTypeID, '''' AS DebtManagerID, '''' AS DebtManagerName,  
      '''' AS PContractID, '''' AS PContractNo, '''' AS SContractID, '''' AS SContractNo,  
      '''' AS CRVoucherID,  
      '''' AS RefStr01, '''' AS RefStr02, '''' AS RefStr03, '''' AS RefStr04, '''' AS RefStr05,  
      NULL AS RefNum01, NULL AS RefNum02, NULL AS RefNum03, NULL AS RefNum04, NULL AS RefNum05,  
      NULL AS RefDate01, NULL AS RefDate02, NULL AS RefDate03, NULL AS RefDate04, NULL AS RefDate05,  
      CASE WHEN T04.AccountID = D90D.AccountID AND D90D.OffAccount = 1 THEN CONVERT(bit, 1) ELSE CONVERT(bit, 0) END AS OffAccountDebit,   
      CASE WHEN T04.CorAccountID = D90C.AccountID AND D90C.OffAccount = 1 THEN CONVERT(bit, 1) ELSE CONVERT(bit, 0) END AS OffAccountCredit,  
      0 AS IsInherit  
   FROM  D95T5000 T95 WITH(NOLOCK)  
   LEFT JOIN (SELECT TOP 1 T21.* FROM D04T1321 T21 WITH(NOLOCK) WHERE T21.TransTypeID = '''+@TransTypeID+''' AND T21.[D_C] = '''+CASE WHEN @Source = 1 THEN 'D' ELSE 'C' END+''') T04  
     ON 1 = 1  
   LEFT JOIN D90T0001 D90D WITH(NOLOCK) ON T04.AccountID = D90D.AccountID  
   LEFT JOIN D90T0001 D90C WITH(NOLOCK) ON T04.CorAccountID = D90C.AccountID    
   LEFT JOIN (SELECT TOP 1 * FROM D04T1320 WITH(NOLOCK) WHERE TransTypeID = '''+@TransTypeID+''' ) T1320   
   ON 1 = 1  
   WHERE  CHARINDEX('';''+T95.VoucherID+'';'', '';''+'''+@OBatchID+'''+'';'') > 0  
   AND T95.CVAT <> 0  
   AND   T95.IsCreated = 0  
   GROUP BY T95.RefNo,T95.RefDate,T95.SerialNo,T95.VoucherID,T95.VatGroup,T95.ObjectTypeID,T95.ObjectName,T95.TaxCode,
	T95.ObjectAddress,T95.ObjectID,T95.VATGroupID,T95.VATRate,T04.CorAccountID,T04.AccountID,D90D.AccountID,D90C.OffAccount,D90D.OffAccount,D90C.AccountID,T04.VATTypeID,T04.VATInOut
     
   IF EXISTS ( SELECT 1 FROM D91T9130 WITH(NOLOCK) WHERE Customize = ''UseModeTHF'' AND Value = 1 )  --- Han fix dac thu tai khoan dong thue cho THF do chua co thiet lap 2026/02/12  
   BEGIN  
    UPDATE #D04P2331Grid  
    SET  AccountID = ''13311''  
    WHERE OrdinaryNo = 1  
   END    
  
   UPDATE  T1  
   SET   T1.ObjectID = CASE WHEN ISNULL(T1.ObjectID, '''') = '''' THEN Ob.ObjectID ELSE T1.ObjectID END   
      , T1.ObjectTypeID = CASE WHEN ISNULL(T1.ObjectTypeID, '''') = '''' THEN Ob.ObjectTypeID ELSE T1.ObjectTypeID END    
      , T1.ObjectName = CASE WHEN ISNULL(T1.ObjectName, '''') = '''' THEN Ob.ObjectNameU ELSE T1.ObjectName END   
        
   FROM  #D04P2331Grid  T1  
   INNER JOIN Object Ob WITH(NOLOCK)  
   ON   T1.VATNo = Ob.VATNo  
   WHERE  Ob.Disabled = 0  
   AND   (ISNULL(T1.ObjectID, '''') = '''' OR ISNULL(T1.ObjectTypeID, '''') = '''')  
  
  
   UPDATE  T1  
   SET   T1.ObjectTypeID = Ob.ObjectTypeID        
   FROM  #D04P2331Grid  T1  
   INNER JOIN Object Ob WITH(NOLOCK)  
   ON   T1.VATNo = Ob.VATNo  
   AND   T1.ObjectID = Ob.ObjectID  
   WHERE  Ob.Disabled = 0  
   AND   (ISNULL(T1.ObjectID, '''') = '''' OR ISNULL(T1.ObjectTypeID, '''') = '''')  
  
   UPDATE  T1  
   SET   T1.VATObjectID = CASE WHEN ISNULL(T1.ObjectID, '''') = '''' THEN Ob.ObjectID ELSE T1.VATObjectID END   
      , T1.VATObjectTypeID = CASE WHEN ISNULL(T1.ObjectTypeID, '''') = '''' THEN Ob.ObjectTypeID ELSE T1.VATObjectTypeID END    
      , T1.VATObjectName = CASE WHEN ISNULL(T1.ObjectName, '''') = '''' THEN Ob.ObjectNameU ELSE T1.VATObjectName END  
   FROM  #D04P2331Grid  T1  
   INNER JOIN Object Ob WITH(NOLOCK)  
   ON   T1.VATNo = Ob.VATNo  
   WHERE  Ob.Disabled = 0  
   AND   (ISNULL(T1.VATObjectID, '''') = '''' OR ISNULL(T1.VATObjectTypeID, '''') = '''')   
  
   UPDATE  T1  
   SET   T1.VATObjectTypeID = Ob.ObjectTypeID  
   FROM  #D04P2331Grid  T1  
   INNER JOIN Object Ob WITH(NOLOCK)  
   ON   T1.VATNo = Ob.VATNo  
   AND   T1.VATObjectID = Ob.ObjectID  
   WHERE  Ob.Disabled = 0  
   AND   (ISNULL(T1.VATObjectID, '''') = '''' OR ISNULL(T1.VATObjectTypeID, '''') = '''')   
      
  
   SELECT  *   
   FROM  #D04P2331Grid   
   ORDER BY OBatchID, OTransID, OrdinaryNo  
   '  
   END  
     --print (@sSQL1+@sSQL2+ @sSQL3)  
     EXEC(@sSQL1+@sSQL2+@sSQL3)  
 END -- Load du lieu luoi 1, luoi 2  
--EXEC(@sSQL)  
--PRINT(@sSQL)  
  
  
  
  
  
  
  
  
