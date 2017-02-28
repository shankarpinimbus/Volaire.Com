<%@ Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.CONTROL.index" EnableSessionState="True" %>

<%@ Register Src="UserControls/TrackingPixels.ascx" TagPrefix="uc1" TagName="TrackingPixels" %>


<!doctype html>
<html>
<head runat="server">
<meta charset="utf-8">
<title></title>
<meta name="description" content="" />
<meta name="keywords" content="" />

    <%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-top.html")%>
<script type="text/javascript" src="//d39hwjxo88pg52.cloudfront.net/scripts/jwplayer7/jwplayer.js"></script>
<script src="/Scripts/videoplayer.js"></script>

</head>

<body>
<div class="container">
<div class="left">


<!-- note the playlist player id must be 'player1' -->
<!-- horizontal thumbs -->
<div class="testimonial_container horz">
<div id="player1"></div>
<ul id="testimonial_thumbs_horz"></ul>
</div> 


<!-- vertical thumbs -->
<!--<div class="testimonial_container vert">
<ul id="testimonial_thumbs_vert"></ul>
<div id="player1"></div>
</div> -->

<div>



<!-- sample if more than one player on screen -->
<div id="player2"></div>
<script>
jwplayer("player2").setup({
  	file: 'https://dx6i5pkyrcr70.cloudfront.net/video/jim.mp4',
	autostart: false,
	primary: "flash",   
	controls: true,
	width: '100%',
	aspectratio: '16:9',
	stretching: 'exactfit',	skin: '/scripts/jwplayer/five.xml'
});
	jwplayer("player2").onBeforePlay(function(){
	pauseAllOthers("player2");
});
</script>
</div>
</div>
<div class="clear"></div>
</div>
<%# CSBusiness.DynamicVersion.Helper.IncludeFile("scripts-bottom.html")%>
   <uc1:TrackingPixels runat="server" ID="TrackingPixels" />
</body>
</html>
