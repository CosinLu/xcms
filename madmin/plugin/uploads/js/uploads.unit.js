/**
 * Created by Admin on 2017/9/5.
 */
define(['jquery'], function ($) {
    return u = {
        //配置
        config: {
            'itemTemplate': '<div class="uploadifive-queue-item uploads-queue-item uploads-queue-item-hook">\
                            <span class="uploads-err uploads-err-hook"></span>\
                            <span class="uploads-move uploads-move-hook"></span>\
                            <div class="uploads-progress progress">\
                                <div class="progress-bar progress-bar-success"></div>\
                            </div>\
                            <div class="uploads-control ploads-control-hook">\
                                <a href="javascript:;" class="uploads-preview uploads-preview-hook"><i class="fa fa-search-plus"></i></a>\
                                <a href="javascript:;" class="uploads-destory uploads-destory-hook"><i class="fa fa-trash"></i></a>\
                            </div>\
                            <img class="uploads-thumb uploads-thumb-hook" src="" alt="">\
                            <input type="hidden" class="uploads-input-hook">\
                        </div>'
        },

        //缩略图
        thumbnail: function (ext) {
            if (!ext.length) return '';
            var src;
            var thumbnail = {
                'docx': 'plugin/uploads/images/docx.png',
                'jpg': 'plugin/uploads/images/jpg.png',
                'mp3': 'plugin/uploads/images/mp3.png',
                'mp4': 'plugin/uploads/images/mp4.png',
                'pdf': 'plugin/uploads/images/pdf.png',
                'pptx': 'plugin/uploads/images/pptx.png',
                'unknown': 'plugin/uploads/images/unknown.png',
                'xlsx': 'plugin/uploads/images/xlsx.png',
                'zip': 'plugin/uploads/images/zip.png'
            };
            ext = ext.replace('\.', '').toLowerCase();

            if ($.inArray(ext, ['doc', 'docx']) > -1) {
                src = thumbnail.docx;
            } else if ($.inArray(ext, ['jpg', 'png', 'gif', 'jpeg', 'bmp']) > -1) {
                src = thumbnail.jpg;
            } else if ($.inArray(ext, ['mp3', 'mid', 'ogg', 'mp4a', 'wav', 'wma']) > -1) {
                src = thumbnail.mp3;
            } else if ($.inArray(ext, ['avi', 'dv', 'mp4', 'mpeg', 'mpg', 'mov', 'wm', 'flv', 'mkv', 'swf']) > -1) {
                src = thumbnail.mp4;
            } else if ($.inArray(ext, ['pdf']) > -1) {
                src = thumbnail.pdf;
            } else if ($.inArray(ext, ['ppt', 'pptx']) > -1) {
                src = thumbnail.pptx;
            } else if ($.inArray(ext, ['xls', 'xlsx']) > -1) {
                src = thumbnail.xlsx;
            } else if ($.inArray(ext, ['7z', 'rar', 'zip']) > -1) {
                src = thumbnail.zip;
            } else {
                src = thumbnail.unknown;
            }
            return src;
        },

        //初始化数据
        initData: function () {
            require(['jqthumb'], function (jqthumb) {
                $('.uploads-queue-hook').each(function () {
                    var _this = $(this);
                    var list = _this.data('list');
                    var inputName = _this.attr('id');
                    if (!inputName) return false;
                    if (list != undefined) {
                        $.each(list, function (i, data) {
                            var item = $(u.config.itemTemplate).clone();
                            var src = eval(data.is_image) ? data.rel_path : u.thumbnail(data.file_ext);
                            var thumbSrc = data.thumb_rel_path || u.thumbnail(data.file_ext);
                            //状态
                            item.addClass('complete');
                            //预览图片信息
                            item.find('.uploads-preview-hook')
                                .attr('data-content', '{"src":"' + src + '","client_name":"' + data.client_name + '","file_size":"' + data.file_size + '","image_width":"' + data.image_width + '","image_height":"' + data.image_width + '","is_image":"' + data.is_image + '"}');
                            //input
                            item.find('.uploads-input-hook')
                                .attr('name', inputName + '[]').val(data.id);
                            //缩略图
                            item.find('.uploads-thumb-hook').attr('src', thumbSrc)
                                .attr('alt', data.client_name)
                                .jqthumb({width: '69', height: '69'});
                            //图片标题
                            item.attr('title', data.client_name);
                            //添加到容器
                            _this.append(item);
                        })
                    }
                })
            })
        },

        //拖拽
        dragSort: function () {
            require(['sortable'], function (Sortable) {
                $('.uploads-queue-hook').each(function () {
                    var id = $(this).attr('id');
                    if (!id) return false;
                    var el = document.getElementById(id);
                    var sortable = new Sortable(el, {
                        group: id,
                        handle: '.uploads-move-hook',
                        ghostClass: 'uploads-ghost',
                        chosenClass: "uploads-chosen",
                        draggable: '.uploads-queue-item-hook',
                    });
                });
            })
        },

        //上传预览
        uploadsPreview: function () {
            $(document).on('click', '.uploads-preview-hook', function () {
                var data = $(this).data('content');
                var content = '';
                content += '<div class="uploads-preview">';
                content += '<div class="uploads-preview-img">';
                content += '<img src="' + data.src + '">';
                content += '</div>';
                content += '<div class="uploads-preview-content">';
                content += '<div>名称：' + data.client_name + '</div>';
                if (data.is_image) {
                    content += '<div>尺寸：' + data.image_width + ' * ' + data.image_height + '</div>';
                }
                content += '<div>大小：' + data.file_size + ' KB</div>';
                content += '</div>';
                content += '</div>';
                parent.layer.open({
                    title: false,
                    area: '500px',
                    btn: false,
                    offset: '100px',
                    content: content
                });
            });
        },

        //删除上传
        uploadsDel: function () {
            $(document).on('click', '.uploads-destory-hook', function () {
                $(this).closest('.uploads-queue-item-hook').remove();
            });
        },

        //实例化上传组件
        initUploads: function () {
            require(['uploadifive'], function (uploadifive) {
                $('.uploads-btn-hook').uploadifive({
                    'auto': true,
                    'buttonClass': 'uploads-btn',
                    'buttonText': '+',
                    'formData': {
                        'timestamp': new Date().getTime(),
                        'token': Math.random()
                    },
                    'itemTemplate': u.config.itemTemplate,
                    'fileSizeLimit': '2MB',
                    'fileTypeSuffix': 'jpg,png,gif,bmp',
                    'uploadScript': 'index.php/uploads/do_upload',
                    'onUploadComplete': function (file, data) {
                        var data = $.parseJSON(data);
                        var item = file.queueItem;
                        var src = eval(data.is_image) ? data.rel_path : u.thumbnail(data.file_ext);
                        var thumbSrc = data.thumb_rel_path || u.thumbnail(data.file_ext);
                        //预览图片信息
                        item.find('.uploads-preview-hook')
                            .attr('data-content', '{"src":"' + src + '","client_name":"' + data.client_name + '","file_size":"' + data.file_size + '","image_width":"' + data.image_width + '","image_height":"' + data.image_height + '","is_image":"' + data.is_image + '"}');
                        //input
                        item.find('.uploads-input-hook')
                            .attr('name', data.input_name + '[]').val(data.id);
                        //缩略图
                        item.find('.uploads-thumb-hook').attr('src', thumbSrc)
                            .attr('alt', data.client_name)
                            .jqthumb({width: '69', height: '69'});
                        //图片标题
                        item.attr('title', data.client_name);
                    },
                    'onQueueComplete': function (uploads) {
                        //this.dragSort();
                    },
                    'onError': function (errorType, file, uploadAll) {
                        var item = file.queueItem;
                        switch (errorType) {
                            case '404_FILE_NOT_FOUND':
                                errorMsg = '404错误';
                                break;
                            case '403_FORBIDDEN':
                                errorMsg = '403禁止';
                                break;
                            case 'FORBIDDEN_FILE_TYPE':
                                errorMsg = '类型错误';
                                break;
                            case 'FILE_SIZE_LIMIT_EXCEEDED':
                                errorMsg = '文件太大';
                                break;
                            default:
                                errorMsg = '未知错误';
                                break;
                        }
                        item.find('.uploads-err-hook').html(errorMsg).show();
                        item.find('.uploads-thumb-hook').attr('src', 'plugin/uploads/images/damaged.png');
                    }
                });
            })
        },

        //云上传
        initCloudUplods: function () {
            require(['layer'], function () {
                $(document).on('click', '.uploads-cloud-btn-hook', function (e) {
                    e.preventDefault();
                    e.stopPropagation();
                    //容器
                    var queueID = $(this).data('id');
                    //是否多文件上传
                    var multi = $(this).data('multi') || false;
                    var url = $(this).data('url') || 'index.php/uploads/cloud';
                    var url = url + '?&queueid=' + queueID + '&multi=' + multi;
                    layer.open({
                        type: 2,
                        title: '云上传',
                        area: ['740px', '560px'],
                        content: url
                    })
                });
            })
        },
    }
});
