class AdressesController < ApplicationController
    before_action :set_adress

    # GET /adress
    def show
        render json: @adress
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_adress
        @adress = Contact.find(params[:contact_id]).adress
    end
    
end
