<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EmailPopup.ascx.cs" Inherits="CSWeb.Shared.UserControls.EmailPopup" %>
<%--        <script type="text/javascript" src="//nsg.symantec.com/private/rollover/rollover.js"></script>--%>
  <script type="text/javascript">
      $(document).ready(function () {
          $('#close-button').click(function () {
              $('#ltk-snippet').addClass('invisible');
          });

      });
    </script>
<style type="text/css">
    .pos-static {position:static!important}
</style>
<asp:ScriptManager runat="server" ID="sm1">
</asp:ScriptManager>
<div id="ltk-snippet" class="pos-static">
    <span id="simpleltkmodal-placeholder" style="display: none;"></span>
    <div id="ltkmodal-overlay" class="simpleltkmodal-overlay pos-static" style="background-color: rgb(0, 0, 0); opacity: 0.5; height: 6321px; width: 1349px; position: fixed; left: 0px; top: 0px; z-index: 1001;"></div>
    <div id="ltkmodal-container" class="simpleltkmodal-container pos-static" style="position: fixed; z-index: 1002; height: 436px; width: 520px; left: 50%; top: 20%; margin-left: -260px;">
        <a class="modalCloseImg simpleltkmodal-close" title="Close"></a>
        <div tabindex="-1" class="simpleltkmodal-wrap pos-static" style="height: 100%; outline: 0px; width: 100%; overflow: auto;">
            <div id="ltkmodal-content" class="simpleltkmodal-data pos-static">
                <div class="products-email-signup-img"><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/email-pop-woman.jpg" /></div>
                <div id="ltkmodal-form" class="pos-static">
                    <!-- Modal Form -->
                    <div id="ltkmodal-wrapper" class="signup pos-static" name="version1">


                        <!-- SVG Close Button -->
                        <div id="close-button">
                            <a class="ltkmodal-close" title="Close">
                                <img src="//d39hwjxo88pg52.cloudfront.net/specificbeauty/images/xclose.png" alt="Close" />
                                <%--<svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 91 612 612" style="enable-background: new 0 91 612 612;" xml:space="preserve">
                                    <polygon points="612,127 576.5,91.6 306,361.6 35.5,91.6 0,127 270.5,397 0,667 35.5,702.4 306,432.4 576.5,702.4 612,667
                341.5,397 ">
                                    </polygon>
                                </svg>--%>

                            </a>
                        </div>
                        <!-- End SVG Close Button -->
                        <fieldset class="form">
                            <div id="ltkmodal-contentarea" class="signup">
                                <div id="contentInformation" class="ltk-clearfix" style="">
                                    <%--<h1>YES!</h1>--%>
                                    <h2 class="text-center"><img src="//d39hwjxo88pg52.cloudfront.net/volaire/images/hdr-mvp.png" alt="MVP - Mega Volume Perks insiders program" style="max-width: 75%;" /></h2>
                                    <p class="p1">RSVP for the latest news, pro tips<br />                                        and exclusive offers!</p>
                                    <br />
                                    <div style="position: relative;">
                                            <div><asp:Label runat="server" Visible="false" ID="lblmsg">Please enter a valid email</asp:Label></div>
                                            <label class="label_signup" for="EmailPopUp_txtEmail">Email : </label>
                                            <asp:TextBox runat="server" placeholder="" CssClass="ltkmodal-email" ID="txtEmail"></asp:TextBox>
                                            <div class="buttons" style="text-align: center">
                                                <asp:Button runat="server" Text="Submit" ID="subButton" CssClass="ltkmodal-subscribe med submit" OnClick="subButton_Click" />
                                            </div>
                                        </div>

                                    <div class="ltk-clearfix"></div>
                                </div>
                                <!-- End Content Information -->
                            </div>
                        </fieldset>
                    </div>
