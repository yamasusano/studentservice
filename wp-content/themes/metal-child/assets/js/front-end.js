jQuery(function ($) {
    jQuery(document).ready(function () {
        var keyword = $('b#keyword-search').text().trim();
        if (keyword) {
            $('div.finder-post-title h5').unmark().mark(keyword);
        }
    });
})
