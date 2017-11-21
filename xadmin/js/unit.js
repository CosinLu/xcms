/**
 * Created by Admin on 2017/5/25.
 */
define(['jquery', 'layer'], function ($) {
    return {

        //颜色选择器
        colorPicker: function (options) {
            require(['colorpicker'], function () {
                var defaults = {
                    dom: '.colorpicker-hook',
                    input: '.colorpicker-input-hook',
                    defaultColor: '#333',
                    affectedDom: '.colorpicker-affected-hook',
                    onChange: function (e) {
                        $(opt.affectedDom).css('color', e.color.toHex());
                    }
                };
                var opt = $.extend({}, defaults, options);
                $(opt.dom).colorpicker({
                    input: opt.input,
                    color: opt.defaultColor,
                    colorSelectors: {
                        '#333': '#333',//default
                        '#007CF9': '#007CF9',//primary
                        '#5cb85c': '#5cb85c',//success
                        '#007fff': '#007fff',//info
                        '#f0ad4e': '#f0ad4e',//warning
                        '#d9534f': '#d9534f'//danger
                    }
                }).on('changeColor', opt.onChange);
            })
        },

        //editable
        editable: function (options) {
            require(['editable'], function () {
                var defaults = {
                    dom: '.editable-hook',
                    mode: 'popup',
                    escape: false,
                    type: 'select',
                    title: '',
                    url: 'index.php/api/editable',
                    source: [],
                    params: {}
                };
                var opt = $.extend({}, defaults, options);
                $(opt.dom).editable({
                    mode: $(this).data('mode') || opt.mode,
                    escape: $(this).data('escape') || opt.escape,
                    type: $(this).data('type') || opt.type,
                    title: $(this).data('title') || opt.title,
                    url: $(this).data('url') || opt.url,
                    source: $(this).data('source') || opt.source,
                    params: function (params) {
                        params = $.extend({}, params, opt.params, $(this).data('params'));
                        return params;
                    }
                });
            })
        },

        //获取列表
        getList: function (options) {
            require(['template'], function (template) {
                var defaults = {
                    url: '',
                    data: {
                        x: Math.random()
                    },
                    jqthumb: false,
                    listEle: '.list-hook',
                    listBodyEle: '.list-body-hook',
                    listTpl: 'listTpl',
                    paginationEle: '.pagination-hook',
                    paginationTpl: 'paginationTpl',
                    nodataEle: '.nodata-hook',
                    loadingEle: '.loading-hook',
                    errordataEle: '.error-hook',
                    loadingDom: '<div class="panel-body loading-hook">数据加载中...</div>',
                    nodataDom: '<div class="panel-body nodata-hook">暂无数据</div>',
                    errordataDom: '<div class="panel-body error-hook">数据加载失败</div>',
                    beforeSend: function () {
                        $(opt.nodataEle + ',' + opt.loadingEle + ',' + opt.errordataEle).remove();
                        $(opt.listBodyEle).html('');
                        if (opt.paginationEle.length) $(opt.paginationEle).html('');
                        if (opt.listEle.length) $(opt.listEle).after(opt.loadingDom);
                    },
                    success: function (data) {
                        $(opt.nodataEle + ',' + opt.loadingEle + ',' + opt.errordataEle).remove();
                        if (data.list.list.length) {
                            $(opt.listBodyEle).html(template(opt.listTpl, data.list));
                            if (opt.jqthumb) {
                                require(['jqthumb'], function () {
                                    if ($(opt.listBodyEle).find('.jqthumb-hook').length) {
                                        $(opt.listBodyEle).find('.jqthumb-hook').each(function () {
                                            var width = $(this).data('width') || 120;
                                            var height = $(this).data('height') || 80;
                                            $(this).jqthumb({
                                                width: width, height: height
                                            })
                                        });
                                    }
                                })
                            }
                            if ($(opt.paginationEle).length) $(opt.paginationEle).html(template(opt.paginationTpl, data.list));
                        } else {
                            if (opt.listEle.length) $(opt.listEle).after(opt.nodataDom);
                        }
                    },
                    error: function () {
                        $(opt.nodataEle + ',' + opt.loadingEle + ',' + opt.errordataEle).remove();
                        if (opt.listEle.length) $(opt.listEle).after(opt.errordataDom);
                    },
                    complete: function () {
                    }
                };
                var opt = $.extend({}, defaults, options);
                $.ajax({
                    url: opt.url,
                    type: 'post',
                    dataType: 'json',
                    data: opt.data,
                    beforeSend: opt.beforeSend,
                    success: opt.success,
                    error: opt.error,
                    complete: opt.complete
                })
            })
        },

        //分页
        pagination: function (fn) {
            $(document).on('click', '.page-hook li[class!="active"] a', fn)
        },

        //检索
        search: function (fn) {
            $('.search-btn-hook').click(fn);
        },

        //图片预览
        imagePreview: function () {
            $(document).on('click', '.preview-hook', function () {
                var content = $(this).data('content');
                var titleContent = (content.name) ? '<div style="padding-top:15px;">' + content.name + '</div>' : '';
                parent.layer.open({
                    type: 1,
                    title: false,
                    area: '500px',
                    btn: false,
                    offset: '100px',
                    content: '<div style="text-align: center;"><img src="' + content.src + '" style="max-width: 100%;max-height: 500px;">' + titleContent + '</div>'
                });

            });
        },

        //layer配置
        layerConfig: function () {
            layer.config({
                path: 'plugin/layer/',
                extend: 'bootcss/css/style.css',
                skin: 'layer-ext-bootcss',
                shade: [0.6, '#373737'],
                shadeClose: true
            });
        },

        //表单提交&验证
        ajaxForm: function (options) {
            var _this = this;
            require(['form', 'layer'], function () {
                if ($('.ajax-form-hook').length > 0) {
                    var defaults = {
                        tiptype: function (msg, o, cssctl) {
                            if (o.type == 1) {
                                layer.msg(msg, {icon: 16, shade: 0.6});
                            }
                        },
                        ajaxPost: true,
                        callback: function (data) {
                            //提示
                            var msg;
                            if (data.msg) {
                                msg = data.msg;
                            } else {
                                switch (data.icon) {
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
                            if (data.icon) {
                                icon = data.icon;
                            }
                            //停留时间
                            var time = (data.time) ? data.time : 1000;
                            layer.msg(msg, {icon: icon, time: time, shade: 0.6, shadeClose: true}, function () {
                                if (data.url) {
                                    location.href = data.url;
                                }
                            });
                        }
                    };
                    var opt = $.extend({}, defaults, options);
                    var validform = $('.ajax-form-hook').Validform(opt);

                    $('.submit-hook').on('click', function () {
                        _this._setFormSubmitType($(this));
                        validform.ajaxPost();
                        return false;
                    });
                }
            })
        },

        //设置表单提交类型
        _setFormSubmitType: function (obj) {
            var name = obj.attr('name');
            var submitText = $('input[type="hidden"][name="' + name + '"]');
            var type = obj.val(); //1：保存，2：保存并新增
            if (submitText.length == 0) {
                obj.after('<input type="hidden" name="' + name + '" value="' + type + '">');
            } else {
                submitText.val(type);
            }
        },

        //批量删除
        batchDel: function () {
            $(document).on('click', '.batch-del-hook', function () {
                var tbname = $(this).data('tb') || '';
                var url = $(this).data('url') || 'index.php/api/batch_del';
                var primary = $(this).data('primary') || 'id';
                var checkname = $(this).data('checkname') ? $(this).data('checkname') : 'id';
                var checkbox = $('input[type="checkbox"][name^=' + checkname + ']:enabled:checked');
                var menu = $(this).data('menu') || '';
                var id = '';
                //遍历已选中checkbox并获得val
                checkbox.each(function () {
                    id += $(this).val() + ',';
                });
                id = id.substring(0, id.length - 1);
                //没有选中项
                if (id.length == 0) {
                    layer.msg('没有数据！', {icon: 4, shade: 0.6, shadeClose: true});
                    return;
                }
                layer.confirm('删除数据？', {icon: 3, title: '批量删除'}, function () {
                    $.ajax({
                        url: url,
                        type: 'post',
                        data: {tbname: tbname, id: id, primary: primary, menu: menu},
                        beforeSend: function () {
                            layer.msg('正在删除数据...', {icon: 16, shade: 0.6});
                        },
                        success: function (data) {
                            if (parseInt(data) > 0) {
                                layer.msg('删除成功！', {icon: 1, time: 1000, shade: 0.6, shadeClose: true}, function () {
                                    window.location.reload();
                                });
                            } else {
                                layer.msg('删除失败！', {icon: 2, shade: 0.6, shadeClose: true});
                            }
                        }
                    });
                });
            });
        },

        //删除
        del: function () {
            $(document).on('click', '.del-hook', function () {
                var tbname = $(this).data('tb') || '';
                var id = $(this).data('id') || '';
                var url = $(this).data('url') || 'index.php/api/del';
                var primary = $(this).data('primary') || 'id';
                var menu = $(this).data('menu') || '';
                if (tbname == '' || id == '' || url == '') {
                    layer.msg('删除失败！', {icon: 2, shade: 0.6, shadeClose: true});
                    return;
                }
                layer.confirm('删除数据？', {icon: 3, title: '删除'}, function () {
                    $.ajax({
                        url: url,
                        type: 'post',
                        data: {tbname: tbname, id: id, primary: primary, menu: menu},
                        beforeSend: function () {
                            layer.msg('正在删除数据...', {icon: 16, shade: 0.6});
                        },
                        success: function (data) {
                            if (parseInt(data) > 0) {
                                layer.msg('删除成功！', {icon: 1, time: 1000, shade: 0.6, shadeClose: true}, function () {
                                    window.location.reload();
                                });
                            } else {
                                layer.msg('删除失败！', {icon: 2, shade: 0.6, shadeClose: true});
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
                    $('.search-btn-hook').click();
                }
            });
        },

        //全选
        checkAll: function () {
            //全选
            $(document).on('click', 'input[type="checkbox"][data-checkname]', function () {
                var name = $(this).data('checkname');
                var isChecked = $(this).is(':checked');
                $('input[type="checkbox"][name^=' + name + ']:enabled').prop('checked', isChecked);
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
                $('.mtree-sidebar-hook').mtree({
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
                $('.mtree-main-sidebar-hook').mtree({
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
        goBack: function () {
            $('.back-hook').on('click', function () {
                history.back();
            })
        },

        //滚动条美化
        scroller: function (options) {
            require(['scroller'], function (nanoScroller) {
                var defaults = {
                    dom: '.nano-hook'
                };
                var opt = $.extend({}, defaults, options);
                $(opt.dom).nanoScroller();
            })
        },

        //拖拽排序
        dragsort: function (obj) {
            require(['dragsort'], function (dragsort) {
                $('.' + obj).each(function () {
                    var id = $(this).attr('id');
                    var className = $(this).children('div').attr('class');
                    var newClass = '';
                    if (className) {
                        newClass = className.split(' ').join('.')
                    }
                    $('#' + id).dragsort({
                        dragSelector: '.' + newClass,
                        dragSelectorExclude: 'a,i,.control',
                        placeHolderTemplate: '<div class="' + className + ' dragsort"></div>'
                    });
                });
            })
        },

        //通用日期插件
        datetimePicker: function (options) {
            require(['datetimepicker'], function () {
                var defaults = {
                    language: 'zh-CN',
                    format: 'yyyy-mm-dd hh:ii:ss',
                    pickerPosition: 'top-right',
                    autoclose: true,
                    todayBtn: true
                };
                var opt = $.extend({}, defaults, options);
                $('input.datetimepicker-hook').datetimepicker({
                    language: opt.language,
                    format: opt.format,
                    pickerPosition: opt.pickerPosition,
                    autoclose: opt.autoclose,
                    todayBtn: opt.todayBtn
                });
            });
        },

        //编辑器
        ueditor: function () {
            var _this = this;
            require(['ueditor'], function (UE) {
                //实例化编辑器
                $('.ueditor-hook').each(function () {
                    var id = $(this).attr('id');
                    var ue = UE.getEditor(id, {
                        toolbars: [
                            [
                                'fullscreen', 'source', 'undo', 'redo',
                                'bold', 'italic', 'underline', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'cleardoc',
                                'lineheight',
                                'customstyle', 'paragraph', 'fontfamily', 'fontsize',
                                'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify',
                                'link', 'unlink', 'anchor',
                                'insertimage', 'attachment', 'map', 'insertframe', 'insertcode', 'pagebreak',
                                'horizontal',
                                'inserttable',
                                'print',
                            ]
                        ]
                        , zIndex: 9999
                        , initialFrameHeight: 350
                        , autoSyncData: false
                        , 'fontsize': [12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36]
                        , elementPathEnabled: false
                        , wordCount: false
                        , autoHeightEnabled: false
                        , autoFloatEnabled: false
                        , topOffset: 50
                        , autotypeset: {
                            mergeEmptyline: true,           //合并空行
                            removeClass: true,              //去掉冗余的class
                            removeEmptyline: true,         //去掉空行
                            textAlign: "left",               //段落的排版方式，可以是 left,right,center,justify 去掉这个属性表示不执行排版
                            imageBlockLine: 'center',       //图片的浮动方式，独占一行剧中,左右浮动，默认: center,left,right,none 去掉这个属性表示不执行排版
                            pasteFilter: true,             //根据规则过滤没事粘贴进来的内容
                            clearFontSize: false,           //去掉所有的内嵌字号，使用编辑器默认的字号
                            clearFontFamily: true,         //去掉所有的内嵌字体，使用编辑器默认的字体
                            removeEmptyNode: true,         // 去掉空节点
                            //可以去掉的标签
                            removeTagNames: {标签名字: 1},
                            indent: false,                  // 行首缩进
                            indentValue: '2em',            //行首缩进的大小
                            bdc2sb: false,
                            tobdc: false
                        }
                        , theme: 'fontawesome'
                        , enableAutoSave: false
                        , disabledTableInTable: false
                    });
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
                var checkbox = $(this).closest('.li-hook').next('#list').find('input:checkbox');//全部复选框
                checkbox.prop('checked', status);
            });

            $(document).on("click change", 'input[name^="id"]', function () {
                var prevAuthCheckedLen = $(this).closest('ul').prev('.li-hook').find('input[name^="auth"]:checked').length;//上级全选复选框选中数
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
                var prevAuthCheckedLen = $(this).closest('ul').prev('.li-hook').find('input[name^="auth"]:checked').length;//上级权限复选框选中数
                var nextAuthCheckedLen = $(this).closest('.li-hook').next('ul').find('input[name^="auth"]:checked').length;//下级权限复选框选中数
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
            obj.closest('.li-hook').next('ul').find('input[type="checkbox"]').prop('checked', status);
        },
        //关联上级
        _checkedPrev: function (obj) {
            var checkedLen = obj.closest('ul').find('input[type="checkbox"]:checked').length;
            var checkbox = obj.closest('ul').prev('.li-hook').find('input[type="checkbox"][name^="id"]');
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
            var checkbox = obj.closest('ul').prev('.li-hook').find('input[type="checkbox"][name^="id"]');
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