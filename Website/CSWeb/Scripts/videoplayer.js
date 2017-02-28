// JavaScript Document

$(document).ready(function () {

//creates videoplayer to place on page 	
jwplayer("player1").setup({
	
//add videos, poster images (initial video image when stopped), and thumbs from cdn	(or youtube)
  playlist: [{
  file: 'https://dx6i5pkyrcr70.cloudfront.net/video/jim.mp4',
  image: '//dx6i5pkyrcr70.cloudfront.net/images/poster_jim.jpg',
  thumb: '//dx6i5pkyrcr70.cloudfront.net/images/thumb_jim.jpg'
},
{
  file: 'https://dx6i5pkyrcr70.cloudfront.net/video/ken.mp4',
  image: '//dx6i5pkyrcr70.cloudfront.net/images/poster_ken.jpg',
  thumb: '//dx6i5pkyrcr70.cloudfront.net/images/thumb_ken.jpg'
},
{
  file: 'https://dx6i5pkyrcr70.cloudfront.net/video/monique.mp4',
  image: '//dx6i5pkyrcr70.cloudfront.net/images/poster_monique.jpg',
  thumb: '//dx6i5pkyrcr70.cloudfront.net/images/thumb_monique.jpg'
},
{
  file: 'https://dx6i5pkyrcr70.cloudfront.net/video/sky.mp4',
  image: '//dx6i5pkyrcr70.cloudfront.net/images/poster_sky.jpg',
  thumb: '//dx6i5pkyrcr70.cloudfront.net/images/thumb_sky.jpg'
},
{
  file: 'https://dx6i5pkyrcr70.cloudfront.net/video/steve.mp4',
  image: '//dx6i5pkyrcr70.cloudfront.net/images/poster_steve.jpg',
  thumb: '//dx6i5pkyrcr70.cloudfront.net/images/thumb_steve.jpg'
},
{
  file: 'https://dx6i5pkyrcr70.cloudfront.net/video/tony.mp4',
  image: '//dx6i5pkyrcr70.cloudfront.net/images/poster_tony.jpg',
  thumb: '//dx6i5pkyrcr70.cloudfront.net/images/thumb_tony.jpg'
}

],
  	displaytitle: false,
	autostart: true,
	controls: true,
	width: '100%',
	aspectratio: '16:9',
	stretching: 'exactfit',
	skin: {
	    url: "/scripts/jwplayer7/skins/five.css",
	    name: "five"
	}
});

	jwplayer("player1").onBeforePlay(function(){
	pauseAllOthers("player1");
});



// change the text you need for inactive and active thumbs
var thumbtext = "Watch Video";
var videoplayingtext = "Now Playing...";


if ($("#testimonial_thumbs_horz").length) {

var thumbs = document.getElementById("testimonial_thumbs_horz");
var html = thumbs.innerHTML;
jwplayer("player1").onReady(function(){
var playlist = jwplayer("player1").getPlaylist();
for (var index=0;index<playlist.length;index++){
var playindex = index +1;
html += "<li id='" + 'video' + index + "'><a href='javascript:playThis("+index+")'><img src='" + playlist[index].thumb + "'><span class='watchvideo'>" + thumbtext + "</span></a></li>"
thumbs.innerHTML = html;
}

});

jwplayer("player1").onPlaylistItem(function(){
var thisVideo = 'video'+jwplayer("player1").getPlaylistIndex();
var thumbItems = $('#testimonial_thumbs_horz li');
thumbItems.each(function() {
if ($(this).attr('id') == thisVideo) {
$(this).children('a').children('.watchvideo').text(videoplayingtext);
$(this).addClass('activeThumb');
} else {
$(this).children('a').children('.watchvideo').text(thumbtext);
$(this).removeClass('activeThumb')
}
});
});

} else {


var thumbs = document.getElementById("testimonial_thumbs_vert");
var html = thumbs.innerHTML;
jwplayer("player1").onReady(function(){
var playlist = jwplayer("player1").getPlaylist();
for (var index=0;index<playlist.length;index++){
var playindex = index +1;
html += "<li id='" + 'video' + index + "'><a href='javascript:playThis("+index+")'><img src='" + playlist[index].thumb + "'><span class='watchvideo'>" + thumbtext + "</span></a></li>"
thumbs.innerHTML = html;
}
var playerHeight = $('#player1_wrapper').height();
$("#testimonial_thumbs_vert").css('height',playerHeight);
var thumbWidth = $('#testimonial_thumbs_vert').children('li').children('a').children('img').width() + 16;
$("#testimonial_thumbs_vert").css('width',thumbWidth);
});

jwplayer("player1").onPlaylistItem(function(){
var thisVideo = 'video'+jwplayer("player1").getPlaylistIndex();
var thumbItems = $('#testimonial_thumbs_vert li');
thumbItems.each(function() {
if ($(this).attr('id') == thisVideo) {
$(this).children('a').children('.watchvideo').text(videoplayingtext);
$(this).addClass('activeThumb');
} else {
$(this).children('a').children('.watchvideo').text(thumbtext);
$(this).removeClass('activeThumb')
}
});
});
	
}


}); //END JQuery $(document).ready section



function playThis(index) {
jwplayer("player1").playlistItem(index);
}

// Pause All Other Players
//See global.js