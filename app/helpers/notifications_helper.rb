module NotificationsHelper
  def notification_form(notification)
    @visiter = notification.visiter
    @post_comment = nil
    your_item = link_to 'あなたの投稿', post_path(notification), style: "font-weight: bold;"
    @visiter_post_comment = notification.post_comment_id
    # notification.actionがfollowかfavoriteかpost_commentか
    case notification.action
    when "follow"
      tag.a(notification.visiter.name, href: user_path(@visiter), style: "font-weight: bold;") + "があなたをフォローしました"
    when "favorite"
      tag.a(notification.visiter.name, href: user_path(@visiter), style: "font-weight: bold;") + "が" + tag.a('あなたの投稿', href: post_path(notification.post_id), style: "font-weight: bold;") + "にいいねしました"
    when "post_comment" then
      @post_comment = PostComment.find_by(id: @visiter_post_comment)&.comment
      tag.a(@visiter.name, href: user_path(@visiter), style: "font-weight: bold;") + "が" + tag.a('あなたの投稿', href: post_path(notification.post_id), style: "font-weight: bold;") + "にコメントしました"
    when "chat"
      tag.a(notification.visiter.name, href: user_path(@visiter), style: "font-weight: bold;") + "があなたにダイレクトメッセージを送信しました"
    end
  end

  # 未確認の通知がある時はマークで知らせる
  def unchecked_notifications
    @notifications = current_user.passive_notifications.where(checked: false)
  end
end
