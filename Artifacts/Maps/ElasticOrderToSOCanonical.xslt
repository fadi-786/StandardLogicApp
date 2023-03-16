<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0 userCSharp" version="1.0" xmlns:nsPayment="http://Pat.Azure.Canon.Schema.Common.Payment_3_0" xmlns:nsAddress="http://Pat.Azure.Canon.Schema.Common.Address_3_0" xmlns:nsHeader="http://Pat.Azure.Canon.Schema.Common.Header_3_0" xmlns:ns0="http://Pat.BizTalk.Canon.Schemas.SO.SalesOrderCanon_3_0" xmlns:s0="http://Pat.Azure.WholeSale.Schema" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:WholesaleOrder" />
  </xsl:template>
  <xsl:template match="/s0:WholesaleOrder">
    <xsl:variable name="var:v2" select="userCSharp:StringTrimLeft(&quot;1&quot;)" />
    <xsl:variable name="var:v4" select="userCSharp:StringFind(string(Header/ExternalSystemOrderNo/text()) , &quot;XML&quot;)" />
    <xsl:variable name="var:v5" select="userCSharp:LogicalEq(string($var:v4) , &quot;1&quot;)" />
    <xsl:variable name="var:v7" select="string(Header/ExternalSystemOrderNo/text())" />
    <xsl:variable name="var:v8" select="userCSharp:StringFind($var:v7 , &quot;ELA&quot;)" />
    <xsl:variable name="var:v9" select="userCSharp:LogicalEq(string($var:v8) , &quot;1&quot;)" />
    <xsl:variable name="var:v11" select="string(Header/CatalogKey/text())" />
    <xsl:variable name="var:v23" select="userCSharp:DateCurrentDate()" />
    <xsl:variable name="var:v25" select="userCSharp:StringTrimLeft(&quot; &quot;)" />
    <ns0:SalesOrders>
      <SalesOrder>
        <OrderHeader>
          <xsl:variable name="var:v1" select="userCSharp:ReturnCountryId(string(Header/CatalogKey/text()))" />
          <CompanyID>
            <xsl:value-of select="$var:v1" />
          </CompanyID>
          <CustomerSoldToID>
            <xsl:value-of select="Header/CustomerNumber/text()" />
          </CustomerSoldToID>
          <CustomerStatus>
            <xsl:value-of select="$var:v2" />
          </CustomerStatus>
          <xsl:variable name="var:v3" select="userCSharp:SetGUID()" />
          <OrderInitId>
            <xsl:value-of select="$var:v3" />
          </OrderInitId>
          <OrderDateValidUntil>
            <xsl:value-of select="Header/Deadline/text()" />
          </OrderDateValidUntil>
          <OrderSourceCode>
            <xsl:value-of select="Header/CatalogKey/text()" />
          </OrderSourceCode>
          <OrderExternalSystemID>
            <xsl:value-of select="Header/ExternalSystemOrderNo/text()" />
          </OrderExternalSystemID>
          <OrderName>
            <xsl:value-of select="Header/OrderName/text()" />
          </OrderName>
          <OrderPONumberID>
            <xsl:value-of select="Header/PONo/text()" />
          </OrderPONumberID>
          <xsl:if test="string($var:v5)='true'">
            <xsl:variable name="var:v6" select="userCSharp:StringConcat(&quot;XML&quot;)" />
            <OrderType>
              <xsl:value-of select="$var:v6" />
            </OrderType>
          </xsl:if>
          <xsl:if test="string($var:v9)='true'">
            <xsl:variable name="var:v10" select="userCSharp:StringConcat(&quot;B2B&quot;)" />
            <OrderType>
              <xsl:value-of select="$var:v10" />
            </OrderType>
          </xsl:if>
          <xsl:variable name="var:v12" select="userCSharp:myShipDate($var:v11 , string(Header/ShipDate/text()))" />
          <OrderShipRequestDate>
            <xsl:value-of select="$var:v12" />
          </OrderShipRequestDate>
          <xsl:if test="string($var:v9)='true'">
            <xsl:variable name="var:v13" select="userCSharp:StringConcat(&quot;Journal&quot;)" />
            <OrderSalesType>
              <xsl:value-of select="$var:v13" />
            </OrderSalesType>
          </xsl:if>
          <xsl:variable name="var:v14" select="userCSharp:ReturnCountryId($var:v11)" />
          <xsl:variable name="var:v15" select="userCSharp:LogicalEq(string($var:v14) , &quot;4000&quot;)" />
          <xsl:if test="string($var:v15)='true'">
            <xsl:variable name="var:v16" select="userCSharp:StringTrimLeft(&quot; &quot;)" />
            <ShipToMethod>
              <xsl:value-of select="$var:v16" />
            </ShipToMethod>
          </xsl:if>
          <xsl:variable name="var:v17" select="userCSharp:LogicalNot(string($var:v15))" />
          <xsl:if test="string($var:v17)='true'">
            <xsl:variable name="var:v18" select="Header/ShipMethodKey/text()" />
            <ShipToMethod>
              <xsl:value-of select="$var:v18" />
            </ShipToMethod>
          </xsl:if>
          <xsl:variable name="var:v19" select="userCSharp:ReturnEmptyShippingTotal()" />
          <ShipToShippingTotal>
            <xsl:value-of select="$var:v19" />
          </ShipToShippingTotal>
          <SalesPool>
            <xsl:value-of select="Header/PoolId/text()" />
          </SalesPool>
          <WholesaleCatalogKey>
            <xsl:value-of select="Header/CatalogKey/text()" />
          </WholesaleCatalogKey>
          <References>
