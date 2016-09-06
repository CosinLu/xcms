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
                                <img src="" data-src="holder.js/138x80?theme=primary">\
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
            var json = $.parseJSON(data);
            //console.log(json);
            file.queueItem.find('input').val(json.id);
            if (json.is_image) {
                file.queueItem.find('img').attr('src', json.full_path).jqthumb({width: 138, height: 80});
            } else {
                Holder.addTheme("primary", {bg: '#337AB7', fg: '#fff', text: 'File type is ' + json.ext}).run();
            }
        }
    });

});
