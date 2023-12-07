<?xml
version="1.0" encoding="UTF-8"?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
    <head id="j_idt3">
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link type="text/css" rel="stylesheet" href="/javax.faces.resource/mobile/jquery-mobile.css.jsf?ln=primefaces&amp;v=6.1.19"/>
        <link type="text/css" rel="stylesheet" href="/javax.faces.resource/mobile/primefaces-mobile.css.jsf?ln=primefaces&amp;v=6.1.19"/>
        <link type="text/css" rel="stylesheet" href="/javax.faces.resource/fa/font-awesome.css.jsf?ln=primefaces&amp;v=6.1.19"/>
        <script type="text/javascript" src="/javax.faces.resource/jquery/jquery.js.jsf?ln=primefaces&amp;v=6.1.19"></script>
        <script type="text/javascript">
            $(document).on('mobileinit', function() {
                $.mobile.ajaxEnabled = false;
                $.mobile.pushStateEnabled = false;
                $.mobile.page.prototype.options.domCache = true;
            });
        </script>
        <script type="text/javascript" src="/javax.faces.resource/mobile/jquery-mobile.js.jsf?ln=primefaces&amp;v=6.1.19"></script>
        <script type="text/javascript" src="/javax.faces.resource/core.js.jsf?ln=primefaces&amp;v=6.1.19"></script>
        <script type="text/javascript" src="/javax.faces.resource/components-mobile.js.jsf?ln=primefaces&amp;v=6.1.19"></script>
        <link type="text/css" rel="stylesheet" href="/javax.faces.resource/grid.css.jsf?ln=css"/>
        <script type="text/javascript" src="/javax.faces.resource/jsf.js.jsf?ln=javax.faces"></script>
        <script type="text/javascript" src="/javax.faces.resource/primefaces-extensions.js.jsf?ln=primefaces-extensions&amp;v=6.1"></script>
        <script type="text/javascript" src="/javax.faces.resource/qrcode/qrcode.js.jsf?ln=primefaces-extensions&amp;v=6.1"></script>
        <link href="/template/default/css/base_mob_layout.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript">
            var _gaq = _gaq || [];
            var prod = true;
            // Global
            if (prod) {
                _gaq.push(['_setAccount', 'UA-9525713-22']);
                _gaq.push(['_trackPageview']);
            }
            // Instance specific
            var instid = '';
            var domainName = '';
            var trackerName = '';
            if (instid != '') {
                _gaq.push(['_setAccount', instid]);
                if (domainName != '') {
                    _gaq.push(['_setDomainName', domainName]);
                }
                if (trackerName != '') {
                    _gaq.push(['_trackPageview', trackerName]);
                } else {
                    _gaq.push(['_trackPageview']);
                }
            }
            (function() {
                var ga = document.createElement('script');
                ga.type = 'text/javascript';
                ga.async = true;
                ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
                var s = document.getElementsByTagName('script')[0];
                s.parentNode.insertBefore(ga, s);
            }
            )();
        </script>
        <script type="text/javascript">
            PrimeFaces.locales['en'] = {
                showMonthAfterYear: true
            };
            function showModal() {
                $("#base_page").append('<div class="modalWindow"></div>');
            }
            function hideModal() {
                $(".modalWindow").remove();
            }
        </script>
        <script type="text/javascript">
            function updateCurrency(currency) {// Do Nothing
            }
        </script>
        <script src="/template/default/js/calendar.js"></script>
        <link href="yourbooking.css" rel="stylesheet" type="text/css"/>
        <link href="../ui/offer/inc/stripe.css" rel="stylesheet" type="text/css"/>
        <link id="customCssUrl" rel="stylesheet" type="text/css" href="//dabb7zy6p4b0z.cloudfront.net/nisade/nisade02.css?v=1.1"/>
        <script>
            $.fn.onScreen = function() {
                var win = $(window);
                var viewport = {
                    top: win.scrollTop(),
                    left: win.scrollLeft()
                };
                viewport.right = viewport.left + win.width();
                viewport.bottom = viewport.top + win.height();
                var bounds = this.offset();
                bounds.right = bounds.left + this.outerWidth();
                bounds.bottom = bounds.top + this.outerHeight();
                return (!(viewport.right < bounds.left || viewport.left > bounds.right || viewport.bottom < bounds.top || viewport.top > bounds.bottom));
            }
            ;
            function windowScroll(id) {
                windowScroll(id, 500);
            }
            function windowScroll(id, time) {
                if ($(id).length) {
                    $('html, body').animate({
                        scrollTop: $(id).offset().top
                    }, time);
                }
            }
            window.onscroll = function() {
                var payScroll = document.getElementById("scrollToPay");
                var payNow = document.getElementById("base_page:txtab");
                var limit = window.innerHeight;
                if (payScroll) {
                    if ($(payScroll.length)) {
                        if ($(window).scrollTop() == $(document).height() - $(window).height() || $(payNow).onScreen()) {
                            payScroll.style.opacity = "0%";
                            payScroll.style.bottom = "-100px";
                        } else {
                            payScroll.style.opacity = "95%";
                            payScroll.style.bottom = ".25em";
                        }
                    }
                }
            }
        </script>
    </head>
    <body>
        <div id="base_page" data-role="page" data-title="" class="rb-page">
            <div id="base_page:base_header" data-role="header" data-backbtn="false" class="rb-header">
                <h1>Your Booking</h1>
                <form id="base_page:locform" name="base_page:locform" method="post" action="/public/yourbooking.jsf" class="ui-btn-right" enctype="application/x-www-form-urlencoded">
                    <input type="hidden" name="base_page:locform" value="base_page:locform"/>
                    <table class="ui-btn-right">
                        <tbody>
                            <tr>
                                <td>
                                    <div id="base_page:locform:languageSelect">
                                        <select id="base_page:locform:languageSelect_input" name="base_page:locform:languageSelect" data-role="none" class="rb-hide-disabled" onchange="submit()">
                                            <option value="en" selected="selected">English</option>
                                            <option value="ja">日本語</option>
                                            <option value="ko">한국어</option>
                                            <option value="fr">Français</option>
                                            <option value="zh-CN">中文(简体)</option>
                                            <option value="zh">中文(繁體)</option>
                                        </select>
                                    </div>
                                    <script id="base_page:locform:languageSelect_s" type="text/javascript">
                                        PrimeFaces.cw("SelectOneMenu", "widget_base_page_locform_languageSelect", {
                                            id: "base_page:locform:languageSelect"
                                        });
                                    </script>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <input type="hidden" name="javax.faces.ViewState" id="j_id1:javax.faces.ViewState:0" value="-6557909179203061962:1031983341735614216" autocomplete="off"/>
                    <input type="hidden" name="javax.faces.RenderKitId" value="PRIMEFACES_MOBILE"/>
                </form>
            </div>
            <div role="main" class="ui-content rb-content">
                <div id="base_page:messages" class="ui-outputpanel ui-widget">
                    <div id="base_page:j_idt35"></div>
                    <script id="base_page:j_idt35_s" type="text/javascript">
                        $(function() {
                            PrimeFaces.cw("Growl", "widget_base_page_j_idt35", {
                                id: "base_page:j_idt35",
                                escape: false,
                                msgs: []
                            });
                        });
                    </script>
                </div>
                <span class="rbn-yb-searchtext">Enter your booking ID and email address to view your booking. Details of how to make payment are also available. Please contact us if you have any questions.</span>
                <form id="base_page:gform" name="base_page:gform" method="post" action="/public/yourbooking.jsf" enctype="application/x-www-form-urlencoded">
                    <input type="hidden" name="base_page:gform" value="base_page:gform"/>
                    <div class="ui-field-contain">
                        <label id="base_page:gform:j_idt38" class="ui-outputlabel ui-widget">Booking ID</label>
                        <div id="base_page:gform:gid" class="ui-input-text ui-body-inherit ui-corner-all ui-shadow-inset ui-input-has-clear">
                            <input data-role="none" id="base_page:gform:gid_input" name="base_page:gform:gid_input" type="text" value="1150344" maxlength="7"/>
                            <a href="#" class="ui-input-clear ui-btn ui-icon-delete ui-btn-icon-notext ui-corner-all ui-input-clear-hidden"></a>
                        </div>
                        <script id="base_page:gform:gid_s" type="text/javascript">
                            PrimeFaces.cw("InputText", "widget_base_page_gform_gid", {
                                id: "base_page:gform:gid"
                            });
                        </script>
                    </div>
                    <div class="ui-field-contain">
                        <label id="base_page:gform:j_idt41" class="ui-outputlabel ui-widget">Email Address</label>
                        <div id="base_page:gform:gem" class="ui-input-text ui-body-inherit ui-corner-all ui-shadow-inset ui-input-has-clear">
                            <input data-role="none" id="base_page:gform:gem_input" name="base_page:gform:gem_input" type="email" value="tiffany_y_chua@hotmail.com" maxlength="128"/>
                            <a href="#" class="ui-input-clear ui-btn ui-icon-delete ui-btn-icon-notext ui-corner-all ui-input-clear-hidden"></a>
                        </div>
                        <script id="base_page:gform:gem_s" type="text/javascript">
                            PrimeFaces.cw("InputText", "widget_base_page_gform_gem", {
                                id: "base_page:gform:gem"
                            });
                        </script>
                    </div>
                    <input id="base_page:gform:gbutt" type="submit" name="base_page:gform:gbutt" value="View Booking"/>
                    <input type="hidden" name="javax.faces.ViewState" id="j_id1:javax.faces.ViewState:1" value="-6557909179203061962:1031983341735614216" autocomplete="off"/>
                    <input type="hidden" name="javax.faces.RenderKitId" value="PRIMEFACES_MOBILE"/>
                </form>
                <div id="base_page:j_idt43" class="ui-outputpanel ui-widget rbn-yb-h1">
                    <span id="base_page:guest-intranet-greeting">Dear MS Tiffany Siy, thank you for your reservation.</span>
                </div>
                <div id="base_page:postab" class="ui-datatable ui-shadow">
                    <div class="ui-datatable-tablewrapper">
                        <table role="grid" class="ui-responsive ui-table table-stripe ui-table-reflow">
                            <thead id="base_page:postab_head">
                                <tr class="ui-bar-a" role="row">
                                    <th id="base_page:postab:pos" role="columnheader" class="ui-column-header">
                                        <span class="ui-column-title">Booking With</span>
                                    </th>
                                    <th id="base_page:postab:posemail" role="columnheader" class="ui-column-header">
                                        <span class="ui-column-title">Email</span>
                                    </th>
                                    <th id="base_page:postab:postel" role="columnheader" class="ui-column-header">
                                        <span class="ui-column-title">Telephone</span>
                                    </th>
                                </tr>
                            </thead>
                            <tbody id="base_page:postab_data">
                                <tr data-ri="0" class="ui-table-row">
                                    <td role="gridcell">
                                        <b class="ui-table-cell-label">Booking With</b>
                                        <span id="base_page:postab:0:posnm">Nisade</span>
                                    </td>
                                    <td role="gridcell">
                                        <b class="ui-table-cell-label">Email</b>
                                        <a href="mailto:reservations@nisade.com" target="_blank">reservations@nisade.com</a>
                                    </td>
                                    <td role="gridcell">
                                        <b class="ui-table-cell-label">Telephone</b>
                                        0136 23 1724
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <script id="base_page:postab_s" type="text/javascript">
                    PrimeFaces.cw("DataTable", "widget_base_page_postab", {
                        id: "base_page:postab",
                        reflow: true
                    });
                </script>
                <div id="base_page:ttab" class="ui-datatable ui-shadow">
                    <div class="ui-datatable-tablewrapper">
                        <table role="grid" class="ui-responsive ui-table table-stripe ui-table-reflow">
                            <thead id="base_page:ttab_head">
                                <tr class="ui-bar-a" role="row">
                                    <th id="base_page:ttab:nbks" role="columnheader" class="ui-column-header">
                                        <span class="ui-column-title">Bookings in Package</span>
                                    </th>
                                    <th id="base_page:ttab:tcst" role="columnheader" class="ui-column-header">
                                        <span class="ui-column-title">Total Cost</span>
                                    </th>
                                    <th id="base_page:ttab:trcd" role="columnheader" class="ui-column-header">
                                        <span class="ui-column-title">Received</span>
                                    </th>
                                </tr>
                            </thead>
                            <tbody id="base_page:ttab_data">
                                <tr data-ri="0" class="ui-table-row">
                                    <td role="gridcell">
                                        <b class="ui-table-cell-label">Bookings in Package</b>
                                        6
                                    </td>
                                    <td role="gridcell">
                                        <b class="ui-table-cell-label">Total Cost</b>
                                        2,819,840 JPY
                                    </td>
                                    <td role="gridcell">
                                        <b class="ui-table-cell-label">Received</b>
                                        2,786,840 JPY
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <script id="base_page:ttab_s" type="text/javascript">
                    PrimeFaces.cw("DataTable", "widget_base_page_ttab", {
                        id: "base_page:ttab",
                        reflow: true
                    });
                </script>
                <div id="base_page:tabview" class="ui-accordion ui-collapsible-set ui-corner-all ui-hidden-container" role="tablist" data-widget="widget_base_page_tabview">
                    <div id="base_page:tabview:t0" class="ui-collapsible ui-collapsible-inset ui-corner-all ui-collapsible-themed-content ui-collapsible-collapsed" role="tabpanel">
                        <div class="ui-collapsible-heading ui-collapsible-heading-collapsed" role="tab" aria-expanded="false">
                            <a href="#" class="ui-collapsible-heading-toggle ui-btn ui-btn-icon-left ui-icon-plus">
                                <table class="accordion-bar-content">
                                    <tbody>
                                        <tr>
                                            <td>
                                                <img id="base_page:tabview:i0" src="https://dh1msuk8kbcis.cloudfront.net/0_img/vdr/thumb_sml/8a80818a7ed0faf8017ed772c5881301_niseko_617852.jpg" height="60" width="90" class="rbn-tab-img"/>
                                            </td>
                                            <td>
                                                <div class="accordion-title rbn-bold">
                                                    <span class="accordion-vendor">Niseko Chalets :  </span>
                                                    <span class="accordion-date">Dec 26, 2022</span>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="accordion-status-block">
                                                    <div class="accordion-status res">RESERVATION</div>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </a>
                        </div>
                        <div class="ui-collapsible-content ui-body-inherit ui-collapsible-content-collapsed" aria-hidden="true">
                            <p>
                            <div class="ui-grid ui-grid-responsive rbn-vendor-box">
                                <div class="ui-grid-row" style="padding: 5px;">
                                    <div class="ui-grid-col-3" style="text-align: center;">
                                        <img src="https://dh1msuk8kbcis.cloudfront.net/0_img/vdr/thumb/8a80818a7ed0faf8017ed772c5881301_niseko_617852.jpg" style="width:90%;"/>
                                    </div>
                                    <div class="ui-grid-col-9" style="text-align: justify;">
                                        <div id="base_page:tabview:j_idt78" class="ui-grid-solo">
                                            <div class="ui-block-a">
                                                <span id="base_page:tabview:vndname" class="rbn-bold">Niseko Chalets, Niseko</span>
                                            </div>
                                            <div class="ui-block-a">
                                                <span id="base_page:tabview:vnddesc"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="base_page:tabview:resultTable0" class="ui-datatable ui-shadow">
                                <div class="ui-datatable-tablewrapper">
                                    <table role="grid" class="ui-responsive ui-table table-stripe ui-table-reflow">
                                        <thead id="base_page:tabview:resultTable0_head">
                                            <tr class="ui-bar-a" role="row">
                                                <th id="base_page:tabview:resultTable0:eidcol" role="columnheader" class="ui-column-header rbn-eidcol">
                                                    <span class="ui-column-title">ID</span>
                                                </th>
                                                <th id="base_page:tabview:resultTable0:dtcol" role="columnheader" class="ui-column-header rbn-dtcol">
                                                    <span class="ui-column-title">Created On</span>
                                                </th>
                                                <th id="base_page:tabview:resultTable0:j_idt87" role="columnheader" class="ui-column-header">
                                                    <span class="ui-column-title">Property</span>
                                                </th>
                                                <th id="base_page:tabview:resultTable0:extent" role="columnheader" class="ui-column-header">
                                                    <span class="ui-column-title">Type</span>
                                                </th>
                                                <th id="base_page:tabview:resultTable0:state" role="columnheader" class="ui-column-header">
                                                    <span class="ui-column-title">State</span>
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody id="base_page:tabview:resultTable0_data">
                                            <tr data-ri="0" class="ui-table-row">
                                                <td role="gridcell" class="rbn-eidcol">
                                                    <b class="ui-table-cell-label">ID</b>
                                                    1150344
                                                </td>
                                                <td role="gridcell" class="rbn-dtcol">
                                                    <b class="ui-table-cell-label">Created On</b>
                                                    Monday, September 12, 2022 17:02 (GMT)
                                                </td>
                                                <td role="gridcell">
                                                    <b class="ui-table-cell-label">Property</b>
                                                    Niseko Chalets
                                                </td>
                                                <td role="gridcell">
                                                    <b class="ui-table-cell-label">Type</b>
                                                    RESERVATION
                                                </td>
                                                <td role="gridcell">
                                                    <b class="ui-table-cell-label">State</b>
                                                    <span id="base_page:tabview:resultTable0:0:bookingState" class="active">Active</span>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <script id="base_page:tabview:resultTable0_s" type="text/javascript">
                                PrimeFaces.cw("DataTable", "widget_base_page_tabview_resultTable0", {
                                    id: "base_page:tabview:resultTable0",
                                    reflow: true
                                });
                            </script>
                            <div id="base_page:tabview:otaElementTable0" class="ui-datatable ui-shadow">
                                <div class="ui-datatable-tablewrapper">
                                    <table role="grid" class="ui-responsive ui-table table-stripe ui-table-reflow">
                                        <thead id="base_page:tabview:otaElementTable0_head">
                                            <tr class="ui-bar-a" role="row">
                                                <th id="base_page:tabview:otaElementTable0:j_idt127" role="columnheader" class="ui-column-header nowrap">
                                                    <span class="ui-column-title">Check-in</span>
                                                </th>
                                                <th id="base_page:tabview:otaElementTable0:j_idt131" role="columnheader" class="ui-column-header nowrap">
                                                    <span class="ui-column-title">Check-out</span>
                                                </th>
                                                <th id="base_page:tabview:otaElementTable0:j_idt133" role="columnheader" class="ui-column-header nowrap">
                                                    <span class="ui-column-title">Nights</span>
                                                </th>
                                                <th id="base_page:tabview:otaElementTable0:j_idt135" role="columnheader" class="ui-column-header">
                                                    <span class="ui-column-title">Guests</span>
                                                </th>
                                                <th id="base_page:tabview:otaElementTable0:j_idt144" role="columnheader" class="ui-column-header">
                                                    <span class="ui-column-title">Room Type</span>
                                                </th>
                                                <th id="base_page:tabview:otaElementTable0:ratePlan" role="columnheader" class="ui-column-header" style="width:250px">
                                                    <span class="ui-column-title">Rate Plan</span>
                                                </th>
                                                <th id="base_page:tabview:otaElementTable0:meals" role="columnheader" class="ui-column-header">
                                                    <span class="ui-column-title">Meals</span>
                                                </th>
                                                <th id="base_page:tabview:otaElementTable0:j_idt181" role="columnheader" class="ui-column-header">
                                                    <span class="ui-column-title">Cost</span>
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody id="base_page:tabview:otaElementTable0_data">
                                            <tr data-ri="0" class="ui-table-row">
                                                <td role="gridcell" class="nowrap">
                                                    <b class="ui-table-cell-label">Check-in</b>
                                                    Dec 26, 2022
                                                </td>
                                                <td role="gridcell" class="nowrap">
                                                    <b class="ui-table-cell-label">Check-out</b>
                                                    Jan 2, 2023
                                                </td>
                                                <td role="gridcell" class="nowrap">
                                                    <b class="ui-table-cell-label">Nights</b>
                                                    7
                                                </td>
                                                <td role="gridcell">
                                                    <b class="ui-table-cell-label">Guests</b>
                                                    8
                                                </td>
                                                <td role="gridcell">
                                                    <b class="ui-table-cell-label">Room Type</b>
                                                    Sekka Sekka
                                                    <div id="base_page:tabview:otaElementTable0:0:j_idt146" class="ui-datagrid">
                                                        <div id="base_page:tabview:otaElementTable0:0:j_idt146_content" class="ui-datagrid-content ui-responsive ui-grid-solo">
                                                            <div class="ui-block-a">Bedding Room 1 : Twin</div>
                                                            <div class="ui-block-a">Bedding Room 2 : Twin</div>
                                                            <div class="ui-block-a">Bedding Room 3 : King</div>
                                                            <div class="ui-block-a">Bedding Room 4 : King</div>
                                                            <div class="ui-block-a">Bedding Room 5 : 2 Futons</div>
                                                        </div>
                                                    </div>
                                                    <script id="base_page:tabview:otaElementTable0:0:j_idt146_s" type="text/javascript">
                                                        PrimeFaces.cw("DataGrid", "widget_base_page_tabview_otaElementTable0_0_j_idt146", {
                                                            id: "base_page:tabview:otaElementTable0:0:j_idt146"
                                                        });
                                                    </script>
                                                </td>
                                                <td role="gridcell">
                                                    <b class="ui-table-cell-label">Rate Plan</b>
                                                    <span id="base_page:tabview:otaElementTable0:0:ratePlanName">2022-2023 Winter Room-Only</span>
                                                    <div>
                                                        <a id="base_page:tabview:otaElementTable0:0:ratePlanDescIcon" href="#" class="ui-commandlink ui-widget" onclick="PF('dlg').show();PrimeFaces.ab({s:&quot;base_page:tabview:otaElementTable0:0:ratePlanDescIcon&quot;});return false;">View More</a>
                                                        <div id="base_page:tabview:otaElementTable0:0:j_idt159_mask" class="ui-popup-screen ui-overlay-b ui-screen-hidden"></div>
                                                        <div id="base_page:tabview:otaElementTable0:0:j_idt159" class="ui-popup-container ui-popup-hidden ui-popup-truncate" style="left: 10px">
                                                            <div class="ui-popup ui-body-inherit ui-overlay-shadow ui-corner-all">
                                                                <div class="ui-header ui-bar-inherit">
                                                                    <a href="#" class="ui-btn ui-corner-all ui-icon-delete ui-btn-icon-notext ui-btn-left"></a>
                                                                    <h1 class="ui-title" role="heading">2022-2023 Winter Room-Only</h1>
                                                                </div>
                                                                <div class="ui-content" role="main">
                                                                    <p class="p-m-0" id="ratePlanDesc">Rate is for room only, valid for 1 December 2022 - 31 March 2023.
					</p>
                                                                    <p class="p-m-1" id="ratePlanDetDesc">
                                                                    <p>
                                                                        <strong>Rate is for room only, valid for 1 December 2022 - 31 March 2023.&nbsp;</strong>
                                                                    </p>
                                                                    <p>10% deposit is required to confirm the booking.&nbsp;&nbsp;</p>
                                                                    <p>This rate does not include parking fees for Always Niseko.</p>
                                                                    <p>
                                                                        <br>
                                                                    </p>
                                                                    <p>
                                                                        The <strong>cancellation &amp;payment policy </strong>
                                                                        for this plan is:
                                                                    </p>
                                                                    <ul>
                                                                        <li>The 10% deposit is non-refundable from date of booking.</li>
                                                                        <li>60 days prior to check-in, the 90% final balance will be due.&nbsp;This final payment is non-refundable.</li>
                                                                        <li>Additional COVID19 cancellation terms may apply.</li>
                                                                    </ul>
                                                                    <p>
                                                                        <br>
                                                                    </p>
                                                                    <p>Please ensure that you arrange your own travel insurance at the time of deposit payment.</p>
