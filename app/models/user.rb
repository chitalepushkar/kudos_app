class User < ApplicationRecord
  has_many :kudos_recipients, class_name: 'KudosRecipient', foreign_key: 'recipient_id'
  has_many :kudos_senders, class_name: 'KudosRecipient', foreign_key: 'sender_id'
  belongs_to :organization
end
