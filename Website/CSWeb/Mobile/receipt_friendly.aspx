﻿<%@Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.Mobile.Store.receipt_friendly" EnableViewState="true" EnableSessionState="True" %>
<%@ Register Src="UserControls/CheckoutThankYouModulePrint2.ascx" TagName="Form"
    TagPrefix="uc1" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>SITENAME</title>
<meta name="description" content=""/>
<meta name="keywords" content=""/>
<link href="/Styles/cloudglobal_C2.css" rel="stylesheet" type="text/css" media="all" />
 
    </head>
    <body onload="window.print();">
     <uc1:Form ID="Form1" runat="server" />
    </body>
</html>
  

