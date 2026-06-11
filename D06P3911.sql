  
  
  
  
  
  
  
  
  
  
  
  
-- <Summary>  
---- Load du lieu cho man hinh nhap lieu sau khi chon thuc hien don hang  
-- <Param>  
----   
-- <Return>  
----   
-- <Reference>  
-- Module D06  
---- Nghiep vu \ Nhan hang truoc \ Ke thua don hang \ Chon  
-- <History>  
---- Create on 10/12/2007 by Nguyen Duc Lam  
----   
---- Modified on 21/12/2007 by Nguyen Thi Lan Huong: sua cach tinh OAmount, CAmount  
---- Modified on 06/05/2008 by Nguyen Thi Lan Huong: them LocationNo2   
---- Modified on 24/06/2008 by Nguyen Thi Lan Huong: Tinh mac dinh Don gia va Thanh tien, trong truong hop  FromD37LR = 1  
---- Modified on 17/07/2008 by Nguyen Thi Lan Huong: Them truong LimitDate  
---- Modified on 25/09/2008 by Nguyen Thi Lan Huong: Order by theo thu tu Lo da chon  
---- Modified on 20/01/2009 by Nguyen Thi Lan Huong: sua lai cach ket theo Ordernum - > loi  
---- Modified on 14/04/2009 by Nguyen Xuan Tien: chinh sua '' as LocationNo thanh A.LocationNo  
---- Modified on 09/10/2009 by Nguyen Xuan Tien: chinh sua tinh thanh tien NT va QD khi chon DDH  
---- Modified on 20/11/2009 by Nguyen Xuan Tien: bo sung them tham so @FromD07RR de lay du lieu tra ve khi chon YC nhap kho tu cho don hang  
---- Modified on 22/07/2011 by Nguyen Xuan Tien: Bo sung them ProDate  
---- Modified on 08/12/2011 by Do Trang Nguyen: Bo sung them 30 truong thong bo sung.  
---- Modified on 31/07/2012 by Le Thi Ni: bo sung truong hop don hang dieu chinh KH Du lich bay(ID 50326)  
---- Modified on 14/08/2012 by Nguyen Xuan Tien: Bo sung xoa bang tam D06T3900   
---- Modified on 24/08/2012 by Hoang Ngu: Chuyen Unicode  
---- Modified on 06/09/2012 by Le Thi Ni: Fix loi ko co truong Flag  
---- Modified on 24/10/2012 by Le Thi Ni: Bo sung ProjectID, ProjectName (ID 47354)  
---- Modified on 31/10/2012 by Le Thi Ni: Bo sung cot Ghi giam doanh so (IsDecrease) (ID 51613)  
---- Modified on 20/11/2012 by Le Thi Ni: neu Don hang tu D54 chuyen sang thi lay OInventoryName theo Don hang. Bo sung Load Hang muc. (ID 52632)  
---- Modified on 27/11/2012 by Le Thi Ni: chuyen kieu Tinyint cua IsDecrease thanh kieu Bit (ID 46290)  
---- Modified on 27/11/2012 by Le Thi Ni: bo sung Loai nghiep vu (ID 52229)  
---- Modified on 12/12/2012 by Phuong Thao: bo sung cac truong: PaymentTermID, DueDate, VoucherDesc (ID 52532)  
---- Modified on 14/03/2013 by Hoang Ngu: bo sung PricebyCQuantity (ID 53395)  
---- Modified on 12/04/2013 by Le Thi Ni: bo sung chon tu phieu Yeu cau nhap kho (ID 55601)  
---- Modified on 22/04/2013 by Le Thi Ni: Xu ly khi thiet lap cua mat hang la theo gia tri (ID 53780)  
---- Modified on 08/05/2013 by Le Thi Ni: Don gia theo DVT chuan theo thiet lap PricebyCQuantity cua mat hang, khong theo LNV (ID 56145)  
---- Modified on 15/05/2013 by Le Thi Ni: Bo sung lay len VATOAmount va VATCAmount la tien thue cua PO. Neu hoa don thuc hien het gia tri cua PO 1 lan (OAmount = OPOAmount) thi tien thue HD = tien thue PO (ID 56419)  
---- Modified on 30/05/2013 by Le Thi Ni: Lay don gia = don gia PO neu SL = SL PO va Thanh tien = Thanh tien PO (ID 56964)  
---- Modified on 14/06/2013 by Le Thi Ni: Fix loi don gia bi sai khi mat hang lap theo gia tri va so luong (ID 57361)  
---- Modified on 07/10/2013 by HIEN DUY: Khong xoa bang tam D06T3900 dung khi chon lai don hang (ID 60143)  
---- Modified on 18/10/2013 by HIEN DUY: Chi xoa bang tam o mode ke thua (ID 59717)  
---- Modified on 07/11/2013 by LETHINI: Lay TK no theo Loai nghiep vu, truong hop Kiem ke dinh ky (ID 60898)  
---- Modified on 23/12/2013 by LETHINI: Lay nhom thue PO (ID 62243)  
---- Modified on 10/02/2014 by Hien Duy: Bo sung bien @POAdjustQtyAmt (ID 63010)  
---- Modified on 25/02/2014 by LETHINI: Mac dinh TK mua hang theo PP kiem ke dinh ky (ID 63505)  
---- Modified on 28/02/2014 by Hien Duy: Sua lai cach tinh Thanh tien quy doi(ID 63475)  
---- Modified on 11/03/2014 by Hien Duy: Bo sung ngan sach (ID 63669)  
---- Modified on 21/03/2014 by Hien Duy: Bo sung lam tron NT, DG, QD (ID 64163)  
---- Modified on 07/05/2014 by Hien Duy: Bo sung STT don hang POOrderNum (ID 63897)  
---- Modified on 31/07/2014 by Hien Duy: Bo sung thue nha thau (ID 65860)  
---- Modified on 22/09/2014 by Bao Lam : Bo sung PODetailID (ID 67920)  
---- Modified on 21/01/2015 by Truong An : Bo sung SOVoucherNo (ID 71778)  
---- Modified on 01/06/2015 by Hien Duy : Bo sung @BatchID va chinh sua cach tinh don gia thanh tien (ID 76064)  
---- Modified on 05/01/2015 by Tuan Anh : Bo sung OBatchID,OTransID, OTransType (ID 83245)  
---- Modified on 07/01/2016 by Nguyen Xuan Tien: Bo sung Ngay het han theo Lo (ID 83580)  
---- Modified on 03/06/2016 by Minh Tai: bo sung IsVAT  
---- Modified on 08/08/2016 by Minh Tai: Bo sung cot YCMH (ID 84709)  
---- Modified on 13/09/2016 by Minh Tai: Sua loi khong su dung thue GTGT (ID 91134)  
---- Modified on 07/12/2016 by Hong Tram: Bo sung truong WareHouseID (ID 93272)  
---- Modified on 03/01/2018 by Minh Tai: sua loi fix du As, thieu dau  
---- Modified on 08/01/2018 by Anh Nga(104969): Lay dien giai PO lam dien giai phieu  
---- Modified on 03/07/2018 by Nhu Dat(108978): Fix loi SUBTRING du lieu null  
---- Modified on 05/11/2018 by TUYETMY (113525): Bo sung Orderby theo InventoryID  
---- Modified on 30/11/2021 by LEDAT (195032): Bo sung tra ra 10 cot Lcode  
---- Modified on 10/03/2022 by MYLAI (220397): Mot lo nhieu ma hang  
---- Modified on 16/05/2022 by HOAILAM (214987): Bo sung IsLockPromotion, IsPromotion  
---- Modified on 07/07/2022 by TRITHONG (242756): BO SUNG IsLocation  
---- Modified on 11/10/2022 by KIEUOANH (247895): Bo sung gia tri cot Don hang ban  
---- Modified on 07/11/2022 by TANCUONG (249268): Bo sung IsNotEditUnitPrice: khong sua don gia khi lap phieu nhan hang tu Don dat hang  
---- Modified on 16/01/2023 by HOAILAM (252585): Bo sung mac dinh tai khoan no theo khoan muc cua PO doi voi ma hang dich vu  
---- Modified on 23/02/2023 by HATHY (255334): Bo sung CreditAccountID  
---- Modified on 17/03/2023 by MYLAI (254239): Bo sung CipID, CipNo  
---- Modified on 14/04/2023 by MYLAI (255647): Sua loi load khong dung thu tu nhu man hinh tach lo D06F3914    
---- Modified on 18/04/2023 by HONGTHANH (255675): Bo sung mac dinh TK no, TK co khi chon du lieu tu don hang  
---- Modified on 11/05/2023 by MYLAI(256150): Bo sung mac dinh TK No theo loai nghiep vu  
---- Modified on 18/05/2023 by HOAILAM (254160): Chinh sua mac dinh tai khoan No theo khoan muc  
---- Modified on 22/05/2023 by HOAILAM: Bo sung them dieu kien khi update DebitAccountID, update khi du lieu Account <> ''''   
---- Modified on 26/05/2023 by HONGTHANH(257257): Bo sung DocNoMaster so chung tu, SOID  
---- Modified on 10/06/2023 by TRUNGKIEN (257290): Bo sung tra RefCode - Ma tham chieu  
---- Modified on 28/06/2023 by HOAILAM (257722): Bo sung mac dinh tap phi theo LNV khi tao HDVT, NHT tu PO va PO co PeriodID = ''  
---- Modified on 28/07/2023 by KIEUOANH (261253): Sua loi sap xep theo thu tu chon  
---- Modified on 18/06/2024 by TRUONGGIANG (280245): Bo sung them ProductName, ProductShortName  
---- Modified on 19/07/2024 by TRUONGGIANG (279061): Bo sung load VoucherDesc master (Description master + _ + So PO) khi LNV POIsDesc = 3  
---- Modified on 21/03/2025 by DUCTIN (295614): Mac dinh khoan muc cho man hinh nhan hang cung hoa don  
---- Modified on 25/09/2025 by TIENHUNG (302752): Fix loi insert gia tri null Ana01ID -> Ana10ID  
---- Modified on 19/12/2025 by HOAILAM (304652): Bo sung ConversionLot  
---- Modified on 27/07/2026 by QUANGHOANG(305001): Bo sung ShortName  
-- <Example>  
---- exec D06P3911 'lemonadmin',1,1  
---- Exec D06P3911 'LEMONADMIN', 0, 1, 'NHTKCBT'  
  
CREATE PROCEDURE D06P3911  
(   
   @UserID   VARCHAR(20),  
   @FromD07RR  TINYINT = 0,  
   @CodeTable  TINYINT=0,  
   @TransTypeID VARCHAR(50) = '',  
   @BatchID  VARCHAR(50) = '',  
   @InputInvoiceID VARCHAR(50) = '',  
   @FormID   VARCHAR(50) = ''  
)   
AS   
SET NOCOUNT ON   
  
DECLARE @U VARCHAR(1)  
SET @U = CASE WHEN @CodeTable=0 THEN '' ELSE 'U' END  
  
DECLARE @BusinessType VARCHAR(50), @SQL1 VARCHAR(8000),   
  @SQL2 VARCHAR(8000),   
  @SQL3 VARCHAR(8000),   
  @SQL4 VARCHAR(8000),  
  @SQL5 VARCHAR(8000),  
  @PriceOnDefaultUnit TINYINT,  
  @InventoryMethod TINYINT,   
  @InvDebitAcc VARCHAR(20),  
  @POAdjustQtyAmt TINYINT,  
  @InvDebitAccDef TINYINT,  
  @HaveImpTax TINYINT,  
  @HaveSpecTax TINYINT,  
  @D90_ConvertedDecimals TINYINT,  
  @IsInherit TINYINT,  
  @POIsDesc TINYINT,  
  @IsSplitLotByPOVoucher TINYINT,  
  @IsDetailLocationInfo TINYINT,  
  @IsVAT TINYINT,  
  @IsSaveLotManyInv TINYINT,  
  @IsUsePOAdjustApproval TINYINT = 0,  
  @PayCreditAccDef VARCHAR(20) = '',  
  @PayCreditAcc VARCHAR(20) = '',  
  @IsUseLinkAccKCode TINYINT = 0,  
  @TransactionID VARCHAR(20) = '',  
  @ReceivedTypeID VARCHAR(20) = '',  
  @DefaultPeriodID VARCHAR(50) = ''  
  
SELECT  @IsUsePOAdjustApproval = IsUsePOAdjApprovalProcess  
FROM  D06T0000 WITH(NOLOCK)  
  
  
SELECT @BusinessType = ISNULL(BusinessType, ''),  
  @D90_ConvertedDecimals = ISNULL(D90_ConvertedDecimals,0)  
FROM D91T0025 WITH(NOLOCK)  
  
---- Modified on 21/03/2014 by Hien Duy: Bo sung lam tron NT, DG, QD (ID 64163)  
SET @D90_ConvertedDecimals = ISNULL(@D90_ConvertedDecimals,0)  
  
SELECT @PriceOnDefaultUnit = ISNULL(PriceOnDefaultUnit, 0),  
  @InvDebitAcc = ISNULL(InvDebitAcc, ''),  
  @InvDebitAccDef = ISNULL(InvDebitAccDef, 0),  
  @HaveImpTax = ISNULL(HaveImpTax,0),  
  @HaveSpecTax = ISNULL(HaveSpecTax,0),  
  @POIsDesc = ISNULL(POIsDesc,0),  
  @IsVAT = ISNULL(IsVAT,0),  
  @PayCreditAccDef = PayCreditAccDef,  
  @PayCreditAcc = PayCreditAcc,  
  @TransactionID = TransactionID,  
  @ReceivedTypeID = ReceivedTypeID,  
  @DefaultPeriodID = CASE WHEN IsUseCostCenter = 1 THEN DefaultPeriodID ELSE '' END  
FROM D06T1010 WITH(NOLOCK)  
WHERE TransTypeID = @TransTypeID  
  
SELECT @PriceOnDefaultUnit = ISNULL(@PriceOnDefaultUnit, 0),  
  @InvDebitAcc = ISNULL(@InvDebitAcc, ''),  
  @InvDebitAccDef = ISNULL(@InvDebitAccDef, 0),  
  @POIsDesc = ISNULL(@POIsDesc, 0),  
  @DefaultPeriodID = ISNULL(@DefaultPeriodID,'')  
  
SELECT @InventoryMethod = InventoryMethod,  
  @IsDetailLocationInfo = IsDetailLocationInfo,  
  @IsSaveLotManyInv = ISNULL(IsSaveLotManyInv,0)  
FROM D07T0000 WITH(NOLOCK)  
  
SELECT @POAdjustQtyAmt = ISNULL(POAdjustQtyAmt,0),  
  @IsSplitLotByPOVoucher = ISNULL(@IsSplitLotByPOVoucher,0)  
FROM D06T0000 WITH(NOLOCK)  
  
SELECT TOP 1 @IsInherit = IsInherit  
FROM D06T3900 WITH(NOLOCK)   
WHERE HostName = HOST_NAME()   
  AND UserID = @UserID  
  
SET @IsInherit = ISNULL(@IsInherit,0)  
SET @IsSplitLotByPOVoucher = ISNULL(@IsSplitLotByPOVoucher,0)  
SET @IsDetailLocationInfo = ISNULL(@IsDetailLocationInfo,0)  
  
SET @SQL1 = ''  
SET @SQL2 = ''  
SET @SQL3 = ''  
SET @SQL4 = ''  
  
---- Bang tam luu cac khoan muc lien ket voi tai khoan  
SELECT  DISTINCT RIGHT(D91.AnaCategoryID,2) AS Code  
INTO  #LinkAcc  
FROM  D91T0050 D91 WITH(NOLOCK)  
LEFT JOIN D90T0016 D90 WITH(NOLOCK)  
 ON  D90.CheckTypeID = D91.AnaCategoryID  
WHERE  D91.System = 1 AND D91.AnaTypeID = 'K' AND D91.IsMappingAccount = 1  
  
SELECT @TransactionID = ISNULL(@TransactionID,''), @ReceivedTypeID = ISNULL(@ReceivedTypeID,'')  
  
---- Ap dung cho quy trinh  
---- Hoa don ve truoc TransactionID = 02  
---- Nhan hang truoc co hinh thuc nhan hang la Chuyen thang san xuat: TransactionID = 04 and ReceivedTypeID = 04  
SELECT TOP 1 @IsUseLinkAccKCode = 1  
FROM #LinkAcc  
WHERE (@TransactionID IN ('02','04')  
  AND EXISTS (SELECT TOP 1 1 FROM D06T3900 T3900 WITH(NOLOCK) INNER JOIN D07T0002 T0002 WITH(NOLOCK) ON T0002.InventoryID = T3900.InventoryID  
     WHERE T3900.UserID = @UserID AND T3900.HostName = HOST_NAME() AND T0002.IsService = 1))  
  OR (@TransactionID = '04' AND @ReceivedTypeID ='04')  
  
SET @IsUseLinkAccKCode = ISNULL(@IsUseLinkAccKCode,0)  
  
  
IF(@FormID = 'D95F5000')  
BEGIN  
 EXEC D06P3811 @UserID, @TransTypeID, @FormID, @InputInvoiceID    
 RETURN;  
END  
  
IF EXISTS (SELECT TOP 1 1 FROM D06T3900 WHERE HostName = Host_Name() AND UserID = @UserID AND FromD37LR = 1)  
BEGIN -- Du lieu duoc lay tu Yeu cau nhap lo cua D37  
 IF @IsUseLinkAccKCode = 1  
 BEGIN  
  SET @SQL1 = N'  
  SELECT  ROW_NUMBER() OVER(PARTITION BY ' + STUFF((SELECT ',T0303.K' + Code + 'ID' FROM #LinkAcc FOR XML PATH ('')), 1, 1, '')  
       + ' ORDER BY T0303.AccountID) AS OrderNo,  
     T0303.AccountID, T0303.DivisionID,  
     T0303.K01ID, T0303.K02ID, T0303.K03ID, T0303.K04ID, T0303.K05ID, T0303.K06ID, T0303.K07ID, T0303.K08ID, T0303.K09ID, T0303.K10ID  
  INTO  #MappingK_Acc  
  FROM  D90T0303 T0303 WITH(NOLOCK)  
  WHERE  T0303.AccountID <> ''''  
  '      
 END  
  
 SET @SQL1 = @SQL1 +  
 N'  
 SELECT  A.UnitPrice,  
    A.HostName, A.UserID, A.POID, A.POItemID,   
    A.IsInherit, A.ObjectTypeID, A.ObjectID,   
    A.CurrencyID, A.ExchangeRate, A.OrderNum,   
    D37.InventoryID,   
    D37.Spec01ID, D37.Spec02ID, D37.Spec03ID, D37.Spec04ID, D37.Spec05ID,   
    D37.Spec06ID, D37.Spec07ID, D37.Spec08ID, D37.Spec09ID, D37.Spec10ID,   
    A.InventoryName, D37.UnitID,   
    D37.OQuantity, D37.CQuantity,   
    CONVERT (decimal(28,8), A.UnitPrice) AS UnitPrice,  
    CASE WHEN ISNULL(B.PricebyCQuantity,0) = 0 THEN   
     CONVERT (decimal(28,8), D37.OQuantity * A.UnitPrice)  
    ELSE CONVERT (decimal(28,8), D37.CQuantity * A.UnitPrice)  
    END AS OAmount,   
    CASE WHEN ISNULL(B.PricebyCQuantity,0) = 0 THEN   
     CONVERT (decimal(28,8), D37.OQuantity * A.UnitPrice * A.ExchangeRate)   
    ELSE CONVERT (decimal(28,8), D37.CQuantity * A.UnitPrice * A.ExchangeRate)   
    END AS CAmount,  
    A.OPOAmount,   
    A.CPOAmount,   
    A.OPORealizedAmount,   
    A.CPORealizedAmount,   
    A.OPORemainAmount,   
    A.CPORemainAmount,   
    A.ConversionFactor,   
    A.Volume, A.Weight, A.SpecialFee, A.IsService,   
    A.ImpRateTax, A.SpcRateTax, A.VATGroupID, ISNULL(A.VATRateTax,0) AS VATRateTax, A.AccountID,   
    A.MPSVoucherID, A.MPSVoucherNo, A.ProOrderID, A.ProOrderNo,   
    ISNULL(A.Ana01ID, '''') AS Ana01ID, ISNULL(A.Ana02ID, '''') AS Ana02ID, ISNULL(A.Ana03ID, '''') AS Ana03ID, ISNULL(A.Ana04ID, '''') AS Ana04ID, ISNULL(A.Ana05ID, '''') AS Ana05ID,   
    ISNULL(A.Ana06ID, '''') AS Ana06ID, ISNULL(A.Ana07ID, '''') AS Ana07ID, ISNULL(A.Ana08ID, '''') AS Ana08ID, ISNULL(A.Ana09ID, '''') AS Ana09ID, ISNULL(A.Ana10ID, '''') AS Ana10ID,   
    Convert(int, A.Flag) As Flag, A.FormulaID, A.Formula,   
    A.Num01, A.Num02, A.Num03, A.Num04, A.Num05,   
    A.Num06, A.Num07, A.Num08, A.Num09, A.Num10,   
    A.PaymentMethodID, A.PaymentTermID, A.TransDesc, A.LocationNo,  
    A.DeliveryID , A.LCNo,  
    A.VRef1, A.VRef2, A.VRef3, A.VRef4, A.VRef5,   
    A.NRef1, A.NRef2, A.NRef3, A.NRef4, A.NRef5,   
    A.POVoucherNo, A.DRef1, A.DRef2, A.DRef3, A.DRef4, A.DRef5,   
    CASE WHEN A.PeriodID <> '''' THEN A.PeriodID ELSE ''' + @DefaultPeriodID + ''' END AS PeriodID, A.ProductID  
    ,Convert(nvarchar(500), '''') AS ProductName  
    ,Convert(nvarchar(500), '''') AS ProductShortName,    
    B.InventoryName'+@U+' AS OInventoryName,   
    CONVERT(NVARCHAR(500), '''') AS Spec01Name,  
    CONVERT(NVARCHAR(500), '''') AS Spec02Name,  
    CONVERT(NVARCHAR(500), '''') AS Spec03Name,  
    CONVERT(NVARCHAR(500), '''') AS Spec04Name,  
    CONVERT(NVARCHAR(500), '''') AS Spec05Name,  
    CONVERT(NVARCHAR(500), '''') AS Spec06Name,  
    CONVERT(NVARCHAR(500), '''') AS Spec07Name,  
    CONVERT(NVARCHAR(500), '''') AS Spec08Name,  
    CONVERT(NVARCHAR(500), '''') AS Spec09Name,  
    CONVERT(NVARCHAR(500), '''') AS Spec10Name,   
    D37.LRGroupID,  A.UseConversionFormula, A.ConversionFormula,  
    D37.LocationNo2 AS LocationNo,A.LimitDate,  
    A.Tolerance,  
    A.MDITransID,   
    A.MDIVoucherNo,  
    A.ProDate,  
    A.OTransType,  
    A.POID AS OBatchID,  
    A.POItemID AS OTransID,  
    '  
 SET @SQL2=N'  
    ------------BO SUNG THEM 30 TRUONG THONG TIN BO SUNG   
    ISNULL(A.MStr01,'''') AS MStr01,ISNULL(A.MStr02,'''') AS MStr02, ISNULL(A.MStr03,'''') AS MStr03,ISNULL(A.MStr04,'''') AS MStr04,ISNULL(A.MStr05,'''') AS MStr05,  
    ISNULL(A.MStr06,'''') AS MStr06,ISNULL(A.MStr07,'''') AS MStr07, ISNULL(A.MStr08,'''') AS MStr08,ISNULL(A.MStr09,'''') AS MStr09,ISNULL(A.MStr10,'''') AS MStr10,  
    ISNULL(A.MNum01,0) AS MNum01,ISNULL(A.MNum02,0) AS MNum02,ISNULL(A.MNum03,0) AS MNum03,ISNULL(A.MNum04,0) AS MNum04,ISNULL(A.MNum05,0) AS MNum05,  
    ISNULL(A.MNum06,0) AS MNum06,ISNULL(A.MNum07,0) AS MNum07,ISNULL(A.MNum08,0) AS MNum08,ISNULL(A.MNum09,0) AS MNum09,ISNULL(A.MNum10,0) AS MNum10,  
    ISNULL(A.MDat01,NULL) AS MDat01,ISNULL(A.MDat02,NULL) AS MDat02,ISNULL(A.MDat03,NULL) AS MDat03,ISNULL(A.MDat04,NULL) AS MDat04,ISNULL(A.MDat05,NULL) AS MDat05,  
    ISNULL(A.MDat06,NULL) AS MDat06,ISNULL(A.MDat07,NULL) AS MDat07,ISNULL(A.MDat08,NULL) AS MDat08,ISNULL(A.MDat09,NULL) AS MDat09,ISNULL(A.MDat10,NULL) AS MDat10,  
    A.ConversionFactor as CFactor,'  
    + CASE WHEN @IsUseLinkAccKCode = 1 THEN 'CASE WHEN (T0002.IsService = 1 OR (''' + @TransactionID + ''' = ''04'' AND ''' + @ReceivedTypeID + ''' = ''04'')) AND ISNULL(T0303.AccountID,'''') <> '''' THEN T0303.AccountID ELSE A.AccountID END AS DebitAcco
untID,'  
     ELSE 'A.AccountID AS DebitAccountID' END + '  
    CONVERT(VARCHAR(50), '''') As ProjectID, CONVERT(NVARCHAR(250), '''') As ProjectName,  
    CONVERT(Bit, 0) As IsDecrease,  
    CONVERT(VARCHAR(50), '''') As TaskID, CONVERT(NVARCHAR(250), '''') As TaskName,  
    CONVERT(VARCHAR(50), '''') As PaymentTermID,  
    CONVERT(DATETIME, NULL) As DueDate,  
    CONVERT(NVARCHAR(1000), '''') As VoucherDesc,  
    ISNULL(B.PricebyCQuantity,0) as PricebyCQuantity,  
    '+CASE WHEN @IsVAT = 1 THEN 'A.VATRateTax * A.OPORemainAmount' ELSE 'Convert(Decimal(28,8),0)' END+' As VATOAmount,  
    '+CASE WHEN @IsVAT = 1 THEN 'A.VATRateTax * A.OPORemainAmount * A.ExchangeRate' ELSE 'Convert(Decimal(28,8),0)' END+' As VATCAmount,  
    A.VATGroupID As POVATGroupID,  
    ISNULL(A.UnitPrice, 0) As POUnitPrice, ISNULL(A.OPOAmount, 0) As POOAmount,  
    ISNULL(B.ByValues, 0) As ByValues,  
    CONVERT(VARCHAR(50),'''') AS PRVoucherNo, CONVERT(NVARCHAR(250),'''') AS RequestorName, A.WareHouseID,  
    A.LCode01ID,A.LCode02ID,A.LCode03ID,A.LCode04ID,A.LCode05ID,  
    A.LCode06ID,A.LCode07ID,A.LCode08ID,A.LCode09ID,A.LCode10ID ,B.IsLocation  
 INTO  #D06P3911_D06T3900  
 FROM   D06T3900 A WITH(NOLOCK)   
 INNER JOIN (  
    SELECT   POID, POTransID, LRGroupID, Min(OrderNum) as OrderNum,  
       InventoryID,   
       Spec01ID, Spec02ID, Spec03ID, Spec04ID, Spec05ID,   
       Spec06ID, Spec07ID, Spec08ID, Spec09ID, Spec10ID,   
       UnitID,   
       SUM(OQuantity) AS OQuantity,   
       SUM(CQuantity) AS CQuantity,   
       LocationNo2  
    FROM   D37T2216 WITH(NOLOCK)  
    WHERE  UserID = '''+@UserID+'''  
    GROUP BY  POID, POTransID, LRGroupID,  
       InventoryID,   
       Spec01ID, Spec02ID, Spec03ID, Spec04ID, Spec05ID,   
       Spec06ID, Spec07ID, Spec08ID, Spec09ID, Spec10ID,   
       UnitID,   
       LocationNo2  
    ) AS D37   
   ON  D37.POID = A.POID AND D37.POTransID = A.POItemID  
  
 INNER JOIN  D07T0002 B WITH(NOLOCK) ON A.InventoryID = B.InventoryID   
 '  
 + CASE WHEN @IsUseLinkAccKCode = 1 THEN '  
 LEFT JOIN #MappingK_Acc T0303  
  ON  T0303.OrderNo = 1 '  
    + STUFF((SELECT ' AND T0303.K' + Code + 'ID = A.Ana' + Code + 'ID' FROM #LinkAcc FOR XML PATH ('')), 1, 1, '')   
     ELSE '' END + '  
 WHERE  A.HostName = Host_Name()   
    AND A.UserID = '''+@UserID+'''  
 ORDER BY  D37.LRGroupID, A.OrderNum, D37.OrderNum'  
END   
ELSE   
BEGIN  
 IF @IsUseLinkAccKCode = 1  
 BEGIN  
  SET @SQL1 = N'  
  SELECT  ROW_NUMBER() OVER(PARTITION BY ' + STUFF((SELECT ',T0303.K' + Code + 'ID' FROM #LinkAcc FOR XML PATH ('')), 1, 1, '')  
       + ' ORDER BY T0303.AccountID) AS OrderNo,  
     T0303.AccountID, T0303.DivisionID,  
     T0303.K01ID, T0303.K02ID, T0303.K03ID, T0303.K04ID, T0303.K05ID, T0303.K06ID, T0303.K07ID, T0303.K08ID, T0303.K09ID, T0303.K10ID  
  INTO  #MappingK_Acc  
  FROM  D90T0303 T0303 WITH(NOLOCK)  
  WHERE  T0303.AccountID <> ''''  
  '      
 END  
  
 SET @SQL1 = @SQL1 + '  
 SELECT  A.HostName, A.UserID,   
    --khi ke thua, van Insert D06T3900 gia tri POID va POItemID (de ket lay du lieu), luu y chi moi insert khi o duong dan: Nhan hang cung hoa don/ Ke thua don hang  
    --va Ke thua thi IsInherit = 0. Vi vay, ke thua se set lai POID va POItemID gia tri = ''  
    CASE WHEN A.IsInherit = 0 OR (A.POItemID = A.MDITransID) THEN '''' ELSE A.POID END AS POID, --Chon tu yeu cau nhap kho thi luu POID = ''  
    CASE WHEN A.IsInherit = 0 OR (A.POItemID = A.MDITransID) THEN '''' ELSE A.POItemID END As POItemID, --Chon tu yeu cau nhap kho thi luu POItemID = ''  
    A.IsInherit,   
    CASE WHEN A.ObjectTypeID = '''' THEN T10.ObjectTypeID ELSE A.ObjectTypeID END AS ObjectTypeID,   
    CASE WHEN A.ObjectID = '''' THEN T10.ObjectID ELSE A.ObjectID END AS ObjectID,   
    CASE WHEN A.CurrencyID = '''' THEN T10.CurrencyID ELSE A.CurrencyID END AS CurrencyID,   
    CASE WHEN A.CurrencyID = '''' THEN T10.ExchangeRate ELSE A.ExchangeRate END AS ExchangeRate,  
    A.OrderNum,   
    A.InventoryID,   
    A.Spec01ID, A.Spec02ID, A.Spec03ID, A.Spec04ID, A.Spec05ID,   
    A.Spec06ID, A.Spec07ID, A.Spec08ID, A.Spec09ID, A.Spec10ID,   
    A.InventoryName, B.ShortName'+@U+' AS ShortName, A.UnitID,   
    CASE WHEN B.ByValues = 1 THEN Case When A.OQuantity = 0 Then 1 Else A.OQuantity End ELSE A.OQuantity END As OQuantity,   
    CASE WHEN B.ByValues = 1 THEN Case When A.CQuantity = 0 Then 1 Else A.CQuantity End ELSE A.CQuantity END As CQuantity,   
    ROUND(CASE WHEN '+LTRIM(RTRIM(Str(@FromD07RR)))+' = 0  
     THEN CASE WHEN B.ByValues = 1 THEN A.OAmount   
        WHEN B.ByValues = 2 THEN A.OAmount/Case When ISNULL(B.PricebyCQuantity,0) = 0 Then   
                  Case When A.OQuantity = 0 Then 1 Else A.OQuantity End   
                 Else Case When A.CQuantity = 0 Then 1 Else A.CQuantity End End  
       ELSE A.UnitPrice END  
     ELSE A.UnitPriceRR  
     END, D91.PurchasePriceDecimals) AS UnitPrice,  
    ---- BEGIN Modified on 27/11/2012 by Le Thi Ni: chinh sua tinh thanh tien khi chon DDH (theo thiet lap Don gia theo DVT chuan)  
    ---- Modified on 09/10/2009 by Nguyen Xuan Tien: chinh sua tinh thanh tien NT va QD khi chon DDH  
    -- Begin  
    --A.OAmount,   
    --A.CAmount,  
    ROUND(CASE WHEN B.ByValues <> 0 THEN A.OAmount ELSE  
      CASE WHEN '+LTRIM(RTRIM(Str(@FromD07RR)))+' = 0  
       THEN  
        CASE WHEN (ISNULL(T20.OQuantity,0) - ISNULL(A.OQuantity,0) - ISNULL(C.OReceivedQuantity,0) + ISNULL(D.OReturnedQuantity, 0) + ISNULL(F.OAdjQuantity, 0)= 0)  
         THEN A.OPOAmount - ISNULL(C.OReceivedAmount,0) + ISNULL(D.OReturnedAmount, 0) + ISNULL(F.OAdjAmount, 0) - ISNULL(F.OAdjReduction, 0)      
         ELSE A.UnitPrice * CASE WHEN B.PricebyCQuantity = 0 THEN ISNULL(A.OQuantity,0) ELSE ISNULL(A.CQuantity,0) END    
        END     
       ELSE  
        A.OAmountRR  
      END  
    END, D91.OriginalDecimal) AS  OAmount,  
      
    ROUND(CASE WHEN B.ByValues <> 0 THEN A.CAmount ELSE   
      CASE WHEN '+LTRIM(RTRIM(Str(@FromD07RR)))+' = 0  
       THEN  
        CASE WHEN (ISNULL(T20.CQuantity,0) - ISNULL(A.CQuantity,0) - ISNULL(C.CReceivedQuantity, 0) + ISNULL(D.CReturnedQuantity, 0) + ISNULL(F.CAdjQuantity, 0)= 0)  
         THEN  (A.CPOAmount - ISNULL(C.CReceivedAmount,0) + ISNULL(D.OReturnedAmount, 0) + ISNULL(F.CAdjAmount, 0) - ISNULL(F.CAdjReduction, 0))    
         ELSE   (A.UnitPrice * (CASE WHEN B.PricebyCQuantity = 0 THEN A.OQuantity ELSE A.CQuantity END) * CASE WHEN D91.Operator = 0 THEN A.ExchangeRate ELSE 1 END)/(CASE WHEN D91.Operator = 0 THEN 1 ELSE A.ExchangeRate END)  
        END        
       ELSE  
        A.CAmountRR  
      END   
    END,'+CONVERT(varchar(2),@D90_ConvertedDecimals)+') AS CAmount,      
    -- End  
    --END Modified on 27/11/2012 by Le Thi Ni: chinh sua tinh thanh tien khi chon DDH (theo thiet lap Don gia theo DVT chuan)  
      
    ISNULL(T20.OQuantity,0) AS POOQuantity,  
    ISNULL(T20.CQuantity,0) AS POCQuantity,  
    ISNULL(C.OReceivedQuantity,0) AS OReceivedQuantity,  
    ISNULL(C.CReceivedQuantity,0) AS CReceivedQuantity,  
    A.OPOAmount,   
    A.CPOAmount,   
    A.OPORealizedAmount,   
    A.CPORealizedAmount,   
    A.OPORemainAmount,   
    A.CPORemainAmount,   
    A.ConversionFactor,   
    A.Volume, A.Weight, A.SpecialFee, A.IsService,   
    '+CASE WHEN @HaveImpTax = 0 THEN 'CONVERT(Decimal(28,8),0)' ELSE 'A.ImpRateTax' END + ' AS ImpRateTax,   
    '+CASE WHEN @HaveSpecTax = 0 THEN 'CONVERT(Decimal(28,8),0)' ELSE 'A.SpcRateTax' END + ' AS SpcRateTax,   
    '+CASE WHEN @IsVAT = 0 THEN 'CONVERT(Varchar(50),'''')' ELSE 'A.VATGroupID' END + ' AS VATGroupID,   
    '+CASE WHEN @IsVAT = 0 THEN 'CONVERT(Decimal(28,8),0)' ELSE 'ISNULL(A.VATRateTax,0)' END + ' AS VATRateTax,   
    A.AccountID,   
    A.MPSVoucherID, A.MPSVoucherNo, A.ProOrderID, A.ProOrderNo,   
    ISNULL(A.Ana01ID, '''') AS Ana01ID, ISNULL(A.Ana02ID, '''') AS Ana02ID, ISNULL(A.Ana03ID, '''') AS Ana03ID, ISNULL(A.Ana04ID, '''') AS Ana04ID, ISNULL(A.Ana05ID, '''') AS Ana05ID,   
    ISNULL(A.Ana06ID, '''') AS Ana06ID, ISNULL(A.Ana07ID, '''') AS Ana07ID, ISNULL(A.Ana08ID, '''') AS Ana08ID, ISNULL(A.Ana09ID, '''') AS Ana09ID, ISNULL(A.Ana10ID, '''') AS Ana10ID,   
    Convert(int,A.Flag) As Flag, A.FormulaID, A.Formula,   
    A.Num01, A.Num02, A.Num03, A.Num04, A.Num05,   
    A.Num06, A.Num07, A.Num08, A.Num09, A.Num10,   
    A.PaymentMethodID, A.TransDesc,  
    A.DeliveryID , A.LCNo,   
    --A.VRef1, A.VRef2, A.VRef3, A.VRef4, A.VRef5,  Sua tam thoi lay tu master cua PO dao tao cho PAN  
    Case when A.VRef1='''' THEN  T10.[MStr01U] ELSE  A.VRef1  END AS VRef1,  
    Case when A.VRef2='''' THEN  T10.[MStr02U] ELSE  A.VRef2  END AS VRef2,  
    Case when A.VRef3='''' THEN  T10.[MStr03U] ELSE  A.VRef3  END AS VRef3,  
    Case when A.VRef4='''' THEN  T10.[MStr04U] ELSE  A.VRef4  END AS VRef4,  
    Case when A.VRef5='''' THEN  T10.[MStr05U] ELSE  A.VRef5  END AS VRef5,  
    A.NRef1, A.NRef2, A.NRef3, A.NRef4, A.NRef5,   
    CASE WHEN A.POVoucherNo = A.MDIVoucherNo THEN '''' ELSE A.POVoucherNo END As POVoucherNo,   
    A.DRef1, A.DRef2, A.DRef3, A.DRef4, A.DRef5,   
    CASE WHEN A.PeriodID <> '''' THEN A.PeriodID ELSE ''' + @DefaultPeriodID + ''' END AS PeriodID, A.ProductID  
    ,Convert(nvarchar(500), '''') AS ProductName  
    ,Convert(nvarchar(500), '''') AS ProductShortName,    
    CASE WHEN T10.ModuleID = ''54'' THEN A.InventoryName ELSE B.InventoryName'+@U+' END AS OInventoryName,   
    '  
SET @SQL2='  
    CONVERT(NVARCHAR(500), '''') AS Spec01Name,  
    CONVERT(NVARCHAR(500), '''') AS Spec02Name,  
    CONVERT(NVARCHAR(500), '''') AS Spec03Name,  
    CONVERT(NVARCHAR(500), '''') AS Spec04Name,  
    CONVERT(NVARCHAR(500), '''') AS Spec05Name,  
    CONVERT(NVARCHAR(500), '''') AS Spec06Name,  
    CONVERT(NVARCHAR(500), '''') AS Spec07Name,  
    CONVERT(NVARCHAR(500), '''') AS Spec08Name,  
    CONVERT(NVARCHAR(500), '''') AS Spec09Name,  
    CONVERT(NVARCHAR(500), '''') AS Spec10Name,   
    '''' AS LRGroupID, A.UseConversionFormula, A.ConversionFormula,  
    ----14/04/2009 chinh sua '' as LocationNo thanh A.LocationNo  
    A.LocationNo, ISNULL(LOT.ConversionFactor,0) AS ConversionLot,  
    ---- Modified on 07/01/2016 by Nguyen Xuan Tien: Bo sung Ngay het han theo Lo (ID 83580)  
    '  
    + CASE WHEN @IsSplitLotByPOVoucher = 1 AND @IsDetailLocationInfo = 1  
    THEN  
    '  
    A.LimitDate,  
    A.ProDate,      
    '  
    ELSE  
    '  
    LOT.ExpireDate AS LimitDate,   
    LOT.ManufactureDate AS ProDate,  
    '  
    END  
    +  
    '      
    A.Tolerance,   
    A.MDITransID,   
    A.MDIVoucherNo,      
    A.OTransType,  
    A.POID AS OBatchID,  
    A.POItemID AS OTransID,       
    ISNULL(A.MStr01,'''') AS MStr01,ISNULL(A.MStr02,'''') AS MStr02, ISNULL(A.MStr03,'''') AS MStr03,ISNULL(A.MStr04,'''') AS MStr04,ISNULL(A.MStr05,'''') AS MStr05,  
    ISNULL(A.MStr06,'''') AS MStr06,ISNULL(A.MStr07,'''') AS MStr07, ISNULL(A.MStr08,'''') AS MStr08,ISNULL(A.MStr09,'''') AS MStr09,ISNULL(A.MStr10,'''') AS MStr10,  
    ISNULL(A.MNum01,0) AS MNum01,ISNULL(A.MNum02,0) AS MNum02,ISNULL(A.MNum03,0) AS MNum03,ISNULL(A.MNum04,0) AS MNum04,ISNULL(A.MNum05,0) AS MNum05,  
    ISNULL(A.MNum06,0) AS MNum06,ISNULL(A.MNum07,0) AS MNum07,ISNULL(A.MNum08,0) AS MNum08,ISNULL(A.MNum09,0) AS MNum09,ISNULL(A.MNum10,0) AS MNum10,  
    ISNULL(A.MDat01,NULL) AS MDat01,ISNULL(A.MDat02,NULL) AS MDat02,ISNULL(A.MDat03,NULL) AS MDat03,ISNULL(A.MDat04,NULL) AS MDat04,ISNULL(A.MDat05,NULL) AS MDat05,  
    ISNULL(A.MDat06,NULL) AS MDat06,ISNULL(A.MDat07,NULL) AS MDat07,ISNULL(A.MDat08,NULL) AS MDat08,ISNULL(A.MDat09,NULL) AS MDat09,ISNULL(A.MDat10,NULL) AS MDat10,  
    A.ConversionFactor as CFactor,  
    A.AccountID as DebitAccountID,   
    ISNULL(T20.ProjectID,'''') AS ProjectID,   
    ISNULL(T20.ProjectName'+@U+','''') As ProjectName,  
    CONVERT(Bit, 0) As IsDecrease,  
    ISNULL(T20.TaskID,'''') AS TaskID,   
    ISNULL(T20.TaskName'+@U+','''') As TaskName,  
    ISNULL(T10.PaymentTermID,'''') AS PaymentTermID,   
    ISNULL(T10.DueDate,NULL) AS DueDate,   
    CONVERT(NVARCHAR(1000),ISNULL(T10.VoucherDesc'+@U+','''')) AS VoucherDesc,  
    ISNULL(B.PricebyCQuantity,0) AS PricebyCQuantity,  
    '+CASE WHEN @IsVAT = 1 THEN 'ISNULL(T20.VATOAmount, 0)'ELSE 'Convert(Decimal(28,8),0)' END+' As VATOAmount,  
    '+CASE WHEN @IsVAT = 1 THEN 'ISNULL(T20.VATCAmount, 0)'ELSE 'Convert(Decimal(28,8),0)' END+' As VATCAmount,  
    ISNULL(T20.VATGroupID, 0) As POVATGroupID,  
    ISNULL(T20.UnitPrice, 0) As POUnitPrice, ISNULL(T20.OAmount, 0) As POOAmount,  
    ISNULL(B.ByValues, 0) As ByValues,  
    ISNULL(T20.BudgetID,'''') AS BudgetID, ISNULL(T20.BudgetName,'''') AS BudgetName,   
    ISNULL(T20.BudgetItemID,'''') AS BudgetItemID, ISNULL(T20.BudgetItemName,'''') AS BudgetItemName,  
    '+CASE WHEN @IsInherit = 0 THEN '''''' ELSE 'REPLACE(T10.VoucherNo+''-''+ STR(T20.OrderNum, 3), '' '', ''0'')' END+' AS POOrderNum,  
    Convert(varchar(50), '''') As TransIDWTax, Convert(decimal(28,8), 0) As PreOAmountWTax,   
    Convert(decimal(28,8), 0) As AmtWTax_InvCur,  
    Convert(varchar(50), '''') As DebitAccWTax, Convert(varchar(50), '''') As CreditAccWTax,   
    Convert(nvarchar(250), '''') As TranDescWTax,   
    T20.RateWTax, CONVERT(Decimal(28,8),0) AS OAmountWTax, CONVERT(Decimal(28,8),0) AS CAmountWTax, A.PODetailID AS PODetailID,  
    CASE WHEN T20.SOVoucherNo = '''' THEN IsNull(T16.VoucherNum,'''') ELSE T20.SOVoucherNo END As SOVoucherNo,  
    CONVERT(VARCHAR(50),'''') AS PRVoucherNo, CONVERT(NVARCHAR(250),'''') AS RequestorName, T20.LinkBatchID, T20.LinkTransID, A.WareHouseID ,  
    A.LCode01ID,A.LCode02ID,A.LCode03ID,A.LCode04ID,A.LCode05ID,  
    A.LCode06ID,A.LCode07ID,A.LCode08ID,A.LCode09ID,A.LCode10ID,  
    CONVERT(BIT, 0) AS IsPromotion,  
    CONVERT(BIT, 0) AS IsLockPromotion,B.IsLocation,  
    CONVERT(BIT, 0) AS IsNotEditUnitPrice, T20.CreditAccountID, T20.CipID, T100.CipNo, T10.DocNo AS DocNoMaster,ISNULL(T20.SOID,'''') AS SOID,  
    ISNULL(B.RefCodeU,'''') AS RefCode, CONVERT(VARCHAR(50),'''') AS SerialNo, CONVERT(VARCHAR(50),'''') AS InvoiceNo, CONVERT(DATETIME,NULL) AS RefDate,   
    CONVERT(VARCHAR(50),'''') AS DebtManagerTypeID, CONVERT(VARCHAR(50),'''') AS DebtManagerID, CONVERT(NVARCHAR(250),'''') AS DebtManagerName,  
    CONVERT(VARCHAR(50),'''') AS VATObjectTypeID, CONVERT(VARCHAR(50),'''') AS VATObjectID, CONVERT(NVARCHAR(250),'''') AS VATObjectName,  
    CONVERT(NVARCHAR(500),'''') AS VATObjectAddress, CONVERT(VARCHAR(50),'''') AS VATNo, CONVERT(VARCHAR(50),'''') AS InputInvoiceID, CONVERT(NVARCHAR(1000),'''') AS VATTransDesc  
 INTO  #D06P3911_D06T3900  
 FROM   D06T3900 A   
 LEFT JOIN D06T2520 T20 WITH(NOLOCK)  
   ON T20.POTransID = A.POItemID  
 LEFT JOIN D06T2510 T10 WITH(NOLOCK)  
   ON T10.POID = A.POID  
 LEFT JOIN D05T0016 T16 WITH(NOLOCK)  
   ON T16.QuotationID = T20.QuotationID  
 --So luong da nhan  
 LEFT JOIN (  
    SELECT  B.POItemID,   
       SUM(B.OQuantity) AS OReceivedQuantity,  
       SUM(B.CQuantity) AS CReceivedQuantity,  
       SUM(B.OAmount) AS OReceivedAmount,  
       SUM(B.CAmount) AS CReceivedAmount  
    FROM  D06T2010 A WITH(NOLOCK)  
    INNER JOIN D06T2020 B WITH(NOLOCK) ON A.BatchID = B.BatchID  
    WHERE  ISNULL(B.POItemID,'''') <> ''''  
       AND A.BatchID <> '''+@BatchID+'''  
       AND A.BatchID <> ''''  
       AND A.VoucherType = ''01''   
       AND A.TransactionID IN (''01'', ''02'', ''04'', ''13'') --Chinh tinh so luong cua phieu nhan hang  
       AND B.POID IN (SELECT POID FROM D06T3900 WHERE HostName = Host_Name() AND UserID = '''+@UserID+''')  
         
    GROUP BY B.POItemID  
    ) C ON C.POItemID = A.POItemID     
 --Tra hang xac dinh hoa don  
 '  
 SET @SQL3=N'  
 LEFT JOIN (  
    SELECT  B.POItemID,   
       SUM(B.OQuantity) AS OReturnedQuantity,  
       SUM(B.CQuantity) AS CReturnedQuantity,  
       SUM(B.OAmount) AS OReturnedAmount,  
       SUM(B.CAmount) AS CReturnedAmount  
    FROM  D06T2010 A WITH(NOLOCK)  
    INNER JOIN D06T2020 B WITH(NOLOCK)ON A.BatchID = B.BatchID  
    WHERE  ISNULL(B.POItemID,'''') <> ''''  
       AND A.VoucherType = ''12'' AND A.TransactionID = ''12''  
       AND B.POID IN (SELECT POID FROM D06T3900 WHERE HostName = Host_Name() AND UserID = '''+@UserID+''')  
    GROUP BY B.POItemID  
    ) D ON D.POItemID = A.POItemID   
 '  
 +CASE WHEN @BusinessType <> 'Service01' AND @POAdjustQtyAmt = 0  
 THEN   
 '  
 --Dieu chinh don hang  
 LEFT JOIN (  
    SELECT  Y.POTransID,  
       SUM(CASE WHEN X.AdjustType = 0 THEN Y.OQuantity ELSE (-1)*Y.OQuantity END) AS OAdjQuantity,  
       SUM(CASE WHEN X.AdjustType = 0 THEN Y.CQuantity ELSE (-1)*Y.CQuantity END) AS CAdjQuantity,  
       SUM(0) AS OAdjAmount,  
       SUM(0) AS CAdjAmount,  
       SUM(0) AS OAdjReduction,  
       SUM(0) AS CAdjReduction  
    FROM  D06T2530 X WITH(NOLOCK)  
    INNER JOIN D06T2540 Y WITH(NOLOCK) ON X.AdjPOID = Y.AdjPOID  
    WHERE  X.POID IN (SELECT POID FROM D06T3900 WHERE HostName = Host_Name() AND UserID = '''+@UserID+''')  
    GROUP BY Y.POTransID  
    ) F   
   ON F.POTransID = A.POItemID   
 '  
 ELSE  
 '  
 --Dieu chinh don hang Du lich bay  
 LEFT JOIN (  
    SELECT  Y.AdjustPOTransID, Y.AdjustPOID,  
       SUM(CASE WHEN ISNULL(Y.AdjustTypeID, '''') = ''AI'' THEN Y.OQuantity ELSE (-1)*Y.OQuantity END) AS OAdjQuantity,  
       SUM(CASE WHEN ISNULL(Y.AdjustTypeID, '''') = ''AI'' THEN Y.CQuantity ELSE (-1)*Y.CQuantity END) AS CAdjQuantity,  
       SUM(CASE WHEN ISNULL(Y.AdjustTypeID, '''') = ''AI'' THEN 1* Y.OAmount ELSE (-1) * Y.OAmount END) AS OAdjAmount,  
       SUM(CASE WHEN ISNULL(Y.AdjustTypeID, '''') = ''AI'' THEN 1* Y.CAmount ELSE (-1) * Y.CAmount END) AS CAdjAmount,  
       SUM(CASE WHEN ISNULL(Y.AdjustTypeID, '''') = ''AI'' THEN 1* OReduction ELSE (-1) * OReduction END) As OAdjReduction,  
       SUM(CASE WHEN ISNULL(Y.AdjustTypeID, '''') = ''AI'' THEN 1* CReduction ELSE (-1) * CReduction END) As CAdjReduction  
    FROM  D06T2510 X WITH(NOLOCK)  
    INNER JOIN D06T2520 Y WITH(NOLOCK)   
      ON X.POID = Y.POID  
    WHERE  Y.AdjustTypeID <> ''''  
       AND Y.AdjustPOID IN (SELECT POID FROM D06T3900 WHERE HostName = Host_Name() AND UserID = '''+@UserID+''')'  
       + CASE WHEN @IsUsePOAdjustApproval = 1 THEN ' AND X.AStatus = 90' ELSE '' END + '  
    GROUP BY Y.AdjustPOTransID, Y.AdjustPOID  
    ) F   
   ON F.AdjustPOTransID = A.POItemID  
    AND F.AdjustPOID = A.POID  
 '   
 END  
 +  
 '   
 INNER JOIN  D07T0002 B WITH(NOLOCK) ON A.InventoryID = B.InventoryID   
 LEFT JOIN D07T1210 LOT WITH(NOLOCK) ON A.LocationNo = LOT.LocationNo  '+CASE WHEN @IsSaveLotManyInv = 1 THEN ' AND A.InventoryID = LOT.InventoryID' ELSE '' END +'  
 LEFT JOIN D91V0010 D91 ON A.CurrencyID = D91.CurrencyID   
 LEFT JOIN D02T0100 T100 WITH(NOLOCK) ON T100.CipID = T20.CipID   
 WHERE  A.HostName = Host_Name()   
    AND A.UserID = '''+@UserID+'''  
 ORDER BY  A.OrderNum  
 '  
 SET @SQL4 =   
 '  
 --Neu so luong lap = so luong PO va Thanh tien = Thanh tien PO thi Don gia = Don gia PO  
 UPDATE  T1  
 SET   UnitPrice = POUnitPrice  
 FROM  #D06P3911_D06T3900 T1  
 WHERE  POOQuantity = OQuantity  
    AND POCQuantity = CQuantity  
    AND OAmount = POOAmount  
    AND ByValues = 0  
 '  
  
 IF @TransTypeID <> ''   
 BEGIN  
  SET @SQL4 = @SQL4 +  
  '  
  UPDATE  T1  
  SET   DebitAccountID = CASE WHEN '+Str(@InvDebitAccDef)+' = 0 --TK uu tien theo mat hang  
        THEN '''+@InvDebitAcc+'''  
        ELSE  
         Case When PurchaseAccountID <> '''' Then PurchaseAccountID Else '''+@InvDebitAcc+''' End  
        END  
    
  FROM  #D06P3911_D06T3900 T1  
  LEFT JOIN D07T0002 T2 WITH(NOLOCK)   
    On T1.InventoryID = T2.InventoryID  
  WHERE  ISNULL(CASE WHEN '+Str(@InvDebitAccDef)+' = 0 THEN '''+@InvDebitAcc+'''  
        ELSE Case When PurchaseAccountID <> '''' Then PurchaseAccountID Else '''+@InvDebitAcc+''' End END,'''') <> '''' ---- HOAILAM: 22/05/2023  
    
  '  
 END  
  
 IF @InputInvoiceID <> ''  
 BEGIN  
  SET @SQL4 = @SQL4 +  
  '  
  UPDATE  T1  
  SET   T1.SerialNo = ISNULL(T.SerialNo, ''''),  
     T1.InvoiceNo = ISNULL(T.InvoiceNo, ''''),  
     T1.RefDate = T.InvoiceDate,  
     T1.PaymentMethodID = ISNULL(T.PaymentMethodID, ''''),  
     T1.VATRateTax = T.VATRate/100,  
     T1.VATGroupID = ISNULL(T2.VATGroupID, ''''),  
     T1.InputInvoiceID = T.VoucherID,  
     T1.CurrencyID = ISNULL(T.CurrencyID, ''VND''),  
     T1.ExchangeRate = CASE WHEN T.ExchangeRate = 0 THEN 1 ELSE T.ExchangeRate END,  
     T1.VATObjectTypeID = ISNULL(Obj.ObjectTypeID, ''''),  
     T1.VATObjectID = ISNULL(Obj.ObjectID, ''''),  
     T1.VATObjectName = ISNULL(T.ObjectName, ''''),  
     T1.VATObjectAddress = ISNULL(T.ObjectAddress, T1.VATObjectAddress),  
     T1.VATNo = ISNULL(T.TaxCode, ''''),  
     T1.VATOAmount = T1.OAmount * T.VATRate / 100,  
     T1.VATCAmount = T1.CAmount * T.VATRate / 100,  
     T1.DebtManagerTypeID = Obj.DebtManagerTypeID,  
     T1.DebtManagerID = Obj.DebtManagerID,  
     T1.DebtManagerName = Obj1.ObjectNameU  
  FROM  #D06P3911_D06T3900 T1  
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
     WHERE  T5.VoucherID = '''+@InputInvoiceID+'''  
     ORDER BY T5.TransID  
     ) T  
    ON 1 = 1  
  LEFT JOIN D91T0040 T2 WITH(NOLOCK)   
    ON T.VATRate = T2.RateTax * 100  
  LEFT JOIN Object Obj WITH(NOLOCK)  
   ON  T.TaxCode = Obj.VATNo  
   AND  Obj.ObjectTypeID = ''CC''  
   AND  Obj.Disabled = 0  
  LEFT JOIN Object Obj1 WITH(NOLOCK)  
   ON  Obj1.IsDebtManager = 1  
     AND Obj.DebtManagerTypeID = Obj1.ObjectTypeID  
     AND Obj.DebtManagerID = Obj1.ObjectID  
 '  
 END  
   
 ----Mac dinh TK No doi voi ma hang dich vu dua tren khoan muc cua PO: 252585  
 ----Mac dinh TK No doi voi Hon don ve truoc (Ma hang dich vu) hoac Nhan hang truoc (Ma hang dich vu) hoac Nhan hang truoc Chuyen thang san xuat: 254160  
 IF @IsUseLinkAccKCode = 1  
 BEGIN  
     SET @SQL4 = @SQL4 + '  
      UPDATE  T  
      SET   T.DebitAccountID = T0303.AccountID  
      FROM  #D06P3911_D06T3900 T  
      INNER JOIN #MappingK_Acc T0303  
       ON  1 = 1 '  
         + STUFF((SELECT ' AND T0303.K' + Code + 'ID = T.Ana' + Code + 'ID' FROM #LinkAcc FOR XML PATH ('')), 1, 1, '')   
         + '  
      WHERE  T0303.AccountID <> '''' AND T0303.OrderNo = 1   
      AND (T.IsService = 1 OR (''' + @TransactionID + ''' = ''04'' AND ''' + @ReceivedTypeID + ''' = ''04''))  
      '  
 END  
  
   
 SET @SQL4 = @SQL4 +   
 ''   
 + CASE   
 WHEN @POIsDesc = 0 THEN ''   
 WHEN @POIsDesc = 1 THEN   
        '  
        SELECT  SUBSTRING(  
        ( SELECT  Distinct(ISNULL(A1.VoucherNo, '''')) + ''; ''   
         FROM  #D06P3911_D06T3900 A   
         LEFT JOIN D06T2510  A1 WITH(NOLOCK)  
          ON  A.POID = A1.POID  
        FOR XML PATH ('''')   
        ),1,  
        LEN(( SELECT  Distinct(ISNULL(A1.VoucherNo, '''')) + ''; ''  
          FROM  #D06P3911_D06T3900 A  
          LEFT JOIN D06T2510 A1 WITH(NOLOCK)  
          ON   A.POID = A1.POID  
        FOR XML PATH (''''))) - 1  
        ) AS VoucherDesc  
        INTO  #Temp  
        FROM  #D06P3911_D06T3900 B  
   
        UPDATE  T  
        SET   T.VoucherDesc = Tem.VoucherDesc   
        FROM  #D06P3911_D06T3900 T   
        CROSS JOIN #Temp Tem  
        '  
 ELSE  
        'SELECT  SUBSTRING(  
        ( SELECT  Distinct(ISNULL(A1.VoucherDesc'+@U+', '''')) + ''; ''   
         FROM  #D06P3911_D06T3900 A   
         LEFT JOIN D06T2510  A1 WITH(NOLOCK)  
          ON  A.POID = A1.POID  
        FOR XML PATH ('''')   
        ),1,  
        LEN(( SELECT  Distinct(ISNULL(A1.VoucherDesc'+@U+', '''')) + ''; ''  
          FROM  #D06P3911_D06T3900 A  
          LEFT JOIN D06T2510 A1 WITH(NOLOCK)  
          ON   A.POID = A1.POID  
        FOR XML PATH (''''))) - 1  
        ) AS VoucherDesc, B.POVoucherNo  
        INTO  #Temp  
        FROM  #D06P3911_D06T3900 B  
  
        ----ID 279061  
        UPDATE T1  
        SET  T1.VoucherDesc = CONCAT(T1.VoucherDesc, ''_'',T1.POVoucherNo)  
        FROM #Temp T1  
        WHERE 1 = 1  AND EXISTS ( SELECT TOP 1 1 FROM D06T1010 WHERE TransTypeID = '''+@TransTypeID+''' AND POIsDesc = 3)  
   
        UPDATE  T  
        SET   T.VoucherDesc = Tem.VoucherDesc   
        FROM  #D06P3911_D06T3900 T   
        CROSS JOIN #Temp Tem'  
 END +  
 '  
   
 ---- Modified on 05/01/2015: TUAN ANH LAY THONG TIN KHOANG MUC TU TransTypeID NEU OTransType = IsCopyInvoiceD05 (copy tu don hang D05)  
 UPDATE  A  
 SET   A.Ana01ID = ISNULL(D06.Ana01ID,''''),  
    A.Ana02ID = ISNULL(D06.Ana02ID,''''),   
    A.Ana03ID = ISNULL(D06.Ana03ID,''''),   
    A.Ana04ID = ISNULL(D06.Ana04ID,''''),   
    A.Ana05ID = ISNULL(D06.Ana05ID,''''),   
    A.Ana06ID = ISNULL(D06.Ana06ID,''''),   
    A.Ana07ID = ISNULL(D06.Ana07ID,''''),   
    A.Ana08ID = ISNULL(D06.Ana08ID,''''),   
    A.Ana09ID = ISNULL(D06.Ana09ID,''''),   
    A.Ana10ID = ISNULL(D06.Ana10ID,'''')  
 FROM  #D06P3911_D06T3900 A  
 LEFT JOIN D06T1010 D06 WITH(NOLOCK)   
   ON D06.TransTypeID = '''+@TransTypeID+'''  
 WHERE  A.OTransType = ''IsCopyInvoiceD05''   
   
   
 UPDATE T1  
 SET T1.Ana01ID = CASE WHEN T1.Ana01ID = '''' THEN ISNULL(T2.Ana01ID,'''') ELSE T1.Ana01ID END,  
  T1.Ana02ID = CASE WHEN T1.Ana02ID = '''' THEN ISNULL(T2.Ana02ID,'''') ELSE T1.Ana02ID END,  
  T1.Ana03ID = CASE WHEN T1.Ana03ID = '''' THEN ISNULL(T2.Ana03ID,'''') ELSE T1.Ana03ID END,  
  T1.Ana04ID = CASE WHEN T1.Ana04ID = '''' THEN ISNULL(T2.Ana04ID,'''') ELSE T1.Ana04ID END,  
  T1.Ana05ID = CASE WHEN T1.Ana05ID = '''' THEN ISNULL(T2.Ana05ID,'''') ELSE T1.Ana05ID END,  
  T1.Ana06ID = CASE WHEN T1.Ana06ID = '''' THEN ISNULL(T2.Ana06ID,'''') ELSE T1.Ana06ID END,  
  T1.Ana07ID = CASE WHEN T1.Ana07ID = '''' THEN ISNULL(T2.Ana07ID,'''') ELSE T1.Ana07ID END,  
  T1.Ana08ID = CASE WHEN T1.Ana08ID = '''' THEN ISNULL(T2.Ana08ID,'''') ELSE T1.Ana08ID END,  
  T1.Ana09ID = CASE WHEN T1.Ana09ID = '''' THEN ISNULL(T2.Ana09ID,'''') ELSE T1.Ana09ID END,  
  T1.Ana10ID = CASE WHEN T1.Ana10ID = '''' THEN ISNULL(T2.Ana10ID,'''') ELSE T1.Ana10ID END  
 FROM #D06P3911_D06T3900 T1  
 LEFT JOIN D06T1010 T2 ON T2.TransTypeID = '''+@TransTypeID+'''  
  
  
  
 --Cap nhat thong tin YCMH  
 UPDATE  A  
 SET   A.PRVoucherNo = ISNULL(T2010.PRVoucherNo,''''),  
    A.RequestorName = ISNULL(O.ObjectName'+@U+','''')  
 FROM  #D06P3911_D06T3900 A  
 INNER JOIN D12T2010 T2010 WITH(NOLOCK) ON T2010.PRID = A.LinkBatchID AND T2010.PRTransactionID = A.LinkTransID  
 LEFT JOIN  Object O WITH(NOLOCK) ON O.ObjectTypeID = ''NV'' AND O.ObjectID = T2010.RequiredPerson  
  
 UPDATE  A  
 SET   IsNotEditUnitPrice = 1  
 FROM  #D06P3911_D06T3900 A  
 LEFT JOIN D06T1010 D06 WITH(NOLOCK)   
   ON D06.TransTypeID = '''+@TransTypeID+'''  
 WHERE  A.OTransType = ''IsCopyPurchaseOrdersD06''  
 AND   D06.IsNotEditUnitPrice = 1   
  
 --- 255675 uu tien don hang truoc neu don hang co nhap tk   
 UPDATE  A  
 SET   A.DebitAccountID = T02.DebitAccountID  
 FROM  #D06P3911_D06T3900 A  
 LEFT JOIN D06T2520 T02 WITH(NOLOCK)   
   ON T02.POTransID = A.POItemID  
 LEFT JOIN D06T2510 T10 WITH(NOLOCK)   
   ON  T02.POID = T10.POID  
 WHERE  T02.DebitAccountID <> ''''  
  
 UPDATE  T1  
 SET   CreditAccountID = CASE WHEN '+Str(@PayCreditAccDef)+' = 0 --TK uu tien theo doi tuong  
       THEN '''+@PayCreditAcc+'''  
       ELSE  
        Case When PAccountID <> '''' Then PAccountID Else '''+@PayCreditAcc+''' End  
       END  
 FROM  #D06P3911_D06T3900 T1  
 LEFT JOIN OBJECT T2 WITH(NOLOCK)   
   On T1.ObjectID = T2.ObjectID AND T1.ObjectTypeID = T2.ObjectTypeID  
 WHERE  CreditAccountID = ''''  
 '  
END  
  
SET @SQL5 = '  
 UPDATE A  
 SET  A.Spec01Name = ISNULL(SP01.Description'+@U+', ''''),  
   A.Spec02Name = ISNULL(SP02.Description'+@U+', ''''),  
   A.Spec03Name = ISNULL(SP03.Description'+@U+', ''''),  
   A.Spec04Name = ISNULL(SP04.Description'+@U+', ''''),  
   A.Spec05Name = ISNULL(SP05.Description'+@U+', ''''),  
   A.Spec06Name = ISNULL(SP06.Description'+@U+', ''''),  
   A.Spec07Name = ISNULL(SP07.Description'+@U+', ''''),  
   A.Spec08Name = ISNULL(SP08.Description'+@U+', ''''),  
   A.Spec09Name = ISNULL(SP09.Description'+@U+', ''''),  
   A.Spec10Name = ISNULL(SP10.Description'+@U+', '''')  
 FROM #D06P3911_D06T3900 A  
 LEFT JOIN D07T1410 SP01 WITH(NOLOCK) ON SP01.SpecTypeID = ''01'' AND SP01.SpecID = A.Spec01ID  
 LEFT JOIN D07T1410 SP02 WITH(NOLOCK) ON SP02.SpecTypeID = ''02'' AND SP02.SpecID = A.Spec02ID  
 LEFT JOIN D07T1410 SP03 WITH(NOLOCK) ON SP03.SpecTypeID = ''03'' AND SP03.SpecID = A.Spec03ID  
 LEFT JOIN D07T1410 SP04 WITH(NOLOCK) ON SP04.SpecTypeID = ''04'' AND SP04.SpecID = A.Spec04ID  
 LEFT JOIN D07T1410 SP05 WITH(NOLOCK) ON SP05.SpecTypeID = ''05'' AND SP05.SpecID = A.Spec05ID  
 LEFT JOIN D07T1410 SP06 WITH(NOLOCK) ON SP06.SpecTypeID = ''06'' AND SP06.SpecID = A.Spec06ID  
 LEFT JOIN D07T1410 SP07 WITH(NOLOCK) ON SP07.SpecTypeID = ''07'' AND SP07.SpecID = A.Spec07ID  
 LEFT JOIN D07T1410 SP08 WITH(NOLOCK) ON SP08.SpecTypeID = ''08'' AND SP08.SpecID = A.Spec08ID  
 LEFT JOIN D07T1410 SP09 WITH(NOLOCK) ON SP09.SpecTypeID = ''09'' AND SP09.SpecID = A.Spec09ID  
 LEFT JOIN D07T1410 SP10 WITH(NOLOCK) ON SP10.SpecTypeID = ''10'' AND SP10.SpecID = A.Spec10ID  
  
 ----ID:280245  
 UPDATE  A  
 SET   A.ProductName = A1.InventoryNameU  
    ,A.ProductShortName = A1.ShortNameU  
 FROM  #D06P3911_D06T3900 A  
 INNER JOIN D07T0002 A1 ON A.ProductID = A1.InventoryID  
  
 SELECT  *  
 FROM  #D06P3911_D06T3900  
 ORDER BY OBatchID, OrderNum, OTransID, InventoryID, LocationNo  
   
 DROP TABLE #D06P3911_D06T3900  
 '  
  
--PRINT @SQL1  
--PRINT @SQL2  
--PRINT @SQL3  
--PRINT @SQL4  
--PRINT @SQL5  
  
EXEC (@SQL1 + @SQL2 +@SQL3 + @SQL4 + @SQL5)  
  
---- Modified on 18/10/2013 by HIEN DUY: Chi xoa bang tam o mode ke thua (ID 59717)  
-- Modified on 14/08/2012 by Nguyen Xuan Tien: Bo sung xoa bang tam D06T3900   
DELETE FROM D06T3900   
WHERE  HostName = Host_Name()   
   AND UserID = @UserID  
   AND IsInherit = 0  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
