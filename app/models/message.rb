class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user
  validates :content, presence: true
  scope :for_display, -> { order(:created_at).last(100) }
end
