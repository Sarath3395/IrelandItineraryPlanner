require 'reported_errors_logger'
require 'simple_writer'
require 'numbering_writer'
require 'report_error_result_generator'
require 'document_type'

class ReportErrorsController < ApplicationController
  before_action :set_report_error, only: [:show, :edit, :update, :destroy]

  # GET /report_errors
  # GET /report_errors.json
  def index
    @report_errors = ReportError.where(user_id: current_user.id)
  end

  # GET /report_errors/1
  # GET /report_errors/1.json
  def show
  end

  # GET /report_errors/new
  def new
    @report_error = ReportError.new
  end

  # GET /report_errors/1/edit
  def edit
  end

  def numberedlog
    numberedline = NumberingWriter.new(SimpleWriter.new('ReportedErrorsLog.txt'))
    File.open("mylog.txt",'r') do |fileb|
      while line = fileb.gets
        numberedline.write_line line
      end
    end
    numberedline.close
  end

  def sendtextfile
    send_file(
        "#{Rails.root}/ReportedErrorsLog.txt",
        filename: "ReportedErrorsLog.txt",
        type: "txt",
        disposition: 'inline'
    )
  end

  def viewlogs


    if params[:commit] == 'ViewErrorReportedLogs'

      if params[:linenumber_check].to_s.length > 0 then
        if(params[:viewlogs][:viewtype] == "pdf")
          numberedlog
          pdf = Prawn::Document.new
          File.open("ReportedErrorsLog.txt",'r') do |fileb|
            while line = fileb.gets
              pdf.text "#{line}"
            end
          end

          send_data pdf.render, filename: "ReportedErrorsLog",
                    type: "application/pdf",
                    disposition: "inline"

        else
          #numberedlog
          generatereport = ReportErrorResultGenerator.new(NumberedTextReport.new)
          generatereport.reporting
          sendtextfile
        end
        #numberedlog

      else

        if(params[:viewlogs][:viewtype] == "pdf")

          pdf = Prawn::Document.new
          File.open("mylog.txt",'r') do |fileb|
            while line = fileb.gets
              pdf.text "#{line}"
            end
          end

          send_data pdf.render, filename: "ReportedErrorsLog",
                    type: "application/pdf",
                    disposition: "inline"

        else

          generatereport = ReportErrorResultGenerator.new(TextReport.new)
          generatereport.reporting
          sendtextfile

        end

      end

    end

  end
  # POST /report_errors
  # POST /report_errors.json
  def create
    @report_error = ReportError.new(report_error_params)
    #sorted = Hash.new(0)
    adminusers = User.where(admin: true)
    aduser = adminusers.order("RANDOM()")
    @report_error.user_id = aduser.first.id
    if( user_signed_in? )
      @reported_by = current_user.name
    else
      @reported_by = "User Not LoggedIn"
    end
    respond_to do |format|
      if @report_error.save
        # retrieve the instance/object of the ReportedErrorsLogger class
        logger = ReportedErrorsLogger.instance
        u = User.find_by_id(@report_error.user_id)
        if (@reported_by == "User Not LoggedIn")
        logger.logInformation("#{Time.now} An error is reported by user_id: #{@reported_by}, user_name: #{@reported_by} with the error message: #{@report_error.errormessage} and the error is assigned to user_id: #{@report_error.user_id}, user_name: #{u.name} ")

        else
          logger.logInformation("#{Time.now} An error is reported by user_id: #{current_user.id}, user_name: #{current_user.name} with the error message: #{@report_error.errormessage} and the error is assigned to user_id: #{@report_error.user_id}, user_name: #{u.name} ")
        end
        #changed
        #notify_observers(self, @report_error)
        format.html { redirect_to root_path, notice: 'Report error was successfully created.' }
        format.json { render :show, status: :created, location: @report_error }
      else
        format.html { render :new }
        format.json { render json: @report_error.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /report_errors/1
  # PATCH/PUT /report_errors/1.json
  def update
    respond_to do |format|
      if @report_error.update(report_error_params)
        format.html { redirect_to @report_error, notice: 'Report error was successfully updated.' }
        format.json { render :show, status: :ok, location: @report_error }
      else
        format.html { render :edit }
        format.json { render json: @report_error.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /report_errors/1
  # DELETE /report_errors/1.json
  def destroy
    @report_error.destroy
    respond_to do |format|
      format.html { redirect_to report_errors_url, notice: 'Report error was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_report_error
    @report_error = ReportError.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def report_error_params
    params.require(:report_error).permit(:errormessage)
  end
end
