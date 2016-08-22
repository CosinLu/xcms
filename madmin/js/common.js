$(function () {
    //隐藏侧边栏
    $('[data-name="sidebar_hidden"]').on('click', function () {
        $('[data-name="sidebar"]').toggleClass('sidebar_hidden');
    })
})

