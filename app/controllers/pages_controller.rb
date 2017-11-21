class PagesController < ApplicationController
  def page
    if request.path == '/about'
      @page = Page.find_by(page: 'about')
    elsif request.path == '/contact'
      @page = Page.find_by(page: 'contact')
    end
  end
end
