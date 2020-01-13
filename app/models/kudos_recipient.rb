class KudosRecipient < ApplicationRecord
  validates :sender_id, :recipient_id, presence: true
  validate :sender_and_recipient_to_not_be_same
  validate :kudos_to_not_be_more_than_three
  validate :kudos_recipient_to_be_from_same_organization

  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'

  # Returns list of users who have given kudos to the passed in user_id
  def self.senders_list(user_id)
    User.joins(:kudos_senders)
      .where(kudos_recipients: {recipient_id: user_id})
      .order('kudos_recipients.created_at desc')
      .select("users.first_name, users.last_name, kudos_recipients.message, kudos_recipients.created_at")
  end

  private

  # Validation 1
  def sender_and_recipient_to_not_be_same
    errors.add(:sender_id, 'Sender and reciever cannot be the same') if sender_id == recipient_id
  end

  # Validation 2
  def kudos_to_not_be_more_than_three
    date = Date.today
    start_of_week = date.at_beginning_of_week
    end_of_week = date.at_end_of_week

    kudos_this_week = self.class.where(sender_id: sender_id)
      .where("date(created_at) BETWEEN ? AND ?", start_of_week, end_of_week)
      .count

    errors.add(:sender_id, 'Kudos limit reached') if kudos_this_week == 3
  end

  # Validation 3
  def kudos_recipient_to_be_from_same_organization
    if sender&.organization_id.present? && recipient&.organization_id.present?
      if sender.organization_id != recipient.organization_id
        errors.add(:sender_id, 'Sender and recipient organization should be same')
      end
    else
      errors.add(:sender_id, 'Sender or recipient do not belong to any organization')
    end
  end
end