</p></div></div></div><script id="base_page:tabview:otaElementTable0:0:j_idt159_s" type="text/javascript">
    $(function() {
        PrimeFaces.cw("Dialog", "dlg", {
            id: "base_page:tabview:otaElementTable0:0:j_idt159",
            showEffect: "fade"
        });
    });
</script>
</div></td>
<td role="gridcell">
    <b class="ui-table-cell-label">Meals</b>
    <ul style="display: inline-block;list-style-type: none;padding-left: 0px;margin: 0px">
        <li></li>
        <li></li>
        <li></li>
        <li>
            <span id="base_page:tabview:otaElementTable0:0:noMeals">No meals included.</span>
        </li>
    </ul>
</td>
<td role="gridcell">
    <b class="ui-table-cell-label">Cost</b>
    2,298,240 JPY
</td>
</tr></tbody></table></div></div><script id="base_page:tabview:otaElementTable0_s" type="text/javascript">
    PrimeFaces.cw("DataTable", "widget_base_page_tabview_otaElementTable0", {
        id: "base_page:tabview:otaElementTable0",
        reflow: true
    });
</script>
<div id="base_page:tabview:elementTableTwo0" class="ui-datatable ui-shadow">
    <div class="ui-datatable-tablewrapper">
        <table role="grid" class="ui-responsive ui-table table-stripe ui-table-reflow">
            <thead id="base_page:tabview:elementTableTwo0_head">
                <tr class="ui-bar-a" role="row">
                    <th id="base_page:tabview:elementTableTwo0:j_idt216" role="columnheader" class="ui-column-header nowrap">
                        <span class="ui-column-title">Arrival Time</span>
                    </th>
                    <th id="base_page:tabview:elementTableTwo0:j_idt217" role="columnheader" class="ui-column-header nowrap">
                        <span class="ui-column-title">Departure Time</span>
                    </th>
                    <th id="base_page:tabview:elementTableTwo0:j_idt218" role="columnheader" class="ui-column-header">
                        <span class="ui-column-title">Room Notes</span>
                    </th>
                </tr>
            </thead>
            <tbody id="base_page:tabview:elementTableTwo0_data">
                <tr data-ri="0" class="ui-table-row">
                    <td role="gridcell" class="nowrap">
                        <b class="ui-table-cell-label">Arrival Time</b>
                        <span id="base_page:tabview:elementTableTwo0:0:inhourview">--:--</span>
                    </td>
                    <td role="gridcell" class="nowrap">
                        <b class="ui-table-cell-label">Departure Time</b>
                        <span id="base_page:tabview:elementTableTwo0:0:outhourview">--:--</span>
                    </td>
                    <td role="gridcell">
                        <b class="ui-table-cell-label">Room Notes</b>
                        <span id="base_page:tabview:elementTableTwo0:0:vendorcommentview"></span>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
<script id="base_page:tabview:elementTableTwo0_s" type="text/javascript">
    PrimeFaces.cw("DataTable", "widget_base_page_tabview_elementTableTwo0", {
        id: "base_page:tabview:elementTableTwo0",
        reflow: true
    });
</script>
<div id="base_page:tabview:vendorMessagePanel0" class="ui-panel-m ui-corner-all" data-widget="widget_base_page_tabview_vendorMessagePanel0">
    <div class="ui-panel-m-titlebar ui-bar ui-bar-inherit">
        <h3>Notes</h3>
        <a href="#" class="ui-panel-m-titlebar-icon ui-btn ui-shadow ui-corner-all ui-icon-minus ui-btn-icon-notext ui-btn-right"></a>
    </div>
    <div class="ui-panel-m-content ui-body ui-body-inherit">
        <p>
            <span id="base_page:tabview:bookingMessage0">
                <div>&nbsp;</div>
            </span>
            <span id="base_page:tabview:vendorMessage0">
                <div>
                    <div style="font-family: Arial, Helvetica, sans-serif; font-size: 10pt;">
                        <strong>
                            <span style="font-family: Arial, Helvetica, sans-serif;">Please note that our &nbsp;</span>
                            <span style="color: #ff9900;">Cancellation Policy &nbsp;</span>
                            <span style="font-family: Arial, Helvetica, sans-serif;">and &nbsp;</span>
                            <span style="color: #ff9900;">Terms &amp;Conditions</span>
                            <span style="font-family: Arial, Helvetica, sans-serif;">&nbsp;are applied to your booking once payment is made.&nbsp;</span>
                            <span style="font-family: Arial, Helvetica, sans-serif; font-size: 10pt;">Any future changes to your booking &nbsp;</span>
                            <span style="font-size: 10pt;">
                                <span style="color: #ff9900;">may incur a &yen;20,000 fee</span>
                            </span>
                            <span style="font-family: Arial, Helvetica, sans-serif; font-size: 10pt;">.</span>
                        </strong>
                    </div>
                    <div style="font-family: Arial, Helvetica, sans-serif; font-size: 10pt;">
                        <strong>
                            <br/>
                        </strong>
                    </div>
                    <div style="font-family: Arial, Helvetica, sans-serif; font-size: 10pt;">
                        <span style="font-size: 10pt;">
                            <strong>To view our terms and conditions please follow the link below:</strong>
                        </span>
                    </div>
                    <div>
                        <a style="font-family: Arial, Helvetica, sans-serif; font-size: 10pt;" href="https://nisade.com/terms" target="_blank">
                            <strong>https://nisade.com/terms</strong>
                        </a>
                    </div>
                </div>
            </span>
        </p>
    </div>
    <input type="hidden" id="base_page:tabview:vendorMessagePanel0_collapsed" name="base_page:tabview:vendorMessagePanel0_collapsed" value="false"/>
</div>
<script id="base_page:tabview:vendorMessagePanel0_s" type="text/javascript">
    $(function() {
        PrimeFaces.cw("Panel", "widget_base_page_tabview_vendorMessagePanel0", {
            id: "base_page:tabview:vendorMessagePanel0",
            toggleable: true
        });
    });
</script>
</p></div></div>
<div id="base_page:tabview:t1" class="ui-collapsible ui-collapsible-inset ui-corner-all ui-collapsible-themed-content ui-collapsible-collapsed" role="tabpanel">
    <div class="ui-collapsible-heading ui-collapsible-heading-collapsed" role="tab" aria-expanded="false">
        <a href="#" class="ui-collapsible-heading-toggle ui-btn ui-btn-icon-left ui-icon-plus">
            <table class="accordion-bar-content">
                <tbody>
                    <tr>
                        <td>
                            <img id="base_page:tabview:i1" src="https://dh1msuk8kbcis.cloudfront.net/0_img/vdr/thumb_sml/2c999018742b39e401744c4b65e557d7_niseko_451137.jpg" height="60" width="90" class="rbn-tab-img"/>
                        </td>
                        <td>
                            <div class="accordion-title rbn-bold">
                                <span class="accordion-vendor">Travel Hokkaido Private Transfer :  </span>
                                <span class="accordion-date">Dec 26, 2022</span>
                            </div>
                        </td>
                        <td>
                            <div class="accordion-status-block">
                                <div class="accordion-status res">RESERVATION</div>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </a>
    </div>
    <div class="ui-collapsible-content ui-body-inherit ui-collapsible-content-collapsed" aria-hidden="true">
        <p>
        <div class="ui-grid ui-grid-responsive rbn-vendor-box">
            <div class="ui-grid-row" style="padding: 5px;">
                <div class="ui-grid-col-3" style="text-align: center;">
                    <img src="https://dh1msuk8kbcis.cloudfront.net/0_img/vdr/thumb/2c999018742b39e401744c4b65e557d7_niseko_451137.jpg" style="width:90%;"/>
                </div>
                <div class="ui-grid-col-9" style="text-align: justify;">
                    <div id="base_page:tabview:j_idt334" class="ui-grid-solo">
                        <div class="ui-block-a">
                            <span class="rbn-bold">Travel Hokkaido Private Transfer, Niseko</span>
                        </div>
                        <div class="ui-block-a">Travel in comfort and ease with a private transfer!  Perfect for large groups, Travel Hokkaido provides private bus charter service for 9 – 30 guests.  The driver will meet all guests in the arrivals lobby with a sign with the lead guest’s name.  Tolls are not included in the price and are payable by the guest in cash on the day.</div>
                    </div>
                </div>
            </div>
        </div>
        <div id="base_page:tabview:resultTable1" class="ui-datatable ui-shadow">
            <div class="ui-datatable-tablewrapper">
                <table role="grid" class="ui-responsive ui-table table-stripe ui-table-reflow">
                    <thead id="base_page:tabview:resultTable1_head">
                        <tr class="ui-bar-a" role="row">
                            <th id="base_page:tabview:resultTable1:eidcol" role="columnheader" class="ui-column-header rbn-eidcol">
                                <span class="ui-column-title">ID</span>
                            </th>
                            <th id="base_page:tabview:resultTable1:dtcol" role="columnheader" class="ui-column-header rbn-dtcol">
                                <span class="ui-column-title">Created On</span>
                            </th>
                            <th id="base_page:tabview:resultTable1:j_idt342" role="columnheader" class="ui-column-header">
                                <span class="ui-column-title">Vendor</span>
                            </th>
                            <th id="base_page:tabview:resultTable1:extent" role="columnheader" class="ui-column-header">
                                <span class="ui-column-title">Type</span>
                            </th>
                            <th id="base_page:tabview:resultTable1:state" role="columnheader" class="ui-column-header">
                                <span class="ui-column-title">State</span>
                            </th>
                        </tr>
                    </thead>
                    <tbody id="base_page:tabview:resultTable1_data">
                        <tr data-ri="0" class="ui-table-row">
                            <td role="gridcell" class="rbn-eidcol">
                                <b class="ui-table-cell-label">ID</b>
                                1183142
                            </td>
                            <td role="gridcell" class="rbn-dtcol">
                                <b class="ui-table-cell-label">Created On</b>
                                Thursday, November 10, 2022 08:06 (GMT)
                            </td>
                            <td role="gridcell">
                                <b class="ui-table-cell-label">Vendor</b>
                                Travel Hokkaido Private Transfer
                            </td>
                            <td role="gridcell">
                                <b class="ui-table-cell-label">Type</b>
                                RESERVATION
                            </td>
                            <td role="gridcell">
                                <b class="ui-table-cell-label">State</b>
                                <span id="base_page:tabview:resultTable1:0:bookingState" class="active">Active</span>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <script id="base_page:tabview:resultTable1_s" type="text/javascript">
            PrimeFaces.cw("DataTable", "widget_base_page_tabview_resultTable1", {
                id: "base_page:tabview:resultTable1",
                reflow: true
            });
        </script>
        <div id="base_page:tabview:orderItemTable1" class="ui-datatable ui-shadow">
            <div class="ui-datatable-tablewrapper">
                <table role="grid" class="ui-responsive ui-table table-stripe ui-table-reflow">
                    <thead id="base_page:tabview:orderItemTable1_head">
                        <tr class="ui-bar-a" role="row">
                            <th id="base_page:tabview:orderItemTable1:j_idt421" role="columnheader" class="ui-column-header">
                                <span class="ui-column-title">#</span>
                            </th>
                            <th id="base_page:tabview:orderItemTable1:j_idt423" role="columnheader" class="ui-column-header centered">
                                <span class="ui-column-title">Start date</span>
                            </th>
                            <th id="base_page:tabview:orderItemTable1:j_idt424" role="columnheader" class="ui-column-header">
                                <span class="ui-column-title">Item</span>
                            </th>
                            <th id="base_page:tabview:orderItemTable1:amt" role="columnheader" class="ui-column-header">
                                <span class="ui-column-title">Cost</span>
                            </th>
                        </tr>
                    </thead>
                    <tbody id="base_page:tabview:orderItemTable1_data">
                        <tr data-ri="0" class="ui-table-row">
                            <td role="gridcell">
                                <b class="ui-table-cell-label">#</b>
                                1
                            </td>
                            <td role="gridcell" class="centered">
                                <b class="ui-table-cell-label">Start date</b>
                                <span id="base_page:tabview:orderItemTable1:0:checkindate">2022-12-26</span>
                            </td>
                            <td role="gridcell">
                                <b class="ui-table-cell-label">Item</b>
                                <span id="base_page:tabview:orderItemTable1:0:prodname" class="bold" style="font-weight: bold;">CTS → Niseko</span>
                                <div id="base_page:tabview:orderItemTable1:0:pocgrd" class="ui-datagrid" style="word-wrap: break-word;">
                                    <div id="base_page:tabview:orderItemTable1:0:pocgrd_content" class="ui-datagrid-content ui-responsive ui-grid-solo">
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Vehicle : </span>
                                            Taxi Sedan (1-2 guests)
                                        </div>
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Arrival Flight No : </span>
                                            <span id="base_page:tabview:orderItemTable1:0:pocgrd:1:criterionValueId">KE765</span>
                                        </div>
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Arrival Flight Time : </span>
                                            <span id="base_page:tabview:orderItemTable1:0:pocgrd:2:criterionValueId">1245 pm</span>
                                        </div>
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Property : </span>
                                            Sekka Sekka
                                        </div>
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Number of Adults : </span>
                                            <span id="base_page:tabview:orderItemTable1:0:pocgrd:4:criterionValueId">8</span>
                                        </div>
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Number of Kids &lt;6 : </span>
                                            0
                                        </div>
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Number of Kids &lt;3 : </span>
                                            0
                                        </div>
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Luggage : </span>
                                            <span id="base_page:tabview:orderItemTable1:0:pocgrd:7:criterionValueId">12</span>
                                        </div>
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Ski &amp;Board Bags : </span>
                                            No
                                        </div>
                                    </div>
                                </div>
                                <script id="base_page:tabview:orderItemTable1:0:pocgrd_s" type="text/javascript">
                                    PrimeFaces.cw("DataGrid", "widget_base_page_tabview_orderItemTable1_0_pocgrd", {
                                        id: "base_page:tabview:orderItemTable1:0:pocgrd"
                                    });
                                </script>
                                <div id="base_page:tabview:orderItemTable1:0:pdoptgrd" class="ui-datagrid">
                                    <div id="base_page:tabview:orderItemTable1:0:pdoptgrd_content" class="ui-datagrid-content ui-responsive ui-grid-solo"></div>
                                </div>
                                <script id="base_page:tabview:orderItemTable1:0:pdoptgrd_s" type="text/javascript">
                                    PrimeFaces.cw("DataGrid", "widget_base_page_tabview_orderItemTable1_0_pdoptgrd", {
                                        id: "base_page:tabview:orderItemTable1:0:pdoptgrd"
                                    });
                                </script>
                            </td>
                            <td role="gridcell">
                                <b class="ui-table-cell-label">Cost</b>
                                67,200 JPY
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <script id="base_page:tabview:orderItemTable1_s" type="text/javascript">
            PrimeFaces.cw("DataTable", "widget_base_page_tabview_orderItemTable1", {
                id: "base_page:tabview:orderItemTable1",
                reflow: true
            });
        </script>
        <div id="base_page:tabview:vendorMessagePanel1" class="ui-panel-m ui-corner-all" data-widget="widget_base_page_tabview_vendorMessagePanel1">
            <div class="ui-panel-m-titlebar ui-bar ui-bar-inherit">
                <h3>Notes</h3>
                <a href="#" class="ui-panel-m-titlebar-icon ui-btn ui-shadow ui-corner-all ui-icon-minus ui-btn-icon-notext ui-btn-right"></a>
            </div>
            <div class="ui-panel-m-content ui-body ui-body-inherit">
                <p>
                    <span id="base_page:tabview:bookingMessage1">
                        <div>&nbsp;</div>
                    </span>
                    <span id="base_page:tabview:vendorMessage1">
                        <div>
                            <div>
                                <strong>
                                    <span style="font-family: Arial, Helvetica, sans-serif; font-size: 12pt;">Booking Terms &amp;Conditions</span>
                                </strong>
                            </div>
                            <div>
                                <ol style="font-family: Arial, Helvetica, sans-serif; font-size: 10pt;">
                                    <li style="font-size: 10pt;">All offers, prices, and terms and conditions are subject to change at will and without notice.</li>
                                    <li>Guest services bookings are not confirmed until a confirmation of services is issued by NISADE.</li>
                                    <li>Guest services are subject to availability.&nbsp;</li>
                                    <li>Payment for guest services is due 16 days prior to check-in.&nbsp;This payment is non-refundable.</li>
                                    <li>
                                        Cancellation of guest services:
                                        <ol>
                                            <li>A cancellation is any change(s) to a package item, which is not an upgrade or an addition.</li>
                                            <li>
                                                Cancellation fees will be assessed as follows:
                                                <ol>
                                                    <li>17 days or more prior to check-in will incur an amendment fee of &yen;4,000 and may be subject to additional fees.</li>
                                                    <li>16 days prior to check-in will incur 100% of the total price.</li>
                                                </ol>
                                            </li>
                                        </ol>
                                    </li>
                                    <li>Guest services may not be rescheduled due to changes in travel itinerary or if the guest is unable to attend. Guests may be advised to repurchase services upon check-in at the accommodation.</li>
                                    <li>Unused items are non-refundable.</li>
                                </ol>
                            </div>
                        </div>
                    </span>
                </p>
            </div>
            <input type="hidden" id="base_page:tabview:vendorMessagePanel1_collapsed" name="base_page:tabview:vendorMessagePanel1_collapsed" value="false"/>
        </div>
        <script id="base_page:tabview:vendorMessagePanel1_s" type="text/javascript">
            $(function() {
                PrimeFaces.cw("Panel", "widget_base_page_tabview_vendorMessagePanel1", {
                    id: "base_page:tabview:vendorMessagePanel1",
                    toggleable: true
                });
            });
        </script>
