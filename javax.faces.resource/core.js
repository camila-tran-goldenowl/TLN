(function(a) {
    if (a.PrimeFaces) {
        a.PrimeFaces.debug("PrimeFaces already loaded, ignoring duplicate execution.");
        return
    }
    var b = {
        escapeClientId: function(c) {
            return "#" + c.replace(/:/g, "\\:")
        },
        cleanWatermarks: function() {
            $.watermark.hideAll()
        },
        showWatermarks: function() {
            $.watermark.showAll()
        },
        getWidgetById: function(e) {
            for (var d in b.widgets) {
                var c = b.widgets[d];
                if (c && c.id === e) {
                    return c
                }
            }
            return null
        },
        addSubmitParam: function(d, f) {
            var e = $(this.escapeClientId(d));
            for (var c in f) {
                e.append('<input type="hidden" name="' + c + '" value="' + f[c] + '" class="ui-submit-param"/>')
            }
            return this
        },
        submit: function(f, e) {
            var c = $(this.escapeClientId(f));
            var d;
            if (e) {
                d = c.attr("target");
                c.attr("target", e)
            }
            c.submit();
            c.children("input.ui-submit-param").remove();
            if (e) {
                if (d !== undefined) {
                    c.attr("target", d)
                } else {
                    c.removeAttr("target")
                }
            }
        },
        onPost: function() {
            this.nonAjaxPosted = true;
            this.abortXHRs()
        },
        abortXHRs: function() {
            b.ajax.Queue.abortAll()
        },
        attachBehaviors: function(d, c) {
            $.each(c, function(f, e) {
                d.bind(f, function(g) {
                    e.call(d, g)
                })
            })
        },
        getCookie: function(c) {
            return $.cookie(c)
        },
        setCookie: function(d, e, c) {
            $.cookie(d, e, c)
        },
        deleteCookie: function(d, c) {
            $.removeCookie(d, c)
        },
        cookiesEnabled: function() {
            var c = (navigator.cookieEnabled) ? true : false;
            if (typeof navigator.cookieEnabled === "undefined" && !c) {
                document.cookie = "testcookie";
                c = (document.cookie.indexOf("testcookie") !== -1) ? true : false
            }
            return (c)
        },
        skinInput: function(c) {
            c.hover(function() {
                $(this).addClass("ui-state-hover")
            }, function() {
                $(this).removeClass("ui-state-hover")
            }).focus(function() {
                $(this).addClass("ui-state-focus")
            }).blur(function() {
                $(this).removeClass("ui-state-focus")
            });
            c.attr("role", "textbox").attr("aria-disabled", c.is(":disabled")).attr("aria-readonly", c.prop("readonly"));
            if (c.is("textarea")) {
                c.attr("aria-multiline", true)
            }
            return this
        },
        skinButton: function(c) {
            c.mouseover(function() {
                var e = $(this);
                if (!c.prop("disabled")) {
                    e.addClass("ui-state-hover")
                }
            }).mouseout(function() {
                $(this).removeClass("ui-state-active ui-state-hover")
            }).mousedown(function() {
                var e = $(this);
                if (!c.prop("disabled")) {
                    e.addClass("ui-state-active").removeClass("ui-state-hover")
                }
            }).mouseup(function() {
                $(this).removeClass("ui-state-active").addClass("ui-state-hover")
            }).focus(function() {
                $(this).addClass("ui-state-focus")
            }).blur(function() {
                $(this).removeClass("ui-state-focus ui-state-active")
            }).keydown(function(f) {
                if (f.which === $.ui.keyCode.SPACE || f.which === $.ui.keyCode.ENTER || f.which === $.ui.keyCode.NUMPAD_ENTER) {
                    $(this).addClass("ui-state-active")
                }
            }).keyup(function() {
                $(this).removeClass("ui-state-active")
            });
            var d = c.attr("role");
            if (!d) {
                c.attr("role", "button")
            }
            c.attr("aria-disabled", c.prop("disabled"));
            return this
        },
        skinSelect: function(c) {
            c.mouseover(function() {
                var d = $(this);
                if (!d.hasClass("ui-state-focus")) {
                    d.addClass("ui-state-hover")
                }
            }).mouseout(function() {
                $(this).removeClass("ui-state-hover")
            }).focus(function() {
                $(this).addClass("ui-state-focus").removeClass("ui-state-hover")
            }).blur(function() {
                $(this).removeClass("ui-state-focus ui-state-hover")
            });
            return this
        },
        isIE: function(c) {
            return b.env.isIE(c)
        },
        info: function(c) {
            if (this.logger) {
                this.logger.info(c)
            }
        },
        debug: function(c) {
            if (this.logger) {
                this.logger.debug(c)
            }
        },
        warn: function(c) {
            if (this.logger) {
                this.logger.warn(c)
            }
            if (b.isDevelopmentProjectStage() && a.console) {
                console.log(c)
            }
        },
        error: function(c) {
            if (this.logger) {
                this.logger.error(c)
            }
            if (b.isDevelopmentProjectStage() && a.console) {
                console.error(c)
            }
        },
        isDevelopmentProjectStage: function() {
            return b.settings.projectStage === "Development"
        },
        setCaretToEnd: function(d) {
            if (d) {
                d.focus();
                var e = d.value.length;
                if (e > 0) {
                    if (d.setSelectionRange) {
                        d.setSelectionRange(0, e)
                    } else {
                        if (d.createTextRange) {
                            var c = d.createTextRange();
                            c.collapse(true);
                            c.moveEnd("character", 1);
                            c.moveStart("character", 1);
                            c.select()
                        }
                    }
                }
            }
        },
        changeTheme: function(g) {
            if (g && g !== "") {
                var h = $('link[href*="' + b.RESOURCE_IDENTIFIER + '/theme.css"]');
                if (h.length === 0) {
                    h = $('link[href*="' + b.RESOURCE_IDENTIFIER + '=theme.css"]')
                }
                var f = h.attr("href")
                  , e = f.split("&")[0]
                  , d = e.split("ln=")[1]
                  , c = f.replace(d, "primefaces-" + g);
                h.attr("href", c)
            }
        },
        escapeRegExp: function(c) {
            return this.escapeHTML(c.replace(/([.?*+^$[\]\\(){}|-])/g, "\\$1"))
        },
        escapeHTML: function(c) {
            return c.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;")
        },
        clearSelection: function() {
            if (a.getSelection) {
                if (a.getSelection().empty) {
                    a.getSelection().empty()
                } else {
                    if (a.getSelection().removeAllRanges && a.getSelection().rangeCount > 0 && a.getSelection().getRangeAt(0).getClientRects().length > 0) {
                        a.getSelection().removeAllRanges()
                    }
                }
            } else {
                if (document.selection && document.selection.empty) {
                    try {
                        document.selection.empty()
                    } catch (c) {}
                }
            }
        },
        getSelection: function() {
            var c = "";
            if (a.getSelection) {
                c = a.getSelection()
            } else {
                if (document.getSelection) {
                    c = document.getSelection()
                } else {
                    if (document.selection) {
                        c = document.selection.createRange().text
                    }
                }
            }
            return c
        },
        hasSelection: function() {
            return this.getSelection().length > 0
        },
        cw: function(d, e, c) {
            this.createWidget(d, e, c)
        },
        createWidget: function(d, f, c) {
            c.widgetVar = f;
            if (this.widget[d]) {
                var e = this.widgets[f];
                if (e && (e.constructor === this.widget[d])) {
                    e.refresh(c)
                } else {
                    this.widgets[f] = new this.widget[d](c);
                    if (this.settings.legacyWidgetNamespace) {
                        a[f] = this.widgets[f]
                    }
                }
            } else {
                b.error("Widget not available: " + d)
            }
        },
        getFacesResource: function(f, e, c) {
            if (f.indexOf("/") === 0) {
                f = f.substring(1, f.length)
            }
            var d = $('script[src*="/' + b.RESOURCE_IDENTIFIER + '/core.js"]').attr("src");
            if (!d) {
                d = $('script[src*="' + b.RESOURCE_IDENTIFIER + '=core.js"]').attr("src")
            }
            d = d.replace("core.js", f);
            d = d.replace("ln=primefaces", "ln=" + e);
            if (c) {
                var h = new RegExp("[?&]v=([^&]*)").exec(d)[1];
                d = d.replace("v=" + h, "v=" + c)
            }
            var g = a.location.protocol + "//" + a.location.host;
            return d.indexOf(g) >= 0 ? d : g + d
        },
        inArray: function(c, e) {
            for (var d = 0; d < c.length; d++) {
                if (c[d] === e) {
                    return true
                }
            }
            return false
        },
        isNumber: function(c) {
            return typeof c === "number" && isFinite(c)
        },
        getScript: function(c, d) {
            $.ajax({
                type: "GET",
                url: c,
                success: d,
                dataType: "script",
                cache: true,
                async: false
            })
        },
        focus: function(e, d) {
            var c = ":not(:submit):not(:button):input:visible:enabled[name]";
            setTimeout(function() {
                if (e) {
                    var i = $(b.escapeClientId(e));
                    if (i.is(c)) {
                        i.focus()
                    } else {
                        var g = i.find(c).eq(0);
                        b.focusElement(g)
                    }
                } else {
                    if (d) {
                        var g = $(b.escapeClientId(d)).find(c).eq(0);
                        b.focusElement(g)
                    } else {
                        var h = $(c)
                          , g = h.eq(0);
                        if (g.is(":radio")) {
                            var f = $(':radio[name="' + g.attr("name") + '"]').filter(":checked");
                            if (f.length) {
                                b.focusElement(f)
                            } else {
                                b.focusElement(g)
                            }
                        } else {
                            g.focus()
                        }
                    }
                }
            }, 50);
            b.customFocus = true
        },
        focusElement: function(c) {
            if (c.is(":radio") && c.hasClass("ui-helper-hidden-accessible")) {
                c.parent().focus()
            } else {
                c.focus()
            }
        },
        monitorDownload: function(f, c, d) {
            if (this.cookiesEnabled()) {
                if (f) {
                    f()
                }
                var e = d ? "primefaces.download_" + d : "primefaces.download";
                a.downloadMonitor = setInterval(function() {
                    var g = b.getCookie(e);
                    if (g === "true") {
                        if (c) {
                            c()
                        }
                        clearInterval(a.downloadMonitor);
                        b.setCookie(e, null)
                    }
                }, 1000)
            }
        },
        scrollTo: function(d) {
            var c = $(b.escapeClientId(d)).offset();
            $("html,body").animate({
                scrollTop: c.top,
                scrollLeft: c.left
            }, {
                easing: "easeInCirc"
            }, 1000)
        },
        scrollInView: function(d, g) {
            if (g.length === 0) {
                return
            }
            var j = parseFloat(d.css("borderTopWidth")) || 0
              , f = parseFloat(d.css("paddingTop")) || 0
              , h = g.offset().top - d.offset().top - j - f
              , c = d.scrollTop()
              , e = d.height()
              , i = g.outerHeight(true);
            if (h < 0) {
                d.scrollTop(c + h)
            } else {
                if ((h + i) > e) {
                    d.scrollTop(c + h - e + i)
                }
            }
        },
        calculateScrollbarWidth: function() {
            if (!this.scrollbarWidth) {
                if (b.env.browser.msie) {
                    var e = $('<textarea cols="10" rows="2"></textarea>').css({
                        position: "absolute",
                        top: -1000,
                        left: -1000
                    }).appendTo("body")
                      , d = $('<textarea cols="10" rows="2" style="overflow: hidden;"></textarea>').css({
                        position: "absolute",
                        top: -1000,
                        left: -1000
                    }).appendTo("body");
                    this.scrollbarWidth = e.width() - d.width();
                    e.add(d).remove()
                } else {
                    var c = $("<div />").css({
                        width: 100,
                        height: 100,
                        overflow: "auto",
                        position: "absolute",
                        top: -1000,
                        left: -1000
                    }).prependTo("body").append("<div />").find("div").css({
                        width: "100%",
                        height: 200
                    });
                    this.scrollbarWidth = 100 - c.width();
                    c.parent().remove()
                }
            }
            return this.scrollbarWidth
        },
        bcn: function(d, e, g) {
            if (g) {
                for (var c = 0; c < g.length; c++) {
                    var f = g[c].call(d, e);
                    if (f === false) {
                        if (e.preventDefault) {
                            e.preventDefault()
                        } else {
                            e.returnValue = false
                        }
                        break
                    }
                }
            }
        },
        bcnu: function(e, f, d) {
            if (d) {
                for (var c = 0; c < d.length; c++) {
                    var g = d[c].call(this, e, f);
                    if (g === false) {
                        break
                    }
                }
            }
        },
        openDialog: function(c) {
            b.dialog.DialogHandler.openDialog(c)
        },
        closeDialog: function(c) {
            b.dialog.DialogHandler.closeDialog(c)
        },
        showMessageInDialog: function(c) {
            b.dialog.DialogHandler.showMessageInDialog(c)
        },
        confirm: function(c) {
            b.dialog.DialogHandler.confirm(c)
        },
        deferredRenders: [],
        addDeferredRender: function(e, c, d) {
            this.deferredRenders.push({
                widget: e,
                container: c,
                callback: d
            })
        },
        removeDeferredRenders: function(e) {
            for (var d = (this.deferredRenders.length - 1); d >= 0; d--) {
                var c = this.deferredRenders[d];
                if (c.widget === e) {
                    this.deferredRenders.splice(d, 1)
                }
            }
        },
        invokeDeferredRenders: function(c) {
            var g = [];
            for (var f = 0; f < this.deferredRenders.length; f++) {
                var d = this.deferredRenders[f];
                if (d.container === c) {
                    var h = d.callback.call();
                    if (h) {
                        g.push(d.widget)
                    }
                }
            }
            for (var e = 0; e < g.length; e++) {
                this.removeDeferredRenders(g[e])
            }
        },
        getLocaleSettings: function() {
            if (!this.localeSettings) {
                var c = b.settings.locale;
                this.localeSettings = b.locales[c];
                if (!this.localeSettings) {
                    this.localeSettings = b.locales[c.split("_")[0]];
                    if (!this.localeSettings) {
                        this.localeSettings = b.locales.en_US
                    }
                }
            }
            return this.localeSettings
        },
        getAriaLabel: function(d) {
            var c = this.getLocaleSettings()["aria"];
            return (c && c[d]) ? c[d] : b.locales.en_US["aria"][d]
        },
        zindex: 1000,
        customFocus: false,
        detachedWidgets: [],
        PARTIAL_REQUEST_PARAM: "javax.faces.partial.ajax",
        PARTIAL_UPDATE_PARAM: "javax.faces.partial.render",
        PARTIAL_PROCESS_PARAM: "javax.faces.partial.execute",
        PARTIAL_SOURCE_PARAM: "javax.faces.source",
        BEHAVIOR_EVENT_PARAM: "javax.faces.behavior.event",
        PARTIAL_EVENT_PARAM: "javax.faces.partial.event",
        RESET_VALUES_PARAM: "primefaces.resetvalues",
        IGNORE_AUTO_UPDATE_PARAM: "primefaces.ignoreautoupdate",
        SKIP_CHILDREN_PARAM: "primefaces.skipchildren",
        VIEW_STATE: "javax.faces.ViewState",
        CLIENT_WINDOW: "javax.faces.ClientWindow",
        VIEW_ROOT: "javax.faces.ViewRoot",
        CLIENT_ID_DATA: "primefaces.clientid",
        RESOURCE_IDENTIFIER: "javax.faces.resource",
        VERSION: "${project.version}"
    };
    b.settings = {};
    b.util = {};
    b.widgets = {};
    b.locales = {
        en_US: {
            closeText: "Close",
            prevText: "Previous",
            nextText: "Next",
            monthNames: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
            monthNamesShort: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
            dayNames: ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"],
            dayNamesShort: ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
            dayNamesMin: ["S", "M", "T", "W ", "T", "F ", "S"],
            weekHeader: "Week",
            firstDay: 0,
            isRTL: false,
            showMonthAfterYear: false,
            yearSuffix: "",
            timeOnlyTitle: "Only Time",
            timeText: "Time",
            hourText: "Hour",
            minuteText: "Minute",
            secondText: "Second",
            currentText: "Current Date",
            ampm: false,
            month: "Month",
            week: "Week",
            day: "Day",
            allDayText: "All Day",
            aria: {
                "paginator.PAGE": "Page {0}",
                "calendar.BUTTON": "Show Calendar",
                "datatable.sort.ASC": "activate to sort column ascending",
                "datatable.sort.DESC": "activate to sort column descending",
                "columntoggler.CLOSE": "Close"
            }
        }
    };
    b.locales.en = b.locales.en_US;
    PF = function(d) {
        var c = b.widgets[d];
        if (!c) {
            b.error("Widget for var '" + d + "' not available!")
        }
        return c
    }
    ;
    a.PrimeFaces = b
}
)(window);
if (!PrimeFaces.env) {
    PrimeFaces.env = {
        mobile: false,
        touch: false,
        ios: false,
        browser: null,
        init: function() {
            this.mobile = /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(window.navigator.userAgent);
            this.touch = "ontouchstart"in window || window.navigator.msMaxTouchPoints || PrimeFaces.env.mobile;
            this.ios = /iPhone|iPad|iPod/i.test(window.navigator.userAgent);
            this.resolveUserAgent()
        },
        resolveUserAgent: function() {
            if ($.browser) {
                this.browser = $.browser
            } else {
                var a, d;
                jQuery.uaMatch = function(h) {
                    h = h.toLowerCase();
                    var g = /(opr)[\/]([\w.]+)/.exec(h) || /(chrome)[ \/]([\w.]+)/.exec(h) || /(version)[ \/]([\w.]+).*(safari)[ \/]([\w.]+)/.exec(h) || /(webkit)[ \/]([\w.]+)/.exec(h) || /(opera)(?:.*version|)[ \/]([\w.]+)/.exec(h) || /(msie) ([\w.]+)/.exec(h) || h.indexOf("trident") >= 0 && /(rv)(?::| )([\w.]+)/.exec(h) || h.indexOf("compatible") < 0 && /(mozilla)(?:.*? rv:([\w.]+)|)/.exec(h) || [];
                    var f = /(ipad)/.exec(h) || /(iphone)/.exec(h) || /(android)/.exec(h) || /(windows phone)/.exec(h) || /(win)/.exec(h) || /(mac)/.exec(h) || /(linux)/.exec(h) || /(cros)/i.exec(h) || [];
                    return {
                        browser: g[3] || g[1] || "",
                        version: g[2] || "0",
                        platform: f[0] || ""
                    }
                }
                ;
                a = jQuery.uaMatch(window.navigator.userAgent);
                d = {};
                if (a.browser) {
                    d[a.browser] = true;
                    d.version = a.version;
                    d.versionNumber = parseInt(a.version)
                }
                if (a.platform) {
                    d[a.platform] = true
                }
                if (d.android || d.ipad || d.iphone || d["windows phone"]) {
                    d.mobile = true
                }
                if (d.cros || d.mac || d.linux || d.win) {
                    d.desktop = true
                }
                if (d.chrome || d.opr || d.safari) {
                    d.webkit = true
                }
                if (d.rv) {
                    var e = "msie";
                    a.browser = e;
                    d[e] = true
                }
                if (d.opr) {
                    var c = "opera";
                    a.browser = c;
                    d[c] = true
                }
                if (d.safari && d.android) {
                    var b = "android";
                    a.browser = b;
                    d[b] = true
                }
                d.name = a.browser;
                d.platform = a.platform;
                this.browser = d;
                $.browser = d
            }
        },
        isIE: function(a) {
            return (a === undefined) ? this.browser.msie : (this.browser.msie && parseInt(this.browser.version, 10) === a)
        },
        isLtIE: function(a) {
            return (this.browser.msie) ? parseInt(this.browser.version, 10) < a : false
        },
        isCanvasSupported: function() {
            var a = document.createElement("canvas");
            return !!(a.getContext && a.getContext("2d"))
        }
    };
    PrimeFaces.env.init()
}
;if (!PrimeFaces.ajax) {
    PrimeFaces.AB_MAPPING = {
        s: "source",
        f: "formId",
        p: "process",
        u: "update",
        e: "event",
        a: "async",
        g: "global",
        d: "delay",
        t: "timeout",
        sc: "skipChildren",
        iau: "ignoreAutoUpdate",
        ps: "partialSubmit",
        psf: "partialSubmitFilter",
        rv: "resetValues",
        fi: "fragmentId",
        fu: "fragmentUpdate",
        pa: "params",
        onst: "onstart",
        oner: "onerror",
        onsu: "onsuccess",
        onco: "oncomplete"
    };
    PrimeFaces.ab = function(a, c) {
        for (var b in a) {
            if (!a.hasOwnProperty(b)) {
                continue
            }
            if (this.AB_MAPPING[b]) {
                a[this.AB_MAPPING[b]] = a[b];
                delete a[b]
            }
        }
        PrimeFaces.ajax.Request.handle(a, c)
    }
    ;
    PrimeFaces.ajax = {
        VIEW_HEAD: "javax.faces.ViewHead",
        VIEW_BODY: "javax.faces.ViewBody",
        RESOURCE: "javax.faces.Resource",
        Utils: {
            loadStylesheets: function(b) {
                for (var a = 0; a < b.length; a++) {
                    $("head").append('<link type="text/css" rel="stylesheet" href="' + b[a] + '" />')
                }
            },
            loadScripts: function(b) {
                var a = function() {
                    var c = b.shift();
                    if (c) {
                        PrimeFaces.getScript(c, a)
                    }
                };
                a()
            },
            getContent: function(c) {
                var b = "";
                for (var a = 0; a < c.childNodes.length; a++) {
                    b += c.childNodes[a].nodeValue
                }
                return b
            },
            updateFormStateInput: function(b, g, j) {
                var e = $.trim(g);
                var a = null;
                if (j && j.pfSettings && j.pfSettings.portletForms) {
                    a = $(j.pfSettings.portletForms)
                } else {
                    a = $("form")
                }
                var h = "";
                if (j && j.pfArgs && j.pfArgs.parameterPrefix) {
                    h = j.pfArgs.parameterPrefix
                }
                for (var d = 0; d < a.length; d++) {
                    var c = a.eq(d);
                    if (c.attr("method") === "post") {
                        var f = c.children("input[name='" + h + b + "']");
                        if (f.length > 0) {
                            f.val(e)
                        } else {
                            c.append('<input type="hidden" name="' + h + b + '" value="' + e + '" autocomplete="off" />')
                        }
                    }
                }
            },
            updateHead: function(d) {
                var b = $.ajaxSetup()["cache"];
                $.ajaxSetup()["cache"] = true;
                var a = new RegExp("<head[^>]*>","gi").exec(d)[0];
                var c = d.indexOf(a) + a.length;
                $("head").html(d.substring(c, d.lastIndexOf("</head>")));
                $.ajaxSetup()["cache"] = b
            },
            updateBody: function(b) {
                var c = new RegExp("<body[^>]*>","gi").exec(b)[0];
                var a = b.indexOf(c) + c.length;
                $("body").html(b.substring(a, b.lastIndexOf("</body>")))
            },
            updateElement: function(d, b, c) {
                if (d.indexOf(PrimeFaces.VIEW_STATE) !== -1) {
                    PrimeFaces.ajax.Utils.updateFormStateInput(PrimeFaces.VIEW_STATE, b, c)
                } else {
                    if (d.indexOf(PrimeFaces.CLIENT_WINDOW) !== -1) {
                        PrimeFaces.ajax.Utils.updateFormStateInput(PrimeFaces.CLIENT_WINDOW, b, c)
                    } else {
                        if (d === PrimeFaces.VIEW_ROOT) {
                            var a = PrimeFaces.ajax.Utils;
                            window.PrimeFaces = null;
                            a.updateHead(b);
                            a.updateBody(b)
                        } else {
                            if (d === PrimeFaces.ajax.VIEW_HEAD) {
                                PrimeFaces.ajax.Utils.updateHead(b)
                            } else {
                                if (d === PrimeFaces.ajax.VIEW_BODY) {
                                    PrimeFaces.ajax.Utils.updateBody(b)
                                } else {
                                    if (d === PrimeFaces.ajax.RESOURCE) {
                                        $("head").append(b)
                                    } else {
                                        if (d === $("head")[0].id) {
                                            PrimeFaces.ajax.Utils.updateHead(b)
                                        } else {
                                            $(PrimeFaces.escapeClientId(d)).replaceWith(b)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        },
        Queue: {
            delays: {},
            requests: new Array(),
            xhrs: new Array(),
            offer: function(a) {
                if (a.delay) {
                    var b = null
                      , d = this
                      , b = (typeof (a.source) === "string") ? a.source : $(a.source).attr("id")
                      , c = function() {
                        return setTimeout(function() {
                            d.requests.push(a);
                            if (d.requests.length === 1) {
                                PrimeFaces.ajax.Request.send(a)
                            }
                        }, a.delay)
                    };
                    if (this.delays[b]) {
                        clearTimeout(this.delays[b].timeout);
                        this.delays[b].timeout = c()
                    } else {
                        this.delays[b] = {
                            timeout: c()
                        }
                    }
                } else {
                    this.requests.push(a);
                    if (this.requests.length === 1) {
                        PrimeFaces.ajax.Request.send(a)
                    }
                }
            },
            poll: function() {
                if (this.isEmpty()) {
                    return null
                }
                var b = this.requests.shift()
                  , a = this.peek();
                if (a) {
                    PrimeFaces.ajax.Request.send(a)
                }
                return b
            },
            peek: function() {
                if (this.isEmpty()) {
                    return null
                }
                return this.requests[0]
            },
            isEmpty: function() {
                return this.requests.length === 0
            },
            addXHR: function(a) {
                this.xhrs.push(a)
            },
            removeXHR: function(b) {
                var a = $.inArray(b, this.xhrs);
                if (a > -1) {
                    this.xhrs.splice(a, 1)
                }
            },
            abortAll: function() {
                for (var a = 0; a < this.xhrs.length; a++) {
                    this.xhrs[a].abort()
                }
                this.xhrs = new Array();
                this.requests = new Array()
            }
        },
        Request: {
            handle: function(a, b) {
                a.ext = b;
                if (PrimeFaces.settings.earlyPostParamEvaluation) {
                    a.earlyPostParams = PrimeFaces.ajax.Request.collectEarlyPostParams(a)
                }
                if (a.async) {
                    PrimeFaces.ajax.Request.send(a)
                } else {
                    PrimeFaces.ajax.Queue.offer(a)
                }
            },
            collectEarlyPostParams: function(a) {
                var b;
                var c;
                if (typeof (a.source) === "string") {
                    c = $(PrimeFaces.escapeClientId(a.source))
                } else {
                    c = $(a.source)
                }
                if (c.is(":input") && c.is(":not(:button)")) {
                    b = [];
                    b.push({
                        name: c.attr("name"),
                        value: c.is(":checkbox") ? c.is(":checked") : c.val()
                    })
                } else {
                    b = c.find(":input").serializeArray();
                    b = b.concat(c.find("input[type=checkbox]:not(:checked)").map(function() {
                        var d = $(this);
                        return {
                            name: d.attr("name"),
                            value: d.is(":checked")
                        }
                    }).get())
                }
                return b
            },
            send: function(e) {
                PrimeFaces.debug("Initiating ajax request.");
                PrimeFaces.customFocus = false;
                var m = (e.global === true || e.global === undefined) ? true : false
                  , b = null
                  , f = null
                  , t = null;
                if (e.onstart) {
                    t = e.onstart.call(this, e)
                }
                if (e.ext && e.ext.onstart) {
                    t = e.ext.onstart.call(this, e)
                }
                if (t === false) {
                    PrimeFaces.debug("Ajax request cancelled by onstart callback.");
                    if (!e.async) {
                        PrimeFaces.ajax.Queue.poll()
                    }
                    return false
                }
                if (m) {
                    $(document).trigger("pfAjaxStart")
                }
                if (typeof (e.source) === "string") {
                    f = e.source
                } else {
                    f = $(e.source).attr("id")
                }
                if (e.formId) {
                    b = PrimeFaces.expressions.SearchExpressionFacade.resolveComponentsAsSelector(e.formId)
                } else {
                    var q = $(PrimeFaces.escapeClientId(f));
                    b = q.closest("form");
                    if (b.length === 0) {
                        b = $("form").eq(0)
                    }
                }
                PrimeFaces.debug("Form to post " + b.attr("id") + ".");
                var w = b.attr("action")
                  , s = b.children("input[name*='javax.faces.encodedURL']")
                  , g = [];
                var u = PrimeFaces.ajax.Request.extractParameterNamespace(b);
                var v = null;
                if (s.length > 0) {
                    v = 'form[id*="' + u + '"]';
                    w = s.val()
                }
                PrimeFaces.debug("URL to post " + w + ".");
                PrimeFaces.ajax.Request.addParam(g, PrimeFaces.PARTIAL_REQUEST_PARAM, true, u);
                PrimeFaces.ajax.Request.addParam(g, PrimeFaces.PARTIAL_SOURCE_PARAM, f, u);
                if (e.resetValues) {
                    PrimeFaces.ajax.Request.addParam(g, PrimeFaces.RESET_VALUES_PARAM, true, u)
                }
                if (e.ignoreAutoUpdate) {
                    PrimeFaces.ajax.Request.addParam(g, PrimeFaces.IGNORE_AUTO_UPDATE_PARAM, true, u)
                }
                if (e.skipChildren === false) {
                    PrimeFaces.ajax.Request.addParam(g, PrimeFaces.SKIP_CHILDREN_PARAM, false, u)
                }
                var r = PrimeFaces.ajax.Request.resolveComponentsForAjaxCall(e, "process");
                if (e.fragmentId) {
                    r.push(e.fragmentId)
                }
                var a = "@none";
                if (r.length > 0) {
                    a = r.join(" ")
                } else {
                    var j = PrimeFaces.ajax.Request.resolveComponentsForAjaxCall(e, "process");
                    j = $.trim(j);
                    if (j === "") {
                        a = "@all"
                    }
                }
                if (a !== "@none") {
                    PrimeFaces.ajax.Request.addParam(g, PrimeFaces.PARTIAL_PROCESS_PARAM, a, u)
                }
                var d = PrimeFaces.ajax.Request.resolveComponentsForAjaxCall(e, "update");
                if (e.fragmentId && e.fragmentUpdate) {
                    d.push(e.fragmentId)
                }
                if (d.length > 0) {
                    PrimeFaces.ajax.Request.addParam(g, PrimeFaces.PARTIAL_UPDATE_PARAM, d.join(" "), u)
                }
                if (e.event) {
                    PrimeFaces.ajax.Request.addParam(g, PrimeFaces.BEHAVIOR_EVENT_PARAM, e.event, u);
                    var l = e.event;
                    if (e.event === "valueChange") {
                        l = "change"
                    } else {
                        if (e.event === "action") {
                            l = "click"
                        }
                    }
                    PrimeFaces.ajax.Request.addParam(g, PrimeFaces.PARTIAL_EVENT_PARAM, l, u)
                } else {
                    PrimeFaces.ajax.Request.addParam(g, f, f, u)
                }
                if (e.params) {
                    PrimeFaces.ajax.Request.addParams(g, e.params, u)
                }
                if (e.ext && e.ext.params) {
                    PrimeFaces.ajax.Request.addParams(g, e.ext.params, u)
                }
                if (e.partialSubmit && a.indexOf("@all") === -1) {
                    var n = false
                      , h = e.partialSubmitFilter || ":input";
                    if (a.indexOf("@none") === -1) {
                        for (var o = 0; o < r.length; o++) {
                            var k = $(PrimeFaces.escapeClientId(r[o]));
                            var x = null;
                            if (k.is("form")) {
                                x = k.serializeArray();
                                n = true
                            } else {
                                if (k.is(":input")) {
                                    x = k.serializeArray()
                                } else {
                                    x = k.find(h).serializeArray()
                                }
                            }
                            $.merge(g, x)
                        }
                    }
                    if (!n) {
                        PrimeFaces.ajax.Request.addParamFromInput(g, PrimeFaces.VIEW_STATE, b, u);
                        PrimeFaces.ajax.Request.addParamFromInput(g, PrimeFaces.CLIENT_WINDOW, b, u);
                        PrimeFaces.ajax.Request.addParamFromInput(g, "dsPostWindowId", b, u);
                        PrimeFaces.ajax.Request.addParamFromInput(g, "dspwid", b, u)
                    }
                } else {
                    $.merge(g, b.serializeArray())
                }
                if (PrimeFaces.settings.earlyPostParamEvaluation && e.earlyPostParams) {
                    $.each(e.earlyPostParams, function(i, y) {
                        g = $.grep(g, function(A, z) {
                            if (A.name === y.name) {
                                return false
                            }
                            return true
                        })
                    });
                    $.merge(g, e.earlyPostParams)
                }
                var c = $.param(g);
                PrimeFaces.debug("Post Data:" + c);
                var p = {
                    url: w,
                    type: "POST",
                    cache: false,
                    dataType: "xml",
                    data: c,
                    portletForms: v,
                    source: e.source,
                    global: false,
                    beforeSend: function(y, i) {
                        y.setRequestHeader("Faces-Request", "partial/ajax");
                        y.pfSettings = i;
                        y.pfArgs = {};
                        PrimeFaces.nonAjaxPosted = false;
                        if (m) {
                            $(document).trigger("pfAjaxSend", [y, this])
                        }
                    },
                    error: function(z, i, y) {
                        if (e.onerror) {
                            e.onerror.call(this, z, i, y)
                        }
                        if (e.ext && e.ext.onerror) {
                            e.ext.onerror.call(this, z, i, y)
                        }
                        $(document).trigger("pfAjaxError", [z, this, y]);
                        PrimeFaces.error("Request return with error:" + i + ".")
                    },
                    success: function(A, i, B) {
                        PrimeFaces.debug("Response received succesfully.");
                        try {
                            var y;
                            if (e.onsuccess) {
                                y = e.onsuccess.call(this, A, i, B)
                            }
                            if (e.ext && e.ext.onsuccess && !y) {
                                y = e.ext.onsuccess.call(this, A, i, B)
                            }
                            if (m) {
                                $(document).trigger("pfAjaxSuccess", [B, this])
                            }
                            if (y) {
                                return
                            } else {
                                PrimeFaces.ajax.Response.handle(A, i, B)
                            }
                        } catch (z) {
                            PrimeFaces.error(z)
                        }
                        PrimeFaces.debug("DOM is updated.")
                    },
                    complete: function(y, i) {
                        if (e.oncomplete) {
                            e.oncomplete.call(this, y, i, y.pfArgs)
                        }
                        if (e.ext && e.ext.oncomplete) {
                            e.ext.oncomplete.call(this, y, i, y.pfArgs)
                        }
                        if (m) {
                            $(document).trigger("pfAjaxComplete", [y, this])
                        }
                        PrimeFaces.debug("Response completed.");
                        PrimeFaces.ajax.Queue.removeXHR(y);
                        if (!e.async && !PrimeFaces.nonAjaxPosted) {
                            PrimeFaces.ajax.Queue.poll()
                        }
                    }
                };
                if (e.timeout) {
                    p.timeout = e.timeout
                }
                PrimeFaces.ajax.Queue.addXHR($.ajax(p))
            },
            resolveExpressionsForAjaxCall: function(a, b) {
                var c = "";
                if (a[b]) {
                    c += a[b]
                }
                if (a.ext && a.ext[b]) {
                    c += " " + a.ext[b]
                }
                return c
            },
            resolveComponentsForAjaxCall: function(a, b) {
                var c = PrimeFaces.ajax.Request.resolveExpressionsForAjaxCall(a, b);
                return PrimeFaces.expressions.SearchExpressionFacade.resolveComponents(c)
            },
            addParam: function(c, a, b, d) {
                if (d || !a.indexOf(d) === 0) {
                    c.push({
                        name: d + a,
                        value: b
                    })
                } else {
                    c.push({
                        name: a,
                        value: b
                    })
                }
            },
            addParams: function(d, a, e) {
                for (var b = 0; b < a.length; b++) {
                    var c = a[b];
                    if (e && !c.name.indexOf(e) === 0) {
                        c.name = e + c.name
                    }
                    d.push(c)
                }
            },
            addParamFromInput: function(e, b, c, f) {
                var a = null;
                if (f) {
                    a = c.children("input[name*='" + b + "']")
                } else {
                    a = c.children("input[name='" + b + "']")
                }
                if (a && a.length > 0) {
                    var d = a.val();
                    PrimeFaces.ajax.Request.addParam(e, b, d, f)
                }
            },
            extractParameterNamespace: function(c) {
                var a = c.children("input[name*='" + PrimeFaces.VIEW_STATE + "']");
                if (a && a.length > 0) {
                    var b = a[0].name;
                    if (b.length > PrimeFaces.VIEW_STATE.length) {
                        return b.substring(0, b.indexOf(PrimeFaces.VIEW_STATE))
                    }
                }
                return null
            }
        },
        Response: {
            handle: function(h, e, m, b) {
                var n = h.getElementsByTagName("partial-response")[0];
                for (var g = 0; g < n.childNodes.length; g++) {
                    var a = n.childNodes[g];
                    switch (a.nodeName) {
                    case "redirect":
                        PrimeFaces.ajax.ResponseProcessor.doRedirect(a);
                        break;
                    case "changes":
                        var c = $(document.activeElement);
                        var k = c.attr("id");
                        var f;
                        if (c.length > 0 && c.is("input") && $.isFunction($.fn.getSelection)) {
                            f = c.getSelection()
                        }
                        for (var d = 0; d < a.childNodes.length; d++) {
                            var l = a.childNodes[d];
                            switch (l.nodeName) {
                            case "update":
                                PrimeFaces.ajax.ResponseProcessor.doUpdate(l, m, b);
                                break;
                            case "delete":
                                PrimeFaces.ajax.ResponseProcessor.doDelete(l);
                                break;
                            case "insert":
                                PrimeFaces.ajax.ResponseProcessor.doInsert(l);
                                break;
                            case "attributes":
                                PrimeFaces.ajax.ResponseProcessor.doAttributes(l);
                                break;
                            case "eval":
                                PrimeFaces.ajax.ResponseProcessor.doEval(l);
                                break;
                            case "extension":
                                PrimeFaces.ajax.ResponseProcessor.doExtension(l, m);
                                break
                            }
                        }
                        PrimeFaces.ajax.Response.handleReFocus(k, f);
                        PrimeFaces.ajax.Response.destroyDetachedWidgets();
                        break;
                    case "eval":
                        PrimeFaces.ajax.ResponseProcessor.doEval(a);
                        break;
                    case "extension":
                        PrimeFaces.ajax.ResponseProcessor.doExtension(a, m);
                        break;
                    case "error":
                        PrimeFaces.ajax.ResponseProcessor.doError(a, m);
                        break
                    }
                }
            },
            handleReFocus: function(d, b) {
                if (PrimeFaces.customFocus === false && d && d !== $(document.activeElement).attr("id")) {
                    var c = $(PrimeFaces.escapeClientId(d));
                    var a = function() {
                        c.focus();
                        if (b && b.start) {
                            c.setSelection(b.start, b.end)
                        }
                    };
                    if (c.length) {
                        a();
                        setTimeout(function() {
                            if (!c.is(":focus")) {
                                a()
                            }
                        }, 50)
                    }
                }
                PrimeFaces.customFocus = false
            },
            destroyDetachedWidgets: function() {
                for (var a = 0; a < PrimeFaces.detachedWidgets.length; a++) {
                    var d = PrimeFaces.detachedWidgets[a];
                    var b = PF(d);
                    if (b) {
                        if (b.isDetached()) {
                            PrimeFaces.widgets[d] = null;
                            b.destroy();
                            try {
                                delete b
                            } catch (c) {}
                        }
                    }
                }
                PrimeFaces.detachedWidgets = []
            }
        },
        ResponseProcessor: {
            doRedirect: function(b) {
                try {
                    window.location.assign(b.getAttribute("url"))
                } catch (a) {
                    PrimeFaces.warn("Error redirecting to URL: " + b.getAttribute("url"))
                }
            },
            doUpdate: function(c, d, a) {
                var e = c.getAttribute("id")
                  , b = PrimeFaces.ajax.Utils.getContent(c);
                if (a && a.widget && a.widget.id === e) {
                    a.handle.call(a.widget, b)
                } else {
                    PrimeFaces.ajax.Utils.updateElement(e, b, d)
                }
            },
            doEval: function(b) {
                var a = b.textContent || b.innerText || b.text;
                $.globalEval(a)
            },
            doExtension: function(d, e) {
                if (e) {
                    if (d.getAttribute("ln") === "primefaces" && d.getAttribute("type") === "args") {
                        var c = d.textContent || d.innerText || d.text;
                        if (e.pfArgs) {
                            var b = $.parseJSON(c);
                            for (var a in b) {
                                e.pfArgs[a] = b[a]
                            }
                        } else {
                            e.pfArgs = $.parseJSON(c)
                        }
                    }
                }
            },
            doError: function(a, b) {},
            doDelete: function(a) {
                var b = a.getAttribute("id");
                $(PrimeFaces.escapeClientId(b)).remove()
            },
            doInsert: function(d) {
                if (!d.childNodes) {
                    return false
                }
                for (var b = 0; b < d.childNodes.length; b++) {
                    var a = d.childNodes[b];
                    var f = a.getAttribute("id");
                    var e = $(PrimeFaces.escapeClientId(f));
                    var c = PrimeFaces.ajax.Utils.getContent(a);
                    if (a.nodeName === "after") {
                        $(c).insertAfter(e)
                    } else {
                        if (a.nodeName === "before") {
                            $(c).insertBefore(e)
                        }
                    }
                }
            },
            doAttributes: function(c) {
                if (!c.childNodes) {
                    return false
                }
                var g = c.getAttribute("id");
                var f = $(PrimeFaces.escapeClientId(g));
                for (var b = 0; b < c.childNodes.length; b++) {
                    var d = c.childNodes[b];
                    var a = d.getAttribute("name");
                    var e = d.getAttribute("value");
                    if (!a) {
                        return
                    }
                    if (!e || e === null) {
                        e = ""
                    }
                    f.attr(a, e)
                }
            }
        },
        AjaxRequest: function(a, b) {
            return PrimeFaces.ajax.Request.handle(a, b)
        }
    };
    $(window).unload(function() {
        PrimeFaces.ajax.Queue.abortAll()
    })
}
;if (!PrimeFaces.expressions) {
    PrimeFaces.expressions = {};
    PrimeFaces.expressions.SearchExpressionFacade = {
        resolveComponentsAsSelector: function(c) {
            var a = PrimeFaces.expressions.SearchExpressionFacade.splitExpressions(c);
            var e = $();
            if (a) {
                for (var b = 0; b < a.length; ++b) {
                    var g = $.trim(a[b]);
                    if (g.length > 0) {
                        if (g == "@none" || g == "@all") {
                            continue
                        }
                        if (g.indexOf("@") == -1) {
                            e = e.add($(document.getElementById(g)))
                        } else {
                            if (g.indexOf("@widgetVar(") == 0) {
                                var f = g.substring(11, g.length - 1);
                                var d = PrimeFaces.widgets[f];
                                if (d) {
                                    e = e.add($(document.getElementById(d.id)))
                                } else {
                                    PrimeFaces.error('Widget for widgetVar "' + f + '" not avaiable')
                                }
                            } else {
                                if (g.indexOf("@(") == 0) {
                                    e = e.add($(g.substring(2, g.length - 1)))
                                }
                            }
                        }
                    }
                }
            }
            return e
        },
        resolveComponents: function(l) {
            var k = PrimeFaces.expressions.SearchExpressionFacade.splitExpressions(l)
              , c = [];
            if (k) {
                for (var g = 0; g < k.length; ++g) {
                    var m = $.trim(k[g]);
                    if (m.length > 0) {
                        if (m.indexOf("@") == -1 || m == "@none" || m == "@all") {
                            if (!PrimeFaces.inArray(c, m)) {
                                c.push(m)
                            }
                        } else {
                            if (m.indexOf("@widgetVar(") == 0) {
                                var d = m.substring(11, m.length - 1)
                                  , h = PrimeFaces.widgets[d];
                                if (h) {
                                    if (!PrimeFaces.inArray(c, h.id)) {
                                        c.push(h.id)
                                    }
                                } else {
                                    PrimeFaces.error('Widget for widgetVar "' + d + '" not avaiable')
                                }
                            } else {
                                if (m.indexOf("@(") == 0) {
                                    var b = $(m.substring(2, m.length - 1));
                                    for (var e = 0; e < b.length; e++) {
                                        var f = $(b[e])
                                          , a = f.data(PrimeFaces.CLIENT_ID_DATA) || f.attr("id");
                                        if (!PrimeFaces.inArray(c, a)) {
                                            c.push(a)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            return c
        },
        splitExpressions: function(f) {
            if (PrimeFaces.isIE(7)) {
                f = f.split("")
            }
            var e = [];
            var b = "";
            var a = 0;
            for (var d = 0; d < f.length; d++) {
                var g = f[d];
                if (g === "(") {
                    a++
                }
                if (g === ")") {
                    a--
                }
                if ((g === " " || g === ",") && a === 0) {
                    e.push(b);
                    b = ""
                } else {
                    b += g
                }
            }
            e.push(b);
            return e
        }
    }
}
;(function() {
    var a = false
      , b = /xyz/.test(function() {
        xyz
    }) ? /\b_super\b/ : /.*/;
    this.Class = function() {}
    ;
    Class.extend = function(g) {
        var f = this.prototype;
        a = true;
        var e = new this();
        a = false;
        for (var d in g) {
            e[d] = typeof g[d] == "function" && typeof f[d] == "function" && b.test(g[d]) ? (function(h, i) {
                return function() {
                    var k = this._super;
                    this._super = f[h];
                    var j = i.apply(this, arguments);
                    this._super = k;
                    return j
                }
            }
            )(d, g[d]) : g[d]
        }
        function c() {
            if (!a && this.init) {
                this.init.apply(this, arguments)
            }
        }
        c.prototype = e;
        c.prototype.constructor = c;
        c.extend = arguments.callee;
        return c
    }
}
)();
if (!PrimeFaces.widget) {
    PrimeFaces.widget = {};
    PrimeFaces.widget.BaseWidget = Class.extend({
        init: function(a) {
            this.cfg = a;
            this.id = a.id;
            this.jqId = PrimeFaces.escapeClientId(this.id);
            this.jq = $(this.jqId);
            this.widgetVar = a.widgetVar;
            $(this.jqId + "_s").remove();
            if (this.widgetVar) {
                var b = this;
                this.jq.on("remove", function() {
                    if (b.isDetached()) {
                        PrimeFaces.detachedWidgets.push(b.widgetVar)
                    }
                })
            }
        },
        refresh: function(a) {
            return this.init(a)
        },
        destroy: function() {
            PrimeFaces.debug("Destroyed detached widget: " + this.widgetVar)
        },
        isDetached: function() {
            return document.getElementById(this.id) === null
        },
        getJQ: function() {
            return this.jq
        },
        removeScriptElement: function(a) {
            $(PrimeFaces.escapeClientId(a) + "_s").remove()
        }
    });
    PrimeFaces.widget.DeferredWidget = PrimeFaces.widget.BaseWidget.extend({
        renderDeferred: function() {
            if (this.jq.is(":visible")) {
                this._render();
                this.postRender()
            } else {
                var a = this.jq.closest(".ui-hidden-container")
                  , b = this;
                if (a.length) {
                    this.addDeferredRender(this.id, a, function() {
                        return b.render()
                    })
                }
            }
        },
        render: function() {
            if (this.jq.is(":visible")) {
                this._render();
                this.postRender();
                return true
            } else {
                return false
            }
        },
        _render: function() {
            throw "Unsupported Operation"
        },
        postRender: function() {},
        destroy: function() {
            this._super();
            PrimeFaces.removeDeferredRenders(this.id)
        },
        addDeferredRender: function(b, a, d) {
            PrimeFaces.addDeferredRender(b, a.attr("id"), d);
            if (a.is(":hidden")) {
                var c = this.jq.closest(".ui-hidden-container");
                if (c.length) {
                    this.addDeferredRender(b, a.parent().closest(".ui-hidden-container"), d)
                }
            }
        }
    })
}
;PrimeFaces.widget.AjaxStatus = PrimeFaces.widget.BaseWidget.extend({
    init: function(a) {
        this._super(a);
        this.bind()
    },
    bind: function() {
        var b = $(document)
          , a = this;
        b.on("pfAjaxStart", function() {
            a.trigger("start", arguments)
        }).on("pfAjaxError", function() {
            a.trigger("error", arguments)
        }).on("pfAjaxSuccess", function() {
            a.trigger("success", arguments)
        }).on("pfAjaxComplete", function() {
            a.trigger("complete", arguments)
        });
        this.bindToStandard()
    },
    trigger: function(b, a) {
        var c = this.cfg[b];
        if (c) {
            c.apply(document, a)
        }
        this.jq.children().hide().filter(this.jqId + "_" + b).show()
    },
    bindToStandard: function() {
        if (window.jsf && window.jsf.ajax) {
            var a = $(document);
            jsf.ajax.addOnEvent(function(b) {
                if (b.status === "begin") {
                    a.trigger("pfAjaxStart", arguments)
                } else {
                    if (b.status === "complete") {
                        a.trigger("pfAjaxSuccess", arguments)
                    } else {
                        if (b.status === "success") {
                            a.trigger("pfAjaxComplete", arguments)
                        }
                    }
                }
            });
            jsf.ajax.addOnError(function(b) {
                a.trigger("pfAjaxError", arguments)
            })
        }
    }
});
PrimeFaces.widget.Poll = PrimeFaces.widget.BaseWidget.extend({
    init: function(a) {
        this.cfg = a;
        this.id = this.cfg.id;
        this.active = false;
        if (this.cfg.autoStart) {
            this.start()
        }
    },
    refresh: function(a) {
        if (this.isActive()) {
            this.stop()
        }
        this.init(a)
    },
    start: function() {
        this.timer = setInterval(this.cfg.fn, (this.cfg.frequency * 1000));
        this.active = true
    },
    stop: function() {
        clearInterval(this.timer);
        this.active = false
    },
    isActive: function() {
        return this.active
    }
});
