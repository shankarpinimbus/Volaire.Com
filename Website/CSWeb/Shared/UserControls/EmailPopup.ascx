<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EmailPopup.ascx.cs" Inherits="CSWeb.Shared.UserControls.EmailPopup" %>
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
                <div id="ltkmodal-form" class="pos-static">
                    <!-- Modal Form -->
                    <div id="ltkmodal-wrapper" class="signup pos-static" name="version1">


                        <!-- SVG Close Button -->
                        <div id="close-button" style="color: white">
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
                                    <h2>HELLO BEAUTIFUL!</h2>
                                    <p class="med">Join our email list to make sure you're the first in line to receive our sneak peeks, beauty tips, and exclusive online offers.</p>
                                    <br />
                                    <div style="position: relative;">
                                        <div><asp:Label runat="server" Visible="false" ID="lblmsg">Please enter a valid email</asp:Label></div>
                                        <label class="label_signup" for="EmailPopUp_txtEmail">Email :</label>
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
        width: 620px !important;
        height: auto !important;
        top: 10% !important;
        left: 50% !important;
        margin: 0 auto !important;
        border: #fff solid 3px;
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
        font-family: Arial,Helvetica,sans-serif;
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
            #ltkmodal-wrapper #close-button a:hover img {
                opacity: .9;
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
            padding: 120px 20% 100px;
        }

    #contentInformation h1, #contentInformation h2, #contentInformation h3, #contentInformation h4, #contentInformation h5 {
        margin: 0;
        padding: 0;
    }

    #ltkmodal-contentarea {
        background: #087f7d url(//d39hwjxo88pg52.cloudfront.net/specificbeauty/images/bg_email_signup.jpg);
        background-size: cover;
        line-height: 20px;
        color: #333;
        text-align: center;
        /*border-radius: 10px;*/
    }

    #contentInformation h2 {
        font-size: 36px;
        color: #fff;
        text-transform: uppercase;
        text-align: center;
        margin: 0 auto 26px;
        font-weight: bold;
    }

    #contentInformation p {
        font: 16px/1.5em Arial,Helvetica,sans-serif;
        color: #fff;
        margin: 0;
        padding: 0 0 15px;
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
        color: #fff;
    }

    #contentInformation input[type=email], #contentInformation input[type=number], #contentInformation input[type=text] {
        width: 60%;
        border: 1px solid #c2e4e3;
        color: #333;
        font-size: 15px;
        border-radius: 0 !important;
        box-shadow: none !important;
        padding: .4rem .5rem .3rem .4rem;
        display: inline-block;
        margin: 0;
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



    #contentInformation .buttons {
        width: 100%;
        position: relative;
    }

    #contentInformation .ltk-close-button, #contentInformation .ltkmodal-subscribe {
        font-size: 16px;
        line-height: 20px;
        cursor: pointer;
        border: 0;
        box-shadow: none !important;
        color: #fec563;
        background: #0e7472;
        display: inline-block;
        text-decoration: none;
        vertical-align: middle;
        margin: 15px 0 0 10%;
        padding: 4px 20px;
        -webkit-appearance: none !important;
        -moz-appearance: none !important;
        appearance: none !important;
        -webkit-transition: all .11s linear;
        transition: all .11s linear;
    }

    #contentInformation .ltk-close-button {
        float: none;
        margin: 10px auto 0;
    }

        #contentInformation .ltk-close-button:hover, #contentInformation .ltkmodal-subscribe:hover {
            background-color: #0b5c5a;
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
        left: 28%;
        border: 0 !important;
    }

    @media only screen and (max-width:767px) {

        #ltkmodal-contentarea label.error {
            top: -1.25rem;
            left: 12%;
        }

        #ltkmodal-container {
            position: absolute !important;
            width: 92% !important;
            top: 60px !important;
        }

        #ltkmodal-contentarea {background-size: 150%;}

        #ltkmodal-wrapper {
            width: 100% !important;
        }

            #ltkmodal-wrapper .mobileHide {
                display: none;
            }

            #ltkmodal-wrapper #contentInformation {
                float: none;
                width: 100%;
                padding: 30px 5% 30px;
            }

        #contentInformation h1 {
            font: 700 80px/80px Arial,Helvetica,sans-serif;
        }

        #contentInformation h2 {
            font-size: 24px;
            text-transform: uppercase;
            width: 100%;
            margin-bottom: 1rem;
        }

        #contentInformation h3 {
            font: 20px Arial,Helvetica,sans-serif;
            color: #000;
        }

        #contentInformation p {
            font-size: 13px;
            font-size: 4.2vw;
            margin: 0;
            padding: 0 0 .8rem;
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
            margin: 0 auto;
        }
        

        #contentInformation .close-button, #contentInformation .ltkmodal-subscribe {
            font-size: 15px;
            font-size: 5vw;
            padding: .2rem 1em;
            line-height: 1.2;
        }
        .label_signup {
            font-size: 13px;
            font-size: 4.2vw;
        }

        #contentInformation .ltkmodal-no-thanks {
            float: none;
            width: 100%;
        }

            #contentInformation .ltkmodal-no-thanks a {
                margin: 15px 0 0;
                display: block;
            }
    }
</style>
                </div>
            </div>
        </div>
    </div>
</div>