</p></div></div>
<div id="base_page:tabview:t2" class="ui-collapsible ui-collapsible-inset ui-corner-all ui-collapsible-themed-content ui-collapsible-collapsed" role="tabpanel">
    <div class="ui-collapsible-heading ui-collapsible-heading-collapsed" role="tab" aria-expanded="false">
        <a href="#" class="ui-collapsible-heading-toggle ui-btn ui-btn-icon-left ui-icon-plus">
            <table class="accordion-bar-content">
                <tbody>
                    <tr>
                        <td>
                            <img id="base_page:tabview:i2" src="https://dh1msuk8kbcis.cloudfront.net/0_img/vdr/thumb_sml/explore_transfers_and_tours_niseko_194675.jpg" height="60" width="90" class="rbn-tab-img"/>
                        </td>
                        <td>
                            <div class="accordion-title rbn-bold">
                                <span class="accordion-vendor">Explore Transfers &amp;Tours :  </span>
                                <span class="accordion-date">Jan 1, 2023</span>
                            </div>
                        </td>
                        <td>
                            <div class="accordion-status-block">
                                <div class="accordion-status res">RESERVATION</div>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </a>
    </div>
    <div class="ui-collapsible-content ui-body-inherit ui-collapsible-content-collapsed" aria-hidden="true">
        <p>
        <div class="ui-grid ui-grid-responsive rbn-vendor-box">
            <div class="ui-grid-row" style="padding: 5px;">
                <div class="ui-grid-col-3" style="text-align: center;">
                    <img src="https://dh1msuk8kbcis.cloudfront.net/0_img/vdr/thumb/explore_transfers_and_tours_niseko_194675.jpg" style="width:90%;"/>
                </div>
                <div class="ui-grid-col-9" style="text-align: justify;">
                    <div id="base_page:tabview:j_idt460" class="ui-grid-solo">
                        <div class="ui-block-a">
                            <span class="rbn-bold">Explore Transfers &amp;Tours, Niseko</span>
                        </div>
                        <div class="ui-block-a">Explore Airport Transfers &amp;Tours offer hassle free private transfer services from New Chitose International Airport to all major tourist locations and 8 Hour Days Tours around popular tourist destinations in Hokkaido</div>
                    </div>
                </div>
            </div>
        </div>
        <div id="base_page:tabview:resultTable2" class="ui-datatable ui-shadow">
            <div class="ui-datatable-tablewrapper">
                <table role="grid" class="ui-responsive ui-table table-stripe ui-table-reflow">
                    <thead id="base_page:tabview:resultTable2_head">
                        <tr class="ui-bar-a" role="row">
                            <th id="base_page:tabview:resultTable2:eidcol" role="columnheader" class="ui-column-header rbn-eidcol">
                                <span class="ui-column-title">ID</span>
                            </th>
                            <th id="base_page:tabview:resultTable2:dtcol" role="columnheader" class="ui-column-header rbn-dtcol">
                                <span class="ui-column-title">Created On</span>
                            </th>
                            <th id="base_page:tabview:resultTable2:j_idt468" role="columnheader" class="ui-column-header">
                                <span class="ui-column-title">Vendor</span>
                            </th>
                            <th id="base_page:tabview:resultTable2:extent" role="columnheader" class="ui-column-header">
                                <span class="ui-column-title">Type</span>
                            </th>
                            <th id="base_page:tabview:resultTable2:state" role="columnheader" class="ui-column-header">
                                <span class="ui-column-title">State</span>
                            </th>
                        </tr>
                    </thead>
                    <tbody id="base_page:tabview:resultTable2_data">
                        <tr data-ri="0" class="ui-table-row">
                            <td role="gridcell" class="rbn-eidcol">
                                <b class="ui-table-cell-label">ID</b>
                                1183713
                            </td>
                            <td role="gridcell" class="rbn-dtcol">
                                <b class="ui-table-cell-label">Created On</b>
                                Friday, November 11, 2022 08:12 (GMT)
                            </td>
                            <td role="gridcell">
                                <b class="ui-table-cell-label">Vendor</b>
                                Explore Transfers &amp;Tours
                            </td>
                            <td role="gridcell">
                                <b class="ui-table-cell-label">Type</b>
                                RESERVATION
                            </td>
                            <td role="gridcell">
                                <b class="ui-table-cell-label">State</b>
                                <span id="base_page:tabview:resultTable2:0:bookingState" class="active">Active</span>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <script id="base_page:tabview:resultTable2_s" type="text/javascript">
            PrimeFaces.cw("DataTable", "widget_base_page_tabview_resultTable2", {
                id: "base_page:tabview:resultTable2",
                reflow: true
            });
        </script>
        <div id="base_page:tabview:orderItemTable2" class="ui-datatable ui-shadow">
            <div class="ui-datatable-tablewrapper">
                <table role="grid" class="ui-responsive ui-table table-stripe ui-table-reflow">
                    <thead id="base_page:tabview:orderItemTable2_head">
                        <tr class="ui-bar-a" role="row">
                            <th id="base_page:tabview:orderItemTable2:j_idt547" role="columnheader" class="ui-column-header">
                                <span class="ui-column-title">#</span>
                            </th>
                            <th id="base_page:tabview:orderItemTable2:j_idt549" role="columnheader" class="ui-column-header centered">
                                <span class="ui-column-title">Start date</span>
                            </th>
                            <th id="base_page:tabview:orderItemTable2:j_idt550" role="columnheader" class="ui-column-header">
                                <span class="ui-column-title">Item</span>
                            </th>
                            <th id="base_page:tabview:orderItemTable2:amt" role="columnheader" class="ui-column-header">
                                <span class="ui-column-title">Cost</span>
                            </th>
                        </tr>
                    </thead>
                    <tbody id="base_page:tabview:orderItemTable2_data">
                        <tr data-ri="0" class="ui-table-row">
                            <td role="gridcell">
                                <b class="ui-table-cell-label">#</b>
                                1
                            </td>
                            <td role="gridcell" class="centered">
                                <b class="ui-table-cell-label">Start date</b>
                                <span id="base_page:tabview:orderItemTable2:0:checkindate">2023-01-01</span>
                            </td>
                            <td role="gridcell">
                                <b class="ui-table-cell-label">Item</b>
                                <span id="base_page:tabview:orderItemTable2:0:prodname" class="bold" style="font-weight: bold;">Private Transfer - Niseko to Airport(CTS)</span>
                                <div id="base_page:tabview:orderItemTable2:0:pocgrd" class="ui-datagrid" style="word-wrap: break-word;">
                                    <div id="base_page:tabview:orderItemTable2:0:pocgrd_content" class="ui-datagrid-content ui-responsive ui-grid-solo">
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Vehicle : </span>
                                            Toyota Alphard (1-3pax)
                                        </div>
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Dep. Flight No &amp;Time : </span>
                                            <span id="base_page:tabview:orderItemTable2:0:pocgrd:1:criterionValueId">JL528 Dep.21:00</span>
                                        </div>
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Pick Up Time : </span>
                                            <span id="base_page:tabview:orderItemTable2:0:pocgrd:2:criterionValueId">16:00</span>
                                        </div>
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Pick up location : </span>
                                            <span id="base_page:tabview:orderItemTable2:0:pocgrd:3:criterionValueId">Sekka Sekka</span>
                                        </div>
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Number of Adult : </span>
                                            <span id="base_page:tabview:orderItemTable2:0:pocgrd:4:criterionValueId">4</span>
                                        </div>
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Number of 0-1 yo : </span>
                                            0
                                        </div>
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Number of 2-3 yo : </span>
                                            0
                                        </div>
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Number of 4-6 yo : </span>
                                            0
                                        </div>
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Number of Luggage : </span>
                                            <span id="base_page:tabview:orderItemTable2:0:pocgrd:8:criterionValueId">4</span>
                                        </div>
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Number of Ski &amp;Board : </span>
                                            <span id="base_page:tabview:orderItemTable2:0:pocgrd:9:criterionValueId"></span>
                                        </div>
                                    </div>
                                </div>
                                <script id="base_page:tabview:orderItemTable2:0:pocgrd_s" type="text/javascript">
                                    PrimeFaces.cw("DataGrid", "widget_base_page_tabview_orderItemTable2_0_pocgrd", {
                                        id: "base_page:tabview:orderItemTable2:0:pocgrd"
                                    });
                                </script>
                                <div id="base_page:tabview:orderItemTable2:0:pdoptgrd" class="ui-datagrid">
                                    <div id="base_page:tabview:orderItemTable2:0:pdoptgrd_content" class="ui-datagrid-content ui-responsive ui-grid-solo"></div>
                                </div>
                                <script id="base_page:tabview:orderItemTable2:0:pdoptgrd_s" type="text/javascript">
                                    PrimeFaces.cw("DataGrid", "widget_base_page_tabview_orderItemTable2_0_pdoptgrd", {
                                        id: "base_page:tabview:orderItemTable2:0:pdoptgrd"
                                    });
                                </script>
                            </td>
                            <td role="gridcell">
                                <b class="ui-table-cell-label">Cost</b>
                                40,000 JPY
                            </td>
                        </tr>
                        <tr data-ri="1" class="ui-table-row">
                            <td role="gridcell">
                                <b class="ui-table-cell-label">#</b>
                                2
                            </td>
                            <td role="gridcell" class="centered">
                                <b class="ui-table-cell-label">Start date</b>
                                <span id="base_page:tabview:orderItemTable2:1:checkindate">2023-01-02</span>
                            </td>
                            <td role="gridcell">
                                <b class="ui-table-cell-label">Item</b>
                                <span id="base_page:tabview:orderItemTable2:1:prodname" class="bold" style="font-weight: bold;">Private Transfer - Niseko to Airport(CTS)</span>
                                <div id="base_page:tabview:orderItemTable2:1:pocgrd" class="ui-datagrid" style="word-wrap: break-word;">
                                    <div id="base_page:tabview:orderItemTable2:1:pocgrd_content" class="ui-datagrid-content ui-responsive ui-grid-solo">
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Vehicle : </span>
                                            Toyota Alphard (1-3pax)
                                        </div>
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Dep. Flight No &amp;Time : </span>
                                            <span id="base_page:tabview:orderItemTable2:1:pocgrd:1:criterionValueId">KE766 Dep.14:00</span>
                                        </div>
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Pick Up Time : </span>
                                            <span id="base_page:tabview:orderItemTable2:1:pocgrd:2:criterionValueId">10:00</span>
                                        </div>
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Pick up location : </span>
                                            <span id="base_page:tabview:orderItemTable2:1:pocgrd:3:criterionValueId">Sekka Sekka</span>
                                        </div>
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Number of Adult : </span>
                                            <span id="base_page:tabview:orderItemTable2:1:pocgrd:4:criterionValueId">4</span>
                                        </div>
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Number of 0-1 yo : </span>
                                            0
                                        </div>
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Number of 2-3 yo : </span>
                                            0
                                        </div>
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Number of 4-6 yo : </span>
                                            0
                                        </div>
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Number of Luggage : </span>
                                            <span id="base_page:tabview:orderItemTable2:1:pocgrd:8:criterionValueId">4</span>
                                        </div>
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Number of Ski &amp;Board : </span>
                                            <span id="base_page:tabview:orderItemTable2:1:pocgrd:9:criterionValueId"></span>
                                        </div>
                                    </div>
                                </div>
                                <script id="base_page:tabview:orderItemTable2:1:pocgrd_s" type="text/javascript">
                                    PrimeFaces.cw("DataGrid", "widget_base_page_tabview_orderItemTable2_1_pocgrd", {
                                        id: "base_page:tabview:orderItemTable2:1:pocgrd"
                                    });
                                </script>
                                <div id="base_page:tabview:orderItemTable2:1:pdoptgrd" class="ui-datagrid">
                                    <div id="base_page:tabview:orderItemTable2:1:pdoptgrd_content" class="ui-datagrid-content ui-responsive ui-grid-solo"></div>
                                </div>
                                <script id="base_page:tabview:orderItemTable2:1:pdoptgrd_s" type="text/javascript">
                                    PrimeFaces.cw("DataGrid", "widget_base_page_tabview_orderItemTable2_1_pdoptgrd", {
                                        id: "base_page:tabview:orderItemTable2:1:pdoptgrd"
                                    });
                                </script>
                            </td>
                            <td role="gridcell">
                                <b class="ui-table-cell-label">Cost</b>
                                40,000 JPY
                            </td>
                        </tr>
                        <tr data-ri="2" class="ui-table-row">
                            <td role="gridcell">
                                <b class="ui-table-cell-label">#</b>
                                3
                            </td>
                            <td role="gridcell" class="centered">
                                <b class="ui-table-cell-label">Start date</b>
                                <span id="base_page:tabview:orderItemTable2:2:checkindate">2023-01-02</span>
                            </td>
                            <td role="gridcell">
                                <b class="ui-table-cell-label">Item</b>
                                <span id="base_page:tabview:orderItemTable2:2:prodname" class="bold" style="font-weight: bold;">Private Transfer - Niseko to Airport(CTS)</span>
                                <div id="base_page:tabview:orderItemTable2:2:pocgrd" class="ui-datagrid" style="word-wrap: break-word;">
                                    <div id="base_page:tabview:orderItemTable2:2:pocgrd_content" class="ui-datagrid-content ui-responsive ui-grid-solo">
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Vehicle : </span>
                                            Nissan NV200 (1-3pax)
                                        </div>
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Dep. Flight No &amp;Time : </span>
                                            <span id="base_page:tabview:orderItemTable2:2:pocgrd:1:criterionValueId">KE766, 14:00</span>
                                        </div>
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Pick Up Time : </span>
                                            <span id="base_page:tabview:orderItemTable2:2:pocgrd:2:criterionValueId">10:00</span>
                                        </div>
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Pick up location : </span>
                                            <span id="base_page:tabview:orderItemTable2:2:pocgrd:3:criterionValueId">Seka Seka</span>
                                        </div>
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Number of Adult : </span>
                                            <span id="base_page:tabview:orderItemTable2:2:pocgrd:4:criterionValueId">1</span>
                                        </div>
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Number of 0-1 yo : </span>
                                            0
                                        </div>
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Number of 2-3 yo : </span>
                                            0
                                        </div>
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Number of 4-6 yo : </span>
                                            0
                                        </div>
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Number of Luggage : </span>
                                            <span id="base_page:tabview:orderItemTable2:2:pocgrd:8:criterionValueId">4</span>
                                        </div>
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Number of Ski &amp;Board : </span>
                                            <span id="base_page:tabview:orderItemTable2:2:pocgrd:9:criterionValueId">Lugguage Van</span>
                                        </div>
                                    </div>
                                </div>
                                <script id="base_page:tabview:orderItemTable2:2:pocgrd_s" type="text/javascript">
                                    PrimeFaces.cw("DataGrid", "widget_base_page_tabview_orderItemTable2_2_pocgrd", {
                                        id: "base_page:tabview:orderItemTable2:2:pocgrd"
                                    });
                                </script>
                                <div id="base_page:tabview:orderItemTable2:2:pdoptgrd" class="ui-datagrid">
                                    <div id="base_page:tabview:orderItemTable2:2:pdoptgrd_content" class="ui-datagrid-content ui-responsive ui-grid-solo"></div>
                                </div>
                                <script id="base_page:tabview:orderItemTable2:2:pdoptgrd_s" type="text/javascript">
                                    PrimeFaces.cw("DataGrid", "widget_base_page_tabview_orderItemTable2_2_pdoptgrd", {
                                        id: "base_page:tabview:orderItemTable2:2:pdoptgrd"
                                    });
                                </script>
                            </td>
                            <td role="gridcell">
                                <b class="ui-table-cell-label">Cost</b>
                                33,000 JPY
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <script id="base_page:tabview:orderItemTable2_s" type="text/javascript">
            PrimeFaces.cw("DataTable", "widget_base_page_tabview_orderItemTable2", {
                id: "base_page:tabview:orderItemTable2",
                reflow: true
            });
        </script>
        <div id="base_page:tabview:vendorMessagePanel2" class="ui-panel-m ui-corner-all" data-widget="widget_base_page_tabview_vendorMessagePanel2">
            <div class="ui-panel-m-titlebar ui-bar ui-bar-inherit">
                <h3>Notes</h3>
                <a href="#" class="ui-panel-m-titlebar-icon ui-btn ui-shadow ui-corner-all ui-icon-minus ui-btn-icon-notext ui-btn-right"></a>
            </div>
            <div class="ui-panel-m-content ui-body ui-body-inherit">
                <p>
                    <span id="base_page:tabview:vendorMessage2">
                        <div>
                            <div>
                                <strong>
                                    <span style="font-family: Arial, Helvetica, sans-serif; font-size: 12pt;">Booking Terms &amp;Conditions</span>
                                </strong>
                            </div>
                            <div>
                                <ol style="font-family: Arial, Helvetica, sans-serif; font-size: 10pt;">
                                    <li style="font-size: 10pt;">All offers, prices, and terms and conditions are subject to change at will and without notice.</li>
                                    <li>Guest services bookings are not confirmed until a confirmation of services is issued by NISADE.</li>
                                    <li>Guest services are subject to availability.&nbsp;</li>
                                    <li>Payment for guest services is due 16 days prior to check-in.&nbsp;This payment is non-refundable.</li>
                                    <li>
                                        Cancellation of guest services:
                                        <ol>
                                            <li>A cancellation is any change(s) to a package item, which is not an upgrade or an addition.</li>
                                            <li>
                                                Cancellation fees will be assessed as follows:
                                                <ol>
                                                    <li>17 days or more prior to check-in will incur an amendment fee of &yen;4,000 and may be subject to additional fees.</li>
                                                    <li>16 days prior to check-in will incur 100% of the total price.</li>
                                                </ol>
                                            </li>
                                        </ol>
                                    </li>
                                    <li>Guest services may not be rescheduled due to changes in travel itinerary or if the guest is unable to attend. Guests may be advised to repurchase services upon check-in at the accommodation.</li>
                                    <li>Unused items are non-refundable.</li>
                                </ol>
                            </div>
                        </div>
                    </span>
                </p>
            </div>
            <input type="hidden" id="base_page:tabview:vendorMessagePanel2_collapsed" name="base_page:tabview:vendorMessagePanel2_collapsed" value="false"/>
        </div>
        <script id="base_page:tabview:vendorMessagePanel2_s" type="text/javascript">
            $(function() {
                PrimeFaces.cw("Panel", "widget_base_page_tabview_vendorMessagePanel2", {
                    id: "base_page:tabview:vendorMessagePanel2",
                    toggleable: true
                });
            });
        </script>
