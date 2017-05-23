$(function () {

    //配置layer
    if (isInclude('layer.js')) {
        layer.ready(function () {
            layer.config({
                extend: 'bootcss/style.css',
                skin: 'layer-ext-bootcss',
                shade: 0.75,
                shadeClose: true
            });
        });
    }

    //sidebar
    if (isInclude('mtree.js')) {
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
    }

    //时间插件
    if(isInclude('bootstrap-datetimepicker.min.js')){
        $('input[name$="_time"]').datetimepicker({
            language:'zh-CN',
            format:'yyyy-mm-dd hh:ii:ss',
            pickerPosition:'top-right',
            autoclose:true,
            todayBtn:true
        });
    }

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

    //实例化编辑器
    $('[data-name="editor"]').each(function () {
        var id = $(this).attr('id');
        var ue = UE.getEditor(id);
        //编辑器准备就绪后会触发该事件
        ue.ready(function () {
            syncEditorToTxtarea(ue, id);
        });
        //1.编辑器内部选区发生改变时，将触发该事件
        //2.编辑器内容发生改变时会触发该事件
        ue.addListener('selectionchange contentChange', function () {
            syncEditorToTxtarea(ue, id);
        });
    });


    //异步提交表单
    if ($('[data-form="ajaxForm"]').length > 0) {
        $('[data-form="ajaxForm"]').ajaxForm({
            type: 'post',
            dataType: 'json',
            success: ajaxFormShowStatus
        });
    }

});

//ajaxForm提交表单后显示的提示
function ajaxFormShowStatus(responseData) {
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

//同步编辑器内容到textarea
//解决ajaxForm提交表单无法获取编辑器内容
function syncEditorToTxtarea(ue, id) {
    var txt = $('textarea[name="' + id + '"]');
    var txtLen = txt.length;
    var editorContent = ue.getContent();
    if (txtLen > 0) {
        txt.val(editorContent);
    } else {
        $('#' + id).after('<textarea class="hidden" name="' + id + '">' + editorContent + '</textarea>');
    }
}

//文件是否被引用
function isInclude(name) {
    var js = /js$/i.test(name);
    var es = document.getElementsByTagName(js ? 'script' : 'link');
    for (var i = 0; i < es.length; i++)
        if (es[i][js ? 'src' : 'href'].indexOf(name) != -1) return true;
    return false;
}

