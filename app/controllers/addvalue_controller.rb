class AddvalueController < ApplicationController
  def insert
      @connect = ActiveRecord::Base.connection
      query = params[:q]
      result = @connect.execute(query)
      render :nothing => true
  end
end
