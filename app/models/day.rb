class Day < ActiveRecord::Base
  CAPABILITY = 2

  has_many :slots
  has_many :users, :through => :slots

  attr_accessible :capability, :date

  validates_uniqueness_of :date

  before_create :set_capability

  def self.today
    Day.find_or_create_by_date(Date.today)
  end

  def full?
    slots.count >= CAPABILITY
  end

  def user_names
    users.map(&:name)
  end

  def users_count
    users.count
  end

  private

  def set_capability
    self.capability = CAPABILITY unless capability
  end
end
