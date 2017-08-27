/**
 * Created by Admin on 2017/5/24.
 */
window.UEDITOR_HOME_URL = document.getElementsByTagName('base')[0].href + '/plugin/ueditor/';
require.config({
    paths: {
        'css': 'plugin/css.min',
        'jquery': 'js/jquery.min-1.11.1',
        'unit': 'js/unit',
        'bootstrap': 'plugin/bootstrap/js/bootstrap.min',
        'colorpicker': 'plugin/bootstrap-colorpicker/js/bootstrap-colorpicker.min',
        'datetimepicker': 'plugin/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN',
        'dragsort': 'plugin/dragsort/jquery.dragsort.min',
        'dropload': 'plugin/dropload/dropload.min',
        'iconpicker': 'plugin/fontawesome-iconpicker/js/fontawesome-iconpicker',
        'layer': 'plugin/layer/layer',
        'mtree': 'plugin/mtree/js/mtree',
        'ueditor': 'plugin/ueditor/ueditor.all.min',
        'uploadifive': 'plugin/uploadifive/js/uploadifive.mcms',
        'uploadifive_mcms': 'plugin/uploadifive/js/uploadifive.mcms',
        'upload': 'plugin/uploadifive/js/upload',
        'holder': 'plugin/holder.min',
        'jqthumb': 'plugin/jqthumb.min',
        'form': 'plugin/jquery.form.min',
        'sortable': 'plugin/jquery.sortable',
        'template': 'plugin/template',
        'nanoscroller': 'plugin/nanoscroller/js/jquery.nanoscroller.min'
    },
    shim: {
        'bootstrap': {
            deps: ['jquery'
                , 'css!plugin/font-awesome/css/font-awesome.min.css']
        },
        'colorpicker': {
            deps: ['jquery'
                , 'bootstrap'
                , 'css!plugin/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css']
        },
        'datetimepicker': {
            deps: ['jquery'
                , 'bootstrap'
                , 'plugin/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min'
                , 'css!plugin/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css']
        },
        'dragsort': {
            deps: ['jquery']
        },
        'dropload': {
            deps: ['jquery'
                , 'css!plugin/dropload/dropload.css']
        },
        'iconpicker': {
            deps: ['jquery'
                , 'bootstrap'
                , 'css!plugin/fontawesome-iconpicker/css/fontawesome-iconpicker.min.css']
        },
        'layer': {
            deps: ['jquery']
        },
        'mtree': {
            deps: ['jquery'
                , 'css!plugin/mtree/css/mtree.css']
        },
        'ueditor': {
            deps: ['plugin/ueditor/third-party/zeroclipboard/ZeroClipboard.min.js'
                , 'plugin/ueditor/ueditor.config.js'],
            exports: 'UE',
            init: function (ZeroClipboard) {
                //导出到全局变量，供ueditor使用
                window.ZeroClipboard = ZeroClipboard;
            }
        },
        'uploadifive': {
            deos: ['jquery'
                , 'css!plugin/uploadifive/css/uploadifive.css']
        },
        'upload': {
            deps: ['jquery'
                , 'uploadifive_mcms'
                , 'jqthumb'
                , 'holder'
                , 'dragsort']
        },
        'holder': {
            deps: ['jquery'
                , 'jqthumb']
        },
        'template': {
            deps: ['jquery']
        },
        'nanoscroller': {
            deps: ['jquery'
                , 'css!plugin/nanoscroller/css/nanoscroller.css']
        }
    }

});

