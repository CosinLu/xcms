/**
 * Created by Admin on 2017/8/30.
 */
require(['unit', 'uploads', 'jqthumb', 'dragsort', 'layer'], function (unit, uploadifive, jqthumb, dragsort) {
    var _queue = 'uploads-queue-hook';
    var _queueItem = 'uploads-queue-item-hook';
    var _thumb = 'thumb-hook';
    var _preview = 'preview-hook';
    var _destory = 'destory-hook';
    var _input = 'input-hook';

    //获取窗口索引
    var index = parent.layer.getFrameIndex(window.name);

    //设置弹窗标题
    parent.layer.title('上传图片');

    //拖拽排序
    unit.dragsort(_queue);

    //关闭窗口
    unit.layerClose(index);

    //预览
    unit.imagePreview();

    //删除上传文件
    $(document).on('click', '.' + _destory, function () {
        $(this).closest('.' + _queueItem).remove();
    });

    //实例化uploadifive
    $('.uploads-hook').uploadifive({
        'auto'            : true,
        'buttonClass'     : 'upload_btn',
        'buttonText'      : '+',
        'formData'        : {
            'timestamp': new Date().getTime(),
            'token'    : Math.random(),
            'filename' : 'image_upload'
        },
        //'queueID'         : _queue,
        'queueItem'       : _queueItem,
        'itemTemplate'    : '<div class="' + _queueItem + ' item">\
                                <div class="progress">\
                                    <div class="progress-bar progress-bar-success"></div>\
                                </div>\
                                <div class="control">\
                                    <a href="javascript:;" class="priview ' + _preview + '"><i class="fa fa-search-plus"></i></a>\
                                    <a href="javascript:;" class="destory ' + _destory + '"><i class="fa fa-trash"></i></a>\
                                </div>\
                                <img class="' + _thumb + '" src="" alt="">\
                                <input type="hidden" name="" value="" class="' + _input + '">\
                            </div>',
        'fileSizeLimit'   : '2MB',
        'fileTypeSuffix'  : 'jpg,png,gif,zip,rar,doc,docx,xls',
        'uploadScript'    : 'index.php/uploads/do_upload',
        'onUploadComplete': function (file, data) {
            var _json = $.parseJSON(data);
            var _item = file.queueItem;
            //console.log(_json);
            //缩略图属性
            _item.find('.' + _thumb).attr('src', _json.full_path)
                .attr('alt', _json.client_name)
                .jqthumb({width: '69', height: '69'});
            //预览图片属性
            _item.find('.' + _preview).attr('data-src', _json.full_path);
            //删除上传图片属性
            _item.find('.' + _destory).attr('data-id', _json.id);
            //input赋值
            _item.find('.' + _input).attr('name', _json.filename + '[]');
            _item.find('.' + _input).val(_json.id);
        },
        'onQueueComplete' : function (uploads) {
            //console.log(uploads);
            unit.dragsort(_queue);
        }
    });
});