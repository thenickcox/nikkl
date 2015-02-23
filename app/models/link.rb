class Link < ActiveRecord::Base
  validates :url, url: true, url: { message: I18n.t('models.link.errors.url') }
end
