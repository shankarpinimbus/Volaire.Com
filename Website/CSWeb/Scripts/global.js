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



    //fancybox popups
    $(".fancybox").fancybox();

    $(".included").fancybox({
        closeBtn: false,
        fitToView: false,
        wrapCSS: 'nowrapper',
        padding: 0,
        width: 710,
        height: 461,
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

    $(".guarantee").fancybox({
        closeBtn: false,
        fitToView: false,
        wrapCSS: 'nowrapper',
        padding: 0,
        width: 500,
        maxWidth: '90%',
        height: "auto",
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


});

//use to resolve postback issues
function pageLoad() {

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
                
            },
            // the below can be used to submit to tokenex or to show the mask and submit, but may conflict with shipping or contact forms?
            // make sure the name on the submit button matches the first argument in the postback below
            submitHandler: function (form) {
                //MM_showHideLayers('mask', '', 'show');
                //__doPostBack('sbcfShippingBillingCreditForm$imgBtn', '');
                return tokenize();
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