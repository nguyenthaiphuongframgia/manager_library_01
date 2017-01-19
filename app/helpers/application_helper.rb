module ApplicationHelper
  def full_title page_title
    base_title = t "app.helpers.application.base_title"
    page_title.empty? ? base_title : page_title + " | " + base_title
  end

  def generate_file_name file_name
    file_name + Time.now.strftime Settings.format.date_time_format + ".xls"
  end
end
