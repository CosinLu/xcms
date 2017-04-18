/**
 * Created by Admin on 2017/4/11.
 * filter-v.1.0 by MengXianghan
 */
+(function ($) {
    var defaults = {
        height: 32,//默认高度
        openText: '更多&nbsp;<i class="fa fa-caret-right"></i>',
        closeText: '更多&nbsp;<i class="fa fa-caret-down"></i>',
        currentClass: 'active',
        onClick: function (obj) {
        }
    };
    var _filter_ = {
        init: function () {
            this._$ele = $(this);
            _filter_.onLoad.call(this);
        },
        onLoad: function () {
            var _self = this;
            $('[data-name="filterControl"]', this._$ele).each(function () {
                var body = $(this).children('[data-name="filterBody"]');
                var itemHeigth = body.children('[data-name="filterItem"]').height();
                var $footer = $('[data-name="filterFooter"]', $(this));
                if (itemHeigth > _self.ops.height) {
                    body.height(_self.ops.height);
                    if ($footer.size() == 0) {
                        $(this).prepend('<div class="filter_footer" data-name="filterFooter"><a href="javascript:;" class="btn btn-default btn-sm" data-name="filterMore">' + _self.ops.openText + '</a></div>');
                    }
                } else {
                    if ($footer.size() > 0) {
                        $footer.remove();
                    }
                }
            });
        },
        onResize: function () {
            var _self = this;
            $(window).on('resize', function () {
                _filter_.onLoad.call(_self);
            })
        },
        onMoreClick: function () {
            var _self = this;
            this._$ele.off('click').on('click', '[data-name="filterMore"]', function () {
                var filterBody = $(this).closest('[data-name="filterControl"]').find('>[data-name="filterBody"]');
                var filterBodyHeight = filterBody.height();
                if (filterBodyHeight == _self.ops.height) {
                    filterBody.height('');
                    $(this).html(_self.ops.closeText);
                } else {
                    filterBody.height(_self.ops.height);
                    $(this).html(_self.ops.openText);
                }
            })
        },
        onItemClick: function () {
            var _self = this;
            $('a', this._$ele.find('[data-name="filterItem"]'))
                .off('click')
                .on('click', function () {
                    $(this).addClass(_self.ops.currentClass).siblings().removeClass(_self.ops.currentClass);
                    _self.ops.onClick.call(_self, $(this));
                })
        }
    };
    $.fn.filter = function (ops) {
        this.ops = $.extend({}, defaults, ops);
        _filter_.init.call(this);
        _filter_.onResize.call(this);
        _filter_.onMoreClick.call(this);
        _filter_.onItemClick.call(this);
    }
})(jQuery);
