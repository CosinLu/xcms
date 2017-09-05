/**
 * Created by Admin on 2017/5/24.
 */
window.UEDITOR_HOME_URL = document.getElementsByTagName('base')[0].href + '/plugin/ueditor/';
require.config({
    paths: {
        'css'           : 'plugin/css.min',
        'jquery'        : 'js/jquery.min-1.11.1',
        'unit'          : 'js/unit',
        'bootstrap'     : 'plugin/bootstrap/js/bootstrap.min',
        'colorpicker'   : 'plugin/bootstrap-colorpicker/js/bootstrap-colorpicker.min',
        'datetimepicker': 'plugin/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN',
        'dragsort'      : 'plugin/dragsort/jquery.dragsort-0.5.2.min',
        'dropload'      : 'plugin/dropload/dropload.min',
        'iconpicker'    : 'plugin/fontawesome-iconpicker/js/fontawesome-iconpicker',
        'layer'         : 'plugin/layer/layer',
        'mtree'         : 'plugin/mtree/js/mtree',
        'ueditor'       : 'plugin/ueditor/ueditor.all.min',
        'jqthumb'       : 'plugin/jqthumb/jqthumb.min',
        'form'          : 'plugin/jquery.form.min',
        'sortable'      : 'plugin/sortable/Sortable.min',
        'template'      : 'plugin/template',
        'scroller'      : 'plugin/nanoscroller/js/jquery.nanoscroller.min',
        'uploadifive'   : 'plugin/uploads/js/jquery.uploadifive',
        'uploadsUnit'  : 'plugin/uploads/js/uploads.unit',
        'uploads'       : 'plugin/uploads/js/uploads',
    },
    shim : {
        'bootstrap'     : {
            deps: ['jquery'
                , 'css!plugin/font-awesome/css/font-awesome.min.css']
        },
        'colorpicker'   : {
            deps: ['bootstrap'
                , 'css!plugin/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css']
        },
        'datetimepicker': {
            deps: ['bootstrap'
                , 'plugin/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min'
                , 'css!plugin/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css'
                , 'css!plugin/../css/datetimepicker.css']
        },
        'dropload'      : {
            deps: ['jquery'
                , 'css!plugin/dropload/dropload.css']
        },
        'iconpicker'    : {
            deps: ['jquery'
                , 'bootstrap'
                , 'css!plugin/fontawesome-iconpicker/css/fontawesome-iconpicker.min.css'
                , 'css!plugin/../css/iconpicker.css']
        },
        'mtree'         : {
            deps: ['jquery'
                , 'css!plugin/mtree/css/mtree.css']
        },
        'ueditor'       : {
            deps   : ['plugin/ueditor/third-party/zeroclipboard/ZeroClipboard.min.js'
                , 'plugin/ueditor/ueditor.config.js'],
            exports: 'UE',
            init   : function (ZeroClipboard) {
                //导出到全局变量，供ueditor使用
                window.ZeroClipboard = ZeroClipboard;
            }
        },
        'template'      : {
            deps: ['jquery']
        },
        'scroller'      : {
            deps: ['jquery'
                , 'css!plugin/nanoscroller/css/nanoscroller.css']
        }
    }

});

require(['jquery', 'unit', 'bootstrap', 'layer'], function ($, unit) {

    //配置layer
    unit.layerConfig();

    //返回上一级
    unit.goBack();

    //滚动条美化
    unit.scroller();

    //sidebar
    unit.sidebarTree();
    unit.mainSidebarTree();

    //全选
    unit.checkAll();

    //回车搜索
    unit.enterSearch();

    //删除
    unit.del();

    //批量删除
    unit.batchDel();

    //异步提交表单
    unit.ajaxForm();

    //缩略图预览
    unit.imagePreview();
});
