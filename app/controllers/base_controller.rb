class BaseController < ApplicationController
  respond_to :html

  before_filter :authenticate_user! # using devise to authenticate users
  authorize_resource # using cancan to authorize users

end

