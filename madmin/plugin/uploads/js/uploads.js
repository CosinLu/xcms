/**
 * Created by Admin on 2017/8/30.
 */
require(['jquery', 'unit', 'uploads', 'jqthumb', 'sortable', 'layer'], function ($, unit, uploadifive, jqthumb, Sortable) {
    var queue = 'uploads-queue-hook';
    var queueItem = 'uploads-queue-item-hook';
    var thumb = 'uploads-thumb-hook';
    var preview = 'uploads-preview-hook';
    var destory = 'uploads-destory-hook';
    var input = 'uploads-input-hook';
    var progress = 'uploads-progress-hook';
    var control = 'uploads-control-hook';
    var move = 'uploads-move-hook';
    var itemTemplate = '<div class="uploads-queue-item ' + queueItem + '">\
                            <span class="uploads-move ' + move + '"></span>\
                            <div class="' + progress + ' uploads-progress progress">\
                                <div class="progress-bar progress-bar-success"></div>\
                            </div>\
                            <div class="uploads-control ' + control + '">\
                                <a href="javascript:;" class="uploads-preview ' + preview + '"><i class="fa fa-search-plus"></i></a>\
                                <a href="javascript:;" class="uploads-destory ' + destory + '"><i class="fa fa-trash"></i></a>\
                            </div>\
                            <img class="uploads-thumb ' + thumb + '" src="" alt="">\
                            <input type="hidden" class="' + input + '">\
                        </div>';

    //缩略图
    var thumbnail = function (ext) {
        if (!ext.length) return '';
        var src;
        var thumbnail = {
            'zip': 'plugin/uploads/images/zip.png',
            'ai': 'plugin/uploads/images/ai.png',
            'apk': 'plugin/uploads/images/apk.png',
            'excel': 'plugin/uploads/images/excel.png',
            'flash': 'plugin/uploads/images/flash.png',
            'image': 'plugin/uploads/images/image.png',
            'music': 'plugin/uploads/images/music.png',
            'pdf': 'plugin/uploads/images/pdf.png',
            'ppt': 'plugin/uploads/images/ppt.png',
            'psd': 'plugin/uploads/images/psd.png',
            'video': 'plugin/uploads/images/video.png',
            'word': 'plugin/uploads/images/word.png',
            'unknown': 'plugin/uploads/images/unknown.png'
        };
        ext = ext.replace('\.', '').toLowerCase();
        if ($.inArray(ext, ['7z', 'rar', 'zip']) > -1) {
            src = thumbnail.zip;
        } else if ($.inArray(ext, ['ai']) > -1) {
            src = thumbnail.ai;
        } else if ($.inArray(ext, ['apk']) > -1) {
            src = thumbnail.apk;
        } else if ($.inArray(ext, ['xls', 'xlsx']) > -1) {
            src = thumbnail.excel;
        } else if ($.inArray(ext, ['flv', 'flash']) > -1) {
            src = thumbnail.flash;
        } else if ($.inArray(ext, ['jpg', 'png', 'gif', 'bmp']) > -1) {
            src = thumbnail.image;
        } else if ($.inArray(ext, ['mp3', 'ogg', 'wav']) > -1) {
            src = thumbnail.music;
        } else if ($.inArray(ext, ['pdf']) > -1) {
            src = thumbnail.pdf;
        } else if ($.inArray(ext, ['ppt', 'pptx']) > -1) {
            src = thumbnail.ppt;
        } else if ($.inArray(ext, ['psd']) > -1) {
            src = thumbnail.psd;
        } else if ($.inArray(ext, ['mp4', 'rm', '3gp', 'avi', 'wma', 'rmvb']) > -1) {
            src = thumbnail.video;
        } else if ($.inArray(ext, ['doc', 'docx']) > -1) {
            src = thumbnail.word;
        } else {
            src = thumbnail.unknown;
        }
        return src;
    };

    //设置弹窗标题
    parent.layer.title('上传图片');

    //初始化数据
    var initData = function () {
        $('.' + queue).each(function () {
            var _this = $(this);
            var list = $(this).data('list');
            if (list != undefined) {
                $.each(list, function (i, e) {
                    var $item = $(itemTemplate).clone();
                    var src = (parseInt(e.upl_image)) ? e.upl_path : thumbnail(e.upl_ext);
                    $item.addClass('complete');
                    $item.find('.' + preview)
                        .attr('data-src', src)
                        .attr('data-name', e.upl_name);
                    $item.find('.' + input)
                        .attr('name', _this.attr('id') + '[]');
                    $item.find('.' + input).val(e.upl_id);
                    $item.find('.' + progress).remove();
                    $item.find('.' + thumb).attr('src', src)
                        .attr('alt', e.upl_name)
                        .jqthumb({width: '69', height: '69'});
                    _this.append($item);
                })
            }
        })
    };
    initData();

    //拖拽排序
    var Dragsort = function () {
        $('.' + queue).each(function () {
            var id = $(this).attr('id');
            var el = document.getElementById(id);
            var sortable = new Sortable(el, {
                group: id,
                handle: '.' + move,
                ghostClass: 'uploads-ghost',
                chosenClass: "uploads-chosen",
                draggable: "." + queueItem,
            });
        });
    };
    Dragsort();

    //预览
    $(document).on('click', '.' + preview, function () {
        var src = $(this).data('src');
        var name = $(this).data('name');
        var nameContent = (name) ? '<div class="uploads-preview-name">' + name + '</div>' : '';
        parent.layer.open({
            title: false,
            area: '500px',
            btn: false,
            offset: '100px',
            content: '<div class="uploads-preview"><img src="' + src + '">' + nameContent + '</div>'
        });
    });

    //

    //删除上传文件
    $(document).on('click', '.' + destory, function () {
        $(this).closest('.' + queueItem).remove();
    });

    //实例化uploadifive
    $('.uploads-btn-hook').uploadifive({
        'auto': true,
        'buttonClass': 'uploads-btn',
        'buttonText': '+',
        'formData': {
            'timestamp': new Date().getTime(),
            'token': Math.random()
        },
        'queueItem': queueItem,
        'itemTemplate': itemTemplate,
        'fileSizeLimit': '100MB',
        'fileTypeSuffix': 'jpg,png,gif,zip,rar,doc,docx,xls',
        'uploadScript': 'index.php/uploads/do_upload',
        'onUploadComplete': function (file, data) {
            var data = $.parseJSON(data);
            var item = file.queueItem;
            var full_path = '';
            //缩略图
            if (data.upl_image) {
                full_path = data.upl_path;
            } else {
                full_path = thumbnail(data.upl_ext);
            }
            item.find('.' + thumb).attr('src', full_path)
                .attr('alt', data.upl_name)
                .jqthumb({width: '69', height: '69'});

            //预览图片属性
            item.find('.' + preview).attr('data-src', full_path).attr('data-name', data.upl_name);
            //删除上传图片属性
            //item.find('.' + destory).attr('data-id', data.id);
            //input赋值
            item.find('.' + input).attr('name', data.upl_input + '[]').val(data.upl_id);
        },
        'onQueueComplete': function (uploads) {
            //Dragsort();
        },
        'onError': function (errorType) {
            // console.log('The error was: ' + errorType);
        }
    });
});