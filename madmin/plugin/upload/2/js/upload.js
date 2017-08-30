/**
 * Created by MengXianghan on 2016/8/10.
 */
require(['jquery', 'upload2', 'jqthumb', 'holder', 'dragsort', 'unit'], function ($, uploadifive, jqthumb, holder, dragsort, unit) {
    var _uploadBtn = 'upload2-btn-hook';
    var $_uploadBtn = $('.' + _uploadBtn);
    var _queue = 'upload2-queue-hook';
    var _queueItem = 'upload2-queue-item-hook';
    var _thumb = 'thumb-hook';
    var _preview = 'preview-hook';
    var _destory = 'destory-hook';
    var _input = 'input-hook';
    var _fileName = '';

    //移除元素
    $(document).on('click', '.close-item', function (e) {
        e.stopPropagation();

    });

    //图片等比缩放
    $('.' + _queueItem).each(function () {
        var _img = $(this).find('.' + _thumb);
        if (img.length > 0 && img.data('src').length <= 0) {
            img.jqthumb({width: 138, height: 80});
        }
    });

    //拖拽排序
    $('.' + _uploadBtn).each(function () {
        var id = '#' + $(this).attr('name') + '-queue-hook';
        if ($(this).data('multi')) {
            unit.dragsort(id);
        }
    });

    //本地浏览
    $_uploadBtn.uploadifive({
        'buttonClass': 'btn btn-success',
        'buttonText': '本地浏览',
        'formData': {
            'timestamp': new Date().getTime(),
            'token': Math.random(),
        },
        'itemTemplate': '<div class="' + _queueItem + '" col-xs-3 item">\
                            <div class="thumbnail">\
                                <div class="thumb"><img src="" class="' + _thumb + '"></div>\
                                <div class="caption">\
                                    <p class="filename"></p>\
                                    <button type="button" class="close-item btn btn-danger btn-sm">删除</button>\
                                    <div class="progress">\
                                        <div class="progress-bar progress-bar-success"></div>\
                                    </div>\
                                </div>\
                                <input type="hidden" class="' + _input + '" name="" value="">\
                            </div>\
                        </div>',
        'fileSizeLimit': '100MB',
        'fileType': false,
        'uploadScript': 'index.php/upload/do_upload',
        'onUploadComplete': function (file, data) {
            //console.log(data);
            var json = $.parseJSON(data);
            var item = file.queueItem;
            item.find('.' + _input).attr('name', json.file_obj_name + '[]').val(json.id);

            //生成缩略图
            if (json.is_image) {//图片自动缩放
                item.find('.' + _thumb).attr('src', json.full_path).jqthumb({width: '100%', height: '80'});
            } else {//生成图片
                item.find('.' + _thumb).attr('data-src', 'holder.js/100px80?theme=sky&text=文件类型 ' + json.ext);
                require(['holder'], function (Holder) {
                    Holder.run({
                        images: '#' + item[0]['id'] + ' img'
                    });
                })
            }
            _fileName = json.file_obj_name;
        },
        'onQueueComplete': function (uploads) {
            unit.dragsort('#' + _fileName + '-queue-hook');
        }
    });

    //在线浏览
    var _uploadOnline = 'upload-online-hook';
    var $_uploadOnline = $('.' + _uploadOnline);
    $_uploadOnline.on('click', function () {
        var _multi = $(this).data('multi');
        var _fileName = $(this).attr('name');
        layer.open({
            type: 2,
            title: '在线浏览',
            area: ['740px', '500px'],
            content: 'index.php/uploadifive/online?multi=' + _multi + '&name=' + _fileName
        });
    });
});
