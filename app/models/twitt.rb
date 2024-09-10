class Twitt < ApplicationRecord
  belongs_to :user

  validates :content, presence: true, length: { maximum: 140 }

  after_create_commit :broadcast_create
  after_update_commit :broadcast_update

  private

  def broadcast_create
    Turbo::StreamsChannel.broadcast_prepend_to("twitts",
      target: "twitts",
      partial: "twitts/twitt",
      locals: { twitt: self })
  end

  def broadcast_update
    Turbo::StreamsChannel.broadcast_replace_to("twitts",
    target: self,
    partial: "twitts/twitt",
    locals: { twitt: self })
  end
end
