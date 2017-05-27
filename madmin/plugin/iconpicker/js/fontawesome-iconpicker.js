(function (a, b) {
    a.ui = a.ui || {};
    var c, d = Math.max, e = Math.abs, f = Math.round, g = /left|center|right/, h = /top|center|bottom/, i = /[\+\-]\d+(\.[\d]+)?%?/, j = /^\w+/, k = /%$/, l = a.fn.pos;

    function m(a, b, c) {
        return [parseFloat(a[0]) * (k.test(a[0]) ? b / 100 : 1), parseFloat(a[1]) * (k.test(a[1]) ? c / 100 : 1)];
    }

    function n(b, c) {
        return parseInt(a.css(b, c), 10) || 0;
    }

    function o(b) {
        var c = b[0];
        if (c.nodeType === 9) {
            return {
                width: b.width(),
                height: b.height(),
                offset: {
                    top: 0,
                    left: 0
                }
            };
        }
        if (a.isWindow(c)) {
            return {
                width: b.width(),
                height: b.height(),
                offset: {
                    top: b.scrollTop(),
                    left: b.scrollLeft()
                }
            };
        }
        if (c.preventDefault) {
            return {
                width: 0,
                height: 0,
                offset: {
                    top: c.pageY,
                    left: c.pageX
                }
            };
        }
        return {
            width: b.outerWidth(),
            height: b.outerHeight(),
            offset: b.offset()
        };
    }

    a.pos = {
        scrollbarWidth: function () {
            if (c !== b) {
                return c;
            }
            var d, e, f = a("<div style='display:block;position:absolute;width:50px;height:50px;overflow:hidden;'><div style='height:100px;width:auto;'></div></div>"), g = f.children()[0];
            a("body").append(f);
            d = g.offsetWidth;
            f.css("overflow", "scroll");
            e = g.offsetWidth;
            if (d === e) {
                e = f[0].clientWidth;
            }
            f.remove();
            return c = d - e;
        },
        getScrollInfo: function (b) {
            var c = b.isWindow || b.isDocument ? "" : b.element.css("overflow-x"), d = b.isWindow || b.isDocument ? "" : b.element.css("overflow-y"), e = c === "scroll" || c === "auto" && b.width < b.element[0].scrollWidth, f = d === "scroll" || d === "auto" && b.height < b.element[0].scrollHeight;
            return {
                width: f ? a.pos.scrollbarWidth() : 0,
                height: e ? a.pos.scrollbarWidth() : 0
            };
        },
        getWithinInfo: function (b) {
            var c = a(b || window), d = a.isWindow(c[0]), e = !!c[0] && c[0].nodeType === 9;
            return {
                element: c,
                isWindow: d,
                isDocument: e,
                offset: c.offset() || {
                    left: 0,
                    top: 0
                },
                scrollLeft: c.scrollLeft(),
                scrollTop: c.scrollTop(),
                width: d ? c.width() : c.outerWidth(),
                height: d ? c.height() : c.outerHeight()
            };
        }
    };
    a.fn.pos = function (b) {
        if (!b || !b.of) {
            return l.apply(this, arguments);
        }
        b = a.extend({}, b);
        var c, k, p, q, r, s, t = a(b.of), u = a.pos.getWithinInfo(b.within), v = a.pos.getScrollInfo(u), w = (b.collision || "flip").split(" "), x = {};
        s = o(t);
        if (t[0].preventDefault) {
            b.at = "left top";
        }
        k = s.width;
        p = s.height;
        q = s.offset;
        r = a.extend({}, q);
        a.each(["my", "at"], function () {
            var a = (b[this] || "").split(" "), c, d;
            if (a.length === 1) {
                a = g.test(a[0]) ? a.concat(["center"]) : h.test(a[0]) ? ["center"].concat(a) : ["center", "center"];
            }
            a[0] = g.test(a[0]) ? a[0] : "center";
            a[1] = h.test(a[1]) ? a[1] : "center";
            c = i.exec(a[0]);
            d = i.exec(a[1]);
            x[this] = [c ? c[0] : 0, d ? d[0] : 0];
            b[this] = [j.exec(a[0])[0], j.exec(a[1])[0]];
        });
        if (w.length === 1) {
            w[1] = w[0];
        }
        if (b.at[0] === "right") {
            r.left += k;
        } else if (b.at[0] === "center") {
            r.left += k / 2;
        }
        if (b.at[1] === "bottom") {
            r.top += p;
        } else if (b.at[1] === "center") {
            r.top += p / 2;
        }
        c = m(x.at, k, p);
        r.left += c[0];
        r.top += c[1];
        return this.each(function () {
            var g, h, i = a(this), j = i.outerWidth(), l = i.outerHeight(), o = n(this, "marginLeft"), s = n(this, "marginTop"), y = j + o + n(this, "marginRight") + v.width, z = l + s + n(this, "marginBottom") + v.height, A = a.extend({}, r), B = m(x.my, i.outerWidth(), i.outerHeight());
            if (b.my[0] === "right") {
                A.left -= j;
            } else if (b.my[0] === "center") {
                A.left -= j / 2;
            }
            if (b.my[1] === "bottom") {
                A.top -= l;
            } else if (b.my[1] === "center") {
                A.top -= l / 2;
            }
            A.left += B[0];
            A.top += B[1];
            if (!a.support.offsetFractions) {
                A.left = f(A.left);
                A.top = f(A.top);
            }
            g = {
                marginLeft: o,
                marginTop: s
            };
            a.each(["left", "top"], function (d, e) {
                if (a.ui.pos[w[d]]) {
                    a.ui.pos[w[d]][e](A, {
                        targetWidth: k,
                        targetHeight: p,
                        elemWidth: j,
                        elemHeight: l,
                        collisionPosition: g,
                        collisionWidth: y,
                        collisionHeight: z,
                        offset: [c[0] + B[0], c[1] + B[1]],
                        my: b.my,
                        at: b.at,
                        within: u,
                        elem: i
                    });
                }
            });
            if (b.using) {
                h = function (a) {
                    var c = q.left - A.left, f = c + k - j, g = q.top - A.top, h = g + p - l, m = {
                        target: {
                            element: t,
                            left: q.left,
                            top: q.top,
                            width: k,
                            height: p
                        },
                        element: {
                            element: i,
                            left: A.left,
                            top: A.top,
                            width: j,
                            height: l
                        },
                        horizontal: f < 0 ? "left" : c > 0 ? "right" : "center",
                        vertical: h < 0 ? "top" : g > 0 ? "bottom" : "middle"
                    };
                    if (k < j && e(c + f) < k) {
                        m.horizontal = "center";
                    }
                    if (p < l && e(g + h) < p) {
                        m.vertical = "middle";
                    }
                    if (d(e(c), e(f)) > d(e(g), e(h))) {
                        m.important = "horizontal";
                    } else {
                        m.important = "vertical";
                    }
                    b.using.call(this, a, m);
                };
            }
            i.offset(a.extend(A, {
                using: h
            }));
        });
    };
    a.ui.pos = {
        _trigger: function (a, b, c, d) {
            if (b.elem) {
                b.elem.trigger({
                    type: c,
                    position: a,
                    positionData: b,
                    triggered: d
                });
            }
        },
        fit: {
            left: function (b, c) {
                a.ui.pos._trigger(b, c, "posCollide", "fitLeft");
                var e = c.within, f = e.isWindow ? e.scrollLeft : e.offset.left, g = e.width, h = b.left - c.collisionPosition.marginLeft, i = f - h, j = h + c.collisionWidth - g - f, k;
                if (c.collisionWidth > g) {
                    if (i > 0 && j <= 0) {
                        k = b.left + i + c.collisionWidth - g - f;
                        b.left += i - k;
                    } else if (j > 0 && i <= 0) {
                        b.left = f;
                    } else {
                        if (i > j) {
                            b.left = f + g - c.collisionWidth;
                        } else {
                            b.left = f;
                        }
                    }
                } else if (i > 0) {
                    b.left += i;
                } else if (j > 0) {
                    b.left -= j;
                } else {
                    b.left = d(b.left - h, b.left);
                }
                a.ui.pos._trigger(b, c, "posCollided", "fitLeft");
            },
            top: function (b, c) {
                a.ui.pos._trigger(b, c, "posCollide", "fitTop");
                var e = c.within, f = e.isWindow ? e.scrollTop : e.offset.top, g = c.within.height, h = b.top - c.collisionPosition.marginTop, i = f - h, j = h + c.collisionHeight - g - f, k;
                if (c.collisionHeight > g) {
                    if (i > 0 && j <= 0) {
                        k = b.top + i + c.collisionHeight - g - f;
                        b.top += i - k;
                    } else if (j > 0 && i <= 0) {
                        b.top = f;
                    } else {
                        if (i > j) {
                            b.top = f + g - c.collisionHeight;
                        } else {
                            b.top = f;
                        }
                    }
                } else if (i > 0) {
                    b.top += i;
                } else if (j > 0) {
                    b.top -= j;
                } else {
                    b.top = d(b.top - h, b.top);
                }
                a.ui.pos._trigger(b, c, "posCollided", "fitTop");
            }
        },
        flip: {
            left: function (b, c) {
                a.ui.pos._trigger(b, c, "posCollide", "flipLeft");
                var d = c.within, f = d.offset.left + d.scrollLeft, g = d.width, h = d.isWindow ? d.scrollLeft : d.offset.left, i = b.left - c.collisionPosition.marginLeft, j = i - h, k = i + c.collisionWidth - g - h, l = c.my[0] === "left" ? -c.elemWidth : c.my[0] === "right" ? c.elemWidth : 0, m = c.at[0] === "left" ? c.targetWidth : c.at[0] === "right" ? -c.targetWidth : 0, n = -2 * c.offset[0], o, p;
                if (j < 0) {
                    o = b.left + l + m + n + c.collisionWidth - g - f;
                    if (o < 0 || o < e(j)) {
                        b.left += l + m + n;
                    }
                } else if (k > 0) {
                    p = b.left - c.collisionPosition.marginLeft + l + m + n - h;
                    if (p > 0 || e(p) < k) {
                        b.left += l + m + n;
                    }
                }
                a.ui.pos._trigger(b, c, "posCollided", "flipLeft");
            },
            top: function (b, c) {
                a.ui.pos._trigger(b, c, "posCollide", "flipTop");
                var d = c.within, f = d.offset.top + d.scrollTop, g = d.height, h = d.isWindow ? d.scrollTop : d.offset.top, i = b.top - c.collisionPosition.marginTop, j = i - h, k = i + c.collisionHeight - g - h, l = c.my[1] === "top", m = l ? -c.elemHeight : c.my[1] === "bottom" ? c.elemHeight : 0, n = c.at[1] === "top" ? c.targetHeight : c.at[1] === "bottom" ? -c.targetHeight : 0, o = -2 * c.offset[1], p, q;
                if (j < 0) {
                    q = b.top + m + n + o + c.collisionHeight - g - f;
                    if (b.top + m + n + o > j && (q < 0 || q < e(j))) {
                        b.top += m + n + o;
                    }
                } else if (k > 0) {
                    p = b.top - c.collisionPosition.marginTop + m + n + o - h;
                    if (b.top + m + n + o > k && (p > 0 || e(p) < k)) {
                        b.top += m + n + o;
                    }
                }
                a.ui.pos._trigger(b, c, "posCollided", "flipTop");
            }
        },
        flipfit: {
            left: function () {
                a.ui.pos.flip.left.apply(this, arguments);
                a.ui.pos.fit.left.apply(this, arguments);
            },
            top: function () {
                a.ui.pos.flip.top.apply(this, arguments);
                a.ui.pos.fit.top.apply(this, arguments);
            }
        }
    };
    (function () {
        var b, c, d, e, f, g = document.getElementsByTagName("body")[0], h = document.createElement("div");
        b = document.createElement(g ? "div" : "body");
        d = {
            visibility: "hidden",
            width: 0,
            height: 0,
            border: 0,
            margin: 0,
            background: "none"
        };
        if (g) {
            a.extend(d, {
                position: "absolute",
                left: "-1000px",
                top: "-1000px"
            });
        }
        for (f in d) {
            b.style[f] = d[f];
        }
        b.appendChild(h);
        c = g || document.documentElement;
        c.insertBefore(b, c.firstChild);
        h.style.cssText = "position: absolute; left: 10.7432222px;";
        e = a(h).offset().left;
        a.support.offsetFractions = e > 10 && e < 11;
        b.innerHTML = "";
        c.removeChild(b);
    })();
})(jQuery);

