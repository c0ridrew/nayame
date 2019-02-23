module ApplicationHelper

  def meta_tag_twitter()
    twitter_card = {}
    twitter_card[:url] = request.url
    if controller.controller_path == "answers"
      twitter_card[:title] = "#{@user.name}さんの悩meです"
      twitter_card[:description] = "#{@post.content}"
      twitter_card[:image] = "https://s3-ap-northeast-1.amazonaws.com/nayame/post_images/post_id%3A#{@post.id}"
    else
      twitter_card[:title] = "Nayame"
      twitter_card[:description] = "悩me|あなたの疑問、答えます。〜匿名回答サービス"
      twitter_card[:image] = "https://s3-ap-northeast-1.amazonaws.com/nayame/lp/logo.png"
    end
    twitter_card
  end
end
