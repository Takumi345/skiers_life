class Admin::HomesController < ApplicationController
  def top
    @genres = Genre.where(is_registration: false)
  end
end
