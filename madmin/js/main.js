/**
 * Created by Admin on 2017/5/24.
 */
window.UEDITOR_HOME_URL = document.getElementsByTagName('base')[0].href + '/plugin/ueditor/';
require.config({
    paths: {
        'css': 'plugin/css.min'
        , 'jquery': 'js/jquery.min-1.11.1'
        , 'unit': 'js/unit'
        , 'bootstrap': 'plugin/bootstrap-3.3.5/js/bootstrap.min'
        , 'colorpicker': 'plugin/colorpicker-2.3.3/js/bootstrap-colorpicker.min'
        , 'datetimepicker': 'plugin/datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN'
        , 'dragsort': 'plugin/dragsort-0.5.2/jquery.dragsort-0.5.2.min'
        , 'dropload': 'plugin/dropload-0.9.0/dropload.min'
        , 'iconpicker': 'plugin/iconpicker/js/iconPicker'
        , 'layer': 'plugin/layer-3.0.1/layer'
        , 'mtree': 'plugin/mtree-2.0/js/mtree'
        , 'ueditor': 'plugin/ueditor/ueditor.all.min'
        , 'uploadifive': 'plugin/uploadifive-1.1.2/js/do_uploadifive'
        , 'holder': 'plugin/holder.min'
        , 'jqthumb': 'plugin/jqthumb.min'
        , 'form': 'plugin/jquery.form.min'
        , 'sortable': 'plugin/jquery.sortable'
        , 'template': 'plugin/template'
    },
    shim: {
        'bootstrap': {
            deps: ['jquery'
                , 'css!plugin/font-awesome-4.7.0/css/font-awesome.min.css']
        }
        , 'colorpicker': {
            deps: ['jquery'
                , 'bootstrap'
                , 'css!plugin/colorpicker-2.3.3/css/bootstrap-colorpicker.min.css']
        }
        , 'datetimepicker': {
            deps: ['jquery'
                , 'bootstrap'
                , 'plugin/datetimepicker/js/bootstrap-datetimepicker.min'
                , 'css!plugin/datetimepicker/css/bootstrap-datetimepicker.min.css']
        }
        , 'dragsort': {
            deps: ['jquery']
        }
        , 'dropload': {
            deps: ['jquery'
                , 'css!plugin/dropload-0.9.0/dropload.css']
        }
        , 'iconpicker': {
            deps: ['jquery'
                , 'bootstrap'
                , 'css!plugin/iconpicker/css/iconpicker.min.css']
        }
        , 'layer': {
            deps: ['jquery']
        }
        , 'mtree': {
            deps: ['jquery'
                , 'css!plugin/mtree-2.0/css/mtree.css']
        }
        , 'ueditor': {
            deps: ['plugin/ueditor/third-party/zeroclipboard/ZeroClipboard.min.js'
                , 'plugin/ueditor/ueditor.config.js'],
            exports: 'UE',
            init: function (ZeroClipboard) {
                //导出到全局变量，供ueditor使用
                window.ZeroClipboard = ZeroClipboard;
            }
        }
        , 'uploadifive': {
            deps: ['jquery'
                , 'plugin/uploadifive-1.1.2/js/jquery.uploadifive.me'
                , 'jqthumb'
                , 'holder'
                , 'dragsort']
        }
        , 'holder': {
            deps: ['jquery'
                , 'jqthumb']
        }
        , 'template': {
            deps: ['jquery']
        }
    }

});

require(['jquery', 'bootstrap', 'mtree', 'layer', 'datetimepicker', 'form'], function ($) {

    //sidebar
    $('[data-name="mtreeSidebar"]').mtree({
        html: true,
        display: 2,
        onClick: function (obj, url) {
            window.location.href = url;
        }
    });
    $('[data-name="mtreeMainSidebar"]').mtree({
        html: true,
        display: 2,
        onClick: function (obj, url) {
            window.location.href = url;
        }
    });

    //配置layer
    layer.config({
        path: 'plugin/layer-3.0.1/',
        extend: 'bootcss/style.css',
        skin: 'layer-ext-bootcss',
        shade: 0.75,
        shadeClose: true
    });

    //时间插件
    $('input[data-name="datetimepicker"]').datetimepicker({
        language: 'zh-CN',
        format: 'yyyy-mm-dd hh:ii:ss',
        pickerPosition: 'top-right',
        autoclose: true,
        todayBtn: true
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
            $('[data-name="searchbtn"]').click();
        }
    });

    //删除
    $(document).on('click', '[data-name="del"]', function () {
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
                            $('[data-name="searchbtn"]').click();
                        });
                    } else {
                        layer.msg('删除失败！', {icon: 2, shade: 0.75, shadeClose: true});
                    }
                }
            });
        });
    });

    //批量删除
    $(document).on('click', '[data-name="batchDel"]', function () {
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
                            $('[data-name="searchbtn"]').click();
                            $('input[type="checkbox"][name="checkAll"][data-checkname="' + checkname + '"]').prop('checked', false);
                        });
                    } else {
                        layer.msg('删除失败！', {icon: 2, shade: 0.75, shadeClose: true});
                    }
                }
            });
        });
    });

    //隐藏侧边栏
    $('[data-name="sidebar_hidden"]').on('click', function () {
        $('[data-name="sidebar"]').toggleClass('sidebar_hidden');
    });

    //异步提交表单
    if ($('[data-form="ajaxForm"]').length > 0) {
        $('[data-form="ajaxForm"]').ajaxForm({
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
