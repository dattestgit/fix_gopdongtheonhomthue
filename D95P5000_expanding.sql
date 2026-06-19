  
  
  
-- <Summary>  
---- Man hinh chon hoa don dau vao  
-- <Param>  
----   
-- <Return>  
----   
-- <Reference>  
----   
-- <History>  
---- Create on 19/08/2025 by TIENHUNG (300083): Man hinh chon hoa don dau vao  
----   
---- Modified on 09/09/2025 by THAONGUYEN (300281): Bo sung @FormCall = 'D01F2080' tai @DataType = 'ReturnData'  
---- Modified on 19/09/2025 by THAONGUYEN (300280): Bo sung @FormCall = 'D04F2325', 'D04F2330' tai @DataType = 'ReturnData'  
---- Modified on 17/11/2025 by TIENHUNG (303115): Bo sung InvoiceType, RelatedInvoiceNo, IsValidInvoice  
---- Modified on 18/11/2025 by TIENHUNG (300279): Bo sung @FormCall = 'D06F2281'  
---- Modified on 01/12/2025 by TIENHUNG (300277): Bo sung @FormCall = 'D06F2130'  
---- Modified on 08/01/2026 by TIENHUNG (304926): Bo sung sort RefDate, RefNo  
---- Modified on 20/01/2026 by TIENHUNG (303534): Bo sung load tat ca hoa don khi goi tu man hinh D95F5002  
---- Modified on 01/12/2025 by TIENHUNG (303043): Bo sung @FormCall = 'D06F2260'  
---- Modified on 06/02/2026 by THAONGUYEN (305059): Bo sung @KeyID, @UserID, @HostID; @DataType = 'CheckData'  
---- Modified on 05/03/2026 by TIENHUNG (307493): Dieu chinh load HDDV  
---- Modified on 10/03/2026 by TIENHUNG (307441): Bo sung headclick cot chon  
---- Modified on 23/04/2026 by TIENHUNG (308925): Bo sung @FormCall = 'D06F3510'  
---- Modified on 23/04/2026 by THAONGUYEN (307766): Bo sung @FormCall = 'D01F2070'  
---- Modified on 21/05/2026 by THAONGUYEN (313410): Bo sung an hoa don da chon khi chua luu goi tu D01  
-- <Example>  
---- EXEC D95P5000 'DIGINET', '', 'BottomGrid', 0, '08/2025', '08/2025', 1, '08/19/2025', '08/19/2025', '', '', '', '', '', '', '030268180600000055', ''  
ALTER PROCEDURE D95P5000  
(   
  
  @DivisionID  VARCHAR(50),  
  @FormCall  VARCHAR(50),   
  @DataType  VARCHAR(50),   
  @IsPeriod  TINYINT,    
  @PeriodFrom  VARCHAR(50),  
  @PeriodTo  VARCHAR(50),  
  @IsDate   TINYINT,  
  @DateFrom  DATETIME,  
  @DateTo   DATETIME,  
  @SerialNo  VARCHAR(50),  
  @InvoiceNo  VARCHAR(50),  
  @TaxCode  VARCHAR(50),  
  @ObjectTypeID VARCHAR(50),  
  @ObjectID  VARCHAR(50),  
  @ObjectName  NVARCHAR(500),  
  @VoucherID  VARCHAR(5000),  
  @TransTypeID VARCHAR(50),  
  @KeyID   VARCHAR(50) = '',   
  @UserID   VARCHAR(50) = '',  
  @HostID   VARCHAR(50) = '',  
  @IsMultiInvoice BIT = 0,  
  @IsGroupingByTaxGroup  TINYINT = 0   
)   
AS   
SET NOCOUNT ON  
  
DECLARE  @sSQL NVARCHAR(MAX)  
  
DECLARE  @TranMonthFrom  TINYINT = 0,  
   @TranYearFrom  SMALLINT = 0,  
   @TranMonthTo  TINYINT = 0,  
   @TranYearTo   SMALLINT = 0  
  
SELECT  @TranMonthFrom = LEFT(@PeriodFrom,2),  
   @TranYearFrom = RIGHT(@PeriodFrom,4),  
   @TranMonthTo = LEFT(@PeriodTo,2),  
   @TranYearTo = RIGHT(@PeriodTo,4)  
  
DECLARE  @CurrencyID VARCHAR(20)  
  
SELECT  @CurrencyID = BaseCurrencyID  
FROM  D91T0025 WITH(NOLOCK)  
  
