$(function(){
  $('.sns').on('click', function(){
    $('.link').toggleClass("clicked");
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