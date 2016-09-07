/**
 * Created by MengXianghan on 2016/8/10.
 */
$(function () {
    var uploadifive = '[data-name="uploadifive"]';
    var $_uploadifive = $(uploadifive);
    var fileName;

    //设置容器
    $_uploadifive.each(function () {
        var name = $(this).prop('name');
        var queueBoxName = $(this).prop('name') + '-queue';
        $(this).attr('id', name);
        //容器
        if ($('#' + queueBoxName).length == 0) {
            $(this).before('<div class="row uploadifive-queue" id="' + queueBoxName + '"></div>');
        }
    });

    //当前触发的控件
    $(document).on('click', '.uploadifive-button', function () {
        fileName = $(this).find(uploadifive).prop('name');
    });

    //实例化
    $_uploadifive.uploadifive({
        //'auto': false,
        'buttonClass': 'btn btn-success',
        'buttonText': '选择文件',
        'height': 34,
        //'checkScript': 'index.php/uploadifive/check_exists',
        // 'fileObjName': 'image',
        // 'queueID': 'image-queue',
        'formData': {
            'timestamp': new Date().getTime(),
            'tokenuploadScript': Math.random(),
            'fileInput': 'image'
        },
        'multi': true,
        'itemTemplate': '<div class="uploadifive-queue-item col-xs-3">\
                            <div class="thumbnail">\
                                <img src="" data-src="holder.js/138x80?theme=primary" class="img">\
                                <div class="caption">\
                                    <p class="filename"></p>\
                                    <p><span class="filesize"></span><span class="fileinfo"></span></p>\
                                    <button type="button" class="close-item btn btn-danger btn-sm">删除</button>\
                                    <div class="progress">\
                                        <div class="progress-bar progress-bar-success"></div>\
                                    </div>\
                                </div>\
                            </div>\
                            <input type="hidden" name="" value="">\
                        </div>',
        'fileSizeLimit': '2GB',
        'fileType': false,
        'uploadScript': 'index.php/uploadifive/do_upload',
        'onUploadComplete': function (file, data) {
            //console.log(data);
            var json = $.parseJSON(data);
            var item = file.queueItem;
            item.find('input').val(json.id);

            if (json.is_image) {//图片自动缩放
                item.find('img').prop('src', json.full_path).jqthumb({width: 138, height: 80});
            } else {//生成图片
                Holder.run({
                    themes: {
                        "primary": {
                            bg: "#337AB7",
                            fg: "#fff",
                            text: 'File type is ' + json.ext
                        }
                    },
                    images: '#' + item[0]['id'] + ' img'
                });
            }

        }
    });

});
