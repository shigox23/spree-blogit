// Placeholder manifest file.
// the installer will append this file to the app vendored assets here: vendor/assets/javascripts/spree/frontend/all.js'

// Supporting functions for the display of post archives
jQuery(function(){
    $("a[data-blog-click-to-toggle-children]").click(function(event){
        event.preventDefault();
        $(this).siblings('ul').toggle();
    })
})
