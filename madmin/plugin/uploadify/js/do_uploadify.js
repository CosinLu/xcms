/**
 * Created by MengXianghan on 2016/8/8.
 */
$(function () {
    $(function () {
        var timestamp = new Date().getTime();
        var id = '[id^="file_upload"]';
        var server,
            swf,
            inputName,
            queueID;

        $('[data-name="uploadify"]').on('click', function () {
            server = $(this).data('server');
            swf = $(this).data('swf');
            inputName = $(this).data('input-name');
            queueID = $(this).data('queue-id');
        });

        $(id).uploadify({
            'formData': {
                'timestamp': timestamp,
                'token': Math.random()
            },
            'auto': false,
            'buttonClass': 'btn btn-success',
            'buttonText': '选择文件',
            'height': 34,
            'queueID': queueID ? queueID : false,
            'swf': swf ? swf : 'plugin/uploadify/uploadify.swf',
            'uploader': server ? server : 'uploadify.php',
            'itemTemplate': '<div id="${fileID}" class="uploadify-queue-item">\
                                <div class="item-info">\
                                    <span class="fileName">${fileName} (${fileSize})</span><span class="data"></span>\
                                </div>\
                                <div class="item-opera">\
                                    <div class="row">\
                                        <a class="btn btn-danger btn-sm pull-right" href="javascript:$(\'#${instanceID}\').uploadify(\'cancel\', \'${fileID}\')">删除</a>\
                                    </div>\
                                </div>\
                                <div class="uploadify-progress">\
                                    <div class="uploadify-progress-bar"></div>\
                                </div>\
                              </div>',
            'onUploadSuccess': function (file, data, response) {
                $('#' + file.id).find('.item-info').fadeOut();
                $('#' + file.id).append('<div class="item-img">\
                                            <img src="" alt="">\
                                         </div>\
                                         <input type="hidden" name="' + inputName + '" value="" >')
            }
        });
    });
});


/*
 <div id="${fileID}" class="uploadify-queue-item">\
 <div class="item-img">\
 <img src="" alt="">\
 </div>\
 <div class="item-info">\
 <span class="fileName">${fileName} (${fileSize})</span><span class="data"></span>\
 </div>\
 <div class="item-opera">\
 <div class="row">\
 <a class="btn btn-danger btn-sm pull-right" href="javascript:$(\'#${instanceID}\').uploadify(\'cancel\', \'${fileID}\')">删除</a>\
 </div>\
 </div>\
 <div class="uploadify-progress">\
 <div class="uploadify-progress-bar"></div>\
 </div>\
 <input type="hidden" name="' + inputName + '" value="" >\
 </div>*/