<Reference>
  <Name>CustomerEmail</Name>
  <Value><xsl:value-of select="Header/CustomerEmail/text()" /></Value>
</Reference>
<Reference>
  <Name>AuthorName</Name>
  <Value><xsl:value-of select="Header/AuthorName/text()" /></Value>
</Reference>
<Reference>
  <Name>PATRMAINTEGRATIONACTION</Name>
  <Value></Value>
</Reference>
</References>
        </OrderHeader>
        <Addresses>
          <nsAddress:Address xmlns:nsAddress="http://Pat.Azure.Canon.Schema.Common.Address_3_0">
            <xsl:variable name="var:vv14" select="userCSharp:getGUID()" />
            <AddressOrderInitId>
              <xsl:value-of select="$var:vv14" />
            </AddressOrderInitId>
              <AddressCity>
                <xsl:value-of select="Header/PaymentCity/text()" />
              </AddressCity>
              <AddressCountry>
                <xsl:value-of select="Header/PaymentCountry/text()" />
              </AddressCountry>
              <AddressIsBilling>
                <xsl:value-of select="1" />
              </AddressIsBilling>
              <AddressDropShip>
                <xsl:value-of select="0" />
              </AddressDropShip>       
            <AddressLineNumber>
              <xsl:value-of select="1" />
            </AddressLineNumber>
              <AddressType>
                <xsl:value-of select="'Invoice'" />
              </AddressType>
              <AddressState>
                <xsl:value-of select="Header/PaymentStateOrCountry/text()" />
              </AddressState>
             <xsl:variable name="var:vv3" select="Header/PaymentAddress1/text()" />
             <Address>
            <xsl:choose>
              <xsl:when test="Header/PaymentAddress2 !=''">              
               <xsl:variable name="var:vv4" select="concat(Header/PaymentAddress1/text(),'&#xA;',Header/PaymentAddress2/text())" />
                <xsl:if test="Header/PaymentAddress3 =''">
                  <xsl:value-of select="$var:vv4" />                
                </xsl:if>
              <xsl:if test="Header/PaymentAddress3/text() !=''">
                 <xsl:variable name="var:vv5" select="concat($var:vv4,'&#xA;',Header/PaymentAddress3/text())" />
              <xsl:value-of select="$var:vv5" />
              </xsl:if>
               </xsl:when>
               <xsl:otherwise>
               <xsl:value-of select="$var:vv3" />
               </xsl:otherwise>
            </xsl:choose> 
               </Address>
              <AddressPostalCode>
                <xsl:value-of select="Header/PaymentPostal/text()" />
              </AddressPostalCode>
              <AddressLastName>
                <xsl:value-of select="Header/NameonCard/text()" />
              </AddressLastName> 
          </nsAddress:Address>
          <xsl:if test="Header/DropShip/text()='Y'">
            <nsAddress:Address xmlns:nsAddress="http://Pat.Azure.Canon.Schema.Common.Address_3_0">
                 <xsl:variable name="var:vv14" select="userCSharp:getGUID()" />
            <AddressOrderInitId>
              <xsl:value-of select="$var:vv14" />
            </AddressOrderInitId>
              <AddressCity>
                <xsl:value-of select="Header/ShiptoCity/text()" />
              </AddressCity>
              <AddressCountry>
                <xsl:value-of select="Header/ShiptoCountry/text()" />
              </AddressCountry>
              <AddressIsBilling>
                <xsl:value-of select="0" />
              </AddressIsBilling>
              <AddressDropShip>
                <xsl:value-of select="1" />
              </AddressDropShip>       
            <AddressLineNumber>
              <xsl:value-of select="2" />
            </AddressLineNumber>
              <AddressType>
                <xsl:value-of select="'Delivery'" />
              </AddressType>
              <AddressState>
                <xsl:value-of select="Header/ShiptoState/text()" />
              </AddressState>
             <xsl:variable name="var:vv3" select="Header/ShiptoAddress1/text()" />
             <Address>
            <xsl:choose>
              <xsl:when test="Header/ShiptoAddress2 !=''">              
               <xsl:variable name="var:vv4" select="concat(Header/ShiptoAddress1/text(),'&#xA;',Header/ShiptoAddress2/text())" />
                <xsl:if test="Header/ShiptoAddress3 =''">
                  <xsl:value-of select="$var:vv4" />                
                </xsl:if>
              <xsl:if test="Header/PaymentAddress3/text() !=''">
                 <xsl:variable name="var:vv5" select="concat($var:vv4,'&#xA;',Header/ShiptoAddress3/text())" />
              <xsl:value-of select="$var:vv5" />
              </xsl:if>
               </xsl:when>
               <xsl:otherwise>
               <xsl:value-of select="$var:vv3" />
               </xsl:otherwise>
            </xsl:choose> 
               </Address>
              <AddressPostalCode>
                <xsl:value-of select="Header/ShiptoPostal/text()" />
              </AddressPostalCode>
              <AddressLastName>
                <xsl:value-of select="Header/AttentionToforDropShip/text()" />
              </AddressLastName> 
            </nsAddress:Address>
          </xsl:if>
        </Addresses>
        <Items>
          <xsl:for-each select="LineItem">
            <xsl:variable name="var:v20" select="position()" />
            <xsl:variable name="var:v22" select="userCSharp:StringConcat(&quot;1st&quot;)" />
            <Item>
              <xsl:variable name="var:v21" select="userCSharp:getGUID()" />
              <ItemOrderInitId>
                <xsl:value-of select="$var:v21" />
              </ItemOrderInitId>
              <ItemLineNumber>
                <xsl:value-of select="$var:v20" />
              </ItemLineNumber>
              <ItemConfig>
                <xsl:value-of select="$var:v22" />
              </ItemConfig>
              <ItemColorCode>
                <xsl:value-of select="ColorID/text()" />
              </ItemColorCode>
              <ItemSizeCode>
                <xsl:value-of select="Size/text()" />
              </ItemSizeCode>
              <ItemStyleNo>
                <xsl:value-of select="StyleNumber/text()" />
              </ItemStyleNo>
              <ItemSalePrice>
                <xsl:value-of select="UnitPrice/text()" />
              </ItemSalePrice>
              <ItemQuantity>
                <xsl:value-of select="Quantity/text()" />
              </ItemQuantity>
              <ItemSKU>
                <xsl:value-of select="UPC/text()" />
              </ItemSKU>
            </Item>
          </xsl:for-each>
        </Items>
        <Payments>
          <nsPayment:Payment>
            <PaymentAuthDate>
              <xsl:value-of select="$var:v23" />
            </PaymentAuthDate>
            <PaymentCryptogram>
              <xsl:value-of select="Header/PSPReference/text()" />
            </PaymentCryptogram>
            <PaymentExpirationMonth>
              <xsl:value-of select="Header/ExpMonth/text()" />
            </PaymentExpirationMonth>
            <xsl:variable name="var:v24" select="userCSharp:PadZeros(string(Header/ExpYear/text()))" />
            <PaymentExpirationYear>
              <xsl:value-of select="$var:v24" />
            </PaymentExpirationYear>
            <PaymentLastFour>
              <xsl:value-of select="Header/CCLast4/text()" />
            </PaymentLastFour>
            <PaymentLowValueToken>
              <xsl:value-of select="$var:v25" />
            </PaymentLowValueToken>
            <PaymentNameOnCard>
              <xsl:value-of select="Header/NameonCard/text()" />
            </PaymentNameOnCard>
            <xsl:variable name="var:v26" select="userCSharp:getGUID()" />
            <PaymentOrderIntId>
              <xsl:value-of select="$var:v26" />
            </PaymentOrderIntId>
            <PaymentPrimaryAccountNum>
              <xsl:value-of select="Header/ShopperReferenceID/text()" />
            </PaymentPrimaryAccountNum>
            <PaymentToken>
              <xsl:value-of select="Header/TokenID/text()" />
            </PaymentToken>
          </nsPayment:Payment>
        </Payments>
      </SalesOrder>
    </ns0:SalesOrders>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp"><![CDATA[
