/**
 * Created by Admin on 2017/11/17.
 */
define(['jquery'], function ($) {
    return {

        //新增行业分类
        insertIndustry: function () {
            require(['layer'], function () {
                $('.insert-industry-hook').on('click', function () {
                    layer.open({
                        type: 2,
                        title: '新增行业分类',
                        area: ['305px', '130px'],
                        content: 'index.php/customer/insert_industry'
                    });
                })
            })
        },

        //保存行业分类
        saveIndustry: function (options) {
            require(['unit'], function (unit) {
                var defaults = {};
                var opt = $.extend({}, defaults, options);
                var layerIndex = parent.layer.getFrameIndex(window.name);
                unit.ajaxForm({
                    tiptype: function (msg, o, cssctl) {
                    },
                    callback: function (data) {
                        parent.$('select[name="industry"]').append('<option value="' + data.id + '">' + data.name + '</option>');
                        parent.$('select[name="industry"] option:last').attr('selected', true);
                        parent.layer.close(layerIndex);
                    }
                });
            })
        },

        //右键操作
        rightClickOpera: function (options) {
            var _this = this;
            require(['unit'], function (unit) {
                var defaults = {
                    target: '.context-menu-hook',
                    menuHtml: '<ul class="dropdown-menu" role="menu">' +
                    //'<li><a href="javascript:;" class="context-item-hook" data-opera="top"><i class="fa fa-arrow-up"></i>置顶</a></li>' +
                    '<li><a href="javascript:;" class="context-item-hook" data-opera="edit"><i class="fa fa-pencil"></i>编辑</a></li>' +
                    '<li><a href="javascript:;" class="context-item-hook" data-opera="del"><i class="fa fa-trash"></i>删除</a></li>' +
                    '</ul>'
                };
                var opt = $.extend({}, defaults, options);
                var len = $(opt.target).length;
                if (!len) $('body').append('<div class="' + opt.target.replace('.', '') + '">' + opt.menuHtml + '</div>');
                unit.contextmenu({
                    target: opt.target,
                    before: function (e, context) {
                        $('.context-menu-hook').find('.context-item-hook')
                            .data('id', $(context).data('id'))
                            .data('type', $(context).data('type'))
                            .data('tb', $(context).data('tb'))
                            .data('menu', $(context).data('menu'));
                    },
                    onItem: function (context, e) {
                        var $_ele = (e.target.tagName == 'A') ? $(e.target) : $(e.target).closest('a');
                        var opera = $_ele.data('opera');
                        var id = $_ele.data('id');
                        var customerId = $('.id-input-hook').val();
                        var type = $_ele.data('type');
                        switch (opera) {
                            case 'edit':
                                if (type == 'contact') {
                                    layer.open({
                                        type: 2,
                                        title: '编辑联系人',
                                        area: ['500px', '505px'],
                                        content: 'index.php/customer/update_additional_info?type=contact&id=' + id,
                                        end: function () {
                                            _this.getAdditionalInfo({
                                                type: type,
                                                customerId: customerId
                                            });
                                        }
                                    });
                                } else {
                                    layer.open({
                                        type: 2,
                                        title: '编辑备注',
                                        area: ['500px', '340px'],
                                        content: 'index.php/customer/update_additional_info?type=remark&id=' + id,
                                        end: function () {
                                            _this.getAdditionalInfo({
                                                type: type,
                                                customerId: customerId
                                            });
                                        }
                                    });
                                }
                                break;
                            case 'del':
                                var tbname = $_ele.data('tb') || '';
                                var url = $_ele.data('url') || 'index.php/api/del';
                                var menu = $_ele.data('menu') || '';
                                if (id == '' || url == '') {
                                    layer.msg('删除失败！', {icon: 2, shade: 0.6, shadeClose: true});
                                    return;
                                }
                                layer.confirm('删除数据？', {icon: 3, title: '删除'}, function () {
                                    $.ajax({
                                        url: url,
                                        type: 'post',
                                        data: {tbname: tbname, id: id, primary: 'id', menu: menu},
                                        beforeSend: function () {
                                            layer.msg('正在删除数据...', {icon: 16, shade: 0.6});
                                        },
                                        success: function (data) {
                                            if (parseInt(data) > 0) {
                                                layer.msg('删除成功！', {
                                                    icon: 1, time: 1000, shade: 0.6, shadeClose: true
                                                }, function () {
                                                    _this.getAdditionalInfo({
                                                        type: type,
                                                        customerId: customerId
                                                    });
                                                });
                                            } else {
                                                layer.msg('删除失败！', {icon: 2, shade: 0.6, shadeClose: true});
                                            }
                                        }
                                    });
                                });
                                break;
                            /*case 'top':
                             layer.msg('置顶--' + id, {icon: 4});
                             break;*/
                        }
                    }
                });
            })
        },

        //显示/隐藏联系人详细信息
        toggleDetail: function (options) {
            var defaults = {};
            var opt = $.extend({}, defaults, options);
            $(document).on('click', '.toggle-hook', function () {
                $(this).next('.toggle-detail-hook').toggleClass('hidden');
                $(this).toggleClass('active');
            })
        },

        //获取附加信息
        getAdditionalInfo: function (options) {
            var _this = this;
            require(['unit'], function (unit) {
                var defaults = {
                    type: [],
                    customerId: '',
                    url: 'index.php/customer/get_additional_info'
                };
                var opt = $.extend({}, defaults, options);
                opt.type = $.isArray(opt.type) ? opt.type : opt.type.split(',');
                opt.url = opt.url + '?customer_id=' + opt.customerId;
                $.each(opt.type, function (i, v) {
                    switch (v) {
                        case 'contact':
                            unit.getList({
                                url: opt.url + '&type=' + v,
                                listEle: '.list-contact-hook',
                                listBodyEle: '.list-contact-body-hook',
                                listTpl: 'listContactTpl',
                                complete: function () {
                                    _this.rightClickOpera();
                                }
                            });
                            break;
                        case 'remark':
                            unit.getList({
                                url: opt.url + '&type=' + v,
                                listEle: '.list-remark-hook',
                                listBodyEle: '.list-remark-body-hook',
                                listTpl: 'listRemarkTpl',
                                complete: function () {
                                    _this.rightClickOpera();
                                }
                            });
                            break;
                    }
                });
            });
        },

        //新增附加信息
        insertAdditionalInfo: function () {
            var _this = this;
            $('.insert-additional-info-btn-hook').on('click', function () {
                var type = $(this).data('type');
                var url = $(this).data('url') + '&type=' + type;
                var customerId = $('.id-input-hook').val();
                switch (type) {
                    case 'contact':
                        layer.open({
                            type: 2,
                            title: '新增联系人',
                            area: ['500px', '505px'],
                            content: url,
                            end: function () {
                                _this.getAdditionalInfo({
                                    type: type,
                                    customerId: customerId
                                });
                            }
                        });
                        break;
                    case 'remark':
                        layer.open({
                            type: 2,
                            title: '新增备注',
                            area: ['500px', '340px'],
                            content: url,
                            end: function () {
                                _this.getAdditionalInfo({
                                    type: type,
                                    customerId: customerId
                                });
                            }
                        });
                        break;
                }
            });
        },

        //保存附加信息
        saveAdditionalInfo: function (options) {
            require(['unit'], function (unit) {
                var defaults = {
                    callback: function (data) {
                        parent.layer.close(layerIndex);
                    }
                };
                var opt = $.extend({}, defaults, options);
                var layerIndex = parent.layer.getFrameIndex(window.name);
                unit.ajaxForm({
                    callback: opt.callback
                });
            })
        }

    }
});