class PagesController < ApplicationController
  def about
    @heading ='Страничка про нас!'
    @text ='Немного текста'
  end
end
