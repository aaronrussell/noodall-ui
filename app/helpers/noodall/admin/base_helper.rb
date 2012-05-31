module Noodall::Admin::BaseHelper
  include Noodall::LayoutHelper
  include SortableTable::App::Helpers::ApplicationHelper

  def admin_page_title
    @page_title ||= controller.controller_name.titleize +
      (controller.action_name == 'index' ? ' ' : " | #{controller.action_name.titleize}" ) +
      " | #{Noodall::UI.app_name}"
  end

  def admin_menu_items
    Noodall::UI.menu_items.map do |title, link|
      content_tag :li, link_to( title, send(link) )
    end.join.html_safe
  end

  # Monkey-patch for the thoughtbot/sortabletable headers, adding 'colspan' option
  def sortable_table_header(opts = {})
    raise ArgumentError if opts[:name].nil? || opts[:sort].nil?
    anchor = opts[:anchor].blank? ? "" : "##{opts[:anchor]}"
    content_tag :th,
      link_to(opts[:name],
        sortable_url(opts) + anchor,
        :title => opts[:title]),
      :class => sortable_table_header_classes(opts),
      :colspan => opts[:colspan]
  end
  
  
  def flash_class(level)
    case level
    when :notice then "alert alert-info"
    when :success then "alert alert-success"
    when :error then "alert alert-error"
    when :alert then "alert alert-error"
    end
  end
  
  
end