public int StringFind(string str, string strFind)
{
	if (str == null || strFind == null || strFind == "")
	{
		return 0;
	}
	return (str.IndexOf(strFind) + 1);
}


public bool LogicalEq(string val1, string val2)
{
	bool ret = false;
	double d1 = 0;
	double d2 = 0;
	if (IsNumeric(val1, ref d1) && IsNumeric(val2, ref d2))
	{
		ret = d1 == d2;
	}
	else
	{
		ret = String.Compare(val1, val2, StringComparison.Ordinal) == 0;
	}
	return ret;
}


public string StringConcat(string param0)
{
   return param0;
}


	public static string myShipDate(string catalogKey,string shipDate)
{
 
    
string salesPool=catalogKey.Split('_')[1] ;
string areaId=catalogKey.Split('_')[2] ;
  DateTime dateToday = DateTime.Today;
    string todDate =  dateToday.ToString("yyyy-MM-dd");;
    string tomDate =  dateToday.AddDays(1).ToString("yyyy-MM-dd");
		Console.WriteLine(todDate);
		Console.WriteLine(tomDate);
 
    if ((areaId == "1001" || areaId == "1007" ) && (tomDate == shipDate) && (salesPool  == "ASAP" || (salesPool == "DM")))
		{
                 return  todDate;
    }
     else {
             if (shipDate != "")
            {
                //shipDate = shipDate.Insert(6, "-");
                //shipDate = shipDate.Insert(4, "-");
                return shipDate;                            
            }
            else
                return "";
    }
	
}