</p></div></div>
<div id="base_page:tabview:t3" class="ui-collapsible ui-collapsible-inset ui-corner-all ui-collapsible-themed-content ui-collapsible-collapsed" role="tabpanel">
    <div class="ui-collapsible-heading ui-collapsible-heading-collapsed" role="tab" aria-expanded="false">
        <a href="#" class="ui-collapsible-heading-toggle ui-btn ui-btn-icon-left ui-icon-plus">
            <table class="accordion-bar-content">
                <tbody>
                    <tr>
                        <td>
                            <img id="base_page:tabview:i3" src="https://dh1msuk8kbcis.cloudfront.net/0_img/vdr/thumb_sml/gosnow_niseko_38521.gif" height="60" width="90" class="rbn-tab-img"/>
                        </td>
                        <td>
                            <div class="accordion-title rbn-bold">
                                <span class="accordion-vendor">GoSnow :  </span>
                                <span class="accordion-date">Dec 24, 2022</span>
                            </div>
                        </td>
                        <td>
                            <div class="accordion-status-block">
                                <div class="accordion-status na">Cancelled RESERVATION</div>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </a>
    </div>
    <div class="ui-collapsible-content ui-body-inherit ui-collapsible-content-collapsed" aria-hidden="true">
        <p>
        <div class="ui-grid ui-grid-responsive rbn-vendor-box">
            <div class="ui-grid-row" style="padding: 5px;">
                <div class="ui-grid-col-3" style="text-align: center;">
                    <img src="https://dh1msuk8kbcis.cloudfront.net/0_img/vdr/thumb/gosnow_niseko_38521.gif" style="width:90%;"/>
                </div>
                <div class="ui-grid-col-9" style="text-align: justify;">
                    <div id="base_page:tabview:j_idt586" class="ui-grid-solo">
                        <div class="ui-block-a">
                            <span class="rbn-bold">GoSnow, Niseko</span>
                        </div>
                        <div class="ui-block-a">GoSnow is the official international snowsports school of Grand Hirafu Resort operating in two base locations at the Gondola and Family Bases. We offer a range of programs specializing in kids, adults, private lessons and workshops. Our classes can enjoy more skiing with priority lift lanes &amp;private learning areas throughout the resort.</div>
                    </div>
                </div>
            </div>
        </div>
        <div id="base_page:tabview:resultTable3" class="ui-datatable ui-shadow">
            <div class="ui-datatable-tablewrapper">
                <table role="grid" class="ui-responsive ui-table table-stripe ui-table-reflow">
                    <thead id="base_page:tabview:resultTable3_head">
                        <tr class="ui-bar-a" role="row">
                            <th id="base_page:tabview:resultTable3:eidcol" role="columnheader" class="ui-column-header rbn-eidcol">
                                <span class="ui-column-title">ID</span>
                            </th>
                            <th id="base_page:tabview:resultTable3:dtcol" role="columnheader" class="ui-column-header rbn-dtcol">
                                <span class="ui-column-title">Created On</span>
                            </th>
                            <th id="base_page:tabview:resultTable3:j_idt594" role="columnheader" class="ui-column-header">
                                <span class="ui-column-title">Vendor</span>
                            </th>
                            <th id="base_page:tabview:resultTable3:extent" role="columnheader" class="ui-column-header">
                                <span class="ui-column-title">Type</span>
                            </th>
                            <th id="base_page:tabview:resultTable3:state" role="columnheader" class="ui-column-header">
                                <span class="ui-column-title">State</span>
                            </th>
                        </tr>
                    </thead>
                    <tbody id="base_page:tabview:resultTable3_data">
                        <tr data-ri="0" class="ui-table-row">
                            <td role="gridcell" class="rbn-eidcol">
                                <b class="ui-table-cell-label">ID</b>
                                1195404
                            </td>
                            <td role="gridcell" class="rbn-dtcol">
                                <b class="ui-table-cell-label">Created On</b>
                                Tuesday, November 29, 2022 02:17 (GMT)
                            </td>
                            <td role="gridcell">
                                <b class="ui-table-cell-label">Vendor</b>
                                GoSnow
                            </td>
                            <td role="gridcell">
                                <b class="ui-table-cell-label">Type</b>
                                RESERVATION
                            </td>
                            <td role="gridcell">
                                <b class="ui-table-cell-label">State</b>
                                <span id="base_page:tabview:resultTable3:0:bookingState" class="cancelled">Cancelled</span>
                                (2022-12-24 01:15:41.0)
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <script id="base_page:tabview:resultTable3_s" type="text/javascript">
            PrimeFaces.cw("DataTable", "widget_base_page_tabview_resultTable3", {
                id: "base_page:tabview:resultTable3",
                reflow: true
            });
        </script>
        <div id="base_page:tabview:orderItemTable3" class="ui-datatable ui-shadow">
            <div class="ui-datatable-tablewrapper">
                <table role="grid" class="ui-responsive ui-table table-stripe ui-table-reflow">
                    <thead id="base_page:tabview:orderItemTable3_head">
                        <tr class="ui-bar-a" role="row">
                            <th id="base_page:tabview:orderItemTable3:j_idt673" role="columnheader" class="ui-column-header">
                                <span class="ui-column-title">#</span>
                            </th>
                            <th id="base_page:tabview:orderItemTable3:j_idt675" role="columnheader" class="ui-column-header centered">
                                <span class="ui-column-title">Start date</span>
                            </th>
                            <th id="base_page:tabview:orderItemTable3:j_idt676" role="columnheader" class="ui-column-header">
                                <span class="ui-column-title">Item</span>
                            </th>
                            <th id="base_page:tabview:orderItemTable3:amt" role="columnheader" class="ui-column-header">
                                <span class="ui-column-title">Cost</span>
                            </th>
                        </tr>
                    </thead>
                    <tbody id="base_page:tabview:orderItemTable3_data">
                        <tr data-ri="0" class="ui-table-row">
                            <td role="gridcell">
                                <b class="ui-table-cell-label">#</b>
                                1
                            </td>
                            <td role="gridcell" class="centered">
                                <b class="ui-table-cell-label">Start date</b>
                                <span id="base_page:tabview:orderItemTable3:0:checkindate">2022-12-24</span>
                            </td>
                            <td role="gridcell">
                                <b class="ui-table-cell-label">Item</b>
                                <span id="base_page:tabview:orderItemTable3:0:prodname" class="bold" style="font-weight: bold;">Cancellation Charge</span>
                                <div id="base_page:tabview:orderItemTable3:0:pocgrd" class="ui-datagrid" style="word-wrap: break-word;">
                                    <div id="base_page:tabview:orderItemTable3:0:pocgrd_content" class="ui-datagrid-content ui-responsive ui-grid-solo"></div>
                                </div>
                                <script id="base_page:tabview:orderItemTable3:0:pocgrd_s" type="text/javascript">
                                    PrimeFaces.cw("DataGrid", "widget_base_page_tabview_orderItemTable3_0_pocgrd", {
                                        id: "base_page:tabview:orderItemTable3:0:pocgrd"
                                    });
                                </script>
                                <div id="base_page:tabview:orderItemTable3:0:pdoptgrd" class="ui-datagrid">
                                    <div id="base_page:tabview:orderItemTable3:0:pdoptgrd_content" class="ui-datagrid-content ui-responsive ui-grid-solo"></div>
                                </div>
                                <script id="base_page:tabview:orderItemTable3:0:pdoptgrd_s" type="text/javascript">
                                    PrimeFaces.cw("DataGrid", "widget_base_page_tabview_orderItemTable3_0_pdoptgrd", {
                                        id: "base_page:tabview:orderItemTable3:0:pdoptgrd"
                                    });
                                </script>
                            </td>
                            <td role="gridcell">
                                <b class="ui-table-cell-label">Cost</b>
                                36,600 JPY
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <script id="base_page:tabview:orderItemTable3_s" type="text/javascript">
            PrimeFaces.cw("DataTable", "widget_base_page_tabview_orderItemTable3", {
                id: "base_page:tabview:orderItemTable3",
                reflow: true
            });
        </script>
        <div id="base_page:tabview:vendorMessagePanel3" class="ui-panel-m ui-corner-all" data-widget="widget_base_page_tabview_vendorMessagePanel3">
            <div class="ui-panel-m-titlebar ui-bar ui-bar-inherit">
                <h3>Notes</h3>
                <a href="#" class="ui-panel-m-titlebar-icon ui-btn ui-shadow ui-corner-all ui-icon-minus ui-btn-icon-notext ui-btn-right"></a>
            </div>
            <div class="ui-panel-m-content ui-body ui-body-inherit">
                <p>
                    <span id="base_page:tabview:vendorMessage3">
                        <div>
                            <div>
                                <strong>
                                    <span style="font-family: Arial, Helvetica, sans-serif; font-size: 12pt;">Booking Terms &amp;Conditions</span>
                                </strong>
                            </div>
                            <div>
                                <ol style="font-family: Arial, Helvetica, sans-serif; font-size: 10pt;">
                                    <li style="font-size: 10pt;">All offers, prices, and terms and conditions are subject to change at will and without notice.</li>
                                    <li>Guest services bookings are not confirmed until a confirmation of services is issued by NISADE.</li>
                                    <li>Guest services are subject to availability.&nbsp;</li>
                                    <li>Payment for guest services is due 16 days prior to check-in.&nbsp;This payment is non-refundable.</li>
                                    <li>
                                        Cancellation of guest services:
                                        <ol>
                                            <li>A cancellation is any change(s) to a package item, which is not an upgrade or an addition.</li>
                                            <li>
                                                Cancellation fees will be assessed as follows:
                                                <ol>
                                                    <li>17 days or more prior to check-in will incur an amendment fee of &yen;4,000 and may be subject to additional fees.</li>
                                                    <li>16 days prior to check-in will incur 100% of the total price.</li>
                                                </ol>
                                            </li>
                                        </ol>
                                    </li>
                                    <li>Guest services may not be rescheduled due to changes in travel itinerary or if the guest is unable to attend. Guests may be advised to repurchase services upon check-in at the accommodation.</li>
                                    <li>Unused items are non-refundable.</li>
                                </ol>
                            </div>
                        </div>
                    </span>
                </p>
            </div>
            <input type="hidden" id="base_page:tabview:vendorMessagePanel3_collapsed" name="base_page:tabview:vendorMessagePanel3_collapsed" value="false"/>
        </div>
        <script id="base_page:tabview:vendorMessagePanel3_s" type="text/javascript">
            $(function() {
                PrimeFaces.cw("Panel", "widget_base_page_tabview_vendorMessagePanel3", {
                    id: "base_page:tabview:vendorMessagePanel3",
                    toggleable: true
                });
            });
        </script>
