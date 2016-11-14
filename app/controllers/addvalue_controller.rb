class AddvalueController < ApplicationController
  def insert
      @connect = ActiveRecord::Base.connection
      query = params[:q]
      result = @connect.exec_query(query)
  end
end
