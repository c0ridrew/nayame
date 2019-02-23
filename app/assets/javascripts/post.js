$(function(){
  $(document).on('click','#share', function(){
    $(this).find($('.link')).toggleClass("clicked");
  });
});


$(function() {
  var clipboard = new ClipboardJS('.btnClipboard');
  clipboard.on('success', function(e) {
    alert("コピーに成功しました。");
  });
  clipboard.on('error', function(e) {
    alert("コピーに失敗しました。");
  });
});