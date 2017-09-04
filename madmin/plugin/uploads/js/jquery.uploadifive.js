/*
 UploadiFive 1.1.2
 Copyright (c) 2012 Reactive Apps, Ronnie Garcia
 Released under the UploadiFive Standard License <http://www.uploadify.com/uploadifive-standard-license>
 */
;(function ($) {

    var methods = {

        init: function (options) {

            return this.each(function () {

                // Create a reference to the jQuery DOM object
                var $this = $(this);
                $this.data('uploadifive', {
                    inputs    : {}, // The object that contains all the file inputs
                    inputCount: 0,  // The total number of file inputs created
                    fileID    : 0,
                    queue     : {
                        count    : 0, // Total number of files in the queue
                        selected : 0, // Number of files selected in the last select operation
                        replaced : 0, // Number of files replaced in the last select operation
                        errors   : 0, // Number of files that returned an error in the last select operation
                        queued   : 0, // Number of files added to the queue in the last select operation
                        cancelled: 0  // Total number of files that have been cancelled or removed from the queue
                    },
                    uploads   : {
                        current   : 0, // Number of files currently being uploaded
                        attempts  : 0, // Number of file uploads attempted in the last upload operation
                        successful: 0, // Number of files successfully uploaded in the last upload operation
                        errors    : 0, // Number of files returning errors in the last upload operation
                        count     : 0  // Total number of files uploaded successfully
                    }
                });
                var $data = $this.data('uploadifive');

                // Set the default options
                var settings = $data.settings = $.extend({
                    'auto'           : true,               // Automatically upload a file when it's added to the queue
                    'buttonClass'    : false,              // A class to add to the UploadiFive button
                    'buttonText'     : 'Select Files',     // The text that appears on the UploadiFive button
                    'checkScript'    : false,              // Path to the script that checks for existing file names
                    'dnd'            : true,               // Allow drag and drop into the queue
                    'dropTarget'     : false,              // Selector for the drop target
                    'fileObjName'    : 'Filedata',         // The name of the file object to use in your server-side script
                    'fileSizeLimit'  : 0,                  // Maximum allowed size of files to upload
                    'fileType'       : false,              // Type of files allowed (image, etc)
                    'fileTypeSuffix' : false,              //允许上传的文件后缀
                    'formData'       : {},                 // Additional data to send to the upload script
                    'height'         : 30,                 // The height of the button
                    'itemTemplate'   : false,              // The HTML markup for the item in the queue
                    'method'         : 'post',             // The method to use when submitting the upload
                    'multi'          : true,               // Set to true to allow multiple file selections
                    'overrideEvents' : [],                 // An array of events to override
                    'queueID'        : false,              // The ID of the file queue
                    'queueItem'      : 'uploadifive-queue-item',
                    'queueSizeLimit' : 0,                  // The maximum number of files that can be in the queue
                    'removeCompleted': false,              // Set to true to remove files that have completed uploading
                    'simUploadLimit' : 0,                  // The maximum number of files to upload at once
                    'truncateLength' : 0,                  // The length to truncate the file names to
                    'uploadLimit'    : 0,                  // The maximum number of files you can upload
                    'uploadScript'   : 'uploadifive.php',  // The path to the upload script
                    'width'          : 100,                // The width of the button
                    'cloud'          : false,
                    'cloudUrl'       : 'index.php/uploads/cloud'

                    /*
                     // Events
                     'onAddQueueItem'   : function(file) {},                        // Triggered for each file that is added to the queue
                     'onCancel'         : function(file) {},                        // Triggered when a file is cancelled or removed from the queue
                     'onCheck'          : function(file, exists) {},                // Triggered when the server is checked for an existing file
                     'onClearQueue'     : function(queue) {},                       // Triggered during the clearQueue function
                     'onDestroy'        : function() {}                             // Triggered during the destroy function
                     'onDrop'           : function(files, numberOfFilesDropped) {}, // Triggered when files are dropped into the file queue
                     'onError'          : function(file, fileType, data) {},        // Triggered when an error occurs
                     'onFallback'       : function() {},                            // Triggered if the HTML5 File API is not supported by the browser
                     'onInit'           : function() {},                            // Triggered when UploadiFive if initialized
                     'onQueueComplete'  : function() {},                            // Triggered once when an upload queue is done
                     'onProgress'       : function(file, event) {},                 // Triggered during each progress update of an upload
                     'onSelect'         : function() {},                            // Triggered once when files are selected from a dialog box
                     'onUpload'         : function(file) {},                        // Triggered when an upload queue is started
                     'onUploadComplete' : function(file, data) {},                  // Triggered when a file is successfully uploaded
                     'onUploadFile'     : function(file) {},                        // Triggered for each file being uploaded
                     */
                }, options);

                settings.auto           = !$this.data('auto') || settings.auto;
                settings.buttonClass    = $this.data('button-class') || settings.buttonClass;
                settings.buttonText     = $this.data('button-text') || settings.buttonText;
                settings.checkScript    = $this.data('check-script') || settings.checkScript;
                settings.dropTarget     = $this.data('drop-target') || settings.dropTarget;
                settings.fileObjName    = $this.data('name') || settings.fileObjName;
                settings.fileSizeLimit  = $this.data('file-size-limit') || settings.fileSizeLimit;
                settings.fileType       = $this.data('file-type') || settings.fileType;
                settings.fileTypeSuffix = $this.data('file-type-suffix') || settings.fileTypeSuffix;
                settings.height         = $this.data('height') || settings.height;
                settings.method         = $this.data('method') || settings.method;
                settings.multi          = $this.data('multi') && settings.multi;
                settings.mime           = {
                    // 'hqx': ['application/mac-binhex40', 'application/mac-binhex', 'application/x-binhex40', 'application/x-mac-binhex40'],
                    // 'cpt': 'application/mac-compactpro',
                    // 'csv': ['text/x-comma-separated-values', 'text/comma-separated-values', 'application/octet-stream', 'application/vnd.ms-excel', 'application/x-csv', 'text/x-csv', 'text/csv', 'application/csv', 'application/excel', 'application/vnd.msexcel', 'text/plain'],
                    // 'bin': ['application/macbinary', 'application/mac-binary', 'application/octet-stream', 'application/x-binary', 'application/x-macbinary'],
                    // 'dms': 'application/octet-stream',
                    // 'lha': 'application/octet-stream',
                    // 'lzh': 'application/octet-stream',
                    // 'exe': ['application/octet-stream', 'application/x-msdownload'],
                    // 'class': 'application/octet-stream',
                    // 'psd': ['application/x-photoshop', 'image/vnd.adobe.photoshop'],
                    // 'so': 'application/octet-stream',
                    // 'sea': 'application/octet-stream',
                    // 'dll': 'application/octet-stream',
                    // 'oda': 'application/oda',
                    // 'pdf': ['application/pdf', 'application/force-download', 'application/x-download', 'binary/octet-stream'],
                    // 'ai': ['application/pdf', 'application/postscript'],
                    // 'eps': 'application/postscript',
                    // 'ps': 'application/postscript',
                    // 'smi': 'application/smil',
                    // 'smil': 'application/smil',
                    // 'mif': 'application/vnd.mif',
                    // 'xls': ['application/vnd.ms-excel', 'application/msexcel', 'application/x-msexcel', 'application/x-ms-excel', 'application/x-excel', 'application/x-dos_ms_excel', 'application/xls', 'application/x-xls', 'application/excel', 'application/download', 'application/vnd.ms-office', 'application/msword'],
                    // 'ppt': ['application/powerpoint', 'application/vnd.ms-powerpoint', 'application/vnd.ms-office', 'application/msword'],
                    // 'pptx': ['application/vnd.openxmlformats-officedocument.presentationml.presentation', 'application/x-zip', 'application/zip'],
                    // 'wbxml': 'application/wbxml',
                    // 'wmlc': 'application/wmlc',
                    // 'dcr': 'application/x-director',
                    // 'dir': 'application/x-director',
                    // 'dxr': 'application/x-director',
                    // 'dvi': 'application/x-dvi',
                    // 'gtar': 'application/x-gtar',
                    // 'gz': 'application/x-gzip',
                    // 'gzip': 'application/x-gzip',
                    // 'php': ['application/x-httpd-php', 'application/php', 'application/x-php', 'text/php', 'text/x-php', 'application/x-httpd-php-source'],
                    // 'php4': 'application/x-httpd-php',
                    // 'php3': 'application/x-httpd-php',
                    // 'phtml': 'application/x-httpd-php',
                    // 'phps': 'application/x-httpd-php-source',
                    // 'js': ['application/x-javascript', 'text/plain'],
                    // 'swf': 'application/x-shockwave-flash',
                    // 'sit': 'application/x-stuffit',
                    // 'tar': 'application/x-tar',
                    // 'tgz': ['application/x-tar', 'application/x-gzip-compressed'],
                    // 'z': 'application/x-compress',
                    // 'xhtml': 'application/xhtml+xml',
                    // 'xht': 'application/xhtml+xml',
                    // 'zip': ['application/x-zip', 'application/zip', 'application/x-zip-compressed', 'application/s-compressed', 'multipart/x-zip'],
                    // 'rar': ['application/x-rar', 'application/rar', 'application/x-rar-compressed'],
                    // 'mid': 'audio/midi',
                    // 'midi': 'audio/midi',
                    // 'mpga': 'audio/mpeg',
                    // 'mp2': 'audio/mpeg',
                    // 'mp3': ['audio/mpeg', 'audio/mpg', 'audio/mpeg3', 'audio/mp3'],
                    // 'aif': ['audio/x-aiff', 'audio/aiff'],
                    // 'aiff': ['audio/x-aiff', 'audio/aiff'],
                    // 'aifc': 'audio/x-aiff',
                    // 'ram': 'audio/x-pn-realaudio',
                    // 'rm': 'audio/x-pn-realaudio',
                    // 'rpm': 'audio/x-pn-realaudio-plugin',
                    // 'ra': 'audio/x-realaudio',
                    // 'rv': 'video/vnd.rn-realvideo',
                    // 'wav': ['audio/x-wav', 'audio/wave', 'audio/wav'],
                    // 'bmp': ['image/bmp', 'image/x-bmp', 'image/x-bitmap', 'image/x-xbitmap', 'image/x-win-bitmap', 'image/x-windows-bmp', 'image/ms-bmp', 'image/x-ms-bmp', 'application/bmp', 'application/x-bmp', 'application/x-win-bitmap'],
                    // 'gif': 'image/gif',
                    // 'jpeg': ['image/jpeg', 'image/pjpeg'],
                    // 'jpg': ['image/jpeg', 'image/pjpeg'],
                    // 'jpe': ['image/jpeg', 'image/pjpeg'],
                    // 'jp2': ['image/jp2', 'video/mj2', 'image/jpx', 'image/jpm'],
                    // 'j2k': ['image/jp2', 'video/mj2', 'image/jpx', 'image/jpm'],
                    // 'jpf': ['image/jp2', 'video/mj2', 'image/jpx', 'image/jpm'],
                    // 'jpg2': ['image/jp2', 'video/mj2', 'image/jpx', 'image/jpm'],
                    // 'jpx': ['image/jp2', 'video/mj2', 'image/jpx', 'image/jpm'],
                    // 'jpm': ['image/jp2', 'video/mj2', 'image/jpx', 'image/jpm'],
                    // 'mj2': ['image/jp2', 'video/mj2', 'image/jpx', 'image/jpm'],
                    // 'mjp2': ['image/jp2', 'video/mj2', 'image/jpx', 'image/jpm'],
                    // 'png': ['image/png', 'image/x-png'],
                    // 'tiff': 'image/tiff',
                    // 'tif': 'image/tiff',
                    // 'css': ['text/css', 'text/plain'],
                    // 'html': ['text/html', 'text/plain'],
                    // 'htm': ['text/html', 'text/plain'],
                    // 'shtml': ['text/html', 'text/plain'],
                    // 'txt': 'text/plain',
                    // 'text': 'text/plain',
                    // 'log': ['text/plain', 'text/x-log'],
                    // 'rtx': 'text/richtext',
                    // 'rtf': 'text/rtf',
                    // 'xml': ['application/xml', 'text/xml', 'text/plain'],
                    // 'xsl': ['application/xml', 'text/xsl', 'text/xml'],
                    // 'mpeg': 'video/mpeg',
                    // 'mpg': 'video/mpeg',
                    // 'mpe': 'video/mpeg',
                    // 'qt': 'video/quicktime',
                    // 'mov': 'video/quicktime',
                    // 'avi': ['video/x-msvideo', 'video/msvideo', 'video/avi', 'application/x-troff-msvideo'],
                    // 'movie': 'video/x-sgi-movie',
                    // 'doc': ['application/msword', 'application/vnd.ms-office'],
                    // 'docx': ['application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'application/zip', 'application/msword', 'application/x-zip'],
                    // 'dot': ['application/msword', 'application/vnd.ms-office'],
                    // 'dotx': ['application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'application/zip', 'application/msword'],
                    // 'xlsx': ['application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'application/zip', 'application/vnd.ms-excel', 'application/msword', 'application/x-zip'],
                    // 'word': ['application/msword', 'application/octet-stream'],
                    // 'xl': 'application/excel',
                    // 'eml': 'message/rfc822',
                    // 'json': ['application/json', 'text/json'],
                    // 'pem': ['application/x-x509-user-cert', 'application/x-pem-file', 'application/octet-stream'],
                    // 'p10': ['application/x-pkcs10', 'application/pkcs10'],
                    // 'p12': 'application/x-pkcs12',
                    // 'p7a': 'application/x-pkcs7-signature',
                    // 'p7c': ['application/pkcs7-mime', 'application/x-pkcs7-mime'],
                    // 'p7m': ['application/pkcs7-mime', 'application/x-pkcs7-mime'],
                    // 'p7r': 'application/x-pkcs7-certreqresp',
                    // 'p7s': 'application/pkcs7-signature',
                    // 'crt': ['application/x-x509-ca-cert', 'application/x-x509-user-cert', 'application/pkix-cert'],
                    // 'crl': ['application/pkix-crl', 'application/pkcs-crl'],
                    // 'der': 'application/x-x509-ca-cert',
                    // 'kdb': 'application/octet-stream',
                    // 'pgp': 'application/pgp',
                    // 'gpg': 'application/gpg-keys',
                    // 'sst': 'application/octet-stream',
                    // 'csr': 'application/octet-stream',
                    // 'rsa': 'application/x-pkcs7',
                    // 'cer': ['application/pkix-cert', 'application/x-x509-ca-cert'],
                    // '3g2': 'video/3gpp2',
                    // '3gp': ['video/3gp', 'video/3gpp'],
                    // 'mp4': 'video/mp4',
                    // 'm4a': 'audio/x-m4a',
                    // 'f4v': ['video/mp4', 'video/x-f4v'],
                    // 'flv': 'video/x-flv',
                    // 'webm': 'video/webm',
                    // 'aac': 'audio/x-acc',
                    // 'm4u': 'application/vnd.mpegurl',
                    // 'm3u': 'text/plain',
                    // 'xspf': 'application/xspf+xml',
                    // 'vlc': 'application/videolan',
                    // 'wmv': ['video/x-ms-wmv', 'video/x-ms-asf'],
                    // 'au': 'audio/x-au',
                    // 'ac3': 'audio/ac3',
                    // 'flac': 'audio/x-flac',
                    // 'ogg': ['audio/ogg', 'video/ogg', 'application/ogg'],
                    // 'kmz': ['application/vnd.google-earth.kmz', 'application/zip', 'application/x-zip'],
                    // 'kml': ['application/vnd.google-earth.kml+xml', 'application/xml', 'text/xml'],
                    // 'ics': 'text/calendar',
                    // 'ical': 'text/calendar',
                    // 'zsh': 'text/x-scriptzsh',
                    // '7zip': ['application/x-compressed', 'application/x-zip-compressed', 'application/zip', 'multipart/x-zip'],
                    // 'cdr': ['application/cdr', 'application/coreldraw', 'application/x-cdr', 'application/x-coreldraw', 'image/cdr', 'image/x-cdr', 'zz-application/zz-winassoc-cdr'],
                    // 'wma': ['audio/x-ms-wma', 'video/x-ms-asf'],
                    // 'jar': ['application/java-archive', 'application/x-java-application', 'application/x-jar', 'application/x-compressed'],
                    // 'svg': ['image/svg+xml', 'application/xml', 'text/xml'],
                    // 'vcf': 'text/x-vcard',
                    // 'srt': ['text/srt', 'text/plain'],
                    // 'vtt': ['text/vtt', 'text/plain'],
                    // 'ico': ['image/x-icon', 'image/x-ico', 'image/vnd.microsoft.icon']
                    //文档文件类型的
                    'ai'  : ['application/pdf,application/postscript'],
                    'eps' : 'application/postscript',
                    'exe' : ['application/octet-stream,application/x-msdownload'],
                    'doc' : ['application/msword,application/vnd.ms-office'],
                    'xls' : ['application/vnd.ms-excel,application/msexcel,application/x-msexcel,application/x-ms-excel,application/x-excel,application/x-dos_ms_excel,application/xls,application/x-xls,application/excel,application/download,application/vnd.ms-office'],
                    'ppt' : ['application/powerpoint,application/vnd.ms-powerpoint,application/vnd.ms-office,application/msword'],
                    'pps' : 'application/vnd.ms-powerpoint',
                    'pdf' : ['application/pdf,application/force-download,application/x-download,binary/octet-stream'],
                    'xml' : ['application/xml,text/xml,text/plain'],
                    'odt' : 'application/vnd.oasis.opendocument.text',
                    'swf' : 'application/x-shockwave-flash',
                    //压缩文件类型的
                    'gz'  : 'application/x-gzip',
                    'tgz' : 'application/x-gzip',
                    'bz'  : 'application/x-bzip2',
                    'bz2' : 'application/x-bzip2',
                    'tbz' : 'application/x-bzip2',
                    'zip' : ['application/x-zip,application/zip,application/x-zip-compressed,application/s-compressed,multipart/x-zip'],
                    'rar' : ['application/x-rar,application/rar,application/x-rar-compressed'],
                    'tar' : 'application/x-tar',
                    '7z'  : 'application/x-7z-compressed',
                    //文字类型
                    'txt' : 'text/plain',
                    'php' : ['application/x-httpd-php,application/php,application/x-php,text/php,text/x-php,application/x-httpd-php-source'],
                    'html': 'text/html',
                    'htm' : 'text/html',
                    'js'  : ['application/x-javascript,text/javascript'],
                    'css' : 'text/css',
                    'rtf' : 'text/rtf',
                    'rtfd': 'text/rtfd',
                    'py'  : 'text/x-python',
                    'java': 'text/x-java-source',
                    'rb'  : 'text/x-ruby',
                    'sh'  : 'text/x-shellscript',
                    'pl'  : 'text/x-perl',
                    'sql' : 'text/x-sql',
                    //图片类型的
                    'bmp' : ['image/bmp,image/x-bmp,image/x-bitmap,image/x-xbitmap,image/x-win-bitmap,image/x-windows-bmp,image/ms-bmp,image/x-ms-bmp,application/bmp,application/x-bmp,application/x-win-bitmap'],
                    'jpg' : ['image/jpeg,image/pjpeg'],
                    'jpeg': ['image/jpeg,image/pjpeg'],
                    'gif' : 'image/gif',
                    'png' : ['image/png,image/x-png'],
                    'tif' : 'image/tiff',
                    'tiff': 'image/tiff',
                    'tga' : 'image/x-targa',
                    'psd' : ['application/x-photoshop,image/vnd.adobe.photoshop'],
                    //音频文件类型的
                    'mp3' : 'audio/mpeg',
                    'mid' : 'audio/midi',
                    'ogg' : 'audio/ogg',
                    'mp4a': 'audio/mp4',
                    'wav' : 'audio/wav',
                    'wma' : 'audio/x-ms-wma',
                    //视频文件类型的
                    'avi' : 'video/x-msvideo',
                    'dv'  : 'video/x-dv',
                    'mp4' : 'video/mp4',
                    'mpeg': 'video/mpeg',
                    'mpg' : 'video/mpeg',
                    'mov' : 'video/quicktime',
                    'wm'  : 'video/x-ms-wmv',
                    'flv' : 'video/x-flv',
                    'mkv' : 'video/x-matroska'
                }
                if ($this.data('queue-id')) {
                    settings.queueID = $this.data('queue-id');
                } else if (settings.queueID) {
                    settings.queueID = settings.queueID;
                } else {
                    settings.queueID = settings.fileObjName;
                }
                settings.queueSizeLimit  = $this.data('queue-size-limit') || settings.queueSizeLimit;
                settings.removeCompleted = $this.data('remove-completed') || settings.removeCompleted;
                settings.simUploadLimit  = $this.data('sim-upload-limit') || settings.simUploadLimit;
                settings.truncateLength  = $this.data('truncate-length') || settings.truncateLength;
                settings.uploadLimit     = $this.data('upload-limit') || settings.uploadLimit;
                settings.uploadScript    = $this.data('upload-script') || settings.uploadScript;
                settings.width           = $this.data('width') || settings.width;
                settings.list            = $('#' + settings.queueID).data('list');
                settings.cloud           = $this.data('cloud') || settings.cloud;
                settings.cloudUrl        = $this.data('cloud-url') || settings.cloudUrl;

                //根据suffix查找mime
                var allowMime = [];
                if (settings.fileTypeSuffix) {
                    $.each(settings.fileTypeSuffix.split(','), function (i, e) {
                        var mime = settings.mime[e.replace('\.', '')];
                        mime     = $.isArray(mime) ? mime.join(',') : mime;
                        allowMime.push(mime)
                    })
                }
                allowMime        = allowMime.join(',').split(',');
                //去重，去空格
                var newAllowMime = [];
                $.each(allowMime, function (i, e) {
                    if ($.inArray(e, newAllowMime) == -1 && e != '') newAllowMime.push(e);
                });

                //设置允许的文件类型
                var accept        = (newAllowMime) ? newAllowMime.join(',') : '';
                //将允许上传文件类型格式化并重新赋值
                settings.fileType = newAllowMime.length ? newAllowMime : false;
                // console.log(allowMime);
                // console.log(settings.fileType);

                // Calculate the file size limit
                if (isNaN(settings.fileSizeLimit)) {
                    var fileSizeLimitBytes = parseInt(settings.fileSizeLimit) * 1.024
                    if (settings.fileSizeLimit.indexOf('KB') > -1) {
                        settings.fileSizeLimit = fileSizeLimitBytes * 1000;
                    } else if (settings.fileSizeLimit.indexOf('MB') > -1) {
                        settings.fileSizeLimit = fileSizeLimitBytes * 1000000;
                    } else if (settings.fileSizeLimit.indexOf('GB') > -1) {
                        settings.fileSizeLimit = fileSizeLimitBytes * 1000000000;
                    }
                } else {
                    settings.fileSizeLimit = settings.fileSizeLimit * 1024;
                }

                // Create a template for a file input
                $data.inputTemplate = $('<input type="file" accept="' + accept + '">')
                    .css({
                        'width'   : '100%',
                        'height'  : '100%',
                        'opacity' : 0,
                        'position': 'absolute',
                        'left'    : 0,
                        'top'     : 0,
                        'z-index' : 999
                    });
                // Create a new input
                $data.createInput   = function () {

                    // Create a clone of the file input
                    var input     = $data.inputTemplate.clone();
                    // Create a unique name for the input item
                    var inputName = input.name = 'input' + $data.inputCount++;
                    // Set the multiple attribute
                    // if (settings.multi) {
                    //     input.attr('multiple', true);
                    // }
                    input.attr('multiple', settings.multi);
                    // Set the onchange event for the input
                    input.bind('change', function () {
                        $data.queue.selected = 0;
                        $data.queue.replaced = 0;
                        $data.queue.errors   = 0;
                        $data.queue.queued   = 0;
                        // Add a queue item to the queue for each file
                        var limit            = this.files.length;
                        $data.queue.selected = limit;
                        if (($data.queue.count + limit) > settings.queueSizeLimit && settings.queueSizeLimit !== 0) {
                            if ($.inArray('onError', settings.overrideEvents) < 0) {
                                alert('The maximum number of queue items has been reached (' + settings.queueSizeLimit + ').  Please select fewer files.');
                            }
                            // Trigger the error event
                            if (typeof settings.onError === 'function') {
                                settings.onError.call($this, 'QUEUE_LIMIT_EXCEEDED');
                            }
                        } else {
                            for (var n = 0; n < limit; n++) {
                                file = this.files[n];
                                $data.addQueueItem(file);
                            }
                            $data.inputs[inputName] = this;
                            $data.createInput();
                        }
                        // Upload the file if auto-uploads are enabled
                        if (settings.auto) {
                            methods.upload.call($this);
                        }
                        // Trigger the select event
                        if (typeof settings.onSelect === 'function') {
                            settings.onSelect.call($this, $data.queue);
                        }
                    });
                    // Hide the existing current item and add the new one
                    if ($data.currentInput) {
                        $data.currentInput.hide();
                    }
                    $data.button.append(input);
                    $data.currentInput = input;
                }

                // Remove an input
                $data.destroyInput = function (key) {
                    $($data.inputs[key]).remove();
                    delete $data.inputs[key];
                    $data.inputCount--;
                }

                // Drop a file into the queue
                $data.drop = function (e) {
                    $data.queue.selected = 0;
                    $data.queue.replaced = 0;
                    $data.queue.errors   = 0;
                    $data.queue.queued   = 0;

                    var fileData = e.dataTransfer;

                    var inputName = fileData.name = 'input' + $data.inputCount++;
                    // Add a queue item to the queue for each file
                    var limit            = fileData.files.length;
                    $data.queue.selected = limit;
                    if (($data.queue.count + limit) > settings.queueSizeLimit && settings.queueSizeLimit !== 0) {
                        // Check if the queueSizeLimit was reached
                        if ($.inArray('onError', settings.overrideEvents) < 0) {
                            alert('The maximum number of queue items has been reached (' + settings.queueSizeLimit + ').  Please select fewer files.');
                        }
                        // Trigger the onError event
                        if (typeof settings.onError === 'function') {
                            settings.onError.call($this, 'QUEUE_LIMIT_EXCEEDED');
                        }
                    } else {
                        // Add a queue item for each file
                        for (var n = 0; n < limit; n++) {
                            file = fileData.files[n];
                            $data.addQueueItem(file);
                        }
                        // Save the data to the inputs object
                        $data.inputs[inputName] = fileData;
                    }

                    // Upload the file if auto-uploads are enabled
                    if (settings.auto) {
                        methods.upload.call($this);
                    }

                    // Trigger the onDrop event
                    if (typeof settings.onDrop === 'function') {
                        settings.onDrop.call($this, fileData.files, fileData.files.length);
                    }

                    // Stop FireFox from opening the dropped file(s)
                    e.preventDefault();
                    e.stopPropagation();
                }

                // Check if a filename exists in the queue
                $data.fileExistsInQueue = function (file) {
                    for (var key in $data.inputs) {
                        input = $data.inputs[key];
                        limit = input.files.length;
                        for (var n = 0; n < limit; n++) {
                            existingFile = input.files[n];
                            // Check if the filename matches
                            if (existingFile.name == file.name && !existingFile.complete) {
                                return true;
                            }
                        }
                    }
                    return false;
                }

                // Remove an existing file in the queue
                $data.removeExistingFile = function (file) {
                    for (var key in $data.inputs) {
                        input = $data.inputs[key];
                        limit = input.files.length;
                        for (var n = 0; n < limit; n++) {
                            existingFile = input.files[n];
                            // Check if the filename matches
                            if (existingFile.name == file.name && !existingFile.complete) {
                                $data.queue.replaced++;
                                methods.cancel.call($this, existingFile, true);
                            }
                        }
                    }
                }

                // Create the file item template
                if (settings.itemTemplate == false) {
                    $data.queueItem = $('<div class="' + settings.queueItem + '">\
                        <a class="close" href="#">X</a>\
                        <div><span class="filename"></span><span class="fileinfo"></span></div>\
                        <div class="progress">\
                            <div class="progress-bar"></div>\
                        </div>\
                    </div>');
                } else {
                    $data.queueItem = $(settings.itemTemplate);
                }

                // Add an item to the queue
                $data.addQueueItem = function (file) {
                    if ($.inArray('onAddQueueItem', settings.overrideEvents) < 0) {
                        // Check if the filename already exists in the queue
                        $data.removeExistingFile(file);
                        // Create a clone of the queue item template
                        file.queueItem = $data.queueItem.clone();
                        // Add an ID to the queue item
                        file.queueItem.attr('id', settings.id + '-file-' + $data.fileID++);
                        // Bind the close event to the close button
                        file.queueItem.find('.close').bind('click', function () {
                            methods.cancel.call($this, file);
                            return false;
                        });
                        var fileName = file.name;
                        if (fileName.length > settings.truncateLength && settings.truncateLength != 0) {
                            fileName = fileName.substring(0, settings.truncateLength) + '...';
                        }
                        file.queueItem.find('.filename').html(fileName);
                        // Add a reference to the file
                        file.queueItem.data('file', file);

                        //多文件上传
                        if (settings.multi) {
                            $data.queueEl.append(file.queueItem);
                        }
                        //单文件上传
                        else {
                            $data.queueEl.html(file.queueItem);
                        }
                    }
                    // Trigger the addQueueItem event
                    if (typeof settings.onAddQueueItem === 'function') {
                        settings.onAddQueueItem.call($this, file);
                    }
                    // Check the filetype
                    if (settings.fileType) {
                        if ($.isArray(settings.fileType)) {
                            var isValidFileType = false;
                            for (var n = 0; n < settings.fileType.length; n++) {
                                if (file.type.indexOf(settings.fileType[n]) > -1) {
                                    isValidFileType = true;
                                }
                            }
                            if (!isValidFileType) {
                                $data.error('FORBIDDEN_FILE_TYPE', file);
                            }
                        } else {
                            if (file.type.indexOf(settings.fileType) < 0) {
                                $data.error('FORBIDDEN_FILE_TYPE', file);
                            }
                        }
                    }
                    // Check the filesize
                    if (file.size > settings.fileSizeLimit && settings.fileSizeLimit != 0) {
                        $data.error('FILE_SIZE_LIMIT_EXCEEDED', file);
                    } else {
                        $data.queue.queued++;
                        $data.queue.count++;
                    }
                }

                // Remove an item from the queue
                $data.removeQueueItem = function (file, instant, delay) {
                    // Set the default delay
                    if (!delay) delay = 0;
                    var fadeTime = instant ? 0 : 500;
                    if (file.queueItem) {
                        if (file.queueItem.find('.fileinfo').html() != ' - Completed') {
                            file.queueItem.find('.fileinfo').html(' - Cancelled');
                        }
                        file.queueItem.find('.progress-bar').width(0);
                        file.queueItem.delay(delay).fadeOut(fadeTime, function () {
                            $(this).remove();
                        });
                        delete file.queueItem;
                        $data.queue.count--;
                    }
                }

                // Count the number of files that need to be uploaded
                $data.filesToUpload = function () {
                    var filesToUpload = 0;
                    for (var key in $data.inputs) {
                        input = $data.inputs[key];
                        limit = input.files.length;
                        for (var n = 0; n < limit; n++) {
                            file = input.files[n];
                            if (!file.skip && !file.complete) {
                                filesToUpload++;
                            }
                        }
                    }
                    return filesToUpload;
                }

                // Check if a file exists
                $data.checkExists = function (file) {
                    if ($.inArray('onCheck', settings.overrideEvents) < 0) {
                        // This request needs to be synchronous
                        $.ajaxSetup({
                            'async': false
                        });
                        // Send the filename to the check script
                        var checkData = $.extend(settings.formData, {filename: file.name});
                        $.post(settings.checkScript, checkData, function (fileExists) {
                            file.exists = parseInt(fileExists);
                        });
                        if (file.exists) {
                            if (!confirm('A file named ' + file.name + ' already exists in the upload folder.\nWould you like to replace it?')) {
                                // If not replacing the file, cancel the upload
                                methods.cancel.call($this, file);
                                return true;
                            }
                        }
                    }
                    // Trigger the check event
                    if (typeof settings.onCheck === 'function') {
                        settings.onCheck.call($this, file, file.exists);
                    }
                    return false;
                }

                // Upload a single file
                $data.uploadFile = function (file, uploadAll) {
                    //设置filename
                    settings.formData.filename = settings.fileObjName;

                    if (!file.skip && !file.complete && !file.uploading) {
                        file.uploading = true;
                        $data.uploads.current++;
                        $data.uploads.attempted++;

                        // Create a new AJAX request
                        xhr = file.xhr = new XMLHttpRequest();

                        // Start the upload
                        // Use the faster FormData if it exists
                        if (typeof FormData === 'function' || typeof FormData === 'object') {

                            // Create a new FormData object
                            var formData = new FormData();

                            // Add the form data
                            formData.append(settings.fileObjName, file);

                            // Add the rest of the formData
                            for (i in settings.formData) {
                                formData.append(i, settings.formData[i]);
                            }

                            // Open the AJAX call
                            xhr.open(settings.method, settings.uploadScript, true);

                            // On progress function
                            xhr.upload.addEventListener('progress', function (e) {
                                if (e.lengthComputable) {
                                    $data.progress(e, file);
                                }
                            }, false);

                            // On complete function
                            xhr.addEventListener('load', function (e) {
                                if (this.readyState == 4) {
                                    file.uploading = false;
                                    if (this.status == 200) {
                                        if (file.xhr.responseText !== 'Invalid file type.') {
                                            $data.uploadComplete(e, file, uploadAll);
                                        } else {
                                            $data.error(file.xhr.responseText, file, uploadAll);
                                        }
                                    } else if (this.status == 404) {
                                        $data.error('404_FILE_NOT_FOUND', file, uploadAll);
                                    } else if (this.status == 403) {
                                        $data.error('403_FORBIDDEN', file, uploadAll);
                                    } else {
                                        $data.error('Unknown Error', file, uploadAll);
                                    }
                                }
                            });

                            // Send the form data (multipart/form-data)
                            xhr.send(formData);

                        } else {

                            // Send as binary
                            var reader    = new FileReader();
                            reader.onload = function (e) {

                                // Set some file builder variables
                                var boundary = '-------------------------' + (new Date).getTime(),
                                    dashes   = '--',
                                    eol      = '\r\n',
                                    binFile  = '';

                                // Build an RFC2388 String
                                binFile += dashes + boundary + eol;
                                // Generate the headers
                                binFile += 'Content-Disposition: form-data; name="' + settings.fileObjName + '"';
                                if (file.name) {
                                    binFile += '; filename="' + file.name + '"';
                                }
                                binFile += eol;
                                binFile += 'Content-Type: application/octet-stream' + eol + eol;
                                binFile += e.target.result + eol;

                                for (key in settings.formData) {
                                    binFile += dashes + boundary + eol;
                                    binFile += 'Content-Disposition: form-data; name="' + key + '"' + eol + eol;
                                    binFile += settings.formData[key] + eol;
                                }

                                binFile += dashes + boundary + dashes + eol;

                                // On progress function
                                xhr.upload.addEventListener('progress', function (e) {
                                    $data.progress(e, file);
                                }, false);

                                // On complete function
                                xhr.addEventListener('load', function (e) {
                                    file.uploading = false;
                                    var status     = this.status;
                                    if (status == 404) {
                                        $data.error('404_FILE_NOT_FOUND', file, uploadAll);
                                    } else {
                                        if (file.xhr.responseText != 'Invalid file type.') {
                                            $data.uploadComplete(e, file, uploadAll);
                                        } else {
                                            $data.error(file.xhr.responseText, file, uploadAll);
                                        }
                                    }
                                }, false);

                                // Open the ajax request
                                var url = settings.uploadScript;
                                if (settings.method == 'get') {
                                    var params = $(settings.formData).param();
                                    url += params;
                                }
                                xhr.open(settings.method, settings.uploadScript, true);
                                xhr.setRequestHeader("Content-Type", "multipart/form-data; boundary=" + boundary);

                                // Trigger the uploadFile event
                                if (typeof settings.onUploadFile === 'function') {
                                    settings.onUploadFile.call($this, file);
                                }

                                // Send the file for upload
                                xhr.sendAsBinary(binFile);
                            }
                            reader.readAsBinaryString(file);

                        }
                    }
                }

                // Update a file upload's progress
                $data.progress = function (e, file) {
                    if ($.inArray('onProgress', settings.overrideEvents) < 0) {
                        if (e.lengthComputable) {
                            var percent = Math.round((e.loaded / e.total) * 100);
                        }
                        file.queueItem.find('.fileinfo').html(' - ' + percent + '%');
                        file.queueItem.find('.progress-bar').css('width', percent + '%');
                    }
                    // Trigger the progress event
                    if (typeof settings.onProgress === 'function') {
                        settings.onProgress.call($this, file, e);
                    }
                }

                // Trigger an error
                $data.error = function (errorType, file, uploadAll) {
                    if ($.inArray('onError', settings.overrideEvents) < 0) {
                        // Get the error message
                        switch (errorType) {
                            case '404_FILE_NOT_FOUND':
                                errorMsg = '404 Error';
                                break;
                            case '403_FORBIDDEN':
                                errorMsg = '403 Forbidden';
                                break;
                            case 'FORBIDDEN_FILE_TYPE':
                                errorMsg = 'Forbidden File Type';
                                break;
                            case 'FILE_SIZE_LIMIT_EXCEEDED':
                                errorMsg = 'File Too Large';
                                break;
                            default:
                                errorMsg = 'Unknown Error';
                                break;
                        }

                        // Add the error class to the queue item
                        file.queueItem.addClass('error')
                        // Output the error in the queue item
                            .find('.fileinfo').html(' - ' + errorMsg);
                        // Hide the
                        file.queueItem.find('.progress').remove();
                    }
                    // Trigger the error event
                    if (typeof settings.onError === 'function') {
                        settings.onError.call($this, errorType, file);
                    }
                    file.skip = true;
                    if (errorType == '404_FILE_NOT_FOUND') {
                        $data.uploads.errors++;
                    } else {
                        $data.queue.errors++;
                    }
                    if (uploadAll) {
                        methods.upload.call($this, null, true);
                    }
                }

                // Trigger when a single file upload is complete
                $data.uploadComplete = function (e, file, uploadAll) {
                    if ($.inArray('onUploadComplete', settings.overrideEvents) < 0) {
                        file.queueItem.find('.progress-bar').css('width', '100%');
                        file.queueItem.find('.fileinfo').html(' - Completed');
                        file.queueItem.find('.progress').hide();
                        file.queueItem.addClass('complete');
                    }
                    // Trigger the complete event
                    if (typeof settings.onUploadComplete === 'function') {
                        settings.onUploadComplete.call($this, file, file.xhr.responseText);
                    }
                    if (settings.removeCompleted) {
                        setTimeout(function () {
                            methods.cancel.call($this, file);
                        }, 3000);
                    }
                    file.complete = true;
                    $data.uploads.successful++;
                    $data.uploads.count++;
                    $data.uploads.current--;
                    delete file.xhr;
                    if (uploadAll) {
                        methods.upload.call($this, null, true);
                    }
                }

                // Trigger when all the files are done uploading
                $data.queueComplete = function () {
                    // Trigger the queueComplete event
                    if (typeof settings.onQueueComplete === 'function') {
                        settings.onQueueComplete.call($this, $data.uploads);
                    }
                }

                // ----------------------
                // Initialize UploadiFive
                // ----------------------

                // Check if HTML5 is available
                if (window.File && window.FileList && window.Blob && (window.FileReader || window.FormData)) {
                    // Assign an ID to the object
                    settings.id = 'uploadifive-' + settings.queueID;

                    //云端
                    var cloudBtn = '<a href="javascript:;" class="uploads-online uploads-online-hook" title="云上传" data-id="' + settings.queueID + '" data-multi="' + settings.multi + '" data-url="' + settings.cloudUrl + '"><i class="fa fa-cloud-upload"></i></a>';
                    cloudBtn     = settings.cloud ? cloudBtn : '';

                    // Wrap the file input in a div with overflow set to hidden
                    $data.button = $('<div id="' + settings.id + '" class="uploadifive-button">' + cloudBtn + settings.buttonText + '</div>');
                    if (settings.buttonClass) $data.button.addClass(settings.buttonClass);

                    // Style the button wrapper
                    $data.button.css({
                        // 'height': settings.height,
                        // 'line-height': settings.height + 'px',
                        'overflow': 'hidden',
                        'position': 'relative',
                        // 'text-align': 'center',
                        // 'width': settings.width
                    });

                    if (!settings.buttonClass) {
                        $data.button.css({
                            'height'     : settings.height,
                            'line-height': settings.height + 'px',
                            'text-align' : 'center',
                            'width'      : settings.width
                        });
                    }

                    // Insert the button above the file input
                    $this.before($data.button)
                    // Add the file input to the button
                        .appendTo($data.button)
                        // Modify the styles of the file input
                        .hide();

                    // Create a new input
                    $data.createInput.call($this);

                    // Create the queue container
                    if (!settings.queueID) {
                        settings.queueID = settings.id + '-queue';
                        $data.queueEl    = $('<div id="' + settings.queueID + '" class="uploadifive-queue" />');
                        $data.button.after($data.queueEl);
                    } else {
                        $data.queueEl = $('#' + settings.queueID);
                    }

                    // Add drag and drop functionality
                    if (settings.dnd) {
                        var $dropTarget = settings.dropTarget ? $(settings.dropTarget) : $data.queueEl.get(0);
                        $dropTarget.addEventListener('dragleave', function (e) {
                            // Stop FireFox from opening the dropped file(s)
                            e.preventDefault();
                            e.stopPropagation();
                        }, false);
                        $dropTarget.addEventListener('dragenter', function (e) {
                            // Stop FireFox from opening the dropped file(s)
                            e.preventDefault();
                            e.stopPropagation();
                        }, false);
                        $dropTarget.addEventListener('dragover', function (e) {
                            // Stop FireFox from opening the dropped file(s)
                            e.preventDefault();
                            e.stopPropagation();
                        }, false);
                        $dropTarget.addEventListener('drop', $data.drop, false);
                    }

                    // Send as binary workaround for Chrome
                    if (!XMLHttpRequest.prototype.sendAsBinary) {
                        XMLHttpRequest.prototype.sendAsBinary = function (datastr) {
                            function byteValue(x) {
                                return x.charCodeAt(0) & 0xff;
                            }

                            var ords = Array.prototype.map.call(datastr, byteValue);
                            var ui8a = new Uint8Array(ords);
                            this.send(ui8a.buffer);
                        }
                    }

                    // Trigger the oninit event
                    if (typeof settings.onInit === 'function') {
                        settings.onInit.call($this);
                    }

                } else {

                    // Trigger the fallback event
                    if (typeof settings.onFallback === 'function') {
                        settings.onFallback.call($this);
                    }
                    return false;

                }

            });

        },


        // Write some data to the console
        debug: function () {

            return this.each(function () {

                console.log($(this).data('uploadifive'));

            });

        },

        // Clear all the items from the queue
        clearQueue: function () {

            this.each(function () {

                var $this    = $(this),
                    $data    = $this.data('uploadifive'),
                    settings = $data.settings;

                for (var key in $data.inputs) {
                    input = $data.inputs[key];
                    limit = input.files.length;
                    for (i = 0; i < limit; i++) {
                        file = input.files[i];
                        methods.cancel.call($this, file);
                    }
                }
                // Trigger the onClearQueue event
                if (typeof settings.onClearQueue === 'function') {
                    settings.onClearQueue.call($this, $('#' + $data.settings.queueID));
                }

            });

        },

        // Cancel a file upload in progress or remove a file from the queue
        cancel: function (file, fast) {

            this.each(function () {

                var $this    = $(this),
                    $data    = $this.data('uploadifive'),
                    settings = $data.settings;

                // If user passed a queue item ID instead of file...
                if (typeof file === 'string') {
                    if (!isNaN(file)) {
                        fileID = 'uploadifive-' + $(this).attr('id') + '-file-' + file;
                    }
                    file = $('#' + fileID).data('file');
                }

                file.skip = true;
                $data.filesCancelled++;
                if (file.uploading) {
                    $data.uploads.current--;
                    file.uploading = false;
                    file.xhr.abort();
                    delete file.xhr;
                    methods.upload.call($this);
                }
                if ($.inArray('onCancel', settings.overrideEvents) < 0) {
                    $data.removeQueueItem(file, fast);
                }

                // Trigger the cancel event
                if (typeof settings.onCancel === 'function') {
                    settings.onCancel.call($this, file);
                }

            });

        },

        // Upload the files in the queue
        upload: function (file, keepVars) {

            this.each(function () {

                var $this    = $(this),
                    $data    = $this.data('uploadifive'),
                    settings = $data.settings;

                if (file) {

                    $data.uploadFile.call($this, file);

                } else {

                    // Check if the upload limit was reached
                    if (($data.uploads.count + $data.uploads.current) < settings.uploadLimit || settings.uploadLimit == 0) {
                        if (!keepVars) {
                            $data.uploads.attempted   = 0;
                            $data.uploads.successsful = 0;
                            $data.uploads.errors      = 0;
                            var filesToUpload         = $data.filesToUpload();
                            // Trigger the onUpload event
                            if (typeof settings.onUpload === 'function') {
                                settings.onUpload.call($this, filesToUpload);
                            }
                        }

                        // Loop through the files
                        $('#' + settings.queueID).find('.' + settings.queueItem).not('.error, .complete').each(function () {
                            _file = $(this).data('file');
                            // Check if the simUpload limit was reached
                            if (($data.uploads.current >= settings.simUploadLimit && settings.simUploadLimit !== 0) || ($data.uploads.current >= settings.uploadLimit && settings.uploadLimit !== 0) || ($data.uploads.count >= settings.uploadLimit && settings.uploadLimit !== 0)) {
                                return false;
                            }
                            if (settings.checkScript) {
                                // Let the loop know that we're already processing this file
                                _file.checking = true;
                                skipFile       = $data.checkExists(_file);
                                _file.checking = false;
                                if (!skipFile) {
                                    $data.uploadFile(_file, true);
                                }
                            } else {
                                $data.uploadFile(_file, true);
                            }
                        });
                        if ($('#' + settings.queueID).find('.' + settings.queueItem).not('.error, .complete').size() == 0) {
                            $data.queueComplete();
                        }
                    } else {
                        if ($data.uploads.current == 0) {
                            if ($.inArray('onError', settings.overrideEvents) < 0) {
                                if ($data.filesToUpload() > 0 && settings.uploadLimit != 0) {
                                    alert('The maximum upload limit has been reached.');
                                }
                            }
                            // Trigger the onError event
                            if (typeof settings.onError === 'function') {
                                settings.onError.call($this, 'UPLOAD_LIMIT_EXCEEDED', $data.filesToUpload());
                            }
                        }
                    }

                }

            });

        },

        // Destroy an instance of UploadiFive
        destroy: function () {

            this.each(function () {

                var $this    = $(this),
                    $data    = $this.data('uploadifive'),
                    settings = $data.settings;

                // Clear the queue
                methods.clearQueue.call($this);
                // Destroy the queue if it was created
                if (!settings.queueID) $('#' + settings.queueID).remove();
                // Remove extra inputs
                $this.siblings('input').remove();
                // Show the original file input
                $this.show()
                // Move the file input out of the button
                    .insertBefore($data.button);
                // Delete the button
                $data.button.remove();
                // Trigger the destroy event
                if (typeof settings.onDestroy === 'function') {
                    settings.onDestroy.call($this);
                }

            });

        }

    }

    $.fn.uploadifive = function (method) {

        if (methods[method]) {
            return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
        } else if (typeof method === 'object' || !method) {
            return methods.init.apply(this, arguments);
        } else {
            $.error('The method ' + method + ' does not exist in $.uploadify');
        }

    }

})(jQuery);

/* I gave the queueItems IDs and they each have a reference to the file held in the 'data' obj. */