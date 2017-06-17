// JavaScript Document

$(document).ready(function () {

    $('.toggleNav').click(function () {
        $('#headernav').slideToggle();
    });

    //faq toggle stuff 
    $('.togglefaq').click(function (e) {
        e.preventDefault();
        var notthis = $('.active').not(this);
        notthis.find('.icon-arrow-down').addClass('icon-sort-down').removeClass('icon-sort-up');
        notthis.toggleClass('active').next('.faqanswer').slideToggle(300);
        $(this).toggleClass('active').next().slideToggle("fast");
        $(this).children('i').toggleClass('icon-sort-up icon-sort-down');
    });

    $('.size_select input:radio').change(function () {
        $('.checkbox').html("");
        $(this).siblings('.checkbox').html("<img src=\"//d39hwjxo88pg52.cloudfront.net/volaire/images/checkmark.png\" alt=\"checked\">");
    });

    //fancybox popups
    $(".fancybox").fancybox();

    $(".product-pop").fancybox({
        closeBtn: false,
        fitToView: false,
        wrapCSS: 'nowrapper',
        padding: 0,
        width: '90%',
        maxWidth: 793,
        height: '90%',
        maxHeight: 639,
        autoSize: false,
        closeClick: false,
        scrolling: 'no',
        helpers: {
            overlay: {
                locked: false,
                css: {
                    'background': 'rgba(0,0,0,.8)'
                }
            }
        }
    });
    $(".terms").fancybox({
        closeBtn: false,
        fitToView: false,
        wrapCSS: 'nowrapper',
        padding: 0,
        width: '90%',
        maxWidth: 793,
        height: '90%',
        maxHeight: 639,
        autoSize: false,
        closeClick: false,
        scrolling: 'auto',
        helpers: {
            overlay: {
                locked: false,
                css: {
                    'background': 'rgba(0,0,0,.8)'
                }
            }
        }
    });

    $(".cvv").fancybox({
        closeBtn: false,
        fitToView: false,
        wrapCSS: 'nowrapper',
        padding: 0,
        width: 614,
        maxWidth: '90%',
        height: 'auto',
        autoSize: false,
        closeClick: true,
        scrolling: 'no',
        helpers: {
            overlay: {
                locked: false,
                css: {
                    'background': 'rgba(255,255,255,.8)'
                }
            }
        }
    });

    //Offer page rollovers (borders plus offer details at bottom of page
    $('.kit_box').hover(
      function () {
          $('.kit_box').removeClass("kb_active");
          $('.order_checkbox').removeClass("kb_active");
          $('.order-page-col-inner').removeClass("border_dark");
          $(this).addClass("kb_active");
          $(this).children('.order-page-col-inner').addClass("border_dark");
          $('.em1').removeClass("color2");
          $(this).find('.em1').addClass("color2");
         
          $('.footnotes').hide();


          if ($(this).hasClass('kit_box_essentials')) {
              $('#kit_essentials_legal').show();
          } else if ($(this).hasClass('kit_box_mega')) {
              $('#kit_mega_legal').show();
          } 

      }
    );

    $('.prodlink').click(function (e) {
        e.preventDefault();
        $(this).siblings('.orderbtn').children("input[type = 'submit']").trigger("click");
    });

    //Products page rollover text
    $('.products_img').hover(function() {
        $(this).children('.productimginfo').fadeIn(100);
    }, function() {
        $(this).children('.productimginfo').fadeOut(100);
    });

    //Products Detail page thumbnails - > main img swap

    $('.thumbnail').hover(function () {
        var imgpath = $('.main_img').attr("src");
        var imgnum = $(this).data("thumb");
        imgpath1 = imgpath.slice(0, -5);
        imgpath2 = imgnum + ".jpg";
        imgpath3 = imgpath1 + imgpath2;
        $('.main_img').attr("src", imgpath3);
    });
    $('.thumbnail').click(function () {
        var imgpath = $('.main_img').attr("src");
        var imgnum = $(this).data("thumb");
        imgpath1 = imgpath.slice(0, -5);
        imgpath2 = imgnum + ".jpg";
        imgpath3 = imgpath1 + imgpath2;
        $('.main_img').attr("src", imgpath3);
    });

    
    


});


