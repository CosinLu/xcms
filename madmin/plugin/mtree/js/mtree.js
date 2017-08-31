/**
 * Created by Admin on 2017/4/11.
 * mtree-v.2.0 by MengXianghan
 */
+(function ($) {
    var defaults = {
        openIcon    : 'fa fa-caret-right',
        closeIcon   : 'fa fa-caret-down',
        data        : [],//数据
        html        : false,//是否直接解析html，data不需传参
        indent      : 15,//缩进
        display     : 1,//默认显示几级：true=全部显示，1=显示1级，2/3/4/5依次类推
        currentId   : '',//选中菜单id
        currentClass: 'current',//选中菜单样式
        speed       : 100,//动画速度
        url         : true,//启用url：true=启用，false=禁用
        onLoad      : function (obj) {
        },//加载完成执行
        onClick     : function (obj, url) {
        }
    };
    var mtree = {
        init             : function () {
            this._$ele = $(this);
            mtree.unsubscribeEvents.call(this);
            mtree.initData.call(this);
        },
        unsubscribeEvents: function () {
            this._$ele.off('click');
        },
        initData         : function () {
            if (!this.ops.html) {
                this._$ele.html('');
            }
            mtree.genData.call(this, this._$ele, 0, 1);
            mtree.initIdent.call(this);
            mtree.inintShow.call(this);
            mtree.initCurrent.call(this);
            mtree.initBtnStatus.call(this);
            mtree.clearRedundancy(this);
        },
        genData          : function ($parent, pid, level) {
            var _this = this;
            var data = _this.ops.data;
            var $ul = $(mtree.template.ul).data('level', level++);
            $.each(data, function (i, item) {
                if (item.pid == pid) {
                    var $li = $(mtree.template.li);
                    var $a = $(mtree.template.a.replace(/\[expand\]/, item.expand)).attr('data-url', item.url).attr('data-id', item.id).attr('title', item.name);
                    var $indent = $(mtree.template.indent);
                    var $btn = (item.btn == 'false') ? '' : $(mtree.template.btn).addClass(_this.ops.openIcon);
                    var $icon = (item.icon) ? $(mtree.template.icon).addClass(item.icon) : '';
                    var $name = $(mtree.template.name).html(item.name);
                    var $str = $li.append($a.append($indent).append($btn).append($icon).append($name));
                    $ul.append($str);
                    mtree.genData.call(_this, $str, item.id, level);
                }
            });
            if ($ul.html().length > 0) {
                $parent.append($ul);
            }
        },
        initIdent        : function () {
            var _this = this;
            if (_this.ops.indent) {
                $('.mtree-link-hook', this._$ele).each(function (e) {
                    var closestUl = $(this).closest('ul');
                    var level = closestUl.data('level');
                    var indent = (level - 1) * _this.ops.indent;
                    $('.mtree-indent-hook', $(this)).css({
                        width: indent
                    });
                })
            }
        },
        clearRedundancy  : function () {
            var _this = this;
            $('.mtree-link-hook', _this._$ele).each(function () {
                //如果下级没有数据
                if ($(this).next('ul').length == 0) {
                    $('.mtree-btn-hook', $(this)).removeClass().addClass('mtree_btn mtree-btn-hook');
                }
            })
        },
        initBtnStatus    : function () {
            var _this = this;
            $('.mtree-link-hook', this._$ele).each(function () {
                if ($(this).next('ul').is(':hidden')) {
                    $(this).find('>.mtree-btn-hook')
                        .removeClass(_this.ops.closeIcon)
                        .addClass(_this.ops.openIcon);
                } else {
                    $(this).find('>.mtree-btn-hook')
                        .removeClass(_this.ops.openIcon)
                        .addClass(_this.ops.closeIcon);
                }
            })
        },
        initCurrent      : function () {
            if (this.ops.currentId) {
                this._$ele.find('.mtree-link-hook[data-id="' + this.ops.currentId + '"]')
                    .addClass(this.ops.currentClass)
                    .parents('li')
                    .addClass(this.ops.currentClass)
                    .parents('ul')
                    .show();
            } else {
                this._$ele.find('.' + this.ops.currentClass + '.mtree-link-hook')
                    .parents('li')
                    .addClass(this.ops.currentClass)
                    .parents('ul')
                    .show();
            }
        },
        inintShow        : function () {
            var _this = this;
            $('ul', _this._$ele).each(function () {
                var level = $(this).data('level');
                if (_this.ops.display === true) {
                    $(this).show();
                } else if (level > _this.ops.display) {
                    $(this).hide();
                }

            });
        },
        linkClick        : function () {
            var _this = this;
            var openIcon = this.ops.openIcon;
            var closeIcon = this.ops.closeIcon;
            this._$ele.on('click', '.mtree-link-hook', function (e) {
                var $child = $(this).next('ul');
                var $btn = $(this).find(' > .mtree-btn-hook');
                var url = $(this).data('url');
                if (_this.ops.url) {
                    if ((typeof(url) == 'undefined' ? '' : url).replace(/javascript:;|(#)*!/, "")) {
                        _this.ops.onClick.call(_this, $(this), $(this).data('url'));
                    } else {
                        if ($child.size()) {
                            if ($child.is(':hidden')) {
                                //显示子集
                                $child.slideDown(_this.ops.speed);
                                //改变按钮状态
                                $btn
                                    .removeClass(openIcon)
                                    .addClass(closeIcon);
                            } else {
                                //隐藏子集
                                $child.slideUp(_this.ops.speed);
                                //改变按钮状态
                                $btn
                                    .removeClass(closeIcon)
                                    .addClass(openIcon);
                            }
                        }
                    }
                } else {
                    _this.ops.onClick.call(_this, $(this), $(this).data('url'));
                }
                if (url) {
                    _this.find('.mtree-link-hook')
                        .removeClass(_this.ops.currentClass)
                        .parents('li')
                        .removeClass(_this.ops.currentClass);
                    $(this)
                        .addClass(_this.ops.currentClass)
                        .parents('li')
                        .addClass(_this.ops.currentClass);
                } else {
                    _this.find('.mtree-link-hook')
                        .parents('li')
                        .removeClass(_this.ops.currentClass);
                    $(this)
                        .parents('li')
                        .addClass(_this.ops.currentClass);
                }
                e.preventDefault();
                e.stopPropagation();
            })
        },
        btnClick         : function () {
            var _this = this;
            var openIcon = this.ops.openIcon;
            var closeIcon = this.ops.closeIcon;
            this._$ele.on('click', '.mtree-btn-hook', function (e) {
                var $child = $(this).closest('.mtree-link-hook').next('ul');
                if ($child.size()) {
                    if ($child.is(':hidden')) {
                        //显示子集
                        $child.slideDown(_this.ops.speed);
                        //改变按钮状态
                        $(this)
                            .removeClass(openIcon)
                            .addClass(closeIcon);
                    } else {
                        //隐藏子集
                        $child.slideUp(_this.ops.speed);
                        //改变按钮状态
                        $(this)
                            .removeClass(closeIcon)
                            .addClass(openIcon);
                    }
                }
                e.preventDefault();
                e.stopPropagation();
            })
        },
        template         : {
            ul    : '<ul></ul>',
            li    : '<li></li>',
            a     : '<a href="javascript:;" class="mtree_link mtree-link-hook" [expand]></a>',
            indent: '<div class="mtree_indent mtree-indent-hook"></div>',
            btn   : '<div class="mtree_btn mtree-btn-hook"></div>',
            icon  : '<div class="mtree_icon mtree-icon-hook"></div>',
            name  : '<div class="mtree_name mtree-name-hook"></div>'
        }
    }
    $.fn.mtree = function (ops) {
        this.ops = $.extend({}, defaults, ops);
        mtree.init.call(this);
        mtree.linkClick.call(this);
        mtree.btnClick.call(this);
        this.ops.onLoad.call(this);
    }
})(jQuery);