<style type="text/css">
    .products-email-signup-img {
        float: left;
        width: 52%;
        z-index: 10;
    }

    #ltkmodal-form {
        float: left;
        width: 48%;
        z-index: 10;
        background: #bae2e4;
    }
    .products-email-signup-img img {
        display: block;
        width: 100%;
    }
    #ltkmodal-overlay {
        z-index: 100001 !important;
        background-color: #000 !important;
        opacity: .65 !important;
        position: fixed !important;
        width: 100% !important;
        height: 100% !important;
        top: 0 !important;
        bottom: 0 !important;
    }

    #ltkmodal-container {
        z-index: 100002 !important;
        position: fixed !important;
        width: 850px !important;
        max-width: 94% !important;
        height: auto !important;
        top: 10% !important;
        left: 50% !important;
        margin-left: 0 !important;
        border: #fff solid 3px;
        background: #bae2e4;
        -webkit-transform: translateX(-50%) !important;
        -moz-transform: translateX(-50%) !important;
        -ms-transform: translateX(-50%) !important;
        transform: translateX(-50%) !important;
    }

    #ltkmodal-wrapper {
        position: relative;
        margin: 0 auto;
        width: 100% !important;
    }

        #ltkmodal-wrapper .ltk-clearfix::after, #ltkmodal-wrapper .ltk-clearfix::before {
            content: "";
            display: table;
        }

        #ltkmodal-wrapper .ltk-clearfix::after {
            clear: both;
        }

        #ltkmodal-wrapper .ltk-clearfix {
            zoom: 1;
        }

        #ltkmodal-wrapper * {
            box-sizing: border-box;
        }

    #ltkmodal-wrapper {
        background: 0 0;
        font-size: 16px;
    }

        #ltkmodal-wrapper .no-wrap {
            white-space: nowrap;
        }

        #ltkmodal-wrapper #close-button {
            position: absolute !important;
            right: -15px;
            top: -15px;
            z-index: 10;
            margin: 0;
        }

            #ltkmodal-wrapper #close-button a {
                width: 30px;
                height: 30px;
                display: block;
                cursor: pointer;
            }

                #ltkmodal-wrapper #close-button a svg {
                    width: 100%;
                    height: 100%;
                    vertical-align: top;
                    fill: #ab4b7b;
                    -webkit-transition: all .11s linear;
                    transition: all .11s linear;
                }

                    #ltkmodal-wrapper #close-button a svg:hover {
                        fill: #111;
                    }

        #ltkmodal-wrapper #contentInformation {
            padding: 80px 2% 25px;
        }

    #contentInformation h1, #contentInformation h2, #contentInformation h3, #contentInformation h4, #contentInformation h5 {
        margin: 0;
        padding: 0;
    }
    
    #ltkmodal-contentarea {
        line-height: 20px;
        color: #333;
        text-align: center;
    }

    #contentInformation h1 {
        width: 100%;
        font: 700 110px/110px Arial,Helvetica,sans-serif;
        color: #ab4b7b;
        text-transform: uppercase;
        text-align: center;
    }

    #contentInformation h2 {
        font-size: 30px;
        color: #ccb77c;
        text-transform: uppercase;
        margin: 0 auto 40px;
        text-align: center;
        font-family: Quicksand, sans-serif;
        font-weight: bold;
    }

    #contentInformation h3 {
        font: 20px Arial,Helvetica,sans-serif;
        color: #000;
    }

    #contentInformation p {
        font-size: 20px;
        line-height: 1.4;
        color: #000;
        margin: 0;
        padding: 0 0 30px;
        font-family: Lato, sans-serif;
    }
    #contentInformation p.p1 {
        font-weight: 300;
    }

    .confirm #contentInformation h1 {
        font: 700 46px/46px Arial,Helvetica,sans-serif;
    }

    .confirm #contentInformation h2 {
        font: 28px/1em Arial,Helvetica,sans-serif;
        width: 100%;
    }

    #contentInformation .casl {
        font: 10px Arial;
        color: #999;
        padding-top: 20px;
    }

        #contentInformation .casl a {
            color: #999;
            text-decoration: none;
        }

    .label_signup {
        display: inline-block;
        vertical-align: middle;
        color: #000;
        font-family: Lato, sans-serif;
        font-weight: 300;
        font-size: 22px;
        margin-bottom: 3px;
    }

    #contentInformation input[type=email], #contentInformation input[type=number], #contentInformation input[type=text] {
        width: 70%;
        border: 1px solid #c2e4e3;
        color: #333;
        font-size: 15px;
        border-radius: 0 !important;
        box-shadow: none !important;
        padding: .5rem .5rem .4rem .4rem;
        display: inline-block;
        margin: 0 0 0 4px;
        -webkit-transition: all .11s linear;
        transition: all .11s linear;
        -webkit-appearance: none;
        -moz-appearance: none;
        appearance: none;
    }

    #contentInformation input:focus {
        outline: 0;
        border: 1px solid #111;
    }

    #contentInformation input::-webkit-input-placeholder {
        color: #929292;
        font-weight: 400;
        opacity: 1;
    }

    #contentInformation input::-moz-placeholder {
        color: #929292;
        font-weight: 400;
        opacity: 1;
    }

    #contentInformation input:-ms-input-placeholder {
        color: #929292;
        font-weight: 400;
        opacity: 1;
    }

    #contentInformation input::-ms-clear {
        display: none;
        opacity: 0;
        width: 0;
        height: 0;
    }

    #contentInformation .ltk-error-message {
        display: none;
    }

    #contentInformation input.ltkinputnotvalid {
        border-color: red;
    }

        #contentInformation input.ltkinputnotvalid::-webkit-input-placeholder {
            color: red;
        }

        #contentInformation input.ltkinputnotvalid::-moz-placeholder {
            color: red;
        }

        #contentInformation input.ltkinputnotvalid:-ms-input-placeholder {
            color: red;
        }

        #contentInformation input.ltkinputnotvalid + div.ltk-error-message {
            display: block;
            color: red;
        }



    #contentInformation .hidden-select {
        position: absolute;
        top: -1px;
        left: 0;
        width: 100%;
        height: 100%;
        background: transparent !important;
        border: transparent;
        outline: 0;
        z-index: 99;
        box-sizing: border-box;
        -moz-box-sizing: border-box;
        -webkit-box-sizing: border-box;
    }


    #contentInformation .buttons {
        width: 100%;
        position: relative;
    }

    #contentInformation .ltk-close-button, #contentInformation .ltkmodal-subscribe {
        font-size: 22px;
        line-height: 1.1;
        cursor: pointer;
        border: 0;
        box-shadow: none !important;
        color: #fff;
        background: #f17533;
        display: inline-block;
        text-decoration: none;
        vertical-align: middle;
        margin: 25px 0 0 10%;
        padding: 8px 26px;
        -webkit-appearance: none !important;
        -moz-appearance: none !important;
        appearance: none !important;
        -webkit-transition: all .11s linear;
        transition: all .11s linear;
        font-family: Quicksand, sans-serif;
        font-weight: bold;
        font-size: 22px;
    }

    #contentInformation .ltk-close-button {
        float: none;
        margin: 10px auto 0;
    }

        #contentInformation .ltk-close-button:hover, #contentInformation .ltkmodal-subscribe:hover {
            background-color: #cb5415;
        }

        #contentInformation .ltk-close-button:focus, #contentInformation .ltkmodal-subscribe:focus {
            outline: 0;
        }

    #contentInformation .ltkmodal-no-thanks {
        float: right;
        width: 50%;
        margin: 10px 0 0;
    }

        #contentInformation .ltkmodal-no-thanks a {
            display: inline-block;
            font-weight: 700;
            color: #333;
            font-size: 12px;
            padding: 10px;
            text-decoration: underline;
            -webkit-transition: all .11s linear;
            transition: all .11s linear;
        }

            #contentInformation .ltkmodal-no-thanks a:hover {
                text-decoration: none;
                color: #111;
            }


    #ltkmodal-contentarea label.error {
        display: block !important;
        position: absolute;
        top: -1.4rem;
        left: 24%;
        border: 0 !important;
    }

    fieldset {border: 0;}

    @media only screen and (min-width: 768px) and (max-width: 1024px) {
        #ltkmodal-wrapper #contentInformation {
            padding: 40px 2% 25px;
        }
    
        #contentInformation h2 {
            font-size: 26px;
            margin: 0 auto 24px;
        }

        #contentInformation p {
            font-size: 17px;
            padding: 0 0 20px;
        }

    }


    @media only screen and (max-width:767px) {
        .products-email-signup-img {
            display: none
        }
        #ltkmodal-form {
            float: none;
            width: 100%;
        }

        #ltkmodal-contentarea label.error {
            top: -1.25rem;
            left: 12%;
        }

        #ltkmodal-container {
            position: absolute !important;
            width: 100% !important;
            top: 60px !important;
        }

        #ltkmodal-wrapper {
            width: 94% !important;
        }

            #ltkmodal-wrapper .mobileHide {
                display: none;
            }

            #ltkmodal-wrapper #contentInformation {
                float: none;
                width: 100%;
                padding: 1.8rem 2% 1.5rem;
            }

        #contentInformation h1 {
            font: 700 80px/80px Arial,Helvetica,sans-serif;
        }

        #contentInformation h2 {
            font-size: 24px;
            margin-bottom: 1.3rem;
        }

        #contentInformation h3 {
            font: 20px Arial,Helvetica,sans-serif;
            color: #000;
        }

        #contentInformation p {
            font-size: 14px;
            font-size: 4.4vw;
            padding: 0 0 .6rem;
        }

        #contentInformation .casl {
            font-size: 13px;
        }

        .confirm #contentInformation h1 {
            font: 700 26px/26px Arial,Helvetica,sans-serif;
        }

        .confirm #contentInformation h2 {
            font: 24px/1em Arial,Helvetica,sans-serif;
            width: 100%;
        }

        #contentInformation input[type=email], #contentInformation input[type=number], #contentInformation input[type=text] {
            width: 70%;
            padding: .35rem .5rem .3rem .4rem;
        }


        #contentInformation .close-button, #contentInformation .ltkmodal-subscribe {
            font-size: 17px;
            font-size: 5vw;
            padding: 5px 24px;
            margin: 1rem auto 0;
        }
        .label_signup {
            font-size: 14px;
            font-size: 4.4vw;
        }

        #contentInformation .ltkmodal-no-thanks {
            float: none;
            width: 100%;
        }

            #contentInformation .ltkmodal-no-thanks a {
                margin: 15px 0 0;
                display: block;
            }


        #EmailPopUp_lblmsg {font-size: 87%;}

    }
</style>
                </div>
            </div>
        </div>
    </div>
</div>