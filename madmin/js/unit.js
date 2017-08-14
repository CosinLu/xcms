/**
 * Created by Admin on 2017/5/25.
 */
define(['jquery'], function ($) {
    return {
        //滚动条美化
        nanoscroller: function (options) {
            require(['nanoscroller'], function (nanoScroller) {
                var defaults = {
                    dom: '[data-name="nano"]'
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
                $('input[data-name="datetimepicker"]').datetimepicker({
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
                $('[data-name="editor"]').each(function () {
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
            $(document).on('click', 'input[name="checkAll"]', function () {
                var status = $(this).is(':checked');
                var checkbox = $(this).closest('[data-name="li"]').next('#list').find('input[type="checkbox"]');//全部复选框
                checkbox.prop('checked', status);
            });

            $(document).on("click change", 'input[name^="id"]', function () {
                var prevAuthCheckedLen = $(this).closest('ul').prev('[data-name="li"]').find('input[name^="auth"]:checked').length;//上级全选复选框选中数
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
                var prevAuthCheckedLen = $(this).closest('ul').prev('[data-name="li"]').find('input[name^="auth"]:checked').length;//上级权限复选框选中数
                var nextAuthCheckedLen = $(this).closest('[data-name="li"]').next('ul').find('input[name^="auth"]:checked').length;//下级权限复选框选中数
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
            obj.closest('[data-name="li"]').next('ul').find('input[type="checkbox"]').prop('checked', status);
        },
        //关联上级
        _checkedPrev: function (obj) {
            var checkedLen = obj.closest('ul').find('input[type="checkbox"]:checked').length;
            var checkbox = obj.closest('ul').prev('[data-name="li"]').find('input[type="checkbox"][name^="id"]');
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
            var checkbox = obj.closest('ul').prev('[data-name="li"]').find('input[type="checkbox"][name^="id"]');
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