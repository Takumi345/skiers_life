class Public::HomesController < ApplicationController
  def top
    @skis = Ski.all
  end

  def about
  end
end
