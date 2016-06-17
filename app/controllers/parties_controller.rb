class PartiesController < ApplicationController
  before_action :set_party, only: [:show, :edit, :update, :destroy]
  # No point doing it
  skip_before_action :verify_authenticity_token
  # GET /parties
  # GET /parties.json
  def index
    @parties = Party.all
  end

  # GET /parties/1
  # GET /parties/1.json
  def show
  end

  def change
    reference_code = party_params[:reference_code]
    @party = Party.where(reference_code: reference_code).first

  end

  # GET /parties/new
  def new
    @party = Party.new
  end

  # GET /parties/1/edit
  def edit
  end

  def load
    if request.xhr?
      render partial: 'load', layout: false, locals: {use_modal_links: true}
    end
  end

  # POST /parties
  # POST /parties.json
  def create
    @party = Party.new(party_params)
    @party.assign_guests!
    @party.assign_random_reference_code

    if @party.save
      #PartyMailer.confirmation_email(@party)
      #head 200
      flash[:success] = "Reservation Successful"
    else
      #head 422
      flash[:error] = "Reservation not success. Please try again"
    end
    redirect_to localized_root_path
  end

  # PATCH/PUT /parties/1
  # PATCH/PUT /parties/1.json
  def update
    @party.update(party_params)
    @party.assign_guests!
    if @party.save
      flash[:success] = "Reservation Info Updated"
    else
      flash[:error] = "Reservation not success. Please try again"
    end
    redirect_to localized_root_path
  end

  # DELETE /parties/1
  # DELETE /parties/1.json
  def destroy
    @party.destroy
    respond_to do |format|
      format.html { redirect_to parties_url, notice: 'Party was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_party
      @party = Party.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def party_params
      params.require(:party).permit(:email, :phone, :address, {last_names: []}, {first_names: []}, :reference_code)
    end
end
