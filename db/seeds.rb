# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

KUDOS_MESSAGES = ['Great work!', 'Amazing!', 'Good job!', 'Nice effort!', 'Congratulations!', 'Godspeed!'].freeze

if Organization.all.blank?
  2.times do
    Organization.create(name: Faker::Company.name)
  end
end

organization_ids = Organization.all.pluck(:id)

organization_ids.each do |organization_id|
  users = []

  5.times do
    random_number = rand(1000..5000)
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    username = first_name.downcase + random_number.to_s

    users << User.create(
      first_name: first_name,
      last_name: last_name,
      username: username,
      password: 'password',
      organization_id: organization_id
    )
  end

  5.times do
    user_ids = users.map(&:id)
    sender_id = user_ids.sample
    recipient_id = (user_ids - [sender_id]).sample
    kudos_sent_at = Time.at((Time.zone.now.to_f - 1.year.ago.to_f)*rand + 1.year.ago.to_f)

    KudosRecipient.create(
      sender_id: sender_id,
      recipient_id: recipient_id,
      message: KUDOS_MESSAGES.sample,
      created_at: kudos_sent_at,
      updated_at: kudos_sent_at
    )
  end
end