require(['jquery', 'unit', 'bootstrap', 'mtree', 'layer', 'form'], function ($, unit) {

    //返回上一级
    unit.back();

    //滚动条美化
    unit.nanoscroller();

    //sidebar
    $('.mtree-sidebar-mhook').mtree({
        html: true,
        display: 2,
        indent: 0,
        onClick: function (obj, url) {
            window.location.href = url;
        }
    });
    $('.mtree-main-sidebar-mhook').mtree({
        html: true,
        display: 2,
        indent: 0,
        onClick: function (obj, url) {
            window.location.href = url;
        }
    });

    //配置layer
    layer.config({
        path: 'plugin/layer/',
        extend: 'bootcss/style.css',
        skin: 'layer-ext-bootcss',
        shade: 0.75,
        shadeClose: true
    });

    //全选
    $(document).on('click', 'input[type="checkbox"][data-checkname]', function () {
        var name = $(this).data('checkname');
        var is_checked = $(this).is(':checked');
        $('input[type="checkbox"][name^=' + name + ']:enabled').prop('checked', is_checked);
    });

    //关联全选
    $(document).on('click', 'input[type="checkbox"]', function () {
        var name = $(this).attr('name').replace(/\[.*\]/, '');
        var checkbox = $('input[type="checkbox"][data-checkname="' + name + '"]:enabled');
        if (checkbox.length == 0) {
            return;
        }
        var checkedLen = $('input[type="checkbox"][name^="' + name + '"]:enabled:checked').length;
        var checkboxLen = $('input[type="checkbox"][name^="' + name + '"]:enabled').length;
        if (checkedLen < checkboxLen) {
            checkbox.prop('checked', false);
        } else {
            checkbox.prop('checked', true);
        }
    });

    //回车搜索
    $(document).keydown(function (e) {
        if (e.which == 13) {
            $('.search-btn-mhook').click();
        }
    });

    //删除
    $(document).on('click', '.del-mhook', function () {
        var tbname = $(this).data('tb');
        var id = $(this).data('id');
        var url = $(this).data('url');
        var primary = $(this).data('primary');
        if (tbname == '' || id == '' || url == '') {
            layer.msg('删除失败！', {icon: 2, shade: 0.75, shadeClose: true});
            return;
        }
        layer.confirm('删除数据？', {icon: 3, title: '删除'}, function () {
            $.ajax({
                url: url,
                type: 'post',
                data: {tbname: tbname, id: id, primary: primary},
                success: function (data) {
                    if (parseInt(data) > 0) {
                        layer.msg('删除成功！', {icon: 1, time: 1000, shade: 0.75, shadeClose: true}, function () {
                            $('.search-btn-mhook').click();
                        });
                    } else {
                        layer.msg('删除失败！', {icon: 2, shade: 0.75, shadeClose: true});
                    }
                }
            });
        });
    });

    //批量删除
    $(document).on('click', '.batch-del-mhook', function () {
        var tbname = $(this).data('tb');
        var url = $(this).data('url');
        var primary = $(this).data('primary');
        var checkname = ($(this).data('checkname')) ? $(this).data('checkname') : 'id';
        var checkbox = $('input[type="checkbox"][name^=' + checkname + ']:enabled:checked');
        var id = '';
        //遍历已选中checkbox并获得val
        checkbox.each(function () {
            id += $(this).val() + ',';
        });
        id = id.substring(0, id.length - 1);
        //没有选中项
        if (id.length == 0) {
            layer.msg('没有数据！', {icon: 4, shade: 0.75, shadeClose: true});
            return;
        }
        layer.confirm('删除数据？', {icon: 3, title: '批量删除'}, function () {
            $.ajax({
                url: url,
                type: 'post',
                data: {tbname: tbname, id: id, primary: primary},
                success: function (data) {
                    if (parseInt(data) > 0) {
                        layer.msg('删除成功！', {icon: 1, time: 1000, shade: 0.75, shadeClose: true}, function () {
                            $('.search-btn-mhook').click();
                            $('input[type="checkbox"][name="checkAll"][data-checkname="' + checkname + '"]').prop('checked', false);
                        });
                    } else {
                        layer.msg('删除失败！', {icon: 2, shade: 0.75, shadeClose: true});
                    }
                }
            });
        });
    });

    //异步提交表单
    if ($('.ajax-form-mhook').length > 0) {
        $('.ajax-form-mhook').ajaxForm({
            type: 'post',
            dataType: 'json',
            success: function (responseData, $form) {
                //提示
                var msg;
                if (responseData.msg) {
                    msg = responseData.msg;
                } else {
                    switch (responseData.icon) {
                        case 1:
                            msg = '操作成功！';
                            break;
                        case 2:
                            msg = '操作失败！';
                            break;
                        default:
                            msg = '提示！！！';
                            break;
                    }
                }

                //icon
                var icon = -1;
                if (responseData.icon) {
                    icon = responseData.icon;
                }

                //停留时间
                var time = (responseData.time) ? responseData.time : 1000;
                layer.msg(msg, {icon: icon, time: time, shade: 0.75, shadeClose: true}, function () {
                    if (responseData.url) {
                        location.href = responseData.url;
                    }
                });
            }
        });
    }
});