public string StringTrimLeft(string str)
{
	if (str == null)
	{
		return "";
	}
	return str.TrimStart(null);
}


public string globalGuid;

public string SetGUID() 
{ 
     
     globalGuid= System.Guid.NewGuid().ToString(); 
return globalGuid;

} 

public string getGUID()
{
   return globalGuid;
}

public string ReturnEmptyShippingTotal() 
{ 
     
    return "";

} 

public string ReturnCountryId(string orderNo) 
{ 
     
  if(orderNo.ToLower().Contains("1007"))
		
		return "1007";

		else if(orderNo.ToLower().Contains("1001"))
		
		return "1001";

                                else if(orderNo.ToLower().Contains("3000"))
		
		return "3000";
                                else if(orderNo.ToLower().Contains("4000"))
		
		return "4000";
else return "";

} 

public bool LogicalNot(string val)
{
	return !ValToBool(val);
}


public string DateCurrentDate()
{
	DateTime dt = DateTime.Now;
	return dt.ToString("yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture);
}


// D365 requires 4 digit years so add "20" if it's a two digit year.

public string PadZeros(string param1)
{
	if (param1.Length == 2)
                      return "20" + param1;
               else
                      return param1;
}


public bool IsNumeric(string val)
{
	if (val == null)
	{
		return false;
	}
	double d = 0;
	return Double.TryParse(val, System.Globalization.NumberStyles.AllowThousands | System.Globalization.NumberStyles.Float, System.Globalization.CultureInfo.InvariantCulture, out d);
}

public bool IsNumeric(string val, ref double d)
{
	if (val == null)
	{
		return false;
	}
	return Double.TryParse(val, System.Globalization.NumberStyles.AllowThousands | System.Globalization.NumberStyles.Float, System.Globalization.CultureInfo.InvariantCulture, out d);
}

public bool ValToBool(string val)
{
	if (val != null)
	{
		if (string.Compare(val, bool.TrueString, StringComparison.OrdinalIgnoreCase) == 0)
		{
			return true;
		}
		if (string.Compare(val, bool.FalseString, StringComparison.OrdinalIgnoreCase) == 0)
		{
			return false;
		}
		val = val.Trim();
		if (string.Compare(val, bool.TrueString, StringComparison.OrdinalIgnoreCase) == 0)
		{
			return true;
		}
		if (string.Compare(val, bool.FalseString, StringComparison.OrdinalIgnoreCase) == 0)
		{
			return false;
		}
		double d = 0;
		if (IsNumeric(val, ref d))
		{
			return (d > 0);
		}
	}
	return false;
}


]]></msxsl:script>
</xsl:stylesheet>