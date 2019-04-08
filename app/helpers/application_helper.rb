module ApplicationHelper

  def meta_tag_twitter()
    twitter_card = {}
    twitter_card[:url] = request.url
    if controller.controller_path == "answers" && controller.action_name == "show"
      twitter_card[:title] = "#{@user.name}さんの悩meです"
      twitter_card[:description] = "#{@post.content}"
      twitter_card[:image] = "https://s3-ap-northeast-1.amazonaws.com/nayame/post_images/post_id%3A#{@post.id}"
    else
      twitter_card[:title] = "Nayame"
      twitter_card[:description] = "悩me|あなたの疑問、答えます。〜匿名回答サービス"
      twitter_card[:image] = "https://s3-ap-northeast-1.amazonaws.com/nayame/lp/logo-small.png"
    end
    twitter_card
  end

  def check_page(controller_name, action_name)
    controller.controller_name == controller_name && controller.action_name == action_name
  end

end
