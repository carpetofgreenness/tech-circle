module ApplicationHelper
  def app_nav_link(text, path)
    base = ['app-nav-link']
    base << 'active' if request.path == path
    link_to(text, path, class: base.join(' '))
  end
end
