require 'my_logger'
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

  # POST /report_errors
  # POST /report_errors.json
  def create
    @report_error = ReportError.new(report_error_params)
    #sorted = Hash.new(0)
    adminusers = User.where(admin: true)
    aduser = adminusers.order("RANDOM()")
    @report_error.user_id = aduser.first.id

    respond_to do |format|
      if @report_error.save
        # retrieve the instance/object of the MyLogger class
        logger = MyLogger.instance
        logger.logInformation("An error is with the error message: " + @report_error.errormessage)
        #add_observer(ErrorObserver.new)

        #changed
        #notify_observers(self, @report_error)
        format.html { redirect_to root_path, notice: 'An Email was sent to the assigned user for the reported error.' }
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
