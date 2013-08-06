class Api::V1::BaseController < ApplicationController

  respond_to :json

  # using devise to authenticate users
  before_filter :authenticate_user!

  # using cancan to authorize users
  authorize_resource


  protected

  def current_person
    current_user.person if current_user
  end

  def current_actor
    current_person.actor if current_person
  end

end