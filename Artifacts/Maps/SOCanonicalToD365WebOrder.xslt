<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:input="urn:my-input-variables" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s1 s0 s2 s3 userCSharp" version="1.0" xmlns:s1="http://Pat.Azure.Canon.Schema.Common.Payment_3_0" xmlns:s0="http://Pat.Azure.Canon.Schema.Common.Address_3_0" xmlns:s2="http://Pat.Azure.Canon.Schema.Common.Header_3_0" xmlns:s3="http://Pat.BizTalk.Canon.Schemas.SO.SalesOrderCanon_3_0" xmlns:ns0="http://Pat.Azure.D365WebOrder.Schema" xmlns:userCSharp="http://schemas.microsoft.com/BizTalk/2003/userCSharp">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:param name="input:ConnString"></xsl:param>
  <xsl:template match="/">
    <xsl:apply-templates select="/s3:SalesOrders" />
  </xsl:template>
  <xsl:template match="/s3:SalesOrders">
    <ns0:Document>
      <xsl:for-each select="SalesOrder">
        <xsl:variable name="var:v6" select="userCSharp:LogicalExistence(boolean(OrderHeader/OrderClassCode))" />
        <xsl:variable name="var:v8" select="userCSharp:LogicalNot(string($var:v6))" />
        <xsl:variable name="var:v10" select="userCSharp:StringTrimLeft(&quot; &quot;)" />
        <xsl:variable name="var:v20" select="userCSharp:LogicalEq(string(References/Reference/Name/text()) , &quot;destination_zip&quot;)" />
        <xsl:variable name="var:v22" select="userCSharp:LogicalExistence(boolean(References/Reference))" />
        <xsl:variable name="var:v23" select="userCSharp:LogicalNot(string($var:v22))" />
        <patWebOrderINTTableEntity>
          <PATWEBORDERINTID>
            <xsl:value-of select="OrderHeader/OrderInitId/text()" />
          </PATWEBORDERINTID>
          <AFFILIATEDID>
            <xsl:value-of select="OrderHeader/OrderAffiliateId/text()" />
          </AFFILIATEDID>
          <xsl:for-each select="OrderHeader/References">
            <xsl:for-each select="Reference">
              <xsl:variable name="var:v1" select="userCSharp:LogicalEq(string(Name/text()) , &quot;CustomerEmail&quot;)" />
              <xsl:if test="string($var:v1)='true'">
                <xsl:variable name="var:v2" select="Value/text()" />
                <B2BAUTHOREMAIL>
                  <xsl:value-of select="$var:v2" />
                </B2BAUTHOREMAIL>
              </xsl:if>
            </xsl:for-each>
          </xsl:for-each>
          <xsl:for-each select="OrderHeader/References">
            <xsl:for-each select="Reference">
              <xsl:variable name="var:v3" select="string(Name/text())" />
              <xsl:variable name="var:v4" select="userCSharp:LogicalEq($var:v3 , &quot;AuthorName&quot;)" />
              <xsl:if test="string($var:v4)='true'">
                <xsl:variable name="var:v5" select="Value/text()" />
                <B2BORDERAUTHOR>
                  <xsl:value-of select="$var:v5" />
                </B2BORDERAUTHOR>
              </xsl:if>
            </xsl:for-each>
          </xsl:for-each>
          <BILLINGPHONE>
            <xsl:value-of select="OrderHeader/CustomerPhoneBilling/text()" />
          </BILLINGPHONE>
          <BIRTHDAY>
            <xsl:value-of select="OrderHeader/CustomerBirthday/text()" />
          </BIRTHDAY>
          <CATALOGNUMBER>
            <xsl:value-of select="OrderHeader/WholesaleCatalogKey/text()" />
          </CATALOGNUMBER>
          <CHANNEL>
            <xsl:value-of select="OrderHeader/ChannelID/text()" />
          </CHANNEL>
          <xsl:if test="string($var:v6)='true'">
            <xsl:variable name="var:v7" select="OrderHeader/OrderClassCode/text()" />
            <CLASSCODE>
              <xsl:value-of select="$var:v7" />
            </CLASSCODE>
          </xsl:if>
          <xsl:if test="string($var:v8)='true'">
            <xsl:variable name="var:v9" select="userCSharp:StringTrimLeft(&quot; &quot;)" />
            <CLASSCODE>
              <xsl:value-of select="$var:v9" />
            </CLASSCODE>
          </xsl:if>
          <COMPANYID>
            <xsl:value-of select="OrderHeader/CompanyID/text()" />
          </COMPANYID>
          <CURRENCYCODE>
            <xsl:value-of select="OrderHeader/OrderCurrency/text()" />
          </CURRENCYCODE>
          <CUSTACCOUNT>
            <xsl:value-of select="OrderHeader/CustomerSoldToID/text()" />
          </CUSTACCOUNT>
          <CUSTEXTERNALID>
            <xsl:value-of select="OrderHeader/CustomerExternalSystemID/text()" />
          </CUSTEXTERNALID>
          <CUSTOMERREF>
            <xsl:value-of select="$var:v10" />
          </CUSTOMERREF>
          <DEADLINE>
            <xsl:value-of select="OrderHeader/OrderDateValidUntil/text()" />
          </DEADLINE>
          <DELIVERYDATE>
            <xsl:value-of select="OrderHeader/OrderDeliveryDate/text()" />
          </DELIVERYDATE>
          <DELIVERYTIME>
            <xsl:value-of select="OrderHeader/OrderDeliveryTime/text()" />
          </DELIVERYTIME>
          <xsl:variable name="var:v11" select="userCSharp:GetShipVia(string(OrderHeader/ShipToMethod/text()))" />
          <DLVMODEID>
            <xsl:value-of select="$var:v11" />
          </DLVMODEID>
          <EMAIL>
            <xsl:value-of select="OrderHeader/CustomerEmail/text()" />
          </EMAIL>
          <FIRSTNAME>
            <xsl:value-of select="OrderHeader/CustomerFirstName/text()" />
          </FIRSTNAME>
          <FIRSTNAMEKANA>
            <xsl:value-of select="OrderHeader/CustomerFirstNameKana/text()" />
          </FIRSTNAMEKANA>
          <GENDER>
            <xsl:value-of select="OrderHeader/CustomerGender/text()" />
          </GENDER>
          <GIFTMESSAGE>
            <xsl:value-of select="OrderHeader/GiftMessage/text()" />
          </GIFTMESSAGE>
          <xsl:variable name="var:v12" select="userCSharp:InitCumulativeConcat(0)" />
          <xsl:for-each select="/s3:SalesOrders/SalesOrder/Items/Item">
            <xsl:variable name="var:v13" select="userCSharp:AddToCumulativeConcat(0,string(Replacement/text()),&quot;1000&quot;)" />
          </xsl:for-each>
          <xsl:variable name="var:v14" select="userCSharp:GetCumulativeConcat(0)" />
          <xsl:variable name="var:v15" select="userCSharp:StringFind(string($var:v14) , &quot;exchange&quot;)" />
          <xsl:variable name="var:v16" select="userCSharp:LogicalGt(string($var:v15) , &quot;0&quot;)" />
          <xsl:if test="string($var:v16)='true'">
            <xsl:variable name="var:v17" select="&quot;1&quot;" />
            <HASREPLACEMENT>
              <xsl:value-of select="$var:v17" />
            </HASREPLACEMENT>
          </xsl:if>
          <xsl:variable name="var:v18" select="userCSharp:LogicalNot(string($var:v16))" />
          <xsl:if test="string($var:v18)='true'">
            <xsl:variable name="var:v19" select="&quot;0&quot;" />
            <HASREPLACEMENT>
              <xsl:value-of select="$var:v19" />
            </HASREPLACEMENT>
          </xsl:if>
          <xsl:if test="string($var:v20)='true'">
            <xsl:variable name="var:v21" select="References/Reference/Value/text()" />
            <INVENTLOCATIONIDRETURNDC>
              <xsl:value-of select="$var:v21" />
            </INVENTLOCATIONIDRETURNDC>
          </xsl:if>
          <xsl:if test="string($var:v23)='true'">
            <xsl:variable name="var:v24" select="&quot; &quot;" />
            <xsl:variable name="var:v25" select="userCSharp:StringTrimLeft(string($var:v24))" />
            <INVENTLOCATIONIDRETURNDC>
              <xsl:value-of select="$var:v25" />
            </INVENTLOCATIONIDRETURNDC>
          </xsl:if>
          <INVOICEACCOUNT>
            <xsl:value-of select="$var:v10" />
          </INVOICEACCOUNT>
          <ISGIFT>
            <xsl:value-of select="OrderHeader/OrderGift/text()" />
          </ISGIFT>
          <LASTNAME>
            <xsl:value-of select="OrderHeader/CustomerLastName/text()" />
          </LASTNAME>
          <LASTNAMEKANA>
            <xsl:value-of select="OrderHeader/CustomerLastNameKana/text()" />
          </LASTNAMEKANA>
          <MCRSOURCEID>
            <xsl:value-of select="OrderHeader/OrderSourceCode/text()" />
          </MCRSOURCEID>
          <ORDERESTIMATEDREFUND>
            <xsl:value-of select="OrderHeader/OrderEstimatedRefund/text()" />
          </ORDERESTIMATEDREFUND>
          <ORDERGIFTFEE>
            <xsl:value-of select="OrderHeader/OrderGiftFee/text()" />
          </ORDERGIFTFEE>
          <ORDERLABELURL>
            <xsl:value-of select="OrderHeader/OrderLabelURL/text()" />
          </ORDERLABELURL>
          <ORDERLOCALECODE>
            <xsl:value-of select="OrderHeader/OrderLocaleCode/text()" />
          </ORDERLOCALECODE>
          <ORDERNAME>
            <xsl:value-of select="OrderHeader/OrderName/text()" />
          </ORDERNAME>
          <ORDERRETURNMETHOD>
            <xsl:value-of select="OrderHeader/OrderReturnMethod/text()" />
          </ORDERRETURNMETHOD>
          <ORDERRETURNSTATUS>
            <xsl:value-of select="OrderHeader/OrderReturnStatus/text()" />
          </ORDERRETURNSTATUS>
          <ORDERTAXTOTAL>
            <xsl:value-of select="OrderHeader/OrderTaxTotal/text()" />
          </ORDERTAXTOTAL>
          <ORIGINALORDERNUMBER>
            <xsl:value-of select="OrderHeader/OriginalOrderNumber/text()" />
          </ORIGINALORDERNUMBER>
          <PATARORDER>
            <xsl:value-of select="$var:v10" />
          </PATARORDER>
          <PATCONVERTJOURNALSTOBULK>
            <xsl:value-of select="$var:v10" />
          </PATCONVERTJOURNALSTOBULK>
          <PATDEPARTMENTNAME>
            <xsl:value-of select="$var:v10" />
          </PATDEPARTMENTNAME>
          <PATDEPARTMENTNUM>
            <xsl:value-of select="$var:v10" />
          </PATDEPARTMENTNUM>
          <PATEXTERNALORDERID>
            <xsl:value-of select="OrderHeader/OrderExternalSystemID/text()" />
          </PATEXTERNALORDERID>
          <PATORDERLINECOUNT>
            <xsl:value-of select="$var:v10" />
          </PATORDERLINECOUNT>
          <PATPICKINGLISTHOLD>
            <xsl:value-of select="$var:v10" />
          </PATPICKINGLISTHOLD>
          <PATRECORDSTATUS>
            <xsl:value-of select="$var:v10" />
          </PATRECORDSTATUS>
          <PATSHIPTOEXTADDRESSCODE>
            <xsl:value-of select="$var:v10" />
          </PATSHIPTOEXTADDRESSCODE>
          <PURCHORDERFORMNUM>
            <xsl:value-of select="OrderHeader/OrderPONumberID/text()" />
          </PURCHORDERFORMNUM>
          <REGISTEREDSTATUS>
            <xsl:value-of select="OrderHeader/CustomerStatus/text()" />
          </REGISTEREDSTATUS>
          <RETURNSENT>
            <xsl:value-of select="OrderHeader/ReturnStatus/text()" />
          </RETURNSENT>
          <SALESORIGINID>
            <xsl:value-of select="OrderHeader/OrderType/text()" />
          </SALESORIGINID>
          <SALESPOOL>
            <xsl:value-of select="OrderHeader/SalesPool/text()" />
          </SALESPOOL>
          <SALESSHIPPINGDATEREQUESTED>
            <xsl:value-of select="OrderHeader/OrderShipRequestDate/text()" />
          </SALESSHIPPINGDATEREQUESTED>
          <SALESTYPE>
            <xsl:value-of select="OrderHeader/OrderSalesType/text()" />
          </SALESTYPE>
          <SALUTATION>
            <xsl:value-of select="OrderHeader/CustomerSalutation/text()" />
          </SALUTATION>
          <SHIPPINGFEEJP>
            <xsl:value-of select="OrderHeader/OrderShippingFee/text()" />
          </SHIPPINGFEEJP>
          <SHIPPINGPHONE>
            <xsl:value-of select="OrderHeader/CustomerPhoneShipping/text()" />
          </SHIPPINGPHONE>
          <xsl:if test="OrderHeader/ShipToShippingTotal">
            <SHIPPINGTOTAL>
              <xsl:value-of select="OrderHeader/ShipToShippingTotal/text()" />
            </SHIPPINGTOTAL>
          </xsl:if>
          <SUNTAFEXTADDRESSCODE>
            <xsl:value-of select="$var:v10" />
          </SUNTAFEXTADDRESSCODE>
          <TOTALVAT>
            <xsl:value-of select="OrderHeader/OrderVAT/text()" />
          </TOTALVAT>
          <URL>
            <xsl:value-of select="$var:v10" />
          </URL>
          <USERAGENT>
            <xsl:value-of select="UserAgent/text()" />
          </USERAGENT>
          <xsl:for-each select="OrderHeader/References">
            <xsl:for-each select="Reference">
              <xsl:variable name="var:v26" select="string(Name/text())" />
              <xsl:variable name="var:v27" select="userCSharp:LogicalEq($var:v26 , &quot;PATRMAINTEGRATIONACTION&quot;)" />
              <xsl:if test="string($var:v27)='true'">
                <xsl:variable name="var:v28" select="Value/text()" />
                <PATRMAINTEGRATIONACTION>
                  <xsl:value-of select="$var:v28" />
                </PATRMAINTEGRATIONACTION>
              </xsl:if>
            </xsl:for-each>
          </xsl:for-each>
          <xsl:for-each select="Items/Item">
            <xsl:variable name="var:v29" select="userCSharp:StringTrimLeft(&quot; &quot;)" />
            <xsl:variable name="var:v30" select="userCSharp:StringTrimLeft(string(RetailPrice/text()))" />
            <xsl:variable name="var:v31" select="userCSharp:StringSize(string($var:v30))" />
            <xsl:variable name="var:v32" select="userCSharp:LogicalEq(string($var:v31) , &quot;0&quot;)" />
            <xsl:variable name="var:v34" select="string(RetailPrice/text())" />
            <xsl:variable name="var:v35" select="userCSharp:LogicalEq($var:v34 , &quot;0&quot;)" />
            <xsl:variable name="var:v36" select="userCSharp:LogicalNot(string($var:v35))" />
            <xsl:variable name="var:v42" select="userCSharp:LogicalExistence(boolean(ItemRecipientFirstName))" />
            <xsl:variable name="var:v44" select="userCSharp:LogicalNe(string($var:v42) , &quot;true&quot;)" />
            <xsl:variable name="var:v46" select="userCSharp:LogicalExistence(boolean(ItemRecipientLastName))" />
            <xsl:variable name="var:v48" select="userCSharp:LogicalNe(string($var:v46) , &quot;true&quot;)" />
            <xsl:variable name="var:v50" select="userCSharp:StringTrimLeft($var:v34)" />
            <xsl:variable name="var:v51" select="userCSharp:StringSize(string($var:v50))" />
            <xsl:variable name="var:v52" select="userCSharp:LogicalNe(string($var:v51) , &quot;0&quot;)" />
            <xsl:variable name="var:v59" select="userCSharp:LogicalEq(string($var:v51) , &quot;0&quot;)" />
            <patWebOrderINTLineEntity>
              <PATWEBORDERINTID>
                <xsl:value-of select="ItemOrderInitId/text()" />
              </PATWEBORDERINTID>
              <LINENUM>
                <xsl:value-of select="ItemLineNumber/text()" />
              </LINENUM>
              <CONFIGID>
                <xsl:value-of select="ItemConfig/text()" />
              </CONFIGID>
              <EDICUSTITEMNUMBER>
                <xsl:value-of select="$var:v29" />
              </EDICUSTITEMNUMBER>
              <EDILINENUM>
                <xsl:value-of select="$var:v29" />
              </EDILINENUM>
              <EDIQUANTITY>
                <xsl:value-of select="$var:v29" />
              </EDIQUANTITY>
              <EDISHIPPINGDATEREQUESTED>
                <xsl:value-of select="$var:v29" />
              </EDISHIPPINGDATEREQUESTED>
              <EXPECTEDSHIPDATE>
                <xsl:value-of select="ItemExpectedShipDate/text()" />
              </EXPECTEDSHIPDATE>
              <GIFTMESSAGEEGIFTCARD>
                <xsl:value-of select="EGCMessage/text()" />
              </GIFTMESSAGEEGIFTCARD>
              <INVENTCOLORID>
                <xsl:value-of select="ItemColorCode/text()" />
              </INVENTCOLORID>
              <INVENTSIZEID>
                <xsl:value-of select="ItemSizeCode/text()" />
              </INVENTSIZEID>
              <xsl:if test="string($var:v32)='true'">
                <xsl:variable name="var:v33" select="&quot;0&quot;" />
                <ITEMDISCOUNT>
                  <xsl:value-of select="$var:v33" />
                </ITEMDISCOUNT>
              </xsl:if>
              <xsl:if test="string($var:v36)='true'">
                <xsl:variable name="var:v37" select="userCSharp:StringTrimLeft($var:v34)" />
                <xsl:variable name="var:v38" select="userCSharp:StringSize(string($var:v37))" />
                <xsl:variable name="var:v39" select="userCSharp:LogicalNe(string($var:v38) , &quot;0&quot;)" />
                <xsl:if test="string($var:v39)='true'">
                  <xsl:variable name="var:v40" select="userCSharp:MathSubtract($var:v34 , string(ItemSalePrice/text()))" />
                  <ITEMDISCOUNT>
                    <xsl:value-of select="$var:v40" />
                  </ITEMDISCOUNT>
                </xsl:if>
              </xsl:if>
              <xsl:if test="string($var:v35)='true'">
                <xsl:variable name="var:v41" select="&quot;0&quot;" />
                <ITEMDISCOUNT>
                  <xsl:value-of select="$var:v41" />
                </ITEMDISCOUNT>
              </xsl:if>
              <ITEMID>
                <xsl:value-of select="ItemStyleNo/text()" />
              </ITEMID>
              <ITEMPERPETUAL>
                <xsl:value-of select="ItemPerpetual/text()" />
              </ITEMPERPETUAL>
              <ITEMRECEIPTEMAIL>
                <xsl:value-of select="ItemReceiptEmail/text()" />
              </ITEMRECEIPTEMAIL>
              <xsl:if test="string($var:v42)='true'">
                <xsl:variable name="var:v43" select="ItemRecipientFirstName/text()" />
                <ITEMRECIPIENTFIRSTNAME>
                  <xsl:value-of select="$var:v43" />
                </ITEMRECIPIENTFIRSTNAME>
              </xsl:if>
              <xsl:if test="string($var:v44)='true'">
                <xsl:variable name="var:v45" select="&quot;&quot;" />
                <ITEMRECIPIENTFIRSTNAME>
                  <xsl:value-of select="$var:v45" />
                </ITEMRECIPIENTFIRSTNAME>
              </xsl:if>
              <xsl:if test="string($var:v46)='true'">
                <xsl:variable name="var:v47" select="ItemRecipientLastName/text()" />
                <ITEMRECIPIENTLASTNAME>
                  <xsl:value-of select="$var:v47" />
                </ITEMRECIPIENTLASTNAME>
              </xsl:if>
              <xsl:if test="string($var:v48)='true'">
                <xsl:variable name="var:v49" select="../../Addresses/s0:Address/AddressLastName/text()" />
                <ITEMRECIPIENTLASTNAME>
                  <xsl:value-of select="$var:v49" />
                </ITEMRECIPIENTLASTNAME>
              </xsl:if>
              <ITEMRETURNREASONCODE>
                <xsl:value-of select="ItemReturnReasonCode/text()" />
              </ITEMRETURNREASONCODE>
              <ITEMRETURNREASONCOMMENT>
                <xsl:value-of select="ItemReturnReasonComment/text()" />
              </ITEMRETURNREASONCOMMENT>
              <ITEMRETURNTYPE>
                <xsl:value-of select="ItemReturnType/text()" />
              </ITEMRETURNTYPE>
              <ITEMSENDERFIRSTNAME>
                <xsl:value-of select="ItemSenderFirstName/text()" />
              </ITEMSENDERFIRSTNAME>
              <ITEMSENDLASTNAME>
                <xsl:value-of select="ItemSenderLastName/text()" />
              </ITEMSENDLASTNAME>
              <ITEMSKU>
                <xsl:value-of select="ItemSKU/text()" />
              </ITEMSKU>
              <ITEMSKUREPLACEMENT>
                <xsl:value-of select="ItemSKUReplacement/text()" />
              </ITEMSKUREPLACEMENT>
              <ITEMSOURCEID>
                <xsl:value-of select="ItemSourceCode/text()" />
              </ITEMSOURCEID>
              <ITEMTAXAMOUNT>
                <xsl:value-of select="ItemTaxAmount/text()" />
              </ITEMTAXAMOUNT>
              <NAME>
                <xsl:value-of select="$var:v29" />
              </NAME>
              <ORDERRETURNCOMMENT>
                <xsl:value-of select="OrderReturnComment/text()" />
              </ORDERRETURNCOMMENT>
              <PATEDISALESPRICE>
                <xsl:value-of select="$var:v29" />
              </PATEDISALESPRICE>
              <PROMOCODE>
                <xsl:value-of select="ItemPromoCode/text()" />
              </PROMOCODE>
              <REPAIRDESCRIPTION>
                <xsl:value-of select="RepairDescription/text()" />
              </REPAIRDESCRIPTION>
              <REPAIRITEMDESCRIPTION>
                <xsl:value-of select="RepairItem/text()" />
              </REPAIRITEMDESCRIPTION>
              <REPAIRLOCATION>
                <xsl:value-of select="RepairLocation/text()" />
              </REPAIRLOCATION>
              <REPAIRNONREPAIRABLE>
                <xsl:value-of select="RepairNonRepairable/text()" />
              </REPAIRNONREPAIRABLE>
              <REPAIRORDERNUMBER>
                <xsl:value-of select="RepairOrderNo/text()" />
              </REPAIRORDERNUMBER>
              <REPAIRREPLACEMENTCOLOR>
                <xsl:value-of select="RepairReplacementColor/text()" />
              </REPAIRREPLACEMENTCOLOR>
              <REPAIRSTYLE>
                <xsl:value-of select="RepairStyle/text()" />
              </REPAIRSTYLE>
              <xsl:if test="string($var:v52)='true'">
                <xsl:variable name="var:v53" select="RetailPrice/text()" />
                <xsl:variable name="var:v54" select="userCSharp:LogicalEq(string($var:v53) , &quot;0&quot;)" />
                <xsl:if test="string($var:v54)='true'">
                  <xsl:variable name="var:v55" select="ItemSalePrice/text()" />
                  <RETAILPRICE>
                    <xsl:value-of select="$var:v55" />
                  </RETAILPRICE>
                </xsl:if>
              </xsl:if>
              <xsl:if test="string($var:v52)='true'">
                <xsl:variable name="var:v56" select="RetailPrice/text()" />
                <xsl:variable name="var:v57" select="userCSharp:LogicalEq(string($var:v56) , &quot;0&quot;)" />
                <xsl:variable name="var:v58" select="userCSharp:LogicalNot(string($var:v57))" />
                <xsl:if test="string($var:v58)='true'">
                  <xsl:if test="string($var:v52)='true'">
                    <RETAILPRICE>
                      <xsl:value-of select="$var:v56" />
                    </RETAILPRICE>
                  </xsl:if>
                </xsl:if>
              </xsl:if>
              <xsl:if test="string($var:v59)='true'">
                <xsl:variable name="var:v60" select="&quot;0&quot;" />
                <RETAILPRICE>
                  <xsl:value-of select="$var:v60" />
                </RETAILPRICE>
              </xsl:if>
              <RETAILSTOREID>
                <xsl:value-of select="ShipToAddressStoreId/text()" />
              </RETAILSTOREID>
              <SALESPRICE>
                <xsl:value-of select="ItemSalePrice/text()" />
              </SALESPRICE>
              <SALESQTY>
                <xsl:value-of select="ItemQuantity/text()" />
              </SALESQTY>
              <TRACKINGNUMBER>
                <xsl:value-of select="TrackingString/text()" />
              </TRACKINGNUMBER>
              <USEPROVIDEDEXCHANGESALESPRICE>
                <xsl:value-of select="$var:v29" />
              </USEPROVIDEDEXCHANGESALESPRICE>
              <USERAGENT>
                <xsl:value-of select="$var:v29" />
              </USERAGENT>
            </patWebOrderINTLineEntity>
          </xsl:for-each>
          <xsl:for-each select="Addresses/s0:Address">
            <xsl:variable name="var:v61" select="userCSharp:StringTrimLeft(&quot; &quot;)" />
            <xsl:variable name="var:v62" select="userCSharp:LogicalExistence(boolean(CompanyName))" />
            <xsl:variable name="var:v64" select="userCSharp:LogicalNot(string($var:v62))" />
            <patINTLogisticsPostalAddressEntity>
              <PATWEBORDERINTID>
                <xsl:value-of select="AddressOrderInitId/text()" />
              </PATWEBORDERINTID>
              <LINE>
                <xsl:value-of select="AddressLineNumber/text()" />
              </LINE>
              <ADDRESS>
                <xsl:value-of select="$var:v61" />
              </ADDRESS>
              <ADDRESSFIRSTNAME>
                <xsl:value-of select="AddressFirstName/text()" />
              </ADDRESSFIRSTNAME>
              <ADDRESSFIRSTNAMEKANA>
                <xsl:value-of select="AddressFirstNameKana/text()" />
              </ADDRESSFIRSTNAMEKANA>
              <ADDRESSLASTNAME>
                <xsl:value-of select="AddressLastName/text()" />
              </ADDRESSLASTNAME>
              <ADDRESSLASTNAMEKANA>
                <xsl:value-of select="AddressLastNameKana/text()" />
              </ADDRESSLASTNAMEKANA>
              <APTNUMBER>
                <xsl:value-of select="$var:v61" />
              </APTNUMBER>
              <CITY>
                <xsl:value-of select="AddressCity/text()" />
              </CITY>
              <xsl:if test="string($var:v62)='true'">
                <xsl:variable name="var:v63" select="CompanyName/text()" />
                <COMPANY>
                  <xsl:value-of select="$var:v63" />
                </COMPANY>
              </xsl:if>
              <xsl:if test="string($var:v64)='true'">
                <xsl:variable name="var:v65" select="userCSharp:StringTrimRight(&quot; &quot;)" />
                <COMPANY>
                  <xsl:value-of select="$var:v65" />
                </COMPANY>
              </xsl:if>
              <xsl:variable name="var:v66" select="userCSharp:FixCountryCode(string(AddressCountry/text()))" />
              <xsl:variable name="var:v67" select="userCSharp:Get3LetterCountryCode(string($var:v66))" />
              <COUNTRYREGIONID>
                <xsl:value-of select="$var:v67" />
              </COUNTRYREGIONID>
              <ISBILLINGADDRESS>
                <xsl:value-of select="AddressIsBilling/text()" />
              </ISBILLINGADDRESS>
              <ISDROPSHIP>
                <xsl:value-of select="AddressDropShip/text()" />
              </ISDROPSHIP>
              <ROLE>
                <xsl:value-of select="AddressType/text()" />
              </ROLE>
              <SHIPTOFIRSTNAME>
                <xsl:value-of select="$var:v61" />
              </SHIPTOFIRSTNAME>
              <SHIPTOLASTNAME>
                <xsl:value-of select="$var:v61" />
              </SHIPTOLASTNAME>
              <STATE>
                <xsl:value-of select="AddressState/text()" />
              </STATE>
              <STREET>
                <xsl:value-of select="Address/text()" />
              </STREET>
              <ZIPCODE>
                <xsl:value-of select="AddressPostalCode/text()" />
              </ZIPCODE>
            </patINTLogisticsPostalAddressEntity>
          </xsl:for-each>
          <xsl:for-each select="Payments/s1:Payment">
            <xsl:variable name="var:v68" select="userCSharp:StringTrimLeft(&quot; &quot;)" />
            <xsl:variable name="var:v69" select="userCSharp:LogicalEq(string(PaymentTerminalNumber/text()) , &quot;PAYPAL_EXPRESS&quot;)" />
            <xsl:variable name="var:v70" select="userCSharp:LogicalNot(string($var:v69))" />
            <xsl:variable name="var:v75" select="userCSharp:LogicalExistence(boolean(PaymentInstallments))" />
            <xsl:variable name="var:v77" select="userCSharp:LogicalNot(string($var:v75))" />
            <xsl:variable name="var:v78" select="userCSharp:LogicalExistence(boolean(PaymentTenderTypeID))" />
            <xsl:variable name="var:v80" select="userCSharp:LogicalNot(string($var:v78))" />
            <patWebOrderINTPaymEntity>
              <PATWEBORDERINTID>
                <xsl:value-of select="PaymentOrderIntId/text()" />
              </PATWEBORDERINTID>
              <PAYMENTREFERENCEID>
                <xsl:value-of select="PaymentReferenceId/text()" />
              </PAYMENTREFERENCEID>
              <ADDRESSLINE>
                <xsl:value-of select="$var:v68" />
              </ADDRESSLINE>
              <AFTRIGGEREDRULES>
                <xsl:value-of select="PaymentAFTriggeredRule/text()" />
              </AFTRIGGEREDRULES>
              <AMOUNTCUR>
                <xsl:value-of select="PaymentAmount/text()" />
              </AMOUNTCUR>
              <AUTHCODE>
                <xsl:value-of select="PaymentAuthCode/text()" />
              </AUTHCODE>
              <AUTHDATE>
                <xsl:value-of select="PaymentAuthDate/text()" />
              </AUTHDATE>
              <xsl:if test="string($var:v70)='true'">
                <xsl:variable name="var:v71" select="PaymentCardType/text()" />
                <xsl:variable name="var:v72" select="userCSharp:GetCreditCardTypeValue($input:ConnString, string($var:v71))" />
                <CREDITCARDTYPE>
                  <xsl:value-of select="$var:v72" />
                </CREDITCARDTYPE>
              </xsl:if>
              <xsl:if test="string($var:v69)='true'">
                <xsl:variable name="var:v73" select="PaymentPayTypeID/text()" />
                <xsl:variable name="var:v74" select="userCSharp:GetCreditCardTypeValue2($input:ConnString, string($var:v73))" />
                <CREDITCARDTYPE>
                  <xsl:value-of select="$var:v74" />
                </CREDITCARDTYPE>
              </xsl:if>
              <EXPIRATIONMONTH>
                <xsl:value-of select="PaymentExpirationMonth/text()" />
              </EXPIRATIONMONTH>
              <EXPIRATIONYEAR>
                <xsl:value-of select="PaymentExpirationYear/text()" />
              </EXPIRATIONYEAR>
              <GIFTCERTID>
                <xsl:value-of select="PaymentGiftCertId/text()" />
              </GIFTCERTID>
              <NAMEONCARD>
                <xsl:value-of select="PaymentNameOnCard/text()" />
              </NAMEONCARD>
              <PAYMENTCRYPTOGRAM>
                <xsl:value-of select="PaymentCryptogram/text()" />
              </PAYMENTCRYPTOGRAM>
              <PAYMENTFRAUDRISKSCORE>
                <xsl:value-of select="PaymentAuditRiskScore/text()" />
              </PAYMENTFRAUDRISKSCORE>
              <PAYMENTFRAUDSTATUSCODE>
                <xsl:value-of select="PaymentFraudStatusCode/text()" />
              </PAYMENTFRAUDSTATUSCODE>
              <xsl:if test="string($var:v75)='true'">
                <xsl:variable name="var:v76" select="PaymentInstallments/text()" />
                <PAYMENTINSTALLMENTS>
                  <xsl:value-of select="$var:v76" />
                </PAYMENTINSTALLMENTS>
              </xsl:if>
              <xsl:if test="string($var:v77)='true'">
                <PAYMENTINSTALLMENTS>
                  <xsl:value-of select="$var:v68" />
                </PAYMENTINSTALLMENTS>
              </xsl:if>
              <PAYMENTLASTFOUR>
                <xsl:value-of select="PaymentLastFour/text()" />
              </PAYMENTLASTFOUR>
              <PAYMENTLOWVALTOKEN>
                <xsl:value-of select="PaymentLowValueToken/text()" />
              </PAYMENTLOWVALTOKEN>
              <PAYMENTPALTOKEN>
                <xsl:value-of select="PaymentPayPalToken/text()" />
              </PAYMENTPALTOKEN>
              <PAYMENTPAYPALACK>
                <xsl:value-of select="PaymentPayPalAck/text()" />
              </PAYMENTPAYPALACK>
              <PAYMENTPAYPALCORID>
                <xsl:value-of select="PaymentPayPalCorId/text()" />
              </PAYMENTPAYPALCORID>
              <PAYMENTPAYPALPAYERID>
                <xsl:value-of select="PaymentPayPalPayerId/text()" />
              </PAYMENTPAYPALPAYERID>
              <PAYMENTPAYPALTRANSID>
                <xsl:value-of select="PaymentPayPalTransId/text()" />
              </PAYMENTPAYPALTRANSID>
              <PAYMENTPAYTYPEID>
                <xsl:value-of select="PaymentPayTypeID/text()" />
              </PAYMENTPAYTYPEID>
              <PAYMENTPRIMARYACCOUNTNUM>
                <xsl:value-of select="PaymentPrimaryAccountNum/text()" />
              </PAYMENTPRIMARYACCOUNTNUM>
              <PAYMENTRESPONSECODE>
                <xsl:value-of select="PaymentResponseCode/text()" />
              </PAYMENTRESPONSECODE>
              <PAYMENTRETURNCODE>
                <xsl:value-of select="PaymentReturnCode/text()" />
              </PAYMENTRETURNCODE>
              <PAYMENTSTATUS>
                <xsl:value-of select="PaymentStatus/text()" />
              </PAYMENTSTATUS>
              <PAYMENTSVSAUTHCODE>
                <xsl:value-of select="PaymentSVSAuthCode/text()" />
              </PAYMENTSVSAUTHCODE>
              <PAYMENTSVSCARDBALANCE>
                <xsl:value-of select="PaymentSVSCardBalance/text()" />
              </PAYMENTSVSCARDBALANCE>
              <PAYMENTSVSPIN>
                <xsl:value-of select="PaymentSVSPin/text()" />
              </PAYMENTSVSPIN>
              <PAYMENTSVSTERMINALID>
                <xsl:value-of select="PaymentSVSTerminalID/text()" />
              </PAYMENTSVSTERMINALID>
              <PAYMENTTOKEN>
                <xsl:value-of select="PaymentToken/text()" />
              </PAYMENTTOKEN>
              <PAYMENTTRANSACTIONTYPE>
                <xsl:value-of select="PaymentTransactionType/text()" />
              </PAYMENTTRANSACTIONTYPE>
              <PAYMENTVTRANSTYPE>
                <xsl:value-of select="PaymentVTransType/text()" />
              </PAYMENTVTRANSTYPE>
              <PAYPAGEID>
                <xsl:value-of select="PaymentVPayPageId/text()" />
              </PAYPAGEID>
              <PAYPAGERESPCODE>
                <xsl:value-of select="PaymentVPayPageRespCode/text()" />
              </PAYPAGERESPCODE>
              <xsl:if test="string($var:v78)='true'">
                <xsl:variable name="var:v79" select="PaymentTenderTypeID/text()" />
                <TENDERTYPEID>
                  <xsl:value-of select="$var:v79" />
                </TENDERTYPEID>
              </xsl:if>
              <xsl:if test="string($var:v80)='true'">
                <TENDERTYPEID>
                  <xsl:value-of select="$var:v68" />
                </TENDERTYPEID>
              </xsl:if>
              <TERMINALNUMBER>
                <xsl:value-of select="PaymentTerminalNumber/text()" />
              </TERMINALNUMBER>
              <TRANSID>
                <xsl:value-of select="PaymentTransactionId/text()" />
              </TRANSID>
            </patWebOrderINTPaymEntity>
          </xsl:for-each>
        </patWebOrderINTTableEntity>
      </xsl:for-each>
    </ns0:Document>
  </xsl:template>
  <msxsl:script language="C#" implements-prefix="userCSharp">
    <msxsl:assembly name="Pat.Azure.IntegrationsSO.Common.OM.SO, Version=1.0.1.0, Culture=neutral, PublicKeyToken=bf65d9738f5e7edf" />
    <msxsl:using namespace="Pat.Azure.IntegrationsSO.Common.OM.SO" />
	<![CDATA[
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


public bool LogicalExistence(bool val)
{
	return val;
}


public bool LogicalNot(string val)
{
	return !ValToBool(val);
}


public string StringTrimLeft(string str)
{
	if (str == null)
	{
		return "";
	}
	return str.TrimStart(null);
}


public bool LogicalNe(string val1, string val2)
{
	bool ret = false;
	double d1 = 0;
	double d2 = 0;
	if (IsNumeric(val1, ref d1) && IsNumeric(val2, ref d2))
	{
		ret = d1 != d2;
	}
	else
	{
		ret = String.Compare(val1, val2, StringComparison.Ordinal) != 0;
	}
	return ret;
}


public int StringSize(string str)
{
	if (str == null)
	{
		return 0;
	}
	return str.Length;
}


public string MathSubtract(string param0, string param1)
{
	System.Collections.ArrayList listValues = new System.Collections.ArrayList();
	listValues.Add(param0);
	listValues.Add(param1);
	double ret = 0;
	bool first = true;
	foreach (string obj in listValues)
	{
		if (first)
		{
			first = false;
			double d = 0;
			if (IsNumeric(obj, ref d))
			{
				ret = d;
			}
			else
			{
				return "";
			}
		}
		else
		{
			double d = 0;
			if (IsNumeric(obj, ref d))
			{
				ret -= d;
			}
			else
			{
				return "";
			}
		}
	}
	return ret.ToString(System.Globalization.CultureInfo.InvariantCulture);
}


public string InitCumulativeConcat(int index)
{
	if (index >= 0)
	{
		if (index >= myCumulativeConcatArray.Count)
		{
			int i = myCumulativeConcatArray.Count;
			for (; i<=index; i++)
			{
				myCumulativeConcatArray.Add("");
			}
		}
		else
		{
			myCumulativeConcatArray[index] = "";
		}
	}
	return "";
}

public System.Collections.ArrayList myCumulativeConcatArray = new System.Collections.ArrayList();

public string AddToCumulativeConcat(int index, string val, string notused)
{
	if (index < 0 || index >= myCumulativeConcatArray.Count)
	{
		return "";
	}
	myCumulativeConcatArray[index] = (string)(myCumulativeConcatArray[index]) + val;
	return myCumulativeConcatArray[index].ToString();
}

public string GetCumulativeConcat(int index)
{
	if (index < 0 || index >= myCumulativeConcatArray.Count)
	{
		return "";
	}
	return myCumulativeConcatArray[index].ToString();
}

public int StringFind(string str, string strFind)
{
	if (str == null || strFind == null || strFind == "")
	{
		return 0;
	}
	return (str.IndexOf(strFind) + 1);
}


public bool LogicalGt(string val1, string val2)
{
	bool ret = false;
	double d1 = 0;
	double d2 = 0;
	if (IsNumeric(val1, ref d1) && IsNumeric(val2, ref d2))
	{
		ret = d1 > d2;
	}
	else
	{
		ret = String.Compare(val1, val2, StringComparison.Ordinal) > 0;
	}
	return ret;
}


public string StringTrimRight(string str)
{
	if (str == null)
	{
		return "";
	}
	return str.TrimEnd(null);
}


public string GetShipVia(string SourceValue)   
    {
     switch(SourceValue.Trim())
     {
       case "50":
        return "220";
        break;
       case "M7":
        return "220";
        break;
       case "33":
        return "615";
        break;
       case "27":
        return "7";
        break;
       case "UP3":
        return "122";
        break;
       case "26":
        return "7";
        break;        
       case "FED":
        return "355";
        break;
       case "mc":
        return "1";
        break;
       case "1":
        return "230";
        break;
       case "2":
        return "240";
        break;
       case "11":
        return "320";
        break;
       case "12":
        return "330";
        break;
       case "25":
        return "410";
        break;
       case "20":
        return "420";
        break;
       case "21":
        return "421";
        break;
       case "22":
        return "422";
        break;
       case "31":
        return "620";
        break;
       case "32":
        return "630";
        break;
       case "53":
        return "640";
        break;
       case "88":
        return "740";
        break;
       case "UPB":
        return "124";
        break;
       case "UPS":
        return "120";
        break;
       case "FDG":
        return "110";
        break;
       case "PRI":
        return "240";
        break;
       case "40":
        return "615";
        break;
       case "30":
        return "610";
        break;
       case "520":
        return "8";
        break;
       case "501":
        return "231";
        break;
       case "5":
        return "800";
        break;
       case "70":
        return "720";
        break;
       case "52":
        return "241";
        break;
       case "S":
        return "UPS";
        break;
       case "AKH":
        return "AKH";
        break;
       case "Stored":
        return "8";
        break;

       default:
         return SourceValue;
         break;
     }
}

///*Uncomment the following code for a sample Inline C# function
//that concatenates two inputs. Change the number of parameters of
//this function to be equal to the number of inputs connected to this functoid.*/

public string Get3LetterCountryCode( string twoLetterCntryCd)
    {
		 if (string.IsNullOrEmpty( twoLetterCntryCd)) return string.Empty;
		 if(twoLetterCntryCd.Length>2)
		   return twoLetterCntryCd;
		 else 
		 {
		   return LookupData.Get3LetterCountryCode(twoLetterCntryCd);
		 }
    }


///*Uncomment the following code for a sample Inline C# function
//that concatenates two inputs. Change the number of parameters of
//this function to be equal to the number of inputs connected to this functoid.*/

public string GetCreditCardTypeValue(string ConnString,  string SourceValue)
    {
       return LookupData.LookupValue(ConnString,"Order.DeliveryMode","CommerceCloud","D365",SourceValue);
    }


///*Uncomment the following code for a sample Inline C# function
//that concatenates two inputs. Change the number of parameters of
//this function to be equal to the number of inputs connected to this functoid.*/

public string GetCreditCardTypeValue2(string ConnString,  string SourceValue2)
    {
      return LookupData.LookupValue(ConnString,"Order.DeliveryMode","CommerceCloud","D365",SourceValue2);
    }


public string FixCountryCode(string param1)
{
	switch(param1.Trim().ToUpper())
                {
                   case "C2":
                          return "CN";
                   default:
                          return param1;
                }
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