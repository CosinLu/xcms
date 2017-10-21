/**
 * Created by Admin on 2017/9/5.
 */
require(['jquery', 'uploadsUnit'], function ($, uploadsUnit) {
    uploadsUnit.initData();
    uploadsUnit.dragSort();
    uploadsUnit.uploadsPreview();
    uploadsUnit.uploadsDel();
    uploadsUnit.initUploads();
    uploadsUnit.initCloudUplods();
});