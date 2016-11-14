class PagesController < ApplicationController
  def hospitalsim
  end
  
  def issue_medication_post
    @success = false

    if not validate_issue_medication_post
      render 'issue_medication' and return

    else
      time_hours = params[:time_hours]
      di_date = params[:di_date]
      d_dosage = params[:d_dosage]
      eID = params[:eID]
      mname = params[:mname]
      careCardNo = params[:careCardNo]

      query = "INSERT INTO DrugIntakeEvent (time_hours, di_date, d_dosage, eID, mname, careCardNo) VALUES (#{time_hours}, '#{di_date}', #{d_dosage}, #{eID}, '#{mname}', #{careCardNo});"

      begin
        @connection = ActiveRecord::Base.connection
        @connection.execute(query)
      
      rescue ActiveRecord::StatementInvalid => e
        @errors.push("You might have entered invalid ids or medication name, or there might be an existing Drug Intake Event for this time, date, medication, and patient. Also, make sure the date is formatted as yyyy-mm-dd.")
        render 'issue_medication' and return

      end

      @success = true
      render 'issue_medication'


    end
  end

  def validate_issue_medication_post
    @errors = Array.new

    # check for empty
    if params[:time_hours].empty? or
       params[:di_date].empty? or
       params[:d_dosage].empty? or
       params[:eID].empty? or
       params[:mname].empty? or
       params[:careCardNo].empty?

      @errors.push("Please enter a value for each field.")

      return false
    end

   return true
  end

end