</p></div></div>
<div id="base_page:tabview:t4" class="ui-collapsible ui-collapsible-inset ui-corner-all ui-collapsible-themed-content ui-collapsible-collapsed" role="tabpanel">
    <div class="ui-collapsible-heading ui-collapsible-heading-collapsed" role="tab" aria-expanded="false">
        <a href="#" class="ui-collapsible-heading-toggle ui-btn ui-btn-icon-left ui-icon-plus">
            <table class="accordion-bar-content">
                <tbody>
                    <tr>
                        <td>
                            <img id="base_page:tabview:i4" src="https://dh1msuk8kbcis.cloudfront.net/0_img/vdr/thumb_sml/gosnow_niseko_38521.gif" height="60" width="90" class="rbn-tab-img"/>
                        </td>
                        <td>
                            <div class="accordion-title rbn-bold">
                                <span class="accordion-vendor">GoSnow :  </span>
                                <span class="accordion-date">Dec 24, 2022</span>
                            </div>
                        </td>
                        <td>
                            <div class="accordion-status-block">
                                <div class="accordion-status na">Cancelled RESERVATION</div>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </a>
    </div>
    <div class="ui-collapsible-content ui-body-inherit ui-collapsible-content-collapsed" aria-hidden="true">
        <p>
        <div class="ui-grid ui-grid-responsive rbn-vendor-box">
            <div class="ui-grid-row" style="padding: 5px;">
                <div class="ui-grid-col-3" style="text-align: center;">
                    <img src="https://dh1msuk8kbcis.cloudfront.net/0_img/vdr/thumb/gosnow_niseko_38521.gif" style="width:90%;"/>
                </div>
                <div class="ui-grid-col-9" style="text-align: justify;">
                    <div id="base_page:tabview:j_idt712" class="ui-grid-solo">
                        <div class="ui-block-a">
                            <span class="rbn-bold">GoSnow, Niseko</span>
                        </div>
                        <div class="ui-block-a">GoSnow is the official international snowsports school of Grand Hirafu Resort operating in two base locations at the Gondola and Family Bases. We offer a range of programs specializing in kids, adults, private lessons and workshops. Our classes can enjoy more skiing with priority lift lanes &amp;private learning areas throughout the resort.</div>
                    </div>
                </div>
            </div>
        </div>
        <div id="base_page:tabview:resultTable4" class="ui-datatable ui-shadow">
            <div class="ui-datatable-tablewrapper">
                <table role="grid" class="ui-responsive ui-table table-stripe ui-table-reflow">
                    <thead id="base_page:tabview:resultTable4_head">
                        <tr class="ui-bar-a" role="row">
                            <th id="base_page:tabview:resultTable4:eidcol" role="columnheader" class="ui-column-header rbn-eidcol">
                                <span class="ui-column-title">ID</span>
                            </th>
                            <th id="base_page:tabview:resultTable4:dtcol" role="columnheader" class="ui-column-header rbn-dtcol">
                                <span class="ui-column-title">Created On</span>
                            </th>
                            <th id="base_page:tabview:resultTable4:j_idt720" role="columnheader" class="ui-column-header">
                                <span class="ui-column-title">Vendor</span>
                            </th>
                            <th id="base_page:tabview:resultTable4:extent" role="columnheader" class="ui-column-header">
                                <span class="ui-column-title">Type</span>
                            </th>
                            <th id="base_page:tabview:resultTable4:state" role="columnheader" class="ui-column-header">
                                <span class="ui-column-title">State</span>
                            </th>
                        </tr>
                    </thead>
                    <tbody id="base_page:tabview:resultTable4_data">
                        <tr data-ri="0" class="ui-table-row">
                            <td role="gridcell" class="rbn-eidcol">
                                <b class="ui-table-cell-label">ID</b>
                                1196324
                            </td>
                            <td role="gridcell" class="rbn-dtcol">
                                <b class="ui-table-cell-label">Created On</b>
                                Wednesday, November 30, 2022 04:21 (GMT)
                            </td>
                            <td role="gridcell">
                                <b class="ui-table-cell-label">Vendor</b>
                                GoSnow
                            </td>
                            <td role="gridcell">
                                <b class="ui-table-cell-label">Type</b>
                                RESERVATION
                            </td>
                            <td role="gridcell">
                                <b class="ui-table-cell-label">State</b>
                                <span id="base_page:tabview:resultTable4:0:bookingState" class="cancelled">Cancelled</span>
                                (2022-12-24 01:15:58.0)
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <script id="base_page:tabview:resultTable4_s" type="text/javascript">
            PrimeFaces.cw("DataTable", "widget_base_page_tabview_resultTable4", {
                id: "base_page:tabview:resultTable4",
                reflow: true
            });
        </script>
        <div id="base_page:tabview:orderItemTable4" class="ui-datatable ui-shadow">
            <div class="ui-datatable-tablewrapper">
                <table role="grid" class="ui-responsive ui-table table-stripe ui-table-reflow">
                    <thead id="base_page:tabview:orderItemTable4_head">
                        <tr class="ui-bar-a" role="row">
                            <th id="base_page:tabview:orderItemTable4:j_idt799" role="columnheader" class="ui-column-header">
                                <span class="ui-column-title">#</span>
                            </th>
                            <th id="base_page:tabview:orderItemTable4:j_idt801" role="columnheader" class="ui-column-header centered">
                                <span class="ui-column-title">Start date</span>
                            </th>
                            <th id="base_page:tabview:orderItemTable4:j_idt802" role="columnheader" class="ui-column-header">
                                <span class="ui-column-title">Item</span>
                            </th>
                            <th id="base_page:tabview:orderItemTable4:amt" role="columnheader" class="ui-column-header">
                                <span class="ui-column-title">Cost</span>
                            </th>
                        </tr>
                    </thead>
                    <tbody id="base_page:tabview:orderItemTable4_data">
                        <tr data-ri="0" class="ui-table-row">
                            <td role="gridcell">
                                <b class="ui-table-cell-label">#</b>
                                1
                            </td>
                            <td role="gridcell" class="centered">
                                <b class="ui-table-cell-label">Start date</b>
                                <span id="base_page:tabview:orderItemTable4:0:checkindate">2022-12-24</span>
                            </td>
                            <td role="gridcell">
                                <b class="ui-table-cell-label">Item</b>
                                <span id="base_page:tabview:orderItemTable4:0:prodname" class="bold" style="font-weight: bold;">Cancellation Charge</span>
                                <div id="base_page:tabview:orderItemTable4:0:pocgrd" class="ui-datagrid" style="word-wrap: break-word;">
                                    <div id="base_page:tabview:orderItemTable4:0:pocgrd_content" class="ui-datagrid-content ui-responsive ui-grid-solo"></div>
                                </div>
                                <script id="base_page:tabview:orderItemTable4:0:pocgrd_s" type="text/javascript">
                                    PrimeFaces.cw("DataGrid", "widget_base_page_tabview_orderItemTable4_0_pocgrd", {
                                        id: "base_page:tabview:orderItemTable4:0:pocgrd"
                                    });
                                </script>
                                <div id="base_page:tabview:orderItemTable4:0:pdoptgrd" class="ui-datagrid">
                                    <div id="base_page:tabview:orderItemTable4:0:pdoptgrd_content" class="ui-datagrid-content ui-responsive ui-grid-solo"></div>
                                </div>
                                <script id="base_page:tabview:orderItemTable4:0:pdoptgrd_s" type="text/javascript">
                                    PrimeFaces.cw("DataGrid", "widget_base_page_tabview_orderItemTable4_0_pdoptgrd", {
                                        id: "base_page:tabview:orderItemTable4:0:pdoptgrd"
                                    });
                                </script>
                            </td>
                            <td role="gridcell">
                                <b class="ui-table-cell-label">Cost</b>
                                12,200 JPY
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <script id="base_page:tabview:orderItemTable4_s" type="text/javascript">
            PrimeFaces.cw("DataTable", "widget_base_page_tabview_orderItemTable4", {
                id: "base_page:tabview:orderItemTable4",
                reflow: true
            });
        </script>
        <div id="base_page:tabview:vendorMessagePanel4" class="ui-panel-m ui-corner-all" data-widget="widget_base_page_tabview_vendorMessagePanel4">
            <div class="ui-panel-m-titlebar ui-bar ui-bar-inherit">
                <h3>Notes</h3>
                <a href="#" class="ui-panel-m-titlebar-icon ui-btn ui-shadow ui-corner-all ui-icon-minus ui-btn-icon-notext ui-btn-right"></a>
            </div>
            <div class="ui-panel-m-content ui-body ui-body-inherit">
                <p>
                    <span id="base_page:tabview:vendorMessage4">
                        <div>
                            <div>
                                <strong>
                                    <span style="font-family: Arial, Helvetica, sans-serif; font-size: 12pt;">Booking Terms &amp;Conditions</span>
                                </strong>
                            </div>
                            <div>
                                <ol style="font-family: Arial, Helvetica, sans-serif; font-size: 10pt;">
                                    <li style="font-size: 10pt;">All offers, prices, and terms and conditions are subject to change at will and without notice.</li>
                                    <li>Guest services bookings are not confirmed until a confirmation of services is issued by NISADE.</li>
                                    <li>Guest services are subject to availability.&nbsp;</li>
                                    <li>Payment for guest services is due 16 days prior to check-in.&nbsp;This payment is non-refundable.</li>
                                    <li>
                                        Cancellation of guest services:
                                        <ol>
                                            <li>A cancellation is any change(s) to a package item, which is not an upgrade or an addition.</li>
                                            <li>
                                                Cancellation fees will be assessed as follows:
                                                <ol>
                                                    <li>17 days or more prior to check-in will incur an amendment fee of &yen;4,000 and may be subject to additional fees.</li>
                                                    <li>16 days prior to check-in will incur 100% of the total price.</li>
                                                </ol>
                                            </li>
                                        </ol>
                                    </li>
                                    <li>Guest services may not be rescheduled due to changes in travel itinerary or if the guest is unable to attend. Guests may be advised to repurchase services upon check-in at the accommodation.</li>
                                    <li>Unused items are non-refundable.</li>
                                </ol>
                            </div>
                        </div>
                    </span>
                </p>
            </div>
            <input type="hidden" id="base_page:tabview:vendorMessagePanel4_collapsed" name="base_page:tabview:vendorMessagePanel4_collapsed" value="false"/>
        </div>
        <script id="base_page:tabview:vendorMessagePanel4_s" type="text/javascript">
            $(function() {
                PrimeFaces.cw("Panel", "widget_base_page_tabview_vendorMessagePanel4", {
                    id: "base_page:tabview:vendorMessagePanel4",
                    toggleable: true
                });
            });
        </script>
