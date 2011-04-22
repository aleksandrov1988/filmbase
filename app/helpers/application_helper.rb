module ApplicationHelper

  def show_years
    year=Time.now.year
    raw("2011"+(year==2011 ? "" : "mdash;#{year}"))
  end
end
