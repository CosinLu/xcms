/**
 * Created by MengXianghan on 2016/8/10.
 */
$(function () {
    var timestamp = new Date().getTime();
    $('#file_upload').uploadifive({
        // 'auto': false,
        'buttonClass': 'btn btn-success',
        'buttonText': '选择文件',
        'height': 34,
        //'checkScript': 'index.php/uploadifive/check_exists',
        'fileObjName': 'file_upload',
        'formData': {
            'timestamp': timestamp,
            'tokenuploadScript': Math.random()
        },
        'queueID': 'queue',
        'itemTemplate': '<div class="uploadifive-queue-item col-xs-3">\
                            <div class="thumbnail">\
                                <img src="" data-src="holder.js/138x80">\
                                <div class="caption">\
                                    <p class="filename"></p>\
                                    <p><span class="filesize"></span>&nbsp;&nbsp;<span class="fileinfo"></span></p>\
                                    <button type="button" class="close-item btn btn-danger btn-sm">删除</button>\
                                    <div class="progress">\
                                        <div class="progress-bar progress-bar-success"></div>\
                                    </div>\
                                </div>\
                            </div>\
                        </div>',
        'fileSizeLimit': '2GB',
        'fileType': ['jpg', 'jpeg', 'gif', 'png', 'zip'],
        'uploadScript': 'index.php/uploadifive/do_upload',
        'onUploadComplete': function (file, data) {
            var json = $.parseJSON(data);
            console.log(json);
            Holder.run();
            file.queueItem.find('img').attr('src', json.full_path).jqthumb({
                width: 138,
                height: 80
            });
        }
    });

});
