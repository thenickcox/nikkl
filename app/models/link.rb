class Link < ActiveRecord::Base
  validates :url, url: true, url: { message: I18n.t('models.link.errors.url') }

  class << self
    def count_in_featured_period
      self.where{ created_at >= Date.today.beginning_of_month.beginning_of_day }
        .where{ created_at <= Date.today.end_of_month.end_of_day }
        .count
    end
  end
end
