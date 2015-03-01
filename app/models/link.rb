class Link < ActiveRecord::Base
  validates :url, url: true, url: { message: I18n.t('models.link.errors.url') }

  class << self
    def in_featured_period
      self.where{ created_at >= Date.today.beginning_of_month.beginning_of_day }
        .where{ created_at <= Date.today.end_of_month.end_of_day }
    end

    def count_in_featured_period
      self.in_featured_period.count
    end
  end
end
