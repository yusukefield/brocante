class Join < ApplicationRecord
  belongs_to :user
  belongs_to :event, counter_cache: :join_count
  validates :user_id, presence: true
  validates :event_id, presence: true
end
