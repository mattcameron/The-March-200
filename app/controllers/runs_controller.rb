class RunsController < ApplicationController
  before_action :set_run, only: [:show, :edit, :update, :destroy]
  helper_method :sort_direction, :sort_column

  # GET /runs
  # GET /runs.json
  def index
    @runs = Run.all.order(sort_column + ' ' + sort_direction)
  end

  # GET /runs/1
  # GET /runs/1.json
  def show
  end

  # GET /runs/new
  def new
    @run = Run.new
  end

  # GET /runs/1/edit
  def edit
  end

  # POST /runs
  # POST /runs.json
  def create
    @run = Run.new(run_params)

    respond_to do |format|
      if @run.save
        format.html { redirect_to runs_path, notice: 'Run was successfully created.' }
        format.json { render :show, status: :created, location: @run }
      else
        format.html { render :new }
        format.json { render json: @run.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /runs/1
  # PATCH/PUT /runs/1.json
  def update
    respond_to do |format|
      if @run.update(run_params)
        format.html { redirect_to @run, notice: 'Run was successfully updated.' }
        format.json { render :show, status: :ok, location: @run }
      else
        format.html { render :edit }
        format.json { render json: @run.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /runs/1
  # DELETE /runs/1.json
  def destroy
    @run.destroy
    respond_to do |format|
      format.html { redirect_to runs_url, notice: 'Run was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_run
      @run = Run.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def run_params

      time = convert_time_to_seconds(params[:temp_time]["time(4i)"], params[:temp_time]["time(5i)"], params[:temp_time]["time(6i)"])

      edited_params = params
      edited_params[:run][:time] = time

      edited_params.require(:run).permit(:distance, :date, :time, :speed)
    end

    def convert_time_to_seconds(hours, minutes, seconds)
      time = (hours.to_i.hours + minutes.to_i.minutes + seconds.to_i.seconds).to_i
    end

    private

    def sort_direction
      ['asc', 'desc'].include?(params[:direction]) ? params[:direction] : 'desc'
    end

    def sort_column
      params[:sort] || 'date'
    end
end
