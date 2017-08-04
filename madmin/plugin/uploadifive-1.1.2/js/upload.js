/**
 * Created by MengXianghan on 2016/8/10.
 */
require(['jquery', 'jquery', 'uploadifive_mcms', 'jqthumb', 'holder', 'dragsort','unit'], function ($, jQuery, uploadifive, jqthumb, holder, dragsort,unit) {
    var uploadifive = '[data-name="uploadifive"]';
    var $_uploadifive = $(uploadifive);
    var fileName = '';

    //删除元素
    $(document).on('click', '.close-item', function (e) {
        e.stopPropagation();
        $_uploadifive.data('uploadifive').removeQueueItem($(this));
    });

    //缩略图
    $('.uploadifive-queue-item').each(function () {
        var img = $(this).find('img');
        if (img.length > 0 && img.data('src').length <= 0) {
            img.jqthumb({width: 138, height: 80});
        }
    });

    //拖拽排序
    $(uploadifive).each(function () {
        var id = '#uploadifive-' + $(this).attr('name') + '-queue';
        var multi = $(this).data('multi');
        if (multi) {
            unit.dragsort(id);
        }
    });

    //本地浏览
    $_uploadifive.uploadifive({
        'buttonClass': 'btn btn-success',
        'buttonText': '本地浏览',
        'height': 34,
        //'checkScript': 'index.php/uploadifive/check_exists',
        'formData': {
            'timestamp': new Date().getTime(),
            'token': Math.random(),
        },
        'itemTemplate': '<div class="uploadifive-queue-item col-xs-3">\
                            <div class="thumbnail">\
                                <div class="thumb"><img src=""></div>\
                                <div class="caption">\
                                    <p class="filename"></p>\
                                    <p><span class="filesize"></span><span class="fileinfo"></span></p>\
                                    <button type="button" class="close-item btn btn-danger btn-sm">删除</button>\
                                    <div class="progress">\
                                        <div class="progress-bar progress-bar-success"></div>\
                                    </div>\
                                </div>\
                                <input type="hidden" name="" value="">\
                            </div>\
                        </div>',
        'fileSizeLimit': '100MB',
        'fileType': false,
        'uploadScript': 'index.php/uploadifive/do_upload',
        'onUploadComplete': function (file, data) {
            //console.log(data);
            var json = $.parseJSON(data);
            var item = file.queueItem;
            item.find('input').prop('name', json.file_obj_name + '[]').val(json.id);

            //生成缩略图
            if (json.is_image) {//图片自动缩放
                item.find('img').attr('src', json.full_path).jqthumb({width: '100%', height: '80'});
            } else {//生成图片
                item.find('img').attr('data-src', 'holder.js/100px80?theme=sky&text=文件类型 ' + json.ext);
                require(['holder'], function (Holder) {
                    Holder.run({
                        images: '#' + item[0]['id'] + ' img'
                    });
                })
            }
            fileName = json.file_obj_name;
        },
        'onQueueComplete': function (uploads) {
            unit.dragsort("#uploadifive-" + fileName + "-queue");
        }
    });

    //在线浏览
    var uploadonline = '[data-name="uploadonline"]';
    var $_uploadonline = $(uploadonline);
    $_uploadonline.on('click', function () {
        var multi = $(this).data('multi');
        var name = $(this).attr('name');
        layer.open({
            type: 2,
            title: '在线浏览',
            area: ['740px', '500px'],
            content: 'index.php/uploadifive/online?multi=' + multi + '&name=' + name
        });
    });
});
