// JavaScript Document
$(document).ready(function () {

    $(this).scrollTop(0);

    $('.toggleNav').click(function () {
        $('#headernav').slideToggle();
    });


    //cvv overlay
    $(".cvv").fancybox({
        fitToView: false,
        wrapCSS: 'nowrapper',
        closeBtn: false,
        padding: 0,
        width: 614,
        height: 733,
        autoSize: false,
        closeClick: true,
        scrolling: 'no',
        helpers: {
            overlay: {
                opacity: 0.6,
                locked: false
            }
        }
    });


    $(".included").fancybox({
        closeBtn: true,
        fitToView: false,
        wrapCSS: 'nowrapper',
        padding: 0,
        width: 607,
        height: 497,
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

    $('.togglefaq').click(function (e) {
        e.preventDefault();
        var notthis = $('.active').not(this);
        notthis.find('.icon-minus').addClass('icon-plus').removeClass('icon-minus');
        notthis.toggleClass('active').next('.faqanswer').slideToggle(300);
        $(this).toggleClass('active').next().slideToggle("fast");
        $(this).children().toggleClass('icon-plus icon-minus');
    });


    $(".less_link_1").on("click", function () {
        var el = $(this);
        var el_less = '<span class="less_link_txt">View Less Videos</span>';
        var el_more = '<span class="more_link_txt">View More Videos</span>';
        el.html() == el_more
		  ? el.html(el_less)
		  : el.html(el_more);
        $('#thumb_list2').slideToggle();
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