IF @DataType = 'AboveGrid'  
BEGIN  
  SET @sSQL = N'  
  
  CREATE TABLE #D95T5000  
  (   
   RefNo   VARCHAR(100),  
   Serial  VARCHAR(100),  
   VATNo   VARCHAR(50)  
  )  
  
  INSERT INTO #D95T5000  
  SELECT  RefNo, Serial, VATNo  
  FROM  D90T0002 WITH(NOLOCK)  
  WHERE  1 = 1  
     '+CASE WHEN @IsPeriod = 0 THEN '' ELSE ' AND MONTH(RefDate) + YEAR(RefDate) * 100 BETWEEN ' + LTRIM(STR(@TranMonthFrom + @TranYearFrom * 100)) + ' AND ' + LTRIM(STR(@TranMonthTo + @TranYearTo * 100)) END + '  
     '+CASE WHEN @IsDate = 0 THEN '' ELSE  ' AND CONVERT(VARCHAR(10),RefDate,112) BETWEEN ''' + CONVERT(VARCHAR(10), @DateFrom, 112) + ''' AND  ''' + CONVERT(VARCHAR(10), @DateTo, 112) + '''' END + '  
  UNION    
  SELECT  RefNo, SeriNo AS Serial, VATNo  
  FROM  D06T2010 WITH(NOLOCK)  
  WHERE  PostedD90 = 0  
     '+CASE WHEN @IsPeriod = 0 THEN '' ELSE ' AND MONTH(RefDate) + YEAR(RefDate) * 100 BETWEEN ' + LTRIM(STR(@TranMonthFrom + @TranYearFrom * 100)) + ' AND ' + LTRIM(STR(@TranMonthTo + @TranYearTo * 100)) END + '  
     '+CASE WHEN @IsDate = 0 THEN '' ELSE  ' AND CONVERT(VARCHAR(10),RefDate,112) BETWEEN ''' + CONVERT(VARCHAR(10), @DateFrom, 112) + ''' AND  ''' + CONVERT(VARCHAR(10), @DateTo, 112) + '''' END + '  
  UNION    
  SELECT  RefNo, Serial, VATNo  
  FROM  D01T5000 WITH(NOLOCK)  
  WHERE  IsPostedD90 = 0  
     '+CASE WHEN @IsPeriod = 0 THEN '' ELSE ' AND MONTH(RefDate) + YEAR(RefDate) * 100 BETWEEN ' + LTRIM(STR(@TranMonthFrom + @TranYearFrom * 100)) + ' AND ' + LTRIM(STR(@TranMonthTo + @TranYearTo * 100)) END + '  
     '+CASE WHEN @IsDate = 0 THEN '' ELSE ' AND CONVERT(VARCHAR(10),RefDate,112) BETWEEN ''' + CONVERT(VARCHAR(10), @DateFrom, 112) + ''' AND  ''' + CONVERT(VARCHAR(10), @DateTo, 112) + '''' END + '  
  
  ---- Bang tam chua du lieu da check chon truoc do  
  SELECT  DISTINCT T91.Key01ID AS VoucherID  
  INTO  #D95P5000_VoucherID  
  FROM  D91T9009 T91 WITH(NOLOCK)  
  WHERE  1 = '+CASE WHEN @FormCall IN ('D01F2080','D01F2070') THEN '1' ELSE '0' END+'  
    AND T91.UserID = '''+@UserID+'''   
    AND T91.HostID = '''+@HostID+'''   
    AND T91.FormID = ''D95F5000''   
    AND T91.Key02ID = '''+@FormCall+'''  
    AND ISNULL(T91.Key03ID, '''') <> ''''  
  
  SELECT  CONVERT(BIT, 0) AS IsSelect,  
     T00.VoucherID,  
     T00.SerialNo AS SerialNo,   
     T00.RefNo AS InvoiceNo,   
     T00.RefDate AS InvoiceDate,  
     T00.ObjectName AS SellerName,  
     T00.ObjectAddress AS SellerAddress,  
     T00.TaxCode AS SellerTaxCode,  
     T00.TelNumber AS SellerTelNo,  
     ISNULL(T00.CurrencyID, '''+@CurrencyID+N''') AS CurrencyID,  
     CASE WHEN T00.ExchangeRate = 0 THEN 1 ELSE T00.ExchangeRate END AS ExchangeRate,  
     T00.PaymentMethodName AS PaymentMethod,  
     T00.TotalCmount AS TotalOAmount,  
     T00.TotalCvat AS TotalVATOAmount,  
     T00.TotalAmountAfterTax AS TotalPamentOAmount,  
     CASE WHEN ISNULL(T.RefNo,'''') = '''' THEN CONVERT(BIT, 0) ELSE CONVERT(BIT, 1) END AS IsUsed,  
     CASE T00.RefType WHEN 1 THEN N''Hóa đơn gốc''  
          WHEN 2 THEN N''Hóa đơn thay thế''  
          WHEN 3 THEN N''Hóa đơn điều chỉnh''  
          WHEN 4 THEN N''Hóa đơn bị thay thế''  
          WHEN 5 THEN N''Hóa đơn bị điều chỉnh''  
          WHEN 6 THEN N''Hóa đơn hủy''  
          ELSE N'''' END AS InvoiceType,  
     T00.RelatedRefNo AS RelatedInvoiceNo,  
     CONVERT(BIT, T00.StatusID) AS IsValidInvoice,  
     CONVERT(TINYINT, 0) AS IsReadOnly  
  FROM  D95T5000 T00 WITH(NOLOCK)  
  LEFT JOIN #D95T5000 T  
    ON T00.RefNo  = T.RefNo  
      AND T00.SerialNo = T.Serial  
      AND T00.TaxCode  = T.VATNo  
  LEFT JOIN #D95P5000_VoucherID T95  
    ON T00.VoucherID = T95.VoucherID  
  WHERE  '+CASE WHEN @FormCall = 'D95F5002' THEN '1 = 1' ELSE 'ISNULL(T.RefNo,'''') = ''''' END+'  
     '+CASE WHEN @SerialNo = '' THEN '' ELSE 'AND T00.SerialNo = '''+@SerialNo+'''' END+'  
     '+CASE WHEN @InvoiceNo = '' THEN '' ELSE 'AND T00.RefNo = '''+@InvoiceNo+'''' END+'  
     '+CASE WHEN @TaxCode = '' THEN '' ELSE 'AND T00.TaxCode = '''+@TaxCode+'''' END+'  
     '+CASE WHEN @IsPeriod = 0 THEN '' ELSE ' AND MONTH(T00.RefDate) + YEAR(T00.RefDate) * 100 BETWEEN ' + LTRIM(STR(@TranMonthFrom + @TranYearFrom * 100)) + ' AND ' + LTRIM(STR(@TranMonthTo + @TranYearTo * 100)) END + '  
     '+CASE WHEN @IsDate = 0 THEN '' ELSE  ' AND CONVERT(VARCHAR(50),T00.RefDate,112) BETWEEN ''' + CONVERT(VARCHAR(50), @DateFrom, 112) + ''' AND  ''' + CONVERT(VARCHAR(50), @DateTo, 112) + '''' END + '  
     '+CASE WHEN @FormCall = 'D06F2260' THEN 'AND T00.RefType = 3'   
         WHEN @FormCall IN ('D01F2080','D01F2070') THEN ' AND ISNULL(T95.VoucherID, '''') = '''' '  
         ELSE '' END+'   
  GROUP BY T00.VoucherID,  
     T00.SerialNo,   
     T00.RefNo,   
     T00.RefDate,  
     T00.ObjectName,  
     T00.ObjectAddress,  
     T00.TaxCode,  
     T00.TelNumber,  
     T00.CurrencyID,  
     T00.ExchangeRate,  
     T00.PaymentMethodName,  
     T00.RefType,  
     T00.RelatedRefNo,  
     T00.StatusID,  
     T00.TotalCmount,  
     T00.TotalCvat,  
     T00.TotalAmountAfterTax,  
     T.RefNo  
  ORDER BY T00.RefDate, TRY_CONVERT(INT, T00.RefNo)  
  
  DROP TABLE #D95T5000  
  '  
  --PRINT(@sSQL)  
  EXEC(@sSQL)  
  
END  
  
IF @DataType = 'BottomGrid'  
BEGIN  
 SET @IsGroupingByTaxGroup=1
 IF @IsGroupingByTaxGroup =1
 BEGIN
    SET @sSQL = N'  
        SELECT  
            T00.VoucherID,   
            T00.SerialNo,  
            T00.RefNo AS InvoiceNo,  
            T00.RefDate AS InvoiceDate,  
            MAX(T00.TransID) AS TransID,   
            MAX(T00.OrderNum) AS OrderNum,  
            T00.VatGroup, 
			MAX(T00.InventoryName) AS InventoryName,
            MAX(T00.UnitName) AS UnitName,
            SUM(T00.Quantity) AS OQuantity,  
            MAX(T00.UnitPrice) AS UnitPrice,  
            SUM(T00.Amount) AS OAmount,  
            T00.VATRate / 100 AS VATRate,  
            SUM(T00.CVAT) AS VATOAmount,  
            SUM(T00.Amount + T00.CVAT) AS PamentOAmount  
        FROM D95T5000 T00 WITH(NOLOCK)  
		WHERE  '+CASE WHEN @IsMultiInvoice = 0 THEN 'T00.VoucherID = '''+@VoucherID+''''   
				   ELSE 'T00.VoucherID IN (SELECT Key01ID AS VoucherID FROM D91T9009 WHERE UserID = '''+@UserID+''' AND HostID = '''+@HostID+''' AND FormID = ''D95F5000'')' END+'  
        GROUP BY 
            T00.VoucherID,
            T00.SerialNo,
            T00.RefNo,
            T00.RefDate,
            T00.VatGroup,
            T00.VATRate
	  '  
	  --PRINT(@sSQL)  
    EXEC(@sSQL)  
	RETURN   
 END
 ELSE
 BEGIN
    SET @sSQL = N'  
	  SELECT  T00.VoucherID,   
		 T00.SerialNo,  
		 T00.RefNo AS InvoiceNo,  
		 T00.RefDate AS InvoiceDate,  
		 T00.TransID,   
		 T00.OrderNum,  
		 T00.InventoryName,  
		 T00.UnitName,  
		 T00.Quantity AS OQuantity,  
		 T00.UnitPrice,  
		 T00.Amount AS OAmount,  
		 T00.VATRate/100 AS VATRate,  
		 T00.CVAT AS VATOAmount,  
		 T00.Amount + T00.CVAT AS PamentOAmount  
	  FROM  D95T5000 T00 WITH(NOLOCK)  
	  WHERE  '+CASE WHEN @IsMultiInvoice = 0 THEN 'T00.VoucherID = '''+@VoucherID+''''   
				 ELSE 'T00.VoucherID IN (SELECT Key01ID AS VoucherID FROM D91T9009 WHERE UserID = '''+@UserID+''' AND HostID = '''+@HostID+''' AND FormID = ''D95F5000'')' END+'  
	  ORDER BY T00.RefDate, TRY_CONVERT(INT, T00.RefNo), T00.OrderNum  
	  '  
	  --PRINT(@sSQL)  
	  EXEC(@sSQL)     
 END
END  
  
IF @DataType = 'ReturnData'  
BEGIN  
 IF @FormCall = 'D01F2080' OR @FormCall = 'D01F2070'  
 BEGIN   
  SET @sSQL = N'  
  EXEC D01P2030 '''+@DivisionID+''', '''+@UserID+''', '''+@HostID+''', ''84'', '''+@FormCall+''', ''D95F5000'', '''+@TransTypeID+''', '''+@KeyID+'''  
  '  
  --PRINT @sSQL  
  EXEC (@sSQL)  
  
  RETURN  
 END  
  
 IF @FormCall = 'D04F2325'  
 BEGIN  
  SET @sSQL = N'  
  EXEC D04P2326 '''+@DivisionID+''', ''04'', 0, 0, '''', '''', '''', 1, 1, '''', '''', 0, 0, 0, '''', '''', '''+@TransTypeID+''', ''D95F5000'', '''+@VoucherID+'''  
  '  
  --PRINT @sSQL  
  EXEC (@sSQL)  
  
  RETURN  
 END  
  
 IF @FormCall = 'D04F2330'  
 BEGIN  
  SET @sSQL = N'  
  EXEC D04P2331 '''+@DivisionID+''', ''04'', 0, 0, '''', 1, 1, 0, '''', '''+@TransTypeID+''', ''D95F5000'', '''+@VoucherID+'''  
  EXEC D04P2331 '''+@DivisionID+''', ''04'', 0, 0, '''', 2, 1, 0, '''', '''+@TransTypeID+''', ''D95F5000'', '''+@VoucherID+'''  
  '  
  --PRINT @sSQL  
  EXEC (@sSQL)  
  
  RETURN  
 END  
  
 IF @FormCall = 'D06F2150'  
 BEGIN  
  EXEC D06P2158 '', '', @DivisionID, 1, @TransTypeID, 'D95F5000', 0, @VoucherID  
  RETURN  
 END  
 IF @FormCall = 'D06F2281'  
 BEGIN  
  EXEC D06P2281 @DivisionID, '', '', 0, 0, '', 1, 'D95F5000', @TransTypeID, '', 0, @VoucherID  
  RETURN  
 END  

 IF @FormCall = 'D06F2130'  
 BEGIN  
   IF @IsGroupingByTaxGroup=1
	   BEGIN
		EXEC D06P3811 @UserID,@TransTypeID,'D95F5000',@VoucherID,@IsGroupingByTaxGroup 
		RETURN
	   END
   ELSE 
	   BEGIN
		EXEC D06P3911 '', 0, 1, @TransTypeID, '', @VoucherID, 'D95F5000'  
	   END
   RETURN 
 END  

 IF @FormCall = 'D06F2260'  
 BEGIN  
  EXEC D06P2261 '', 1, @TransTypeID, @VoucherID, 'D95F5000'  
  RETURN  
 END  
 IF @FormCall = 'D06F3510'  
 BEGIN  
  EXEC D06P3520 @UserID, @TransTypeID, 'D95F5000', @VoucherID   
  RETURN  
 END  
END  
  
  
IF @DataType = 'CheckData'  
BEGIN  
 SELECT 0 AS Status, N'' AS Message, 0 AS MsgAsk, 1 FontMessage  
 RETURN  
END  
  
  
