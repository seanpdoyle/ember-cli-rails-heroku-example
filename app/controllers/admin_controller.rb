class AdminController < ApplicationController
  def index
    EmberCli.build(:admin)
  end
end
