<%@ Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.CONTROL.contact_placeholder" EnableSessionState="True" %>
<%@ Register Src="UserControls/ContactUs_PlaceHolder.ascx" TagName="ContactUs" TagPrefix="uc" %>


<!doctype html>
<html>
<head>
         <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE9">
<meta charset="utf-8">    


<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/Scripts/fancybox/jquery.fancybox.css">
<script src="/Scripts/fancybox/jquery.fancybox.pack.js"></script>
<script type="text/javascript" src="/scripts/jwplayer/jwplayer.js"></script>
<script src="/Scripts/jquery.cycle.js"></script>
<script type="text/javascript">jwplayer.key="JEtVDryJGkO9Q215yroU+Wz4oLeTJGMccGU/Wb3Kv9s=";</script>
<script src="/Scripts/global.js"></script>

<link href="styles/global.css" rel="stylesheet" type="text/css" />
  </head>
 
<body>
<form runat="server" id="billing1">
    
 
   <div class="container">
    
  
    
      


    <div class="page">
  <div class="left">
  <h2>Contact Us</h2>
  
     <div id="contact_form" runat="server">
       
       <asp:Panel ID="Panel_Contactus" runat="server" > 
        <uc:ContactUs ID="ucContactUs" runat="server" />
     </asp:Panel>
</div>
   </div>
    <div class="right">
    
 
</div>
  <div class="clear"></div>
   
 
   
     </div>
    
    
   
</div> <!-- /container -->
 
 </form>
</body>
</html>
