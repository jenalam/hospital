class MakequeryController < ApplicationController
  require 'json'
  def querysend
      @results = Array.new
      @connection = ActiveRecord::Base.connection
      query = params[:q]
      result = @connection.exec_query(query)
      result.each do |row|
        @results.push(row)
      end
      respond_to do |format|
        format.json { render :json => @results }
      end
  end
end
