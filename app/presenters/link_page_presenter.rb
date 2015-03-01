class LinkPagePresenter

  CENTS_PER_LINK = 5

  def featured_charity_name
    Charity.featured.name
  end

  def money_raised_in_featured_period
    Money.us_dollar(Link.count_in_featured_period * CENTS_PER_LINK).format
  end

end
