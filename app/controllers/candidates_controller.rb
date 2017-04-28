class CandidatesController < ApplicationController
  before_action :find_candidate, only: [:show, :destroy, :edit, :update, :vote]
  
  def index
    @candidates = Candidate.all
  end
  def new
    @candidate = Candidate.new
  end
  def show
  end
  def destroy
    @candidate.destroy
    # flash[:notice] = "deleted!"
    redirect_to candidates_path, notice: "deleted!"
  end
  def create
    
    @candidate = Candidate.new(candidate_params)
    
    if @candidate.save
      redirect_to candidates_path, nootice: "successful!"
    else
      render 'new'
    end
  end
  def edit
  end
  def update
    if @candidate.update(candidate_params)
      redirect_to candidates_path, notice: "update!!"
    else
      render 'edit'
    end
  end
  def vote
    log = Log.new(candidate: @candidate, ip_address: request.remote_ip)
    @candidate.logs << log
    @candidate.save
    redirect_to candidates_path, notice: "Done!"
  end
  private
  def candidate_params
    params.require("candidate").permit(:name,:party,:age,:politics)
  end
  def find_candidate
    @candidate = Candidate.find_by(id: params[:id])
    redirect_to candidates_path, notice: "No data!!" if @candidate.nil?
  end
end