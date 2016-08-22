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
        //'checkScript': 'plugin/uploadifive/check-exists.php',
        'fileObjName'      : 'file_upload',
        'formData': {
            'timestamp': timestamp,
            'token': Math.random()
        },
        'queueID': 'queue',
        'itemTemplate': '<div class="uploadifive-queue-item col-xs-3">\
                            <div class="thumbnail">\
                                <img src="">\
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
        'uploadScript': 'index.php/uploadifive/upload',
        'onUploadComplete': function (file, data) {
            console.log(data);
            //file.queueItem.find('img').attr('src',file.name);
        }
    });
});