</p></div></div>
<div id="base_page:tabview:t5" class="ui-collapsible ui-collapsible-inset ui-corner-all ui-collapsible-themed-content ui-collapsible-collapsed" role="tabpanel">
    <div class="ui-collapsible-heading ui-collapsible-heading-collapsed" role="tab" aria-expanded="false">
        <a href="#" class="ui-collapsible-heading-toggle ui-btn ui-btn-icon-left ui-icon-plus">
            <table class="accordion-bar-content">
                <tbody>
                    <tr>
                        <td>
                            <img id="base_page:tabview:i5" src="https://dh1msuk8kbcis.cloudfront.net/0_img/vdr/thumb_sml/niseko_united_all_mountain_lift_pass_niseko_369751.jpg" height="60" width="90" class="rbn-tab-img"/>
                        </td>
                        <td>
                            <div class="accordion-title rbn-bold">
                                <span class="accordion-vendor">Niseko United All Mountain Lift Pass :  </span>
                                <span class="accordion-date">Dec 27, 2022</span>
                            </div>
                        </td>
                        <td>
                            <div class="accordion-status-block">
                                <div class="accordion-status res">RESERVATION</div>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </a>
    </div>
    <div class="ui-collapsible-content ui-body-inherit ui-collapsible-content-collapsed" aria-hidden="true">
        <p>
        <div class="ui-grid ui-grid-responsive rbn-vendor-box">
            <div class="ui-grid-row" style="padding: 5px;">
                <div class="ui-grid-col-3" style="text-align: center;">
                    <img src="https://dh1msuk8kbcis.cloudfront.net/0_img/vdr/thumb/niseko_united_all_mountain_lift_pass_niseko_369751.jpg" style="width:90%;"/>
                </div>
                <div class="ui-grid-col-9" style="text-align: justify;">
                    <div id="base_page:tabview:j_idt840" class="ui-grid-solo">
                        <div class="ui-block-a">
                            <span class="rbn-bold">Niseko United All Mountain Lift Pass, Niseko</span>
                        </div>
                        <div class="ui-block-a">The All Mountain lift pass grants you access to all four mountains that make up the Niseko United area. We recommend booking your lift pass in advance as we deliver the lift passes to you at check in. This will save you time avoiding the hassle of having to purchase your lift tickets at one of the lift ticket counters where queues can be long.</div>
                    </div>
                </div>
            </div>
        </div>
        <div id="base_page:tabview:resultTable5" class="ui-datatable ui-shadow">
            <div class="ui-datatable-tablewrapper">
                <table role="grid" class="ui-responsive ui-table table-stripe ui-table-reflow">
                    <thead id="base_page:tabview:resultTable5_head">
                        <tr class="ui-bar-a" role="row">
                            <th id="base_page:tabview:resultTable5:eidcol" role="columnheader" class="ui-column-header rbn-eidcol">
                                <span class="ui-column-title">ID</span>
                            </th>
                            <th id="base_page:tabview:resultTable5:dtcol" role="columnheader" class="ui-column-header rbn-dtcol">
                                <span class="ui-column-title">Created On</span>
                            </th>
                            <th id="base_page:tabview:resultTable5:j_idt848" role="columnheader" class="ui-column-header">
                                <span class="ui-column-title">Vendor</span>
                            </th>
                            <th id="base_page:tabview:resultTable5:extent" role="columnheader" class="ui-column-header">
                                <span class="ui-column-title">Type</span>
                            </th>
                            <th id="base_page:tabview:resultTable5:state" role="columnheader" class="ui-column-header">
                                <span class="ui-column-title">State</span>
                            </th>
                        </tr>
                    </thead>
                    <tbody id="base_page:tabview:resultTable5_data">
                        <tr data-ri="0" class="ui-table-row">
                            <td role="gridcell" class="rbn-eidcol">
                                <b class="ui-table-cell-label">ID</b>
                                1213090
                            </td>
                            <td role="gridcell" class="rbn-dtcol">
                                <b class="ui-table-cell-label">Created On</b>
                                Friday, December 16, 2022 08:33 (GMT)
                            </td>
                            <td role="gridcell">
                                <b class="ui-table-cell-label">Vendor</b>
                                Niseko United All Mountain Lift Pass
                            </td>
                            <td role="gridcell">
                                <b class="ui-table-cell-label">Type</b>
                                RESERVATION
                            </td>
                            <td role="gridcell">
                                <b class="ui-table-cell-label">State</b>
                                <span id="base_page:tabview:resultTable5:0:bookingState" class="active">Active</span>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <script id="base_page:tabview:resultTable5_s" type="text/javascript">
            PrimeFaces.cw("DataTable", "widget_base_page_tabview_resultTable5", {
                id: "base_page:tabview:resultTable5",
                reflow: true
            });
        </script>
        <div id="base_page:tabview:orderItemTable5" class="ui-datatable ui-shadow">
            <div class="ui-datatable-tablewrapper">
                <table role="grid" class="ui-responsive ui-table table-stripe ui-table-reflow">
                    <thead id="base_page:tabview:orderItemTable5_head">
                        <tr class="ui-bar-a" role="row">
                            <th id="base_page:tabview:orderItemTable5:j_idt927" role="columnheader" class="ui-column-header">
                                <span class="ui-column-title">#</span>
                            </th>
                            <th id="base_page:tabview:orderItemTable5:j_idt929" role="columnheader" class="ui-column-header centered">
                                <span class="ui-column-title">Start date</span>
                            </th>
                            <th id="base_page:tabview:orderItemTable5:j_idt930" role="columnheader" class="ui-column-header">
                                <span class="ui-column-title">Item</span>
                            </th>
                            <th id="base_page:tabview:orderItemTable5:guests" role="columnheader" class="ui-column-header">
                                <span class="ui-column-title">Guests</span>
                            </th>
                            <th id="base_page:tabview:orderItemTable5:amt" role="columnheader" class="ui-column-header">
                                <span class="ui-column-title">Cost</span>
                            </th>
                        </tr>
                    </thead>
                    <tbody id="base_page:tabview:orderItemTable5_data">
                        <tr data-ri="0" class="ui-table-row">
                            <td role="gridcell">
                                <b class="ui-table-cell-label">#</b>
                                1
                            </td>
                            <td role="gridcell" class="centered">
                                <b class="ui-table-cell-label">Start date</b>
                                <span id="base_page:tabview:orderItemTable5:0:checkindate">2022-12-27</span>
                            </td>
                            <td role="gridcell">
                                <b class="ui-table-cell-label">Item</b>
                                <span id="base_page:tabview:orderItemTable5:0:prodname" class="bold" style="font-weight: bold;">5 Day All Mountain - Adult</span>
                                <div id="base_page:tabview:orderItemTable5:0:pocgrd" class="ui-datagrid" style="word-wrap: break-word;">
                                    <div id="base_page:tabview:orderItemTable5:0:pocgrd_content" class="ui-datagrid-content ui-responsive ui-grid-solo">
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Accommodation : </span>
                                            <span id="base_page:tabview:orderItemTable5:0:pocgrd:1:criterionValueId">Sekka Sekka</span>
                                        </div>
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Agent Ref# : </span>
                                            <span id="base_page:tabview:orderItemTable5:0:pocgrd:2:criterionValueId">224158</span>
                                        </div>
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Accom. Booking No. : </span>
                                            <span id="base_page:tabview:orderItemTable5:0:pocgrd:3:criterionValueId">1150344</span>
                                        </div>
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">LT No. (office use) : </span>
                                            <span id="base_page:tabview:orderItemTable5:0:pocgrd:4:criterionValueId">5188</span>
                                        </div>
                                    </div>
                                </div>
                                <script id="base_page:tabview:orderItemTable5:0:pocgrd_s" type="text/javascript">
                                    PrimeFaces.cw("DataGrid", "widget_base_page_tabview_orderItemTable5_0_pocgrd", {
                                        id: "base_page:tabview:orderItemTable5:0:pocgrd"
                                    });
                                </script>
                                <div id="base_page:tabview:orderItemTable5:0:pdoptgrd" class="ui-datagrid">
                                    <div id="base_page:tabview:orderItemTable5:0:pdoptgrd_content" class="ui-datagrid-content ui-responsive ui-grid-solo"></div>
                                </div>
                                <script id="base_page:tabview:orderItemTable5:0:pdoptgrd_s" type="text/javascript">
                                    PrimeFaces.cw("DataGrid", "widget_base_page_tabview_orderItemTable5_0_pdoptgrd", {
                                        id: "base_page:tabview:orderItemTable5:0:pdoptgrd"
                                    });
                                </script>
                            </td>
                            <td role="gridcell">
                                <b class="ui-table-cell-label">Guests</b>
                                <div id="base_page:tabview:orderItemTable5:0:guestsGrid" class="ui-datagrid">
                                    <div id="base_page:tabview:orderItemTable5:0:guestsGrid_content" class="ui-datagrid-content ui-responsive ui-grid-solo">
                                        <div class="ui-block-a">
                                            <span id="base_page:tabview:orderItemTable5:0:guestsGrid:0:guestName" style="font-weight: bold;">Siy Tiffany</span>
                                            <br/>
                                        </div>
                                    </div>
                                </div>
                                <script id="base_page:tabview:orderItemTable5:0:guestsGrid_s" type="text/javascript">
                                    PrimeFaces.cw("DataGrid", "widget_base_page_tabview_orderItemTable5_0_guestsGrid", {
                                        id: "base_page:tabview:orderItemTable5:0:guestsGrid"
                                    });
                                </script>
                            </td>
                            <td role="gridcell">
                                <b class="ui-table-cell-label">Cost</b>
                                36,900 JPY
                            </td>
                        </tr>
                        <tr data-ri="1" class="ui-table-row">
                            <td role="gridcell">
                                <b class="ui-table-cell-label">#</b>
                                2
                            </td>
                            <td role="gridcell" class="centered">
                                <b class="ui-table-cell-label">Start date</b>
                                <span id="base_page:tabview:orderItemTable5:1:checkindate">2022-12-27</span>
                            </td>
                            <td role="gridcell">
                                <b class="ui-table-cell-label">Item</b>
                                <span id="base_page:tabview:orderItemTable5:1:prodname" class="bold" style="font-weight: bold;">5 Day All Mountain - Adult</span>
                                <div id="base_page:tabview:orderItemTable5:1:pocgrd" class="ui-datagrid" style="word-wrap: break-word;">
                                    <div id="base_page:tabview:orderItemTable5:1:pocgrd_content" class="ui-datagrid-content ui-responsive ui-grid-solo">
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Accommodation : </span>
                                            <span id="base_page:tabview:orderItemTable5:1:pocgrd:1:criterionValueId">Sekka Sekka</span>
                                        </div>
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Agent Ref# : </span>
                                            <span id="base_page:tabview:orderItemTable5:1:pocgrd:2:criterionValueId">224158</span>
                                        </div>
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Accom. Booking No. : </span>
                                            <span id="base_page:tabview:orderItemTable5:1:pocgrd:3:criterionValueId">1150344</span>
                                        </div>
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">LT No. (office use) : </span>
                                            <span id="base_page:tabview:orderItemTable5:1:pocgrd:4:criterionValueId">5189</span>
                                        </div>
                                    </div>
                                </div>
                                <script id="base_page:tabview:orderItemTable5:1:pocgrd_s" type="text/javascript">
                                    PrimeFaces.cw("DataGrid", "widget_base_page_tabview_orderItemTable5_1_pocgrd", {
                                        id: "base_page:tabview:orderItemTable5:1:pocgrd"
                                    });
                                </script>
                                <div id="base_page:tabview:orderItemTable5:1:pdoptgrd" class="ui-datagrid">
                                    <div id="base_page:tabview:orderItemTable5:1:pdoptgrd_content" class="ui-datagrid-content ui-responsive ui-grid-solo"></div>
                                </div>
                                <script id="base_page:tabview:orderItemTable5:1:pdoptgrd_s" type="text/javascript">
                                    PrimeFaces.cw("DataGrid", "widget_base_page_tabview_orderItemTable5_1_pdoptgrd", {
                                        id: "base_page:tabview:orderItemTable5:1:pdoptgrd"
                                    });
                                </script>
                            </td>
                            <td role="gridcell">
                                <b class="ui-table-cell-label">Guests</b>
                                <div id="base_page:tabview:orderItemTable5:1:guestsGrid" class="ui-datagrid">
                                    <div id="base_page:tabview:orderItemTable5:1:guestsGrid_content" class="ui-datagrid-content ui-responsive ui-grid-solo">
                                        <div class="ui-block-a">
                                            <span id="base_page:tabview:orderItemTable5:1:guestsGrid:0:guestName" style="font-weight: bold;">Siy Tiffany</span>
                                            <br/>
                                        </div>
                                    </div>
                                </div>
                                <script id="base_page:tabview:orderItemTable5:1:guestsGrid_s" type="text/javascript">
                                    PrimeFaces.cw("DataGrid", "widget_base_page_tabview_orderItemTable5_1_guestsGrid", {
                                        id: "base_page:tabview:orderItemTable5:1:guestsGrid"
                                    });
                                </script>
                            </td>
                            <td role="gridcell">
                                <b class="ui-table-cell-label">Cost</b>
                                36,900 JPY
                            </td>
                        </tr>
                        <tr data-ri="2" class="ui-table-row">
                            <td role="gridcell">
                                <b class="ui-table-cell-label">#</b>
                                3
                            </td>
                            <td role="gridcell" class="centered">
                                <b class="ui-table-cell-label">Start date</b>
                                <span id="base_page:tabview:orderItemTable5:2:checkindate">2022-12-27</span>
                            </td>
                            <td role="gridcell">
                                <b class="ui-table-cell-label">Item</b>
                                <span id="base_page:tabview:orderItemTable5:2:prodname" class="bold" style="font-weight: bold;">6 Day All Mountain - Adult</span>
                                <div id="base_page:tabview:orderItemTable5:2:pocgrd" class="ui-datagrid" style="word-wrap: break-word;">
                                    <div id="base_page:tabview:orderItemTable5:2:pocgrd_content" class="ui-datagrid-content ui-responsive ui-grid-solo">
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Accommodation : </span>
                                            <span id="base_page:tabview:orderItemTable5:2:pocgrd:1:criterionValueId">Sekka Sekka</span>
                                        </div>
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Agent Ref# : </span>
                                            <span id="base_page:tabview:orderItemTable5:2:pocgrd:2:criterionValueId">224158</span>
                                        </div>
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Accom. Booking No. : </span>
                                            <span id="base_page:tabview:orderItemTable5:2:pocgrd:3:criterionValueId">1150344</span>
                                        </div>
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">LT No. (office use) : </span>
                                            <span id="base_page:tabview:orderItemTable5:2:pocgrd:4:criterionValueId">5190</span>
                                        </div>
                                    </div>
                                </div>
                                <script id="base_page:tabview:orderItemTable5:2:pocgrd_s" type="text/javascript">
                                    PrimeFaces.cw("DataGrid", "widget_base_page_tabview_orderItemTable5_2_pocgrd", {
                                        id: "base_page:tabview:orderItemTable5:2:pocgrd"
                                    });
                                </script>
                                <div id="base_page:tabview:orderItemTable5:2:pdoptgrd" class="ui-datagrid">
                                    <div id="base_page:tabview:orderItemTable5:2:pdoptgrd_content" class="ui-datagrid-content ui-responsive ui-grid-solo"></div>
                                </div>
                                <script id="base_page:tabview:orderItemTable5:2:pdoptgrd_s" type="text/javascript">
                                    PrimeFaces.cw("DataGrid", "widget_base_page_tabview_orderItemTable5_2_pdoptgrd", {
                                        id: "base_page:tabview:orderItemTable5:2:pdoptgrd"
                                    });
                                </script>
                            </td>
                            <td role="gridcell">
                                <b class="ui-table-cell-label">Guests</b>
                                <div id="base_page:tabview:orderItemTable5:2:guestsGrid" class="ui-datagrid">
                                    <div id="base_page:tabview:orderItemTable5:2:guestsGrid_content" class="ui-datagrid-content ui-responsive ui-grid-solo">
                                        <div class="ui-block-a">
                                            <span id="base_page:tabview:orderItemTable5:2:guestsGrid:0:guestName" style="font-weight: bold;">Siy Tiffany</span>
                                            <br/>
                                        </div>
                                    </div>
                                </div>
                                <script id="base_page:tabview:orderItemTable5:2:guestsGrid_s" type="text/javascript">
                                    PrimeFaces.cw("DataGrid", "widget_base_page_tabview_orderItemTable5_2_guestsGrid", {
                                        id: "base_page:tabview:orderItemTable5:2:guestsGrid"
                                    });
                                </script>
                            </td>
                            <td role="gridcell">
                                <b class="ui-table-cell-label">Cost</b>
                                44,000 JPY
                            </td>
                        </tr>
                        <tr data-ri="3" class="ui-table-row">
                            <td role="gridcell">
                                <b class="ui-table-cell-label">#</b>
                                4
                            </td>
                            <td role="gridcell" class="centered">
                                <b class="ui-table-cell-label">Start date</b>
                                <span id="base_page:tabview:orderItemTable5:3:checkindate">2022-12-27</span>
                            </td>
                            <td role="gridcell">
                                <b class="ui-table-cell-label">Item</b>
                                <span id="base_page:tabview:orderItemTable5:3:prodname" class="bold" style="font-weight: bold;">6 Day All Mountain - Adult</span>
                                <div id="base_page:tabview:orderItemTable5:3:pocgrd" class="ui-datagrid" style="word-wrap: break-word;">
                                    <div id="base_page:tabview:orderItemTable5:3:pocgrd_content" class="ui-datagrid-content ui-responsive ui-grid-solo">
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Accommodation : </span>
                                            <span id="base_page:tabview:orderItemTable5:3:pocgrd:1:criterionValueId">Sekka Sekka</span>
                                        </div>
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Agent Ref# : </span>
                                            <span id="base_page:tabview:orderItemTable5:3:pocgrd:2:criterionValueId">224158</span>
                                        </div>
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Accom. Booking No. : </span>
                                            <span id="base_page:tabview:orderItemTable5:3:pocgrd:3:criterionValueId">1150344</span>
                                        </div>
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">LT No. (office use) : </span>
                                            <span id="base_page:tabview:orderItemTable5:3:pocgrd:4:criterionValueId">5191</span>
                                        </div>
                                    </div>
                                </div>
                                <script id="base_page:tabview:orderItemTable5:3:pocgrd_s" type="text/javascript">
                                    PrimeFaces.cw("DataGrid", "widget_base_page_tabview_orderItemTable5_3_pocgrd", {
                                        id: "base_page:tabview:orderItemTable5:3:pocgrd"
                                    });
                                </script>
                                <div id="base_page:tabview:orderItemTable5:3:pdoptgrd" class="ui-datagrid">
                                    <div id="base_page:tabview:orderItemTable5:3:pdoptgrd_content" class="ui-datagrid-content ui-responsive ui-grid-solo"></div>
                                </div>
                                <script id="base_page:tabview:orderItemTable5:3:pdoptgrd_s" type="text/javascript">
                                    PrimeFaces.cw("DataGrid", "widget_base_page_tabview_orderItemTable5_3_pdoptgrd", {
                                        id: "base_page:tabview:orderItemTable5:3:pdoptgrd"
                                    });
                                </script>
                            </td>
                            <td role="gridcell">
                                <b class="ui-table-cell-label">Guests</b>
                                <div id="base_page:tabview:orderItemTable5:3:guestsGrid" class="ui-datagrid">
                                    <div id="base_page:tabview:orderItemTable5:3:guestsGrid_content" class="ui-datagrid-content ui-responsive ui-grid-solo">
                                        <div class="ui-block-a">
                                            <span id="base_page:tabview:orderItemTable5:3:guestsGrid:0:guestName" style="font-weight: bold;">Siy Frederick</span>
                                            <br/>
                                        </div>
                                    </div>
                                </div>
                                <script id="base_page:tabview:orderItemTable5:3:guestsGrid_s" type="text/javascript">
                                    PrimeFaces.cw("DataGrid", "widget_base_page_tabview_orderItemTable5_3_guestsGrid", {
                                        id: "base_page:tabview:orderItemTable5:3:guestsGrid"
                                    });
                                </script>
                            </td>
                            <td role="gridcell">
                                <b class="ui-table-cell-label">Cost</b>
                                44,000 JPY
                            </td>
                        </tr>
                        <tr data-ri="4" class="ui-table-row">
                            <td role="gridcell">
                                <b class="ui-table-cell-label">#</b>
                                5
                            </td>
                            <td role="gridcell" class="centered">
                                <b class="ui-table-cell-label">Start date</b>
                                <span id="base_page:tabview:orderItemTable5:4:checkindate">2022-12-27</span>
                            </td>
                            <td role="gridcell">
                                <b class="ui-table-cell-label">Item</b>
                                <span id="base_page:tabview:orderItemTable5:4:prodname" class="bold" style="font-weight: bold;">6 Day All Mountain - Adult</span>
                                <div id="base_page:tabview:orderItemTable5:4:pocgrd" class="ui-datagrid" style="word-wrap: break-word;">
                                    <div id="base_page:tabview:orderItemTable5:4:pocgrd_content" class="ui-datagrid-content ui-responsive ui-grid-solo">
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Accommodation : </span>
                                            <span id="base_page:tabview:orderItemTable5:4:pocgrd:1:criterionValueId">Sekka Sekka</span>
                                        </div>
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Agent Ref# : </span>
                                            <span id="base_page:tabview:orderItemTable5:4:pocgrd:2:criterionValueId">224158</span>
                                        </div>
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Accom. Booking No. : </span>
                                            <span id="base_page:tabview:orderItemTable5:4:pocgrd:3:criterionValueId">1150344</span>
                                        </div>
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">LT No. (office use) : </span>
                                            <span id="base_page:tabview:orderItemTable5:4:pocgrd:4:criterionValueId">5192</span>
                                        </div>
                                    </div>
                                </div>
                                <script id="base_page:tabview:orderItemTable5:4:pocgrd_s" type="text/javascript">
                                    PrimeFaces.cw("DataGrid", "widget_base_page_tabview_orderItemTable5_4_pocgrd", {
                                        id: "base_page:tabview:orderItemTable5:4:pocgrd"
                                    });
                                </script>
                                <div id="base_page:tabview:orderItemTable5:4:pdoptgrd" class="ui-datagrid">
                                    <div id="base_page:tabview:orderItemTable5:4:pdoptgrd_content" class="ui-datagrid-content ui-responsive ui-grid-solo"></div>
                                </div>
                                <script id="base_page:tabview:orderItemTable5:4:pdoptgrd_s" type="text/javascript">
                                    PrimeFaces.cw("DataGrid", "widget_base_page_tabview_orderItemTable5_4_pdoptgrd", {
                                        id: "base_page:tabview:orderItemTable5:4:pdoptgrd"
                                    });
                                </script>
                            </td>
                            <td role="gridcell">
                                <b class="ui-table-cell-label">Guests</b>
                                <div id="base_page:tabview:orderItemTable5:4:guestsGrid" class="ui-datagrid">
                                    <div id="base_page:tabview:orderItemTable5:4:guestsGrid_content" class="ui-datagrid-content ui-responsive ui-grid-solo">
                                        <div class="ui-block-a">
                                            <span id="base_page:tabview:orderItemTable5:4:guestsGrid:0:guestName" style="font-weight: bold;">Siy Marco</span>
                                            <br/>
                                        </div>
                                    </div>
                                </div>
                                <script id="base_page:tabview:orderItemTable5:4:guestsGrid_s" type="text/javascript">
                                    PrimeFaces.cw("DataGrid", "widget_base_page_tabview_orderItemTable5_4_guestsGrid", {
                                        id: "base_page:tabview:orderItemTable5:4:guestsGrid"
                                    });
                                </script>
                            </td>
                            <td role="gridcell">
                                <b class="ui-table-cell-label">Cost</b>
                                44,000 JPY
                            </td>
                        </tr>
                        <tr data-ri="5" class="ui-table-row">
                            <td role="gridcell">
                                <b class="ui-table-cell-label">#</b>
                                6
                            </td>
                            <td role="gridcell" class="centered">
                                <b class="ui-table-cell-label">Start date</b>
                                <span id="base_page:tabview:orderItemTable5:5:checkindate">2022-12-27</span>
                            </td>
                            <td role="gridcell">
                                <b class="ui-table-cell-label">Item</b>
                                <span id="base_page:tabview:orderItemTable5:5:prodname" class="bold" style="font-weight: bold;">5 Day All Mountain - Youth</span>
                                <div id="base_page:tabview:orderItemTable5:5:pocgrd" class="ui-datagrid" style="word-wrap: break-word;">
                                    <div id="base_page:tabview:orderItemTable5:5:pocgrd_content" class="ui-datagrid-content ui-responsive ui-grid-solo">
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Accommodation : </span>
                                            <span id="base_page:tabview:orderItemTable5:5:pocgrd:1:criterionValueId">Sekka Sekka</span>
                                        </div>
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Agent Ref# : </span>
                                            <span id="base_page:tabview:orderItemTable5:5:pocgrd:2:criterionValueId">224158</span>
                                        </div>
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Accom. Booking No. : </span>
                                            <span id="base_page:tabview:orderItemTable5:5:pocgrd:3:criterionValueId">1150344</span>
                                        </div>
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">LT No. (office use) : </span>
                                            <span id="base_page:tabview:orderItemTable5:5:pocgrd:4:criterionValueId">5193</span>
                                        </div>
                                    </div>
                                </div>
                                <script id="base_page:tabview:orderItemTable5:5:pocgrd_s" type="text/javascript">
                                    PrimeFaces.cw("DataGrid", "widget_base_page_tabview_orderItemTable5_5_pocgrd", {
                                        id: "base_page:tabview:orderItemTable5:5:pocgrd"
                                    });
                                </script>
                                <div id="base_page:tabview:orderItemTable5:5:pdoptgrd" class="ui-datagrid">
                                    <div id="base_page:tabview:orderItemTable5:5:pdoptgrd_content" class="ui-datagrid-content ui-responsive ui-grid-solo"></div>
                                </div>
                                <script id="base_page:tabview:orderItemTable5:5:pdoptgrd_s" type="text/javascript">
                                    PrimeFaces.cw("DataGrid", "widget_base_page_tabview_orderItemTable5_5_pdoptgrd", {
                                        id: "base_page:tabview:orderItemTable5:5:pdoptgrd"
                                    });
                                </script>
                            </td>
                            <td role="gridcell">
                                <b class="ui-table-cell-label">Guests</b>
                                <div id="base_page:tabview:orderItemTable5:5:guestsGrid" class="ui-datagrid">
                                    <div id="base_page:tabview:orderItemTable5:5:guestsGrid_content" class="ui-datagrid-content ui-responsive ui-grid-solo">
                                        <div class="ui-block-a">
                                            <span id="base_page:tabview:orderItemTable5:5:guestsGrid:0:guestName" style="font-weight: bold;">Siy Tiffany</span>
                                            <br/>
                                        </div>
                                    </div>
                                </div>
                                <script id="base_page:tabview:orderItemTable5:5:guestsGrid_s" type="text/javascript">
                                    PrimeFaces.cw("DataGrid", "widget_base_page_tabview_orderItemTable5_5_guestsGrid", {
                                        id: "base_page:tabview:orderItemTable5:5:guestsGrid"
                                    });
                                </script>
                            </td>
                            <td role="gridcell">
                                <b class="ui-table-cell-label">Cost</b>
                                29,500 JPY
                            </td>
                        </tr>
                        <tr data-ri="6" class="ui-table-row">
                            <td role="gridcell">
                                <b class="ui-table-cell-label">#</b>
                                7
                            </td>
                            <td role="gridcell" class="centered">
                                <b class="ui-table-cell-label">Start date</b>
                                <span id="base_page:tabview:orderItemTable5:6:checkindate">2022-12-27</span>
                            </td>
                            <td role="gridcell">
                                <b class="ui-table-cell-label">Item</b>
                                <span id="base_page:tabview:orderItemTable5:6:prodname" class="bold" style="font-weight: bold;">6 Day All Mountain - Youth</span>
                                <div id="base_page:tabview:orderItemTable5:6:pocgrd" class="ui-datagrid" style="word-wrap: break-word;">
                                    <div id="base_page:tabview:orderItemTable5:6:pocgrd_content" class="ui-datagrid-content ui-responsive ui-grid-solo">
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Accommodation : </span>
                                            <span id="base_page:tabview:orderItemTable5:6:pocgrd:1:criterionValueId">Sekka Sekka</span>
                                        </div>
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Agent Ref# : </span>
                                            <span id="base_page:tabview:orderItemTable5:6:pocgrd:2:criterionValueId">224158</span>
                                        </div>
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Accom. Booking No. : </span>
                                            <span id="base_page:tabview:orderItemTable5:6:pocgrd:3:criterionValueId">1150344</span>
                                        </div>
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">LT No. (office use) : </span>
                                            <span id="base_page:tabview:orderItemTable5:6:pocgrd:4:criterionValueId">5194</span>
                                        </div>
                                    </div>
                                </div>
                                <script id="base_page:tabview:orderItemTable5:6:pocgrd_s" type="text/javascript">
                                    PrimeFaces.cw("DataGrid", "widget_base_page_tabview_orderItemTable5_6_pocgrd", {
                                        id: "base_page:tabview:orderItemTable5:6:pocgrd"
                                    });
                                </script>
                                <div id="base_page:tabview:orderItemTable5:6:pdoptgrd" class="ui-datagrid">
                                    <div id="base_page:tabview:orderItemTable5:6:pdoptgrd_content" class="ui-datagrid-content ui-responsive ui-grid-solo"></div>
                                </div>
                                <script id="base_page:tabview:orderItemTable5:6:pdoptgrd_s" type="text/javascript">
                                    PrimeFaces.cw("DataGrid", "widget_base_page_tabview_orderItemTable5_6_pdoptgrd", {
                                        id: "base_page:tabview:orderItemTable5:6:pdoptgrd"
                                    });
                                </script>
                            </td>
                            <td role="gridcell">
                                <b class="ui-table-cell-label">Guests</b>
                                <div id="base_page:tabview:orderItemTable5:6:guestsGrid" class="ui-datagrid">
                                    <div id="base_page:tabview:orderItemTable5:6:guestsGrid_content" class="ui-datagrid-content ui-responsive ui-grid-solo">
                                        <div class="ui-block-a">
                                            <span id="base_page:tabview:orderItemTable5:6:guestsGrid:0:guestName" style="font-weight: bold;">Siy Natalia</span>
                                            <br/>
                                        </div>
                                    </div>
                                </div>
                                <script id="base_page:tabview:orderItemTable5:6:guestsGrid_s" type="text/javascript">
                                    PrimeFaces.cw("DataGrid", "widget_base_page_tabview_orderItemTable5_6_guestsGrid", {
                                        id: "base_page:tabview:orderItemTable5:6:guestsGrid"
                                    });
                                </script>
                            </td>
                            <td role="gridcell">
                                <b class="ui-table-cell-label">Cost</b>
                                35,200 JPY
                            </td>
                        </tr>
                        <tr data-ri="7" class="ui-table-row">
                            <td role="gridcell">
                                <b class="ui-table-cell-label">#</b>
                                8
                            </td>
                            <td role="gridcell" class="centered">
                                <b class="ui-table-cell-label">Start date</b>
                                <span id="base_page:tabview:orderItemTable5:7:checkindate">2022-12-27</span>
                            </td>
                            <td role="gridcell">
                                <b class="ui-table-cell-label">Item</b>
                                <span id="base_page:tabview:orderItemTable5:7:prodname" class="bold" style="font-weight: bold;">5 Day All Mountain - Child</span>
                                <div id="base_page:tabview:orderItemTable5:7:pocgrd" class="ui-datagrid" style="word-wrap: break-word;">
                                    <div id="base_page:tabview:orderItemTable5:7:pocgrd_content" class="ui-datagrid-content ui-responsive ui-grid-solo">
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Accommodation : </span>
                                            <span id="base_page:tabview:orderItemTable5:7:pocgrd:1:criterionValueId">Sekka Sekka</span>
                                        </div>
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Agent Ref# : </span>
                                            <span id="base_page:tabview:orderItemTable5:7:pocgrd:2:criterionValueId">224158</span>
                                        </div>
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">Accom. Booking No. : </span>
                                            <span id="base_page:tabview:orderItemTable5:7:pocgrd:3:criterionValueId">1150344</span>
                                        </div>
                                        <div class="ui-block-a">
                                            <span style="font-weight: bold;">LT No. (office use) : </span>
                                            <span id="base_page:tabview:orderItemTable5:7:pocgrd:4:criterionValueId">5195</span>
                                        </div>
                                    </div>
                                </div>
                                <script id="base_page:tabview:orderItemTable5:7:pocgrd_s" type="text/javascript">
                                    PrimeFaces.cw("DataGrid", "widget_base_page_tabview_orderItemTable5_7_pocgrd", {
                                        id: "base_page:tabview:orderItemTable5:7:pocgrd"
                                    });
                                </script>
                                <div id="base_page:tabview:orderItemTable5:7:pdoptgrd" class="ui-datagrid">
                                    <div id="base_page:tabview:orderItemTable5:7:pdoptgrd_content" class="ui-datagrid-content ui-responsive ui-grid-solo"></div>
                                </div>
                                <script id="base_page:tabview:orderItemTable5:7:pdoptgrd_s" type="text/javascript">
                                    PrimeFaces.cw("DataGrid", "widget_base_page_tabview_orderItemTable5_7_pdoptgrd", {
                                        id: "base_page:tabview:orderItemTable5:7:pdoptgrd"
                                    });
                                </script>
                            </td>
                            <td role="gridcell">
                                <b class="ui-table-cell-label">Guests</b>
                                <div id="base_page:tabview:orderItemTable5:7:guestsGrid" class="ui-datagrid">
                                    <div id="base_page:tabview:orderItemTable5:7:guestsGrid_content" class="ui-datagrid-content ui-responsive ui-grid-solo">
                                        <div class="ui-block-a">
                                            <span id="base_page:tabview:orderItemTable5:7:guestsGrid:0:guestName" style="font-weight: bold;">Siy Tiffany</span>
                                            <br/>
                                        </div>
                                    </div>
                                </div>
                                <script id="base_page:tabview:orderItemTable5:7:guestsGrid_s" type="text/javascript">
                                    PrimeFaces.cw("DataGrid", "widget_base_page_tabview_orderItemTable5_7_guestsGrid", {
                                        id: "base_page:tabview:orderItemTable5:7:guestsGrid"
                                    });
                                </script>
                            </td>
                            <td role="gridcell">
                                <b class="ui-table-cell-label">Cost</b>
                                22,100 JPY
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <script id="base_page:tabview:orderItemTable5_s" type="text/javascript">
            PrimeFaces.cw("DataTable", "widget_base_page_tabview_orderItemTable5", {
                id: "base_page:tabview:orderItemTable5",
                reflow: true
            });
        </script>
        <div id="base_page:tabview:vendorMessagePanel5" class="ui-panel-m ui-corner-all" data-widget="widget_base_page_tabview_vendorMessagePanel5">
            <div class="ui-panel-m-titlebar ui-bar ui-bar-inherit">
                <h3>Notes</h3>
                <a href="#" class="ui-panel-m-titlebar-icon ui-btn ui-shadow ui-corner-all ui-icon-minus ui-btn-icon-notext ui-btn-right"></a>
            </div>
            <div class="ui-panel-m-content ui-body ui-body-inherit">
                <p>
                    <span id="base_page:tabview:vendorMessage5">
                        <div>
                            <div>
                                <strong>
                                    <span style="font-family: Arial, Helvetica, sans-serif; font-size: 12pt;">Booking Terms &amp;Conditions</span>
                                </strong>
                            </div>
                            <div>
                                <ol style="font-family: Arial, Helvetica, sans-serif; font-size: 10pt;">
                                    <li style="font-size: 10pt;">All offers, prices, and terms and conditions are subject to change at will and without notice.</li>
                                    <li>Guest services bookings are not confirmed until a confirmation of services is issued by NISADE.</li>
                                    <li>Guest services are subject to availability.&nbsp;</li>
                                    <li>Payment for guest services is due 16 days prior to check-in.&nbsp;This payment is non-refundable.</li>
                                    <li>
                                        Cancellation of guest services:
                                        <ol>
                                            <li>A cancellation is any change(s) to a package item, which is not an upgrade or an addition.</li>
                                            <li>
                                                Cancellation fees will be assessed as follows:
                                                <ol>
                                                    <li>17 days or more prior to check-in will incur an amendment fee of &yen;4,000 and may be subject to additional fees.</li>
                                                    <li>16 days prior to check-in will incur 100% of the total price.</li>
                                                </ol>
                                            </li>
                                        </ol>
                                    </li>
                                    <li>Guest services may not be rescheduled due to changes in travel itinerary or if the guest is unable to attend. Guests may be advised to repurchase services upon check-in at the accommodation.</li>
                                    <li>Unused items are non-refundable.</li>
                                </ol>
                            </div>
                        </div>
                    </span>
                </p>
            </div>
            <input type="hidden" id="base_page:tabview:vendorMessagePanel5_collapsed" name="base_page:tabview:vendorMessagePanel5_collapsed" value="false"/>
        </div>
        <script id="base_page:tabview:vendorMessagePanel5_s" type="text/javascript">
            $(function() {
                PrimeFaces.cw("Panel", "widget_base_page_tabview_vendorMessagePanel5", {
                    id: "base_page:tabview:vendorMessagePanel5",
                    toggleable: true
                });
            });
        </script>
