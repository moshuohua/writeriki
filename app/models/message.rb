class Message < ActsAsMessageable::Message
  attr_accessible :title, :body, :to
end
