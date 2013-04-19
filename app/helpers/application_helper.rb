module ApplicationHelper

  #gravatar
  def avatar_url(current_user)
      gravatar_id = Digest::MD5::hexdigest(current_user.email).downcase
      "http://gravatar.com/avatar/#{gravatar_id}.png?s=37"
  end
end
