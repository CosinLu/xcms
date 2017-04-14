/**
 * Created by Admin on 2017/4/11.
 */
+(function ($) {
    var defaults = {
        openIcon: 'fa fa-caret-right',
        closeIcon: 'fa fa-caret-down',
        data: [],
        indent: 15,
        display: 1,//默认显示几级：true=全部显示，1=显示1级，2/3/4/5依次类推
        currentId: '',
        currentClass: 'current',
        speed: 100,
        onHandler: function (obj, url) {
        }
    };
    var _mtree_ = {
        init: function () {
            this._$ele = $(this);
            _mtree_.initData.call(this);
        },
        initData: function () {
            _mtree_.genData.call(this, this._$ele, 0, 1);
            _mtree_.initCurrent.call(this);
            _mtree_.initBtnStatus.call(this);
            _mtree_.clearRedundancy(this);
        },
        genData: function ($parent, pid, level) {
            var display;
            if (this.ops.display === true) {
                display = 'block';
            } else if (this.ops.display > 0) {
                if (level > this.ops.display) display = 'none';
            }
            var $ul = $('<ul style="display:' + display + '" data-level="' + level++ + '"></ul>');
            var data = this.ops.data;
            for (var i = 0; i < data.length; i++) {
                var item = data[i];
                if (data[i].pid == pid) {
                    var indent = '<div data-name="mtreeIndent" style="width:' + (parseInt(level - 2)) * this.ops.indent + 'px"></div>';
                    var btn = '<div data-name="mtreeBtn" class="' + this.ops.openIcon + '"></div>';
                    var icon = (item.icon) ? '<div data-name="mtreeIcon" class="' + item.icon + '"></div>' : '';
                    var name = '<div data-name="mtreeName">' + item.name + '</div>';
                    var $li = $('<li><a href="javascript:;" ' + item.expand + ' data-name="mtreeLink" data-url="' + item.url + '" title="' + item.name + '" data-id="' + item.id + '">' + indent + btn + icon + name + '</a></li>');
                    $ul.append($li);
                    _mtree_.genData.call(this, $li, data[i].id, level);
                }
            }
            if ($ul.html().length > 0) {
                $parent.append($ul);
            }
        },
        clearRedundancy: function () {
            $('[data-name="mtreeLink"]', this._$ele).each(function () {
                if ($(this).next('ul').length == 0) {
                    $('[data-name="mtreeBtn"]', $(this)).removeClass();
                }
            })
        },
        initBtnStatus: function () {
            var _self = this;
            $('[data-name="mtreeLink"]', this._$ele).each(function () {
                if ($(this).next('ul').is(':hidden')) {
                    $(this).find('>[data-name="mtreeBtn"]')
                        .removeClass(_self.ops.closeIcon)
                        .addClass(_self.ops.openIcon);
                } else {
                    $(this).find('>[data-name="mtreeBtn"]')
                        .removeClass(_self.ops.openIcon)
                        .addClass(_self.ops.closeIcon);
                }
            })
        },
        initCurrent: function () {
            if (this.ops.currentId) {
                this._$ele.find('[data-name="mtreeLink"][data-id="' + this.ops.currentId + '"]')
                    .addClass(this.ops.currentClass)
                    .parents('li')
                    .addClass(this.ops.currentClass)
                    .parents('ul')
                    .show();
            }
        },
        handleEvent: function () {
            var _self = this;
            var openIcon = this.ops.openIcon;
            var closeIcon = this.ops.closeIcon;
            this._$ele.off('click').on('click', '[data-name="mtreeLink"]', function () {
                var $child = $(this).next('ul');
                var $btn = $(this).find(' > [data-name="mtreeBtn"]');
                if ($child.size()) {
                    if ($child.is(':hidden')) {
                        //显示子集
                        $child.slideDown(_self.ops.speed);
                        //改变按钮状态
                        $btn
                            .removeClass(openIcon)
                            .addClass(closeIcon);
                    } else {
                        //隐藏子集
                        $child.slideUp(_self.ops.speed);
                        //改变按钮状态
                        $btn
                            .removeClass(closeIcon)
                            .addClass(openIcon);
                    }
                } else {
                    var url = $(this).data('url');
                    if (url.replace(/javascript:;|(#)*/, "")) {
                        _self.ops.onHandler.call(_self, $(this), $(this).data('url'));
                    }
                    _self.find('[data-name="mtreeLink"]')
                        .removeClass(_self.ops.currentClass)
                        .parents('li')
                        .removeClass(_self.ops.currentClass);
                    $(this)
                        .addClass(_self.ops.currentClass)
                        .parents('li')
                        .addClass(_self.ops.currentClass);
                }
            })
        }
    }
    $.fn.mtree = function (ops) {
        this.ops = $.extend({}, defaults, ops);
        _mtree_.init.call(this);
        _mtree_.handleEvent.call(this)
    }
})(jQuery);