// set some general variables
var $video_player, _player, _isPlaying = false;
jQuery(document).ready(function ($) {
    jQuery(".fancy_video").fancybox({
        // set type of content (we are building the HTML5 <video> tag as content)
        type: "html",
        // other API options
        scrolling: "no",
        fitToView: false,
        autoSize: false,
        helpers: {
            overlay: {
                locked: false,
                css: {
                    'background': 'rgba(0,0,0,.8)'
                }
            }
        },
        beforeLoad: function () {
            // build the HTML5 video structure for fancyBox content with specific parameters
            this.content = "<video id='video_player' src='" + this.href + "' poster='" + $(this.element).data("poster") + "' width='600' height='338' controls='controls' preload='none' autoplay ></video>";
            // set fancyBox dimensions
            this.width = 600; // same as video width attribute
            this.height = 338; // same as video height attribute
        },
        afterShow: function () {
            // initialize MEJS player
            var $video_player = new MediaElementPlayer('#video_player', {
                defaultVideoWidth: this.width,
                defaultVideoHeight: this.height,
                success: function (mediaElement, domObject) {
                    _player = mediaElement; // override the "mediaElement" instance to be used outside the success setting
                    _player.load(); // fixes webkit firing any method before player is ready
                    _player.play(); // autoplay video (optional)
                    _player.addEventListener('playing', function () {
                        _isPlaying = true;
                    }, false);
                } // success
            });
        },
        beforeClose: function () {
            // if video is playing and we close fancyBox
            // safely remove Flash objects in IE
            if (_isPlaying && navigator.userAgent.match(/msie [6-8]/i)) {
                // video is playing AND we are using IE
                _player.remove(); // remove player instance for IE
                _isPlaying = false; // reinitialize flag
            };
        }
    });
}); // ready



//use to resolve postback issues
function pageLoad() {
    //$('.sizebtn').click(function () {
    //    alert('hi');
    //    $(".sizebtn").removeClass("btn_on");
    //    $(this).addClass("btn_on");
    //});


    $(function () {
        jQuery.validator.addMethod('EmailValidation', function (phone_number, element) {
            return this.optional(element) || phone_number.length > 9 &&
            phone_number.match(/^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/);
        }, 'Please enter a valid email address');


        // for Shipping form and Contact form
        // include whatever email fields exist
        $("#fm1").validateWebForm({
            rules: {
                sfcShippingInfo$txtEmail: {
                    required: true,
                    EmailValidation: true
                },
                Contact$txtEmail: {
                    required: true,
                    EmailValidation: true
                },
                Contact$txtEmailReType: {
                    required: true,
                    EmailValidation: true
                }
            }
        });

        // for Purchases - ie., ShippingBillingCreditForm.ascx - make sure form ID on this cart page is "fm_credit"
        // include whatever email fields exist 
        // and credit card fields (assuming it's one field, not split into 4 parts)
        $("#fm_credit").validateWebForm({
            rules: {
                sbcfShippingBillingCreditForm$txtEmail: {
                    required: true,
                    EmailValidation: true,
                },
                //credit card number validation requires additional-methods.min.js (validate plugin)
                sbcfShippingBillingCreditForm$txtCCNumber1: {
                    required: true,
                    creditcard: true
                },
                sbcfShippingBillingCreditForm$cbAgree: {
                    required: true
                }
                
            },
            // the below can be used to submit to tokenex or to show the mask and submit, but may conflict with shipping or contact forms?
            // make sure the name on the submit button matches the first argument in the postback below
            submitHandler: function (form) {
                //MM_showHideLayers('mask', '', 'show');
                //__doPostBack('sbcfShippingBillingCreditForm$imgBtn', '');
                return tokenize();
            }
        });


        $("#fm_home").validateWebForm({
            rules: {
                //cart
                EmailPopUp$txtEmail: {
                    EmailValidation: true,
                    required: true,
                },
            },
            messages: {
                EmailPopUp$txtEmail: {
                    required: "Please enter an email address",
                    EmailValidation: "Please enter a valid email address"
                }
            }
        });


    });

    
}
function MM_showHideLayers() { //v9.0  
    window.scrollTo(0, 0);
    var i, p, v, obj, args = MM_showHideLayers.arguments;
    for (i = 0; i < (args.length - 2) ; i += 3)
        with (document) if (getElementById && ((obj = getElementById(args[i])) != null)) {
            v = args[i + 2];
            if (obj.style) { obj = obj.style; v = (v == 'show') ? 'visible' : (v == 'hide') ? 'hidden' : v; }
            obj.visibility = v;
        }
}

// Pause All Other Players
function pauseAllOthers(currentId) {
    var jwcount = 0;
    while (jwplayer(jwcount) && jwplayer(jwcount).container && jwplayer(jwcount).getState()) {
        var jwp = jwplayer(jwcount);
        if (jwp && jwp.id != currentId) {
            jwp.pause(true);
        }
        jwcount++;
    }
}