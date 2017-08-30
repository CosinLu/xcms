/**
 * Created by Admin on 2017/8/30.
 */
require(['unit', 'upload', 'jqthumb', 'layer'], function (unit, uploadifive, jqthumb) {
    var _queue = 'upload-queue-hook';
    var _queueItem = 'upload-queue-item-hook';
    var _thumb = 'thumb-hook';
    var _preview = 'preview-hook';
    var _destory = 'destory-hook';

    //获取窗口索引
    var index = parent.layer.getFrameIndex(window.name);

    //设置弹窗标题
    parent.layer.title('上传图片');

    //关闭窗口
    unit.layerClose(index);

    //预览
    unit.imagePreview();

    //删除上传文件
    $(document).on('click', '.' + _destory, function () {
        var _this = $(this);
        var _id = _this.data('id');
        unit.delUploadFile({
            id: _id,
            success: function (data) {
                if (parseInt(data) > 0) {
                    _this.closest('.' + _queueItem).remove();
                } else {
                    layer.msg('删除失败！', {icon: 2, shadeClose: true});
                }
            }
        });
    });

    //实例化uploadifive
    $('.upload-hook').uploadifive({
        'buttonClass': 'upload_btn',
        'buttonText': '+',
        'formData': {
            'timestamp': new Date().getTime(),
            'token': Math.random()
        },
        'queueID': _queue,
        'queueItem': _queueItem,
        'itemTemplate': '<div class="' + _queueItem + ' item">\
                                 <div class="progress">\
                                    <div class="progress-bar progress-bar-success"></div>\
                                 </div>\
                                 <div class="control">\
                                     <a href="javascript:;" class="' + _preview + '"><i class="fa fa-eye"></i></a>\
                                     <a href="javascript:;" class="' + _destory + '"><i class="fa fa-trash"></i></a>\
                                 </div>\
                                 <img class="' + _thumb + '" src="" alt="">\
                             </div>',
        'fileSizeLimit': '2MB',
        'fileType': 'jpg,png,gif,jpeg',
        'uploadScript': 'index.php/upload/do_upload',
        'onUploadComplete': function (file, data) {
            var _json = $.parseJSON(data);
            var _item = file.queueItem;
            //缩略图属性
            _item.find('.' + _thumb).attr('src', _json.full_path)
                .attr('alt', _json.client_name)
                .jqthumb({width: '69', height: '69'});
            //预览图片属性
            _item.find('.' + _preview).attr('data-src', _json.full_path);
            //删除上传图片属性
            _item.find('.' + _destory).attr('data-id', _json.id);
        },
        'onQueueComplete': function (uploads) {
        }
    });
});