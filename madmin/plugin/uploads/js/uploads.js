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

    console.log(0);
    console.log(uploadsUnit.ops);
    console.log(1);
});