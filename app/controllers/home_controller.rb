class HomeController < ApplicationController
  def index
  end
  def about
    @about_me = "This website is a pratical demo."
    @anwser = 2+2
  end
end
