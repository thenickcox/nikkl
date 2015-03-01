class Charity < ActiveRecord::Base
  %i(name url start_on end_on).each do |field|
    validates field, presence: true
  end

  class << self
    def featured
      self.where{ start_on >= Date.today.beginning_of_month.beginning_of_day }
        .where{ end_on <= Date.today.end_of_month.end_of_day }
        .first
    end
  end
end
