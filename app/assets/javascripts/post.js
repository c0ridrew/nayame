$(document).on('turbolinks:load', function() {

  var height = $('#navbar').height();
  $('.body-wrap').css('padding-top',height);

  $('#createBtn').on('click', function(){
    $('.modal-layer').css('display', 'block');
    $('.create_post').fadeToggle(400);
  });

  $('#create_post').on('click', function(e){
    e.preventDefault();
    var content = $('#post_content').val();
    var user_id = $('#post_user_id').val();
    $.ajax ({
      type: 'POST',
      url: '/posts',
      data: {
        post: {
          content: content,
          user_id: user_id
        }
      },
      dataType: 'json'
    })
    .done(function(data){
      toastr.success('投稿に成功しました。')
    })
    .fail(function(){
      toastr.error('投稿に失敗しました。')
    })
    .always(function(){
      location.reload();
    });
  });

  $('#user_image').on('change', function(e){
    var file = e.target.files[0],
        reader = new FileReader(),
        $preview = $(".profile_image");
        t = this;

    // 画像ファイル以外の場合は何もしない
    if(file.type.indexOf("image") < 0){
      return false;
    }
    // ファイル読み込みが完了した際のイベント登録
    reader.onload = (function(file) {
      return function(e) {
        $preview.empty();
        $preview.append($('<img>').attr({
                  src: e.target.result,
                  title: file.name
              }));
      };
    })(file);

    reader.readAsDataURL(file);
  });
});