(function (a) {
    "use strict";
    if (typeof define === "function" && define.amd) {
        define(["jquery"], a);
    } else if (window.jQuery && !window.jQuery.fn.iconpicker) {
        a(window.jQuery);
    }
})(function (a) {
    "use strict";
    var b = {
        isEmpty: function (a) {
            return a === false || a === "" || a === null || a === undefined;
        },
        isEmptyObject: function (a) {
            return this.isEmpty(a) === true || a.length === 0;
        },
        isElement: function (b) {
            return a(b).length > 0;
        },
        isString: function (a) {
            return typeof a === "string" || a instanceof String;
        },
        isArray: function (b) {
            return a.isArray(b);
        },
        inArray: function (b, c) {
            return a.inArray(b, c) !== -1;
        },
        throwError: function (a) {
            throw "Font Awesome Icon Picker Exception: " + a;
        }
    };
    var c = function (d, e) {
        this._id = c._idCounter++;
        this.element = a(d).addClass("iconpicker-element");
        this._trigger("iconpickerCreate");
        this.options = a.extend({}, c.defaultOptions, this.element.data(), e);
        this.options.templates = a.extend({}, c.defaultOptions.templates, this.options.templates);
        this.options.originalPlacement = this.options.placement;
        this.container = b.isElement(this.options.container) ? a(this.options.container) : false;
        if (this.container === false) {
            if (this.element.is(".dropdown-toggle")) {
                this.container = a("~ .dropdown-menu:first", this.element);
            } else {
                this.container = this.element.is("input,textarea,button,.btn") ? this.element.parent() : this.element;
            }
        }
        this.container.addClass("iconpicker-container");
        if (this.isDropdownMenu()) {
            this.options.templates.search = false;
            this.options.templates.buttons = false;
            this.options.placement = "inline";
        }
        this.input = this.element.is("input,textarea") ? this.element.addClass("iconpicker-input") : false;
        if (this.input === false) {
            this.input = this.container.find(this.options.input);
            if (!this.input.is("input,textarea")) {
                this.input = false;
            }
        }
        this.component = this.isDropdownMenu() ? this.container.parent().find(this.options.component) : this.container.find(this.options.component);
        if (this.component.length === 0) {
            this.component = false;
        } else {
            this.component.find("i").addClass("iconpicker-component");
        }
        this._createPopover();
        this._createIconpicker();
        if (this.getAcceptButton().length === 0) {
            this.options.mustAccept = false;
        }
        if (this.isInputGroup()) {
            this.container.parent().append(this.popover);
        } else {
            this.container.append(this.popover);
        }
        this._bindElementEvents();
        this._bindWindowEvents();
        this.update(this.options.selected);
        if (this.isInline()) {
            this.show();
        }
        this._trigger("iconpickerCreated");
    };
    c._idCounter = 0;
    c.defaultOptions = {
        title: false,
        selected: false,
        defaultValue: false,
        placement: "bottom",
        collision: "none",
        animation: true,
        hideOnSelect: false,
        showFooter: false,
        searchInFooter: false,
        mustAccept: false,
        selectedCustomClass: "bg-primary",
        icons: [],
        fullClassFormatter: function (a) {
            //return "fa " + a;
            return a;
        },
        input: "input,.iconpicker-input",
        inputSearch: false,
        container: false,
        component: ".input-group-addon,.iconpicker-component",
        templates: {
            popover: '<div class="iconpicker-popover popover"><div class="arrow"></div>' + '<div class="popover-title"></div><div class="popover-content"></div></div>',
            footer: '<div class="popover-footer"></div>',
            buttons: '<button class="iconpicker-btn iconpicker-btn-cancel btn btn-default btn-sm">Cancel</button>' + ' <button class="iconpicker-btn iconpicker-btn-accept btn btn-primary btn-sm">Accept</button>',
            search: '<input type="search" class="form-control iconpicker-search" placeholder="搜索" />',
            iconpicker: '<div class="iconpicker"><div class="iconpicker-items"></div></div>',
            iconpickerItem: '<a role="button" href="#" class="iconpicker-item"><i></i></a>'
        }
    };
    c.batch = function (b, c) {
        var d = Array.prototype.slice.call(arguments, 2);
        return a(b).each(function () {
            var b = a(this).data("iconpicker");
            if (!!b) {
                b[c].apply(b, d);
            }
        });
    };
    c.prototype = {
        constructor: c,
        options: {},
        _id: 0,
        _trigger: function (b, c) {
            c = c || {};
            this.element.trigger(a.extend({
                type: b,
                iconpickerInstance: this
            }, c));
        },
        _createPopover: function () {
            this.popover = a(this.options.templates.popover);
            var c = this.popover.find(".popover-title");
            if (!!this.options.title) {
                c.append(a('<div class="popover-title-text">' + this.options.title + "</div>"));
            }
            if (this.hasSeparatedSearchInput() && !this.options.searchInFooter) {
                c.append(this.options.templates.search);
            } else if (!this.options.title) {
                c.remove();
            }
            if (this.options.showFooter && !b.isEmpty(this.options.templates.footer)) {
                var d = a(this.options.templates.footer);
                if (this.hasSeparatedSearchInput() && this.options.searchInFooter) {
                    d.append(a(this.options.templates.search));
                }
                if (!b.isEmpty(this.options.templates.buttons)) {
                    d.append(a(this.options.templates.buttons));
                }
                this.popover.append(d);
            }
            if (this.options.animation === true) {
                this.popover.addClass("fade");
            }
            return this.popover;
        },
        _createIconpicker: function () {
            var b = this;
            this.iconpicker = a(this.options.templates.iconpicker);
            var c = function (c) {
                var d = a(this);
                if (d.is("i")) {
                    d = d.parent();
                }
                b._trigger("iconpickerSelect", {
                    iconpickerItem: d,
                    iconpickerValue: b.iconpickerValue
                });
                if (b.options.mustAccept === false) {
                    b.update(d.data("iconpickerValue"));
                    b._trigger("iconpickerSelected", {
                        iconpickerItem: this,
                        iconpickerValue: b.iconpickerValue
                    });
                } else {
                    b.update(d.data("iconpickerValue"), true);
                }
                if (b.options.hideOnSelect && b.options.mustAccept === false) {
                    b.hide();
                }
                c.preventDefault();
                return false;
            };
            for (var d in this.options.icons) {
                if (typeof this.options.icons[d] === "string") {
                    var e = a(this.options.templates.iconpickerItem);
                    e.find("i").addClass(this.options.fullClassFormatter(this.options.icons[d]));
                    e.data("iconpickerValue", this.options.icons[d]).on("click.iconpicker", c);
                    this.iconpicker.find(".iconpicker-items").append(e.attr("title", "." + this.options.icons[d]));
                }
            }
            this.popover.find(".popover-content").append(this.iconpicker);
            return this.iconpicker;
        },
        _isEventInsideIconpicker: function (b) {
            var c = a(b.target);
            if ((!c.hasClass("iconpicker-element") || c.hasClass("iconpicker-element") && !c.is(this.element)) && c.parents(".iconpicker-popover").length === 0) {
                return false;
            }
            return true;
        },
        _bindElementEvents: function () {
            var c = this;
            this.getSearchInput().on("keyup.iconpicker", function () {
                c.filter(a(this).val().toLowerCase());
            });
            this.getAcceptButton().on("click.iconpicker", function () {
                var a = c.iconpicker.find(".iconpicker-selected").get(0);
                c.update(c.iconpickerValue);
                c._trigger("iconpickerSelected", {
                    iconpickerItem: a,
                    iconpickerValue: c.iconpickerValue
                });
                if (!c.isInline()) {
                    c.hide();
                }
            });
            this.getCancelButton().on("click.iconpicker", function () {
                if (!c.isInline()) {
                    c.hide();
                }
            });
            this.element.on("focus.iconpicker", function (a) {
                c.show();
                a.stopPropagation();
            });
            if (this.hasComponent()) {
                this.component.on("click.iconpicker", function () {
                    c.toggle();
                });
            }
            if (this.hasInput()) {
                this.input.on("keyup.iconpicker", function (d) {
                    if (!b.inArray(d.keyCode, [38, 40, 37, 39, 16, 17, 18, 9, 8, 91, 93, 20, 46, 186, 190, 46, 78, 188, 44, 86])) {
                        c.update();
                    } else {
                        c._updateFormGroupStatus(c.getValid(this.value) !== false);
                    }
                    if (c.options.inputSearch === true) {
                        c.filter(a(this).val().toLowerCase());
                    }
                });
            }
        },
        _bindWindowEvents: function () {
            var b = a(window.document);
            var c = this;
            var d = ".iconpicker.inst" + this._id;
            a(window).on("resize.iconpicker" + d + " orientationchange.iconpicker" + d, function (a) {
                if (c.popover.hasClass("in")) {
                    c.updatePlacement();
                }
            });
            if (!c.isInline()) {
                b.on("mouseup" + d, function (a) {
                    if (!c._isEventInsideIconpicker(a) && !c.isInline()) {
                        c.hide();
                    }
                    a.stopPropagation();
                    a.preventDefault();
                    return false;
                });
            }
            return false;
        },
        _unbindElementEvents: function () {
            this.popover.off(".iconpicker");
            this.element.off(".iconpicker");
            if (this.hasInput()) {
                this.input.off(".iconpicker");
            }
            if (this.hasComponent()) {
                this.component.off(".iconpicker");
            }
            if (this.hasContainer()) {
                this.container.off(".iconpicker");
            }
        },
        _unbindWindowEvents: function () {
            a(window).off(".iconpicker.inst" + this._id);
            a(window.document).off(".iconpicker.inst" + this._id);
        },
        updatePlacement: function (b, c) {
            b = b || this.options.placement;
            this.options.placement = b;
            c = c || this.options.collision;
            c = c === true ? "flip" : c;
            var d = {
                at: "right bottom",
                my: "right top",
                of: this.hasInput() && !this.isInputGroup() ? this.input : this.container,
                collision: c === true ? "flip" : c,
                within: window
            };
            this.popover.removeClass("inline topLeftCorner topLeft top topRight topRightCorner " + "rightTop right rightBottom bottomRight bottomRightCorner " + "bottom bottomLeft bottomLeftCorner leftBottom left leftTop");
            if (typeof b === "object") {
                return this.popover.pos(a.extend({}, d, b));
            }
            switch (b) {
                case "inline":
                {
                    d = false;
                }
                    break;

                case "topLeftCorner":
                {
                    d.my = "right bottom";
                    d.at = "left top";
                }
                    break;

                case "topLeft":
                {
                    d.my = "left bottom";
                    d.at = "left top";
                }
                    break;

                case "top":
                {
                    d.my = "center bottom";
                    d.at = "center top";
                }
                    break;

                case "topRight":
                {
                    d.my = "right bottom";
                    d.at = "right top";
                }
                    break;

                case "topRightCorner":
                {
                    d.my = "left bottom";
                    d.at = "right top";
                }
                    break;

                case "rightTop":
                {
                    d.my = "left bottom";
                    d.at = "right center";
                }
                    break;

                case "right":
                {
                    d.my = "left center";
                    d.at = "right center";
                }
                    break;

                case "rightBottom":
                {
                    d.my = "left top";
                    d.at = "right center";
                }
                    break;

                case "bottomRightCorner":
                {
                    d.my = "left top";
                    d.at = "right bottom";
                }
                    break;

                case "bottomRight":
                {
                    d.my = "right top";
                    d.at = "right bottom";
                }
                    break;

                case "bottom":
                {
                    d.my = "center top";
                    d.at = "center bottom";
                }
                    break;

                case "bottomLeft":
                {
                    d.my = "left top";
                    d.at = "left bottom";
                }
                    break;

                case "bottomLeftCorner":
                {
                    d.my = "right top";
                    d.at = "left bottom";
                }
                    break;

                case "leftBottom":
                {
                    d.my = "right top";
                    d.at = "left center";
                }
                    break;

                case "left":
                {
                    d.my = "right center";
                    d.at = "left center";
                }
                    break;

                case "leftTop":
                {
                    d.my = "right bottom";
                    d.at = "left center";
                }
                    break;

                default:
                {
                    return false;
                }
                    break;
            }
            this.popover.css({
                display: this.options.placement === "inline" ? "" : "block"
            });
            if (d !== false) {
                this.popover.pos(d).css("maxWidth", a(window).width() - this.container.offset().left - 5);
            } else {
                this.popover.css({
                    top: "auto",
                    right: "auto",
                    bottom: "auto",
                    left: "auto",
                    maxWidth: "none"
                });
            }
            this.popover.addClass(this.options.placement);
            return true;
        },
        _updateComponents: function () {
            this.iconpicker.find(".iconpicker-item.iconpicker-selected").removeClass("iconpicker-selected " + this.options.selectedCustomClass);
            if (this.iconpickerValue) {
                this.iconpicker.find("." + this.options.fullClassFormatter(this.iconpickerValue).replace(/ /g, ".")).parent().addClass("iconpicker-selected " + this.options.selectedCustomClass);
            }
            if (this.hasComponent()) {
                var a = this.component.find("i");
                if (a.length > 0) {
                    a.attr("class", this.options.fullClassFormatter(this.iconpickerValue));
                } else {
                    this.component.html(this.getHtml());
                }
            }
        },
        _updateFormGroupStatus: function (a) {
            if (this.hasInput()) {
                if (a !== false) {
                    this.input.parents(".form-group:first").removeClass("has-error");
                } else {
                    this.input.parents(".form-group:first").addClass("has-error");
                }
                return true;
            }
            return false;
        },
        getValid: function (c) {
            if (!b.isString(c)) {
                c = "";
            }
            var d = c === "";
            c = a.trim(c);
            if (b.inArray(c, this.options.icons) || d) {
                return c;
            }
            return false;
        },
        setValue: function (a) {
            var b = this.getValid(a);
            if (b !== false) {
                this.iconpickerValue = b;
                this._trigger("iconpickerSetValue", {
                    iconpickerValue: b
                });
                return this.iconpickerValue;
            } else {
                this._trigger("iconpickerInvalid", {
                    iconpickerValue: a
                });
                return false;
            }
        },
        getHtml: function () {
            return '<i class="' + this.options.fullClassFormatter(this.iconpickerValue) + '"></i>';
        },
        setSourceValue: function (a) {
            a = this.setValue(a);
            if (a !== false && a !== "") {
                if (this.hasInput()) {
                    this.input.val(this.iconpickerValue);
                } else {
                    this.element.data("iconpickerValue", this.iconpickerValue);
                }
                this._trigger("iconpickerSetSourceValue", {
                    iconpickerValue: a
                });
            }
            return a;
        },
        getSourceValue: function (a) {
            a = a || this.options.defaultValue;
            var b = a;
            if (this.hasInput()) {
                b = this.input.val();
            } else {
                b = this.element.data("iconpickerValue");
            }
            if (b === undefined || b === "" || b === null || b === false) {
                b = a;
            }
            return b;
        },
        hasInput: function () {
            return this.input !== false;
        },
        isInputSearch: function () {
            return this.hasInput() && this.options.inputSearch === true;
        },
        isInputGroup: function () {
            return this.container.is(".input-group");
        },
        isDropdownMenu: function () {
            return this.container.is(".dropdown-menu");
        },
        hasSeparatedSearchInput: function () {
            return this.options.templates.search !== false && !this.isInputSearch();
        },
        hasComponent: function () {
            return this.component !== false;
        },
        hasContainer: function () {
            return this.container !== false;
        },
        getAcceptButton: function () {
            return this.popover.find(".iconpicker-btn-accept");
        },
        getCancelButton: function () {
            return this.popover.find(".iconpicker-btn-cancel");
        },
        getSearchInput: function () {
            return this.popover.find(".iconpicker-search");
        },
        filter: function (c) {
            if (b.isEmpty(c)) {
                this.iconpicker.find(".iconpicker-item").show();
                return a(false);
            } else {
                var d = [];
                this.iconpicker.find(".iconpicker-item").each(function () {
                    var b = a(this);
                    var e = b.attr("title").toLowerCase();
                    var f = false;
                    try {
                        f = new RegExp(c, "g");
                    } catch (a) {
                        f = false;
                    }
                    if (f !== false && e.match(f)) {
                        d.push(b);
                        b.show();
                    } else {
                        b.hide();
                    }
                });
                return d;
            }
        },
        show: function () {
            if (this.popover.hasClass("in")) {
                return false;
            }
            a.iconpicker.batch(a(".iconpicker-popover.in:not(.inline)").not(this.popover), "hide");
            this._trigger("iconpickerShow");
            this.updatePlacement();
            this.popover.addClass("in");
            setTimeout(a.proxy(function () {
                this.popover.css("display", this.isInline() ? "" : "block");
                this._trigger("iconpickerShown");
            }, this), this.options.animation ? 300 : 1);
        },
        hide: function () {
            if (!this.popover.hasClass("in")) {
                return false;
            }
            this._trigger("iconpickerHide");
            this.popover.removeClass("in");
            setTimeout(a.proxy(function () {
                this.popover.css("display", "none");
                this.getSearchInput().val("");
                this.filter("");
                this._trigger("iconpickerHidden");
            }, this), this.options.animation ? 300 : 1);
        },
        toggle: function () {
            if (this.popover.is(":visible")) {
                this.hide();
            } else {
                this.show(true);
            }
        },
        update: function (a, b) {
            a = a ? a : this.getSourceValue(this.iconpickerValue);
            this._trigger("iconpickerUpdate");
            if (b === true) {
                a = this.setValue(a);
            } else {
                a = this.setSourceValue(a);
                this._updateFormGroupStatus(a !== false);
            }
            if (a !== false) {
                this._updateComponents();
            }
            this._trigger("iconpickerUpdated");
            return a;
        },
        destroy: function () {
            this._trigger("iconpickerDestroy");
            this.element.removeData("iconpicker").removeData("iconpickerValue").removeClass("iconpicker-element");
            this._unbindElementEvents();
            this._unbindWindowEvents();
            a(this.popover).remove();
            this._trigger("iconpickerDestroyed");
        },
        disable: function () {
            if (this.hasInput()) {
                this.input.prop("disabled", true);
                return true;
            }
            return false;
        },
        enable: function () {
            if (this.hasInput()) {
                this.input.prop("disabled", false);
                return true;
            }
            return false;
        },
        isDisabled: function () {
            if (this.hasInput()) {
                return this.input.prop("disabled") === true;
            }
            return false;
        },
        isInline: function () {
            return this.options.placement === "inline" || this.popover.hasClass("inline");
        }
    };
    a.iconpicker = c;
    a.fn.iconpicker = function (b) {
        return this.each(function () {
            var d = a(this);
            if (!d.data("iconpicker")) {
                d.data("iconpicker", new c(this, typeof b === "object" ? b : {}));
            }
        });
    };
    c.defaultOptions.icons = ["fa fa-glass", "fa fa-music", "fa fa-search", "fa fa-envelope-o", "fa fa-heart", "fa fa-star", "fa fa-star-o", "fa fa-user", "fa fa-film", "fa fa-th-large", "fa fa-th", "fa fa-th-list", "fa fa-check", "fa fa-remove", "fa fa-close", "fa fa-times", "fa fa-search-plus", "fa fa-search-minus", "fa fa-power-off", "fa fa-signal", "fa fa-gear", "fa fa-cog", "fa fa-trash-o", "fa fa-home", "fa fa-file-o", "fa fa-clock-o", "fa fa-road", "fa fa-download", "fa fa-arrow-circle-o-down", "fa fa-arrow-circle-o-up", "fa fa-inbox", "fa fa-play-circle-o", "fa fa-rotate-right", "fa fa-repeat", "fa fa-refresh", "fa fa-list-alt", "fa fa-lock", "fa fa-flag", "fa fa-headphones", "fa fa-volume-off", "fa fa-volume-down", "fa fa-volume-up", "fa fa-qrcode", "fa fa-barcode", "fa fa-tag", "fa fa-tags", "fa fa-book", "fa fa-bookmark", "fa fa-print", "fa fa-camera", "fa fa-font", "fa fa-bold", "fa fa-italic", "fa fa-text-height", "fa fa-text-width", "fa fa-align-left", "fa fa-align-center", "fa fa-align-right", "fa fa-align-justify", "fa fa-list", "fa fa-dedent", "fa fa-outdent", "fa fa-indent", "fa fa-video-camera", "fa fa-photo", "fa fa-image", "fa fa-picture-o", "fa fa-pencil", "fa fa-map-marker", "fa fa-adjust", "fa fa-tint", "fa fa-edit", "fa fa-pencil-square-o", "fa fa-share-square-o", "fa fa-check-square-o", "fa fa-arrows", "fa fa-step-backward", "fa fa-fast-backward", "fa fa-backward", "fa fa-play", "fa fa-pause", "fa fa-stop", "fa fa-forward", "fa fa-fast-forward", "fa fa-step-forward", "fa fa-eject", "fa fa-chevron-left", "fa fa-chevron-right", "fa fa-plus-circle", "fa fa-minus-circle", "fa fa-times-circle", "fa fa-check-circle", "fa fa-question-circle", "fa fa-info-circle", "fa fa-crosshairs", "fa fa-times-circle-o", "fa fa-check-circle-o", "fa fa-ban", "fa fa-arrow-left", "fa fa-arrow-right", "fa fa-arrow-up", "fa fa-arrow-down", "fa fa-mail-forward", "fa fa-share", "fa fa-expand", "fa fa-compress", "fa fa-plus", "fa fa-minus", "fa fa-asterisk", "fa fa-exclamation-circle", "fa fa-gift", "fa fa-leaf", "fa fa-fire", "fa fa-eye", "fa fa-eye-slash", "fa fa-warning", "fa fa-exclamation-triangle", "fa fa-plane", "fa fa-calendar", "fa fa-random", "fa fa-comment", "fa fa-magnet", "fa fa-chevron-up", "fa fa-chevron-down", "fa fa-retweet", "fa fa-shopping-cart", "fa fa-folder", "fa fa-folder-open", "fa fa-arrows-v", "fa fa-arrows-h", "fa fa-bar-chart-o", "fa fa-bar-chart", "fa fa-twitter-square", "fa fa-facebook-square", "fa fa-camera-retro", "fa fa-key", "fa fa-gears", "fa fa-cogs", "fa fa-comments", "fa fa-thumbs-o-up", "fa fa-thumbs-o-down", "fa fa-star-half", "fa fa-heart-o", "fa fa-sign-out", "fa fa-linkedin-square", "fa fa-thumb-tack", "fa fa-external-link", "fa fa-sign-in", "fa fa-trophy", "fa fa-github-square", "fa fa-upload", "fa fa-lemon-o", "fa fa-phone", "fa fa-square-o", "fa fa-bookmark-o", "fa fa-phone-square", "fa fa-twitter", "fa fa-facebook-f", "fa fa-facebook", "fa fa-github", "fa fa-unlock", "fa fa-credit-card", "fa fa-feed", "fa fa-rss", "fa fa-hdd-o", "fa fa-bullhorn", "fa fa-bell", "fa fa-certificate", "fa fa-hand-o-right", "fa fa-hand-o-left", "fa fa-hand-o-up", "fa fa-hand-o-down", "fa fa-arrow-circle-left", "fa fa-arrow-circle-right", "fa fa-arrow-circle-up", "fa fa-arrow-circle-down", "fa fa-globe", "fa fa-wrench", "fa fa-tasks", "fa fa-filter", "fa fa-briefcase", "fa fa-arrows-alt", "fa fa-group", "fa fa-users", "fa fa-chain", "fa fa-link", "fa fa-cloud", "fa fa-flask", "fa fa-cut", "fa fa-scissors", "fa fa-copy", "fa fa-files-o", "fa fa-paperclip", "fa fa-save", "fa fa-floppy-o", "fa fa-square", "fa fa-navicon", "fa fa-reorder", "fa fa-bars", "fa fa-list-ul", "fa fa-list-ol", "fa fa-strikethrough", "fa fa-underline", "fa fa-table", "fa fa-magic", "fa fa-truck", "fa fa-pinterest", "fa fa-pinterest-square", "fa fa-google-plus-square", "fa fa-google-plus", "fa fa-money", "fa fa-caret-down", "fa fa-caret-up", "fa fa-caret-left", "fa fa-caret-right", "fa fa-columns", "fa fa-unsorted", "fa fa-sort", "fa fa-sort-down", "fa fa-sort-desc", "fa fa-sort-up", "fa fa-sort-asc", "fa fa-envelope", "fa fa-linkedin", "fa fa-rotate-left", "fa fa-undo", "fa fa-legal", "fa fa-gavel", "fa fa-dashboard", "fa fa-tachometer", "fa fa-comment-o", "fa fa-comments-o", "fa fa-flash", "fa fa-bolt", "fa fa-sitemap", "fa fa-umbrella", "fa fa-paste", "fa fa-clipboard", "fa fa-lightbulb-o", "fa fa-exchange", "fa fa-cloud-download", "fa fa-cloud-upload", "fa fa-user-md", "fa fa-stethoscope", "fa fa-suitcase", "fa fa-bell-o", "fa fa-coffee", "fa fa-cutlery", "fa fa-file-text-o", "fa fa-building-o", "fa fa-hospital-o", "fa fa-ambulance", "fa fa-medkit", "fa fa-fighter-jet", "fa fa-beer", "fa fa-h-square", "fa fa-plus-square", "fa fa-angle-double-left", "fa fa-angle-double-right", "fa fa-angle-double-up", "fa fa-angle-double-down", "fa fa-angle-left", "fa fa-angle-right", "fa fa-angle-up", "fa fa-angle-down", "fa fa-desktop", "fa fa-laptop", "fa fa-tablet", "fa fa-mobile-phone", "fa fa-mobile", "fa fa-circle-o", "fa fa-quote-left", "fa fa-quote-right", "fa fa-spinner", "fa fa-circle", "fa fa-mail-reply", "fa fa-reply", "fa fa-github-alt", "fa fa-folder-o", "fa fa-folder-open-o", "fa fa-smile-o", "fa fa-frown-o", "fa fa-meh-o", "fa fa-gamepad", "fa fa-keyboard-o", "fa fa-flag-o", "fa fa-flag-checkered", "fa fa-terminal", "fa fa-code", "fa fa-mail-reply-all", "fa fa-reply-all", "fa fa-star-half-empty", "fa fa-star-half-full", "fa fa-star-half-o", "fa fa-location-arrow", "fa fa-crop", "fa fa-code-fork", "fa fa-unlink", "fa fa-chain-broken", "fa fa-question", "fa fa-info", "fa fa-exclamation", "fa fa-superscript", "fa fa-subscript", "fa fa-eraser", "fa fa-puzzle-piece", "fa fa-microphone", "fa fa-microphone-slash", "fa fa-shield", "fa fa-calendar-o", "fa fa-fire-extinguisher", "fa fa-rocket", "fa fa-maxcdn", "fa fa-chevron-circle-left", "fa fa-chevron-circle-right", "fa fa-chevron-circle-up", "fa fa-chevron-circle-down", "fa fa-html5", "fa fa-css3", "fa fa-anchor", "fa fa-unlock-alt", "fa fa-bullseye", "fa fa-ellipsis-h", "fa fa-ellipsis-v", "fa fa-rss-square", "fa fa-play-circle", "fa fa-ticket", "fa fa-minus-square", "fa fa-minus-square-o", "fa fa-level-up", "fa fa-level-down", "fa fa-check-square", "fa fa-pencil-square", "fa fa-external-link-square", "fa fa-share-square", "fa fa-compass", "fa fa-toggle-down", "fa fa-caret-square-o-down", "fa fa-toggle-up", "fa fa-caret-square-o-up", "fa fa-toggle-right", "fa fa-caret-square-o-right", "fa fa-euro", "fa fa-eur", "fa fa-gbp", "fa fa-dollar", "fa fa-usd", "fa fa-rupee", "fa fa-inr", "fa fa-cny", "fa fa-rmb", "fa fa-yen", "fa fa-jpy", "fa fa-ruble", "fa fa-rouble", "fa fa-rub", "fa fa-won", "fa fa-krw", "fa fa-bitcoin", "fa fa-btc", "fa fa-file", "fa fa-file-text", "fa fa-sort-alpha-asc", "fa fa-sort-alpha-desc", "fa fa-sort-amount-asc", "fa fa-sort-amount-desc", "fa fa-sort-numeric-asc", "fa fa-sort-numeric-desc", "fa fa-thumbs-up", "fa fa-thumbs-down", "fa fa-youtube-square", "fa fa-youtube", "fa fa-xing", "fa fa-xing-square", "fa fa-youtube-play", "fa fa-dropbox", "fa fa-stack-overflow", "fa fa-instagram", "fa fa-flickr", "fa fa-adn", "fa fa-bitbucket", "fa fa-bitbucket-square", "fa fa-tumblr", "fa fa-tumblr-square", "fa fa-long-arrow-down", "fa fa-long-arrow-up", "fa fa-long-arrow-left", "fa fa-long-arrow-right", "fa fa-apple", "fa fa-windows", "fa fa-android", "fa fa-linux", "fa fa-dribbble", "fa fa-skype", "fa fa-foursquare", "fa fa-trello", "fa fa-female", "fa fa-male", "fa fa-gittip", "fa fa-gratipay", "fa fa-sun-o", "fa fa-moon-o", "fa fa-archive", "fa fa-bug", "fa fa-vk", "fa fa-weibo", "fa fa-renren", "fa fa-pagelines", "fa fa-stack-exchange", "fa fa-arrow-circle-o-right", "fa fa-arrow-circle-o-left", "fa fa-toggle-left", "fa fa-caret-square-o-left", "fa fa-dot-circle-o", "fa fa-wheelchair", "fa fa-vimeo-square", "fa fa-turkish-lira", "fa fa-try", "fa fa-plus-square-o", "fa fa-space-shuttle", "fa fa-slack", "fa fa-envelope-square", "fa fa-wordpress", "fa fa-openid", "fa fa-institution", "fa fa-bank", "fa fa-university", "fa fa-mortar-board", "fa fa-graduation-cap", "fa fa-yahoo", "fa fa-google", "fa fa-reddit", "fa fa-reddit-square", "fa fa-stumbleupon-circle", "fa fa-stumbleupon", "fa fa-delicious", "fa fa-digg", "fa fa-pied-piper-pp", "fa fa-pied-piper-alt", "fa fa-drupal", "fa fa-joomla", "fa fa-language", "fa fa-fax", "fa fa-building", "fa fa-child", "fa fa-paw", "fa fa-spoon", "fa fa-cube", "fa fa-cubes", "fa fa-behance", "fa fa-behance-square", "fa fa-steam", "fa fa-steam-square", "fa fa-recycle", "fa fa-automobile", "fa fa-car", "fa fa-cab", "fa fa-taxi", "fa fa-tree", "fa fa-spotify", "fa fa-deviantart", "fa fa-soundcloud", "fa fa-database", "fa fa-file-pdf-o", "fa fa-file-word-o", "fa fa-file-excel-o", "fa fa-file-powerpoint-o", "fa fa-file-photo-o", "fa fa-file-picture-o", "fa fa-file-image-o", "fa fa-file-zip-o", "fa fa-file-archive-o", "fa fa-file-sound-o", "fa fa-file-audio-o", "fa fa-file-movie-o", "fa fa-file-video-o", "fa fa-file-code-o", "fa fa-vine", "fa fa-codepen", "fa fa-jsfiddle", "fa fa-life-bouy", "fa fa-life-buoy", "fa fa-life-saver", "fa fa-support", "fa fa-life-ring", "fa fa-circle-o-notch", "fa fa-ra", "fa fa-resistance", "fa fa-rebel", "fa fa-ge", "fa fa-empire", "fa fa-git-square", "fa fa-git", "fa fa-y-combinator-square", "fa fa-yc-square", "fa fa-hacker-news", "fa fa-tencent-weibo", "fa fa-qq", "fa fa-wechat", "fa fa-weixin", "fa fa-send", "fa fa-paper-plane", "fa fa-send-o", "fa fa-paper-plane-o", "fa fa-history", "fa fa-circle-thin", "fa fa-header", "fa fa-paragraph", "fa fa-sliders", "fa fa-share-alt", "fa fa-share-alt-square", "fa fa-bomb", "fa fa-soccer-ball-o", "fa fa-futbol-o", "fa fa-tty", "fa fa-binoculars", "fa fa-plug", "fa fa-slideshare", "fa fa-twitch", "fa fa-yelp", "fa fa-newspaper-o", "fa fa-wifi", "fa fa-calculator", "fa fa-paypal", "fa fa-google-wallet", "fa fa-cc-visa", "fa fa-cc-mastercard", "fa fa-cc-discover", "fa fa-cc-amex", "fa fa-cc-paypal", "fa fa-cc-stripe", "fa fa-bell-slash", "fa fa-bell-slash-o", "fa fa-trash", "fa fa-copyright", "fa fa-at", "fa fa-eyedropper", "fa fa-paint-brush", "fa fa-birthday-cake", "fa fa-area-chart", "fa fa-pie-chart", "fa fa-line-chart", "fa fa-lastfm", "fa fa-lastfm-square", "fa fa-toggle-off", "fa fa-toggle-on", "fa fa-bicycle", "fa fa-bus", "fa fa-ioxhost", "fa fa-angellist", "fa fa-cc", "fa fa-shekel", "fa fa-sheqel", "fa fa-ils", "fa fa-meanpath", "fa fa-buysellads", "fa fa-connectdevelop", "fa fa-dashcube", "fa fa-forumbee", "fa fa-leanpub", "fa fa-sellsy", "fa fa-shirtsinbulk", "fa fa-simplybuilt", "fa fa-skyatlas", "fa fa-cart-plus", "fa fa-cart-arrow-down", "fa fa-diamond", "fa fa-ship", "fa fa-user-secret", "fa fa-motorcycle", "fa fa-street-view", "fa fa-heartbeat", "fa fa-venus", "fa fa-mars", "fa fa-mercury", "fa fa-intersex", "fa fa-transgender", "fa fa-transgender-alt", "fa fa-venus-double", "fa fa-mars-double", "fa fa-venus-mars", "fa fa-mars-stroke", "fa fa-mars-stroke-v", "fa fa-mars-stroke-h", "fa fa-neuter", "fa fa-genderless", "fa fa-facebook-official", "fa fa-pinterest-p", "fa fa-whatsapp", "fa fa-server", "fa fa-user-plus", "fa fa-user-times", "fa fa-hotel", "fa fa-bed", "fa fa-viacoin", "fa fa-train", "fa fa-subway", "fa fa-medium", "fa fa-yc", "fa fa-y-combinator", "fa fa-optin-monster", "fa fa-opencart", "fa fa-expeditedssl", "fa fa-battery-4", "fa fa-battery", "fa fa-battery-full", "fa fa-battery-3", "fa fa-battery-three-quarters", "fa fa-battery-2", "fa fa-battery-half", "fa fa-battery-1", "fa fa-battery-quarter", "fa fa-battery-0", "fa fa-battery-empty", "fa fa-mouse-pointer", "fa fa-i-cursor", "fa fa-object-group", "fa fa-object-ungroup", "fa fa-sticky-note", "fa fa-sticky-note-o", "fa fa-cc-jcb", "fa fa-cc-diners-club", "fa fa-clone", "fa fa-balance-scale", "fa fa-hourglass-o", "fa fa-hourglass-1", "fa fa-hourglass-start", "fa fa-hourglass-2", "fa fa-hourglass-half", "fa fa-hourglass-3", "fa fa-hourglass-end", "fa fa-hourglass", "fa fa-hand-grab-o", "fa fa-hand-rock-o", "fa fa-hand-stop-o", "fa fa-hand-paper-o", "fa fa-hand-scissors-o", "fa fa-hand-lizard-o", "fa fa-hand-spock-o", "fa fa-hand-pointer-o", "fa fa-hand-peace-o", "fa fa-trademark", "fa fa-registered", "fa fa-creative-commons", "fa fa-gg", "fa fa-gg-circle", "fa fa-tripadvisor", "fa fa-odnoklassniki", "fa fa-odnoklassniki-square", "fa fa-get-pocket", "fa fa-wikipedia-w", "fa fa-safari", "fa fa-chrome", "fa fa-firefox", "fa fa-opera", "fa fa-internet-explorer", "fa fa-tv", "fa fa-television", "fa fa-contao", "fa fa-500px", "fa fa-amazon", "fa fa-calendar-plus-o", "fa fa-calendar-minus-o", "fa fa-calendar-times-o", "fa fa-calendar-check-o", "fa fa-industry", "fa fa-map-pin", "fa fa-map-signs", "fa fa-map-o", "fa fa-map", "fa fa-commenting", "fa fa-commenting-o", "fa fa-houzz", "fa fa-vimeo", "fa fa-black-tie", "fa fa-fonticons", "fa fa-reddit-alien", "fa fa-edge", "fa fa-credit-card-alt", "fa fa-codiepie", "fa fa-modx", "fa fa-fort-awesome", "fa fa-usb", "fa fa-product-hunt", "fa fa-mixcloud", "fa fa-scribd", "fa fa-pause-circle", "fa fa-pause-circle-o", "fa fa-stop-circle", "fa fa-stop-circle-o", "fa fa-shopping-bag", "fa fa-shopping-basket", "fa fa-hashtag", "fa fa-bluetooth", "fa fa-bluetooth-b", "fa fa-percent", "fa fa-gitlab", "fa fa-wpbeginner", "fa fa-wpforms", "fa fa-envira", "fa fa-universal-access", "fa fa-wheelchair-alt", "fa fa-question-circle-o", "fa fa-blind", "fa fa-audio-description", "fa fa-volume-control-phone", "fa fa-braille", "fa fa-assistive-listening-systems", "fa fa-asl-interpreting", "fa fa-american-sign-language-interpreting", "fa fa-deafness", "fa fa-hard-of-hearing", "fa fa-deaf", "fa fa-glide", "fa fa-glide-g", "fa fa-signing", "fa fa-sign-language", "fa fa-low-vision", "fa fa-viadeo", "fa fa-viadeo-square", "fa fa-snapchat", "fa fa-snapchat-ghost", "fa fa-snapchat-square", "fa fa-pied-piper", "fa fa-first-order", "fa fa-yoast", "fa fa-themeisle", "fa fa-google-plus-circle", "fa fa-google-plus-official", "fa fa-fa", "fa fa-font-awesome", "fa fa-handshake-o", "fa fa-envelope-open", "fa fa-envelope-open-o", "fa fa-linode", "fa fa-address-book", "fa fa-address-book-o", "fa fa-vcard", "fa fa-address-card", "fa fa-vcard-o", "fa fa-address-card-o", "fa fa-user-circle", "fa fa-user-circle-o", "fa fa-user-o", "fa fa-id-badge", "fa fa-drivers-license", "fa fa-id-card", "fa fa-drivers-license-o", "fa fa-id-card-o", "fa fa-quora", "fa fa-free-code-camp", "fa fa-telegram", "fa fa-thermometer-4", "fa fa-thermometer", "fa fa-thermometer-full", "fa fa-thermometer-3", "fa fa-thermometer-three-quarters", "fa fa-thermometer-2", "fa fa-thermometer-half", "fa fa-thermometer-1", "fa fa-thermometer-quarter", "fa fa-thermometer-0", "fa fa-thermometer-empty", "fa fa-shower", "fa fa-bathtub", "fa fa-s15", "fa fa-bath", "fa fa-podcast", "fa fa-window-maximize", "fa fa-window-minimize", "fa fa-window-restore", "fa fa-times-rectangle", "fa fa-window-close", "fa fa-times-rectangle-o", "fa fa-window-close-o", "fa fa-bandcamp", "fa fa-grav", "fa fa-etsy", "fa fa-imdb", "fa fa-ravelry", "fa fa-eercast", "fa fa-microchip", "fa fa-snowflake-o", "fa fa-superpowers", "fa fa-wpexplorer", "fa fa-meetup", "glyphicon glyphicon-adjust", "glyphicon glyphicon-alert", "glyphicon glyphicon-align-center", "glyphicon glyphicon-align-justify", "glyphicon glyphicon-align-left", "glyphicon glyphicon-align-right", "glyphicon glyphicon-apple", "glyphicon glyphicon-arrow-down", "glyphicon glyphicon-arrow-left", "glyphicon glyphicon-arrow-right", "glyphicon glyphicon-arrow-up", "glyphicon glyphicon-asterisk", "glyphicon glyphicon-baby-formula", "glyphicon glyphicon-backward", "glyphicon glyphicon-ban-circle", "glyphicon glyphicon-barcode", "glyphicon glyphicon-bed", "glyphicon glyphicon-bell", "glyphicon glyphicon-bishop", "glyphicon glyphicon-bitcoin", "glyphicon glyphicon-blackboard", "glyphicon glyphicon-bold", "glyphicon glyphicon-book", "glyphicon glyphicon-bookmark", "glyphicon glyphicon-briefcase", "glyphicon glyphicon-btc", "glyphicon glyphicon-bullhorn", "glyphicon glyphicon-calendar", "glyphicon glyphicon-camera", "glyphicon glyphicon-cd", "glyphicon glyphicon-certificate", "glyphicon glyphicon-check", "glyphicon glyphicon-chevron-down", "glyphicon glyphicon-chevron-left", "glyphicon glyphicon-chevron-right", "glyphicon glyphicon-chevron-up", "glyphicon glyphicon-circle-arrow-down", "glyphicon glyphicon-circle-arrow-left", "glyphicon glyphicon-circle-arrow-right", "glyphicon glyphicon-circle-arrow-up", "glyphicon glyphicon-cloud", "glyphicon glyphicon-cloud-download", "glyphicon glyphicon-cloud-upload", "glyphicon glyphicon-cog", "glyphicon glyphicon-collapse-down", "glyphicon glyphicon-collapse-up", "glyphicon glyphicon-comment", "glyphicon glyphicon-compressed", "glyphicon glyphicon-console", "glyphicon glyphicon-copy", "glyphicon glyphicon-copyright-mark", "glyphicon glyphicon-credit-card", "glyphicon glyphicon-cutlery", "glyphicon glyphicon-dashboard", "glyphicon glyphicon-download", "glyphicon glyphicon-download-alt", "glyphicon glyphicon-duplicate", "glyphicon glyphicon-earphone", "glyphicon glyphicon-edit", "glyphicon glyphicon-education", "glyphicon glyphicon-eject", "glyphicon glyphicon-envelope", "glyphicon glyphicon-equalizer", "glyphicon glyphicon-erase", "glyphicon glyphicon-eur", "glyphicon glyphicon-euro", "glyphicon glyphicon-exclamation-sign", "glyphicon glyphicon-expand", "glyphicon glyphicon-export", "glyphicon glyphicon-eye-close", "glyphicon glyphicon-eye-open", "glyphicon glyphicon-facetime-video", "glyphicon glyphicon-fast-backward", "glyphicon glyphicon-fast-forward", "glyphicon glyphicon-file", "glyphicon glyphicon-film", "glyphicon glyphicon-filter", "glyphicon glyphicon-fire", "glyphicon glyphicon-flag", "glyphicon glyphicon-flash", "glyphicon glyphicon-floppy-disk", "glyphicon glyphicon-floppy-open", "glyphicon glyphicon-floppy-remove", "glyphicon glyphicon-floppy-save", "glyphicon glyphicon-floppy-saved", "glyphicon glyphicon-folder-close", "glyphicon glyphicon-folder-open", "glyphicon glyphicon-font", "glyphicon glyphicon-forward", "glyphicon glyphicon-fullscreen", "glyphicon glyphicon-gbp", "glyphicon glyphicon-gift", "glyphicon glyphicon-glass", "glyphicon glyphicon-globe", "glyphicon glyphicon-grain", "glyphicon glyphicon-hand-down", "glyphicon glyphicon-hand-left", "glyphicon glyphicon-hand-right", "glyphicon glyphicon-hand-up", "glyphicon glyphicon-hd-video", "glyphicon glyphicon-hdd", "glyphicon glyphicon-header", "glyphicon glyphicon-headphones", "glyphicon glyphicon-heart", "glyphicon glyphicon-heart-empty", "glyphicon glyphicon-home", "glyphicon glyphicon-hourglass", "glyphicon glyphicon-ice-lolly", "glyphicon glyphicon-ice-lolly-tasted", "glyphicon glyphicon-import", "glyphicon glyphicon-inbox", "glyphicon glyphicon-indent-left", "glyphicon glyphicon-indent-right", "glyphicon glyphicon-info-sign", "glyphicon glyphicon-italic", "glyphicon glyphicon-jpy", "glyphicon glyphicon-king", "glyphicon glyphicon-knight", "glyphicon glyphicon-lamp", "glyphicon glyphicon-leaf", "glyphicon glyphicon-level-up", "glyphicon glyphicon-link", "glyphicon glyphicon-list", "glyphicon glyphicon-list-alt", "glyphicon glyphicon-lock", "glyphicon glyphicon-log-in", "glyphicon glyphicon-log-out", "glyphicon glyphicon-magnet", "glyphicon glyphicon-map-marker", "glyphicon glyphicon-menu-down", "glyphicon glyphicon-menu-hamburger", "glyphicon glyphicon-menu-left", "glyphicon glyphicon-menu-right", "glyphicon glyphicon-menu-up", "glyphicon glyphicon-minus", "glyphicon glyphicon-minus-sign", "glyphicon glyphicon-modal-window", "glyphicon glyphicon-move", "glyphicon glyphicon-music", "glyphicon glyphicon-new-window", "glyphicon glyphicon-object-align-bottom", "glyphicon glyphicon-object-align-horizontal", "glyphicon glyphicon-object-align-left", "glyphicon glyphicon-object-align-right", "glyphicon glyphicon-object-align-top", "glyphicon glyphicon-object-align-vertical", "glyphicon glyphicon-off", "glyphicon glyphicon-oil", "glyphicon glyphicon-ok", "glyphicon glyphicon-ok-circle", "glyphicon glyphicon-ok-sign", "glyphicon glyphicon-open", "glyphicon glyphicon-open-file", "glyphicon glyphicon-option-horizontal", "glyphicon glyphicon-option-vertical", "glyphicon glyphicon-paperclip", "glyphicon glyphicon-paste", "glyphicon glyphicon-pause", "glyphicon glyphicon-pawn", "glyphicon glyphicon-pencil", "glyphicon glyphicon-phone", "glyphicon glyphicon-phone-alt", "glyphicon glyphicon-picture", "glyphicon glyphicon-piggy-bank", "glyphicon glyphicon-plane", "glyphicon glyphicon-play", "glyphicon glyphicon-play-circle", "glyphicon glyphicon-plus", "glyphicon glyphicon-plus-sign", "glyphicon glyphicon-print", "glyphicon glyphicon-pushpin", "glyphicon glyphicon-qrcode", "glyphicon glyphicon-queen", "glyphicon glyphicon-question-sign", "glyphicon glyphicon-random", "glyphicon glyphicon-record", "glyphicon glyphicon-refresh", "glyphicon glyphicon-registration-mark", "glyphicon glyphicon-remove", "glyphicon glyphicon-remove-circle", "glyphicon glyphicon-remove-sign", "glyphicon glyphicon-repeat", "glyphicon glyphicon-resize-full", "glyphicon glyphicon-resize-horizontal", "glyphicon glyphicon-resize-small", "glyphicon glyphicon-resize-vertical", "glyphicon glyphicon-retweet", "glyphicon glyphicon-road", "glyphicon glyphicon-rub", "glyphicon glyphicon-ruble", "glyphicon glyphicon-save", "glyphicon glyphicon-save-file", "glyphicon glyphicon-saved", "glyphicon glyphicon-scale", "glyphicon glyphicon-scissors", "glyphicon glyphicon-screenshot", "glyphicon glyphicon-sd-video", "glyphicon glyphicon-search", "glyphicon glyphicon-send", "glyphicon glyphicon-share", "glyphicon glyphicon-share-alt", "glyphicon glyphicon-shopping-cart", "glyphicon glyphicon-signal", "glyphicon glyphicon-sort", "glyphicon glyphicon-sort-by-alphabet", "glyphicon glyphicon-sort-by-alphabet-alt", "glyphicon glyphicon-sort-by-attributes", "glyphicon glyphicon-sort-by-attributes-alt", "glyphicon glyphicon-sort-by-order", "glyphicon glyphicon-sort-by-order-alt", "glyphicon glyphicon-sound-5-1", "glyphicon glyphicon-sound-6-1", "glyphicon glyphicon-sound-7-1", "glyphicon glyphicon-sound-dolby", "glyphicon glyphicon-sound-stereo", "glyphicon glyphicon-star", "glyphicon glyphicon-star-empty", "glyphicon glyphicon-stats", "glyphicon glyphicon-step-backward", "glyphicon glyphicon-step-forward", "glyphicon glyphicon-stop", "glyphicon glyphicon-subscript", "glyphicon glyphicon-subtitles", "glyphicon glyphicon-sunglasses", "glyphicon glyphicon-superscript", "glyphicon glyphicon-tag", "glyphicon glyphicon-tags", "glyphicon glyphicon-tasks", "glyphicon glyphicon-tent", "glyphicon glyphicon-text-background", "glyphicon glyphicon-text-color", "glyphicon glyphicon-text-height", "glyphicon glyphicon-text-size", "glyphicon glyphicon-text-width", "glyphicon glyphicon-th", "glyphicon glyphicon-th-large", "glyphicon glyphicon-th-list", "glyphicon glyphicon-thumbs-down", "glyphicon glyphicon-thumbs-up", "glyphicon glyphicon-time", "glyphicon glyphicon-tint", "glyphicon glyphicon-tower", "glyphicon glyphicon-transfer", "glyphicon glyphicon-trash", "glyphicon glyphicon-tree-conifer", "glyphicon glyphicon-tree-deciduous", "glyphicon glyphicon-triangle-bottom", "glyphicon glyphicon-triangle-left", "glyphicon glyphicon-triangle-right", "glyphicon glyphicon-triangle-top", "glyphicon glyphicon-unchecked", "glyphicon glyphicon-upload", "glyphicon glyphicon-usd", "glyphicon glyphicon-user", "glyphicon glyphicon-volume-down", "glyphicon glyphicon-volume-off", "glyphicon glyphicon-volume-up", "glyphicon glyphicon-warning-sign", "glyphicon glyphicon-wrench", "glyphicon glyphicon-xbt", "glyphicon glyphicon-yen", "glyphicon glyphicon-zoom-in", "glyphicon glyphicon-zoom-out"];
});