</p></div></div><input type="hidden" id="base_page:tabview_active" name="base_page:tabview_active" value="-1" autocomplete="off"/>
</div><script id="base_page:tabview_s" type="text/javascript">
    PrimeFaces.cw("AccordionPanel", "widget_base_page_tabview", {
        id: "base_page:tabview"
    });
</script>
<div id="base_page:vendorMessagePanel" class="ui-panel-m ui-corner-all" data-widget="widget_base_page_vendorMessagePanel">
    <div class="ui-panel-m-titlebar ui-bar ui-bar-inherit">
        <h3>Additional Information</h3>
        <a href="#" class="ui-panel-m-titlebar-icon ui-btn ui-shadow ui-corner-all ui-icon-minus ui-btn-icon-notext ui-btn-right"></a>
    </div>
    <div class="ui-panel-m-content ui-body ui-body-inherit">
        <p>
            <span id="base_page:generalMessage">
                <div>&nbsp;</div>
                <div>
                    <ol style="font-family: Arial, Helvetica, sans-serif; font-size: 10pt;"></ol>
                </div>
            </span>
        </p>
    </div>
    <input type="hidden" id="base_page:vendorMessagePanel_collapsed" name="base_page:vendorMessagePanel_collapsed" value="false"/>
</div>
<script id="base_page:vendorMessagePanel_s" type="text/javascript">
    $(function() {
        PrimeFaces.cw("Panel", "widget_base_page_vendorMessagePanel", {
            id: "base_page:vendorMessagePanel",
            toggleable: true
        });
    });
