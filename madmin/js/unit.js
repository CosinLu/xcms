/**
 * Created by Admin on 2017/5/25.
 */
define(['jquery'], function ($) {
    return {
        //layer配置
        layerConfig: function () {
            require(['layer'], function () {
                layer.config({
                    path: 'plugin/layer/',
                    extend: 'bootcss/style.css',
                    skin: 'layer-ext-bootcss',
                    shade: 0.75,
                    shadeClose: true
                });
            })
        },
        //异步提交表单
        ajaxForm: function () {
            require(['form'], function () {
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
            })
        },

        //批量删除
        batchDel: function () {
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
        },

        //删除
        del: function () {
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
        },

        //回车搜索
        enterSearch: function () {
            $(document).keydown(function (e) {
                if (e.which == 13) {
                    $('.search-btn-mhook').click();
                }
            });
        },

        //全选
        checkAll: function () {
            //全选
            $(document).on('click', 'input[type="checkbox"][data-checkname]', function () {
                var name = $(this).data('checkname');
                var is_checked = $(this).is(':checked');
                $('input[type="checkbox"][name^=' + name + ']:enabled').prop('checked', is_checked);
            });

            //关联全选
            $(document).on('click', 'input[type="checkbox"]', function () {
                if ($(this).attr('name')) {
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
                }
            });
        },

        //侧边栏
        sidebarTree: function () {
            require(['mtree'], function () {
                $('.mtree-sidebar-mhook').mtree({
                    html: true,
                    display: 2,
                    indent: 0,
                    onClick: function (obj, url) {
                        window.location.href = url;
                    }
                });
            });
        },

        //内容侧边栏
        mainSidebarTree: function () {
            require(['mtree'], function () {
                $('.mtree-main-sidebar-mhook').mtree({
                    html: true,
                    display: 2,
                    indent: 0,
                    onClick: function (obj, url) {
                        window.location.href = url;
                    }
                });
            })
        },

        //返回上一级
        back: function () {
            $('.back-mhook').on('click', function () {
                history.back();
            })
        },

        //滚动条美化
        scroller: function (options) {
            require(['scroller'], function (nanoScroller) {
                var defaults = {
                    dom: '.nano-mhook'
                };
                var ops = $.extend({}, defaults, options);
                $(ops.dom).nanoScroller();
            })
        },

        //拖拽排序
        dragsort: function (id) {
            require(['dragsort'], function (dragsort) {
                $(id).dragsort({
                    dragSelector: "div.uploadifive-queue-item .thumb",
                    dragSelectorExclude: "button",
                    placeHolderTemplate: "<div class='uploadifive-queue-item col-xs-3'><div class='thumbnail placeholder'></div></div>"
                });
            })
        },

        //通用日期插件
        date: function () {
            require(['datetimepicker'], function () {
                $('input.datetimepicker-mhook').datetimepicker({
                    language: 'zh-CN',
                    format: 'yyyy-mm-dd hh:ii:ss',
                    pickerPosition: 'top-right',
                    autoclose: true,
                    todayBtn: true
                });
            });
        },

        //编辑器
        ueditor: function () {
            var _this = this;
            require(['ueditor'], function (UE) {
                //实例化编辑器
                $('.editor-mhook').each(function () {
                    var id = $(this).attr('id');
                    var ue = UE.getEditor(id);
                    //编辑器准备就绪后会触发该事件
                    ue.ready(function () {
                        _this._syncEditorToTxtarea(ue, id);
                    });
                    //1.编辑器内部选区发生改变时，将触发该事件
                    //2.编辑器内容发生改变时会触发该事件
                    ue.addListener('selectionchange contentChange', function () {
                        _this._syncEditorToTxtarea(ue, id);
                    });
                });
            });
        },

        //同步编辑器内容到textarea
        //解决ajaxForm提交表单无法获取编辑器内容
        _syncEditorToTxtarea: function (ue, id) {
            var txt = $('textarea[name="' + id + '"]');
            var txtLen = txt.length;
            var editorContent = ue.getContent();
            if (txtLen > 0) {
                txt.val(editorContent);
            } else {
                $('#' + id).after('<textarea class="hidden" name="' + id + '">' + editorContent + '</textarea>');
            }
        },

        //权限选择器
        authCheck: function () {
            var _this = this;

            //全选
            $(document).on('click', 'input[name="authCheckAll"]', function () {
                var status = $(this).is(':checked');
                $(this).closest('.div-thead-hook').next('.div-tbody-hook').find('input:checkbox').prop('checked', status);
            });

            //全选当前分类下的所有复选框
            $(document).on('click', 'input[name="checkAll"]', function () {
                var status = $(this).is(':checked');
                var checkbox = $(this).closest('.li-mhook').next('#list').find('input:checkbox');//全部复选框
                checkbox.prop('checked', status);
            });

            $(document).on("click change", 'input[name^="id"]', function () {
                var prevAuthCheckedLen = $(this).closest('ul').prev('.li-mhook').find('input[name^="auth"]:checked').length;//上级全选复选框选中数
                //关联上级
                if (prevAuthCheckedLen == 0) {
                    _this._checkedPrev($(this));
                }
                //关联下级
                _this._checkedNext($(this));
                //关联当前行
                _this._checkedInline($(this));
            });

            //关联行首
            $(document).on('click', 'input[name^="auth"]', function () {
                var siblingsCheckedLen = $(this).closest('label').siblings().find('input[name^="auth"]:checked').length;//兄弟label选中数
                var status = $(this).is(':checked');//状态：true=选中，false=未选中
                var prevCheckbox = $(this).closest('li').find('input[name^="id"]');//上级name为id[]的复选框
                var prevAuthCheckedLen = $(this).closest('ul').prev('.li-mhook').find('input[name^="auth"]:checked').length;//上级权限复选框选中数
                var nextAuthCheckedLen = $(this).closest('.li-mhook').next('ul').find('input[name^="auth"]:checked').length;//下级权限复选框选中数
                if (siblingsCheckedLen == 0 && nextAuthCheckedLen == 0) {
                    prevCheckbox.prop('checked', status);
                } else {
                    prevCheckbox.prop('checked', true);
                }
                //关联上级
                if (prevAuthCheckedLen == 0 && siblingsCheckedLen == 0) {
                    _this._authCheckedPrev(prevCheckbox);
                }
            });
        },
        //关联当前行
        _checkedInline: function (obj) {
            var status = obj.is(':checked');
            obj.closest('div').siblings().find('input[type="checkbox"]').prop('checked', status);
        },
        //关联下级
        _checkedNext: function (obj) {
            var status = obj.is(':checked');
            obj.closest('.li-mhook').next('ul').find('input[type="checkbox"]').prop('checked', status);
        },
        //关联上级
        _checkedPrev: function (obj) {
            var checkedLen = obj.closest('ul').find('input[type="checkbox"]:checked').length;
            var checkbox = obj.closest('ul').prev('.li-mhook').find('input[type="checkbox"][name^="id"]');
            var checkboxLen = checkbox.length;
            if (checkboxLen > 0) {
                if (checkedLen > 0) {
                    checkbox.prop('checked', true);
                } else {
                    checkbox.prop('checked', false);
                }
                this._checkedPrev(checkbox);
            }
        },
        //权限关联上级
        _authCheckedPrev: function (obj) {
            var checkedLen = obj.closest('ul').find('input[type="checkbox"]:checked').length;
            var checkbox = obj.closest('ul').prev('.li-mhook').find('input[type="checkbox"][name^="id"]');
            var checkboxLen = checkbox.length;
            if (checkboxLen > 0) {
                if (checkedLen > 0) {
                    checkbox.prop('checked', true);
                } else {
                    checkbox.prop('checked', false);
                }
                this._checkedPrev(checkbox);
            }
        }
    }
});