</script>
<div id="invoiceHead"></div>
<div id="base_page:txtab" class="ui-datatable ui-shadow">
    <div class="ui-datatable-tablewrapper">
        <table role="grid" class="ui-responsive ui-table table-stripe ui-table-reflow">
            <thead id="base_page:txtab_head">
                <tr class="ui-bar-a" role="row">
                    <th id="base_page:txtab:j_idt228" role="columnheader" class="ui-column-header" style="text-align: center">
                        <span class="ui-column-title"></span>
                    </th>
                    <th id="base_page:txtab:invoiceId" role="columnheader" class="ui-column-header">
                        <span class="ui-column-title">Invoice ID</span>
                    </th>
                    <th id="base_page:txtab:amt" role="columnheader" class="ui-column-header">
                        <span class="ui-column-title">Invoice Amount</span>
                    </th>
                    <th id="base_page:txtab:notesText" role="columnheader" class="ui-column-header">
                        <span class="ui-column-title">Notes</span>
                    </th>
                    <th id="base_page:txtab:invoiceDate" role="columnheader" class="ui-column-header">
                        <span class="ui-column-title">Invoice Date</span>
                    </th>
                    <th id="base_page:txtab:dueDate" role="columnheader" class="ui-column-header">
                        <span class="ui-column-title">Due Date</span>
                    </th>
                    <th id="base_page:txtab:recd" role="columnheader" class="ui-column-header">
                        <span class="ui-column-title">Payment Amount</span>
                    </th>
                    <th id="base_page:txtab:j_idt247" role="columnheader" class="ui-column-header">
                        <span class="ui-column-title">Payment Date</span>
                    </th>
                    <th id="base_page:txtab:j_idt250" role="columnheader" class="ui-column-header">
                        <span class="ui-column-title"></span>
                    </th>
                </tr>
            </thead>
            <tbody id="base_page:txtab_data">
                <tr data-ri="0" class="ui-table-row">
                    <td role="gridcell" style="text-align: center">
                        <b class="ui-table-cell-label"></b>
                        <form id="base_page:txtab:0:f1" name="base_page:txtab:0:f1" method="post" action="/public/yourbooking.jsf" enctype="application/x-www-form-urlencoded">
                            <input type="hidden" name="base_page:txtab:0:f1" value="base_page:txtab:0:f1"/>
                            <a id="base_page:txtab:0:f1:toPDFNew" name="base_page:txtab:0:f1:toPDFNew" href="https://pdf.roomboss.com/?state=eyJtb2RlIjoiSU5WT0lDRV9UaGluUkIiLCJjb21wYW55SWQiOiJmODA4YWQ5NjI4MDFhMTZhMDEyODA0MDk3NTUwMDAwNyIsImlzTmV3SW52b2ljZUZvckl0ZW0iOmZhbHNlLCJpbnZvaWNlSWQiOiI4YTgwODE4YTgzMWUyODMzMDE4MzMyYTcwZDJjNTEyOCIsImxvY2FsZSI6ImVuIiwiYm9va2luZ0lkIjoiOGE4MDgxOGE4MzFlMjgzMzAxODMzMmE3MDNiMTUxMWMiLCJmaWxlVHlwZSI6IlBERiJ9&amp;download=INVOICE&amp;returnUrl=https%3A//nisade.evoke.jp/public/yourbooking.jsf%3Fid=1150344&amp;em=tiffany_y_chua%40hotmail.com">
                                <img src="/template/default/images/icons/page_white_acrobat.png" style="margin-right: 3px;" class="bottom noborder"/>Receipt
                            </a>
                            <input type="hidden" name="javax.faces.ViewState" id="j_id1:javax.faces.ViewState:2" value="-6557909179203061962:1031983341735614216" autocomplete="off"/>
                            <input type="hidden" name="javax.faces.RenderKitId" value="PRIMEFACES_MOBILE"/>
                        </form>
                    </td>
                    <td role="gridcell">
                        <b class="ui-table-cell-label">Invoice ID</b>
                        1150344-1
                    </td>
                    <td role="gridcell">
                        <b class="ui-table-cell-label">Invoice Amount</b>
                        217,000 JPY
                    </td>
                    <td role="gridcell">
                        <b class="ui-table-cell-label">Notes</b>
                    </td>
                    <td role="gridcell">
                        <b class="ui-table-cell-label">Invoice Date</b>
                        Sep 13, 2022
                    </td>
                    <td role="gridcell">
                        <b class="ui-table-cell-label">Due Date</b>
                        Sep 16, 2022
                    </td>
                    <td role="gridcell">
                        <b class="ui-table-cell-label">Payment Amount</b>
                        217,000 JPY
                    </td>
                    <td role="gridcell">
                        <b class="ui-table-cell-label">Payment Date</b>
                        Sep 15, 2022
                    </td>
                    <td role="gridcell">
                        <b class="ui-table-cell-label"></b>
                        <span id="base_page:txtab:0:receivedMessageText">RECEIVED, THANK YOU</span>
                    </td>
                </tr>
                <tr data-ri="1" class="ui-table-row">
                    <td role="gridcell" style="text-align: center">
                        <b class="ui-table-cell-label"></b>
                        <form id="base_page:txtab:1:f1" name="base_page:txtab:1:f1" method="post" action="/public/yourbooking.jsf" enctype="application/x-www-form-urlencoded">
                            <input type="hidden" name="base_page:txtab:1:f1" value="base_page:txtab:1:f1"/>
                            <a id="base_page:txtab:1:f1:toPDFNew" name="base_page:txtab:1:f1:toPDFNew" href="https://pdf.roomboss.com/?state=eyJtb2RlIjoiSU5WT0lDRV9UaGluUkIiLCJjb21wYW55SWQiOiJmODA4YWQ5NjI4MDFhMTZhMDEyODA0MDk3NTUwMDAwNyIsImlzTmV3SW52b2ljZUZvckl0ZW0iOmZhbHNlLCJpbnZvaWNlSWQiOiI4YTgwODE4YTgzMWUyODMzMDE4MzMyYTcwZDYyNTEyYyIsImxvY2FsZSI6ImVuIiwiYm9va2luZ0lkIjoiOGE4MDgxOGE4MzFlMjgzMzAxODMzMmE3MDNiMTUxMWMiLCJmaWxlVHlwZSI6IlBERiJ9&amp;download=INVOICE&amp;returnUrl=https%3A//nisade.evoke.jp/public/yourbooking.jsf%3Fid=1150344&amp;em=tiffany_y_chua%40hotmail.com">
                                <img src="/template/default/images/icons/page_white_acrobat.png" style="margin-right: 3px;" class="bottom noborder"/>Receipt
                            </a>
                            <input type="hidden" name="javax.faces.ViewState" id="j_id1:javax.faces.ViewState:3" value="-6557909179203061962:1031983341735614216" autocomplete="off"/>
                            <input type="hidden" name="javax.faces.RenderKitId" value="PRIMEFACES_MOBILE"/>
                        </form>
                    </td>
                    <td role="gridcell">
                        <b class="ui-table-cell-label">Invoice ID</b>
                        1150344-2
                    </td>
                    <td role="gridcell">
                        <b class="ui-table-cell-label">Invoice Amount</b>
                        1,953,000 JPY
                    </td>
                    <td role="gridcell">
                        <b class="ui-table-cell-label">Notes</b>
                    </td>
                    <td role="gridcell">
                        <b class="ui-table-cell-label">Invoice Date</b>
                        Sep 13, 2022
                    </td>
                    <td role="gridcell">
                        <b class="ui-table-cell-label">Due Date</b>
                        Oct 27, 2022
                    </td>
                    <td role="gridcell">
                        <b class="ui-table-cell-label">Payment Amount</b>
                        1,953,000 JPY
                    </td>
                    <td role="gridcell">
                        <b class="ui-table-cell-label">Payment Date</b>
                        Oct 26, 2022
                    </td>
                    <td role="gridcell">
                        <b class="ui-table-cell-label"></b>
                        <span id="base_page:txtab:1:receivedMessageText">RECEIVED, THANK YOU</span>
                    </td>
                </tr>
                <tr data-ri="2" class="ui-table-row">
                    <td role="gridcell" style="text-align: center">
                        <b class="ui-table-cell-label"></b>
                        <form id="base_page:txtab:2:f1" name="base_page:txtab:2:f1" method="post" action="/public/yourbooking.jsf" enctype="application/x-www-form-urlencoded">
                            <input type="hidden" name="base_page:txtab:2:f1" value="base_page:txtab:2:f1"/>
                            <a id="base_page:txtab:2:f1:toPDFNew" name="base_page:txtab:2:f1:toPDFNew" href="https://pdf.roomboss.com/?state=eyJtb2RlIjoiSU5WT0lDRV9UaGluUkIiLCJjb21wYW55SWQiOiJmODA4YWQ5NjI4MDFhMTZhMDEyODA0MDk3NTUwMDAwNyIsImlzTmV3SW52b2ljZUZvckl0ZW0iOmZhbHNlLCJpbnZvaWNlSWQiOiI4YTgwODE4YTg0NTc4ZTIzMDE4NDYwOTNlMzg1MzI4OCIsImxvY2FsZSI6ImVuIiwiYm9va2luZ0lkIjoiOGE4MDgxOGE4MzFlMjgzMzAxODMzMmE3MDNiMTUxMWMiLCJmaWxlVHlwZSI6IlBERiJ9&amp;download=INVOICE&amp;returnUrl=https%3A//nisade.evoke.jp/public/yourbooking.jsf%3Fid=1150344&amp;em=tiffany_y_chua%40hotmail.com">
                                <img src="/template/default/images/icons/page_white_acrobat.png" style="margin-right: 3px;" class="bottom noborder"/>Receipt
                            </a>
                            <input type="hidden" name="javax.faces.ViewState" id="j_id1:javax.faces.ViewState:4" value="-6557909179203061962:1031983341735614216" autocomplete="off"/>
                            <input type="hidden" name="javax.faces.RenderKitId" value="PRIMEFACES_MOBILE"/>
                        </form>
                    </td>
                    <td role="gridcell">
                        <b class="ui-table-cell-label">Invoice ID</b>
                        1183141-1
                    </td>
                    <td role="gridcell">
                        <b class="ui-table-cell-label">Invoice Amount</b>
                        148,800 JPY
                    </td>
                    <td role="gridcell">
                        <b class="ui-table-cell-label">Notes</b>
                    </td>
                    <td role="gridcell">
                        <b class="ui-table-cell-label">Invoice Date</b>
                        Nov 10, 2022
                    </td>
                    <td role="gridcell">
                        <b class="ui-table-cell-label">Due Date</b>
                        Nov 10, 2022
                    </td>
                    <td role="gridcell">
                        <b class="ui-table-cell-label">Payment Amount</b>
                        148,800 JPY
                    </td>
                    <td role="gridcell">
                        <b class="ui-table-cell-label">Payment Date</b>
                        Nov 10, 2022
                    </td>
                    <td role="gridcell">
                        <b class="ui-table-cell-label"></b>
                        <span id="base_page:txtab:2:receivedMessageText">RECEIVED, THANK YOU</span>
                    </td>
                </tr>
                <tr data-ri="3" class="ui-table-row">
                    <td role="gridcell" style="text-align: center">
                        <b class="ui-table-cell-label"></b>
                        <form id="base_page:txtab:3:f1" name="base_page:txtab:3:f1" method="post" action="/public/yourbooking.jsf" enctype="application/x-www-form-urlencoded">
                            <input type="hidden" name="base_page:txtab:3:f1" value="base_page:txtab:3:f1"/>
                            <a id="base_page:txtab:3:f1:toPDFNew" name="base_page:txtab:3:f1:toPDFNew" href="https://pdf.roomboss.com/?state=eyJtb2RlIjoiSU5WT0lDRV9UaGluUkIiLCJjb21wYW55SWQiOiJmODA4YWQ5NjI4MDFhMTZhMDEyODA0MDk3NTUwMDAwNyIsImlzTmV3SW52b2ljZUZvckl0ZW0iOmZhbHNlLCJpbnZvaWNlSWQiOiI4YTgwODE4YTg1MTZkNmU5MDE4NTE5NTA5YWI1NGI3NSIsImxvY2FsZSI6ImVuIiwiYm9va2luZ0lkIjoiOGE4MDgxOGE4MzFlMjgzMzAxODMzMmE3MDNiMTUxMWMiLCJmaWxlVHlwZSI6IlBERiJ9&amp;download=INVOICE&amp;returnUrl=https%3A//nisade.evoke.jp/public/yourbooking.jsf%3Fid=1150344&amp;em=tiffany_y_chua%40hotmail.com">
                                <img src="/template/default/images/icons/page_white_acrobat.png" style="margin-right: 3px;" class="bottom noborder"/>Receipt
                            </a>
                            <input type="hidden" name="javax.faces.ViewState" id="j_id1:javax.faces.ViewState:5" value="-6557909179203061962:1031983341735614216" autocomplete="off"/>
                            <input type="hidden" name="javax.faces.RenderKitId" value="PRIMEFACES_MOBILE"/>
                        </form>
                    </td>
                    <td role="gridcell">
                        <b class="ui-table-cell-label">Invoice ID</b>
                        1150344-4
                    </td>
                    <td role="gridcell">
                        <b class="ui-table-cell-label">Invoice Amount</b>
                        67,200 JPY
                    </td>
                    <td role="gridcell">
                        <b class="ui-table-cell-label">Notes</b>
                    </td>
                    <td role="gridcell">
                        <b class="ui-table-cell-label">Invoice Date</b>
                        Dec 16, 2022
                    </td>
                    <td role="gridcell">
                        <b class="ui-table-cell-label">Due Date</b>
                        Dec 10, 2022
                    </td>
                    <td role="gridcell">
                        <b class="ui-table-cell-label">Payment Amount</b>
                        67,200 JPY
                    </td>
                    <td role="gridcell">
                        <b class="ui-table-cell-label">Payment Date</b>
                        Dec 16, 2022
                    </td>
                    <td role="gridcell">
                        <b class="ui-table-cell-label"></b>
                        <span id="base_page:txtab:3:receivedMessageText">RECEIVED, THANK YOU</span>
                    </td>
                </tr>
                <tr data-ri="4" class="ui-table-row">
                    <td role="gridcell" style="text-align: center">
                        <b class="ui-table-cell-label"></b>
                        <form id="base_page:txtab:4:f1" name="base_page:txtab:4:f1" method="post" action="/public/yourbooking.jsf" enctype="application/x-www-form-urlencoded">
                            <input type="hidden" name="base_page:txtab:4:f1" value="base_page:txtab:4:f1"/>
                            <a id="base_page:txtab:4:f1:toPDFNew" name="base_page:txtab:4:f1:toPDFNew" href="https://pdf.roomboss.com/?state=eyJtb2RlIjoiSU5WT0lDRV9UaGluUkIiLCJjb21wYW55SWQiOiJmODA4YWQ5NjI4MDFhMTZhMDEyODA0MDk3NTUwMDAwNyIsImlzTmV3SW52b2ljZUZvckl0ZW0iOmZhbHNlLCJpbnZvaWNlSWQiOiI4YTgwODE4YTg1MTZkNmU5MDE4NTE5NTViNDNmNGM5MyIsImxvY2FsZSI6ImVuIiwiYm9va2luZ0lkIjoiOGE4MDgxOGE4MzFlMjgzMzAxODMzMmE3MDNiMTUxMWMiLCJmaWxlVHlwZSI6IlBERiJ9&amp;download=INVOICE&amp;returnUrl=https%3A//nisade.evoke.jp/public/yourbooking.jsf%3Fid=1150344&amp;em=tiffany_y_chua%40hotmail.com">
                                <img src="/template/default/images/icons/page_white_acrobat.png" style="margin-right: 3px;" class="bottom noborder"/>Receipt
                            </a>
                            <input type="hidden" name="javax.faces.ViewState" id="j_id1:javax.faces.ViewState:6" value="-6557909179203061962:1031983341735614216" autocomplete="off"/>
                            <input type="hidden" name="javax.faces.RenderKitId" value="PRIMEFACES_MOBILE"/>
                        </form>
                    </td>
                    <td role="gridcell">
                        <b class="ui-table-cell-label">Invoice ID</b>
                        1150344-5
                    </td>
                    <td role="gridcell">
                        <b class="ui-table-cell-label">Invoice Amount</b>
                        80,000 JPY
                    </td>
                    <td role="gridcell">
                        <b class="ui-table-cell-label">Notes</b>
                    </td>
                    <td role="gridcell">
                        <b class="ui-table-cell-label">Invoice Date</b>
                        Dec 16, 2022
                    </td>
                    <td role="gridcell">
                        <b class="ui-table-cell-label">Due Date</b>
                        Dec 10, 2022
                    </td>
                    <td role="gridcell">
                        <b class="ui-table-cell-label">Payment Amount</b>
                        80,000 JPY
                    </td>
                    <td role="gridcell">
                        <b class="ui-table-cell-label">Payment Date</b>
                        Dec 16, 2022
                    </td>
                    <td role="gridcell">
                        <b class="ui-table-cell-label"></b>
                        <span id="base_page:txtab:4:receivedMessageText">RECEIVED, THANK YOU</span>
                    </td>
                </tr>
                <tr data-ri="5" class="ui-table-row">
                    <td role="gridcell" style="text-align: center">
                        <b class="ui-table-cell-label"></b>
                        <form id="base_page:txtab:5:f1" name="base_page:txtab:5:f1" method="post" action="/public/yourbooking.jsf" enctype="application/x-www-form-urlencoded">
                            <input type="hidden" name="base_page:txtab:5:f1" value="base_page:txtab:5:f1"/>
                            <a id="base_page:txtab:5:f1:toPDFNew" name="base_page:txtab:5:f1:toPDFNew" href="https://pdf.roomboss.com/?state=eyJtb2RlIjoiSU5WT0lDRV9UaGluUkIiLCJjb21wYW55SWQiOiJmODA4YWQ5NjI4MDFhMTZhMDEyODA0MDk3NTUwMDAwNyIsImlzTmV3SW52b2ljZUZvckl0ZW0iOmZhbHNlLCJpbnZvaWNlSWQiOiI4YTgwODE4YTg1MmI3MDZiMDE4NTMyYTdjOGE1MWQwMSIsImxvY2FsZSI6ImVuIiwiYm9va2luZ0lkIjoiOGE4MDgxOGE4MzFlMjgzMzAxODMzMmE3MDNiMTUxMWMiLCJmaWxlVHlwZSI6IlBERiJ9&amp;download=INVOICE&amp;returnUrl=https%3A//nisade.evoke.jp/public/yourbooking.jsf%3Fid=1150344&amp;em=tiffany_y_chua%40hotmail.com">
                                <img src="/template/default/images/icons/page_white_acrobat.png" style="margin-right: 3px;" class="bottom noborder"/>Receipt
                            </a>
                            <input type="hidden" name="javax.faces.ViewState" id="j_id1:javax.faces.ViewState:7" value="-6557909179203061962:1031983341735614216" autocomplete="off"/>
                            <input type="hidden" name="javax.faces.RenderKitId" value="PRIMEFACES_MOBILE"/>
                        </form>
                    </td>
                    <td role="gridcell">
                        <b class="ui-table-cell-label">Invoice ID</b>
                        1213090
                    </td>
                    <td role="gridcell">
                        <b class="ui-table-cell-label">Invoice Amount</b>
                        292,600 JPY
                    </td>
                    <td role="gridcell">
                        <b class="ui-table-cell-label">Notes</b>
                        All Mountain Lift Pass
                    </td>
                    <td role="gridcell">
                        <b class="ui-table-cell-label">Invoice Date</b>
                        Dec 21, 2022
                    </td>
                    <td role="gridcell">
                        <b class="ui-table-cell-label">Due Date</b>
                        Dec 22, 2022
                    </td>
                    <td role="gridcell">
                        <b class="ui-table-cell-label">Payment Amount</b>
                        292,600 JPY
                    </td>
                    <td role="gridcell">
                        <b class="ui-table-cell-label">Payment Date</b>
                        Dec 23, 2022
                    </td>
                    <td role="gridcell">
                        <b class="ui-table-cell-label"></b>
                        <span id="base_page:txtab:5:receivedMessageText">RECEIVED, THANK YOU</span>
                    </td>
                </tr>
                <tr data-ri="6" class="ui-table-row">
                    <td role="gridcell" style="text-align: center">
                        <b class="ui-table-cell-label"></b>
                        <form id="base_page:txtab:6:f1" name="base_page:txtab:6:f1" method="post" action="/public/yourbooking.jsf" enctype="application/x-www-form-urlencoded">
                            <input type="hidden" name="base_page:txtab:6:f1" value="base_page:txtab:6:f1"/>
                            <a id="base_page:txtab:6:f1:toPDFNew" name="base_page:txtab:6:f1:toPDFNew" href="https://pdf.roomboss.com/?state=eyJtb2RlIjoiSU5WT0lDRV9UaGluUkIiLCJjb21wYW55SWQiOiJmODA4YWQ5NjI4MDFhMTZhMDEyODA0MDk3NTUwMDAwNyIsImlzTmV3SW52b2ljZUZvckl0ZW0iOmZhbHNlLCJpbnZvaWNlSWQiOiI4YTgwODE4YTg1M2Y5NDQxMDE4NTQyYjdkZmZhNjY3OSIsImxvY2FsZSI6ImVuIiwiYm9va2luZ0lkIjoiOGE4MDgxOGE4MzFlMjgzMzAxODMzMmE3MDNiMTUxMWMiLCJmaWxlVHlwZSI6IlBERiJ9&amp;download=INVOICE&amp;returnUrl=https%3A//nisade.evoke.jp/public/yourbooking.jsf%3Fid=1150344&amp;em=tiffany_y_chua%40hotmail.com">
                                <img src="/template/default/images/icons/page_white_acrobat.png" style="margin-right: 3px;" class="bottom noborder"/>Receipt
                            </a>
                            <input type="hidden" name="javax.faces.ViewState" id="j_id1:javax.faces.ViewState:8" value="-6557909179203061962:1031983341735614216" autocomplete="off"/>
                            <input type="hidden" name="javax.faces.RenderKitId" value="PRIMEFACES_MOBILE"/>
                        </form>
                    </td>
                    <td role="gridcell">
                        <b class="ui-table-cell-label">Invoice ID</b>
                        1150344-7
                    </td>
                    <td role="gridcell">
                        <b class="ui-table-cell-label">Invoice Amount</b>
                        28,240 JPY
                    </td>
                    <td role="gridcell">
                        <b class="ui-table-cell-label">Notes</b>
                        Cancellation 
                    </td>
                    <td role="gridcell">
                        <b class="ui-table-cell-label">Invoice Date</b>
                        Dec 24, 2022
                    </td>
                    <td role="gridcell">
                        <b class="ui-table-cell-label">Due Date</b>
                        Dec 24, 2022
                    </td>
                    <td role="gridcell">
                        <b class="ui-table-cell-label">Payment Amount</b>
                        28,240 JPY
                    </td>
                    <td role="gridcell">
                        <b class="ui-table-cell-label">Payment Date</b>
                        Dec 24, 2022
                    </td>
                    <td role="gridcell">
                        <b class="ui-table-cell-label"></b>
                        <span id="base_page:txtab:6:receivedMessageText">RECEIVED, THANK YOU</span>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
<script id="base_page:txtab_s" type="text/javascript">
    PrimeFaces.cw("DataTable", "widget_base_page_txtab", {
        id: "base_page:txtab",
        reflow: true
    });
</script>
</div>
<div data-role="footer" class="rb-footer">
    <span class="rbn-footer-text">Powered by RoomBoss</span>
</div>
<div id="base_page:view_expired_dlg_mask" class="ui-popup-screen ui-overlay-b ui-screen-hidden"></div>
<div id="base_page:view_expired_dlg" class="ui-popup-container ui-popup-hidden ui-popup-truncate" style="text-align: center;">
    <div class="ui-popup ui-body-inherit ui-overlay-shadow ui-corner-all">
        <div class="ui-header ui-bar-inherit">
            <a href="#" class="ui-btn ui-corner-all ui-icon-delete ui-btn-icon-notext ui-btn-left"></a>
            <h1 class="ui-title" role="heading">Page Has Expired</h1>
        </div>
        <div class="ui-content" role="main">
            <p>
                Sorry, this page has expired. Reload the page?
				<a href="#" onclick="document.location.href = document.location.href; return false;">Yes
				</a>
            </p>
        </div>
    </div>
</div>
<script id="base_page:view_expired_dlg_s" type="text/javascript">
    $(function() {
        PrimeFaces.cw("Dialog", "widget_base_page_view_expired_dlg", {
            id: "base_page:view_expired_dlg"
        });
    });
</script>
<form id="base_page:weChatQrForm" name="base_page:weChatQrForm" method="post" action="/public/yourbooking.jsf" enctype="application/x-www-form-urlencoded">
    <input type="hidden" name="base_page:weChatQrForm" value="base_page:weChatQrForm"/>
    <div id="base_page:weChatQrForm:weChatQrDlg_mask" class="ui-popup-screen ui-overlay-b ui-screen-hidden"></div>
    <div id="base_page:weChatQrForm:weChatQrDlg" class="ui-popup-container ui-popup-hidden ui-popup-truncate rb-wechat-qr-dialog">
        <div class="ui-popup ui-body-inherit ui-overlay-shadow ui-corner-all">
            <div class="ui-header ui-bar-inherit">
                <a href="#" class="ui-btn ui-corner-all ui-icon-delete ui-btn-icon-notext ui-btn-left"></a>
                <h1 class="ui-title" role="heading">WeChat Pay QR Code</h1>
            </div>
            <div class="ui-content" role="main">
                <div id="base_page:weChatQrForm:weChatQrCodePg" style="text-align: center;">
                    <span id="base_page:weChatQrForm:weChatQrCode"></span>
                    <script id="base_page:weChatQrForm:weChatQrCode_s" type="text/javascript">
                        $(function() {
                            PrimeFaces.cw("ExtQRCode", "widget_base_page_weChatQrForm_weChatQrCode", {
                                id: "base_page:weChatQrForm:weChatQrCode",
                                mode: 0,
                                minVersion: 1,
                                maxVersion: 40,
                                left: 0,
                                top: 0,
                                size: 200,
                                ecLevel: "L",
                                text: "",
                                radius: 0.0,
                                quiet: 0,
                                mSize: 0.1,
                                mPosX: 0.5,
                                mPosY: 0.5
                            });
                        });
                    </script>
                </div>
            </div>
        </div>
    </div>
    <script id="base_page:weChatQrForm:weChatQrDlg_s" type="text/javascript">
        $(function() {
            PrimeFaces.cw("Dialog", "weChatQrDialog", {
                id: "base_page:weChatQrForm:weChatQrDlg",
                modal: true
            });
        });
    </script>
    <input type="hidden" name="javax.faces.ViewState" id="j_id1:javax.faces.ViewState:9" value="-6557909179203061962:1031983341735614216" autocomplete="off"/>
    <input type="hidden" name="javax.faces.RenderKitId" value="PRIMEFACES_MOBILE"/>
</form>
</div><script>
    jQuery(document).ready(function() {
        var currency = {
            value: "JPY"
        };
        updateCurrency(currency);
    });
</script>
</body></html>
