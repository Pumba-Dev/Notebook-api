class AdressesController < ApplicationController
    before_action :set_contact

    def destroy
        @contact.adress.destroy    
    end

    def create
        @contact.adress = Adress.new(adress_params)

        if(@contact.save)
            render json: @contact.adress, status: :created, location: contact_adress_url(@contact)
        else
            render json: @contact.errors, status: :unprocessable_entity
        end
    end

    def update
        if @contact.adress.update(adress_params)
            render json: @contact.adress
        else
            render json: @contact.errors, status: :unprocessable_entity
        end
    end

    # GET /adress
    def show
        render json: @contact.adress
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
        @contact = Contact.find(params[:contact_id])
    end

    def adress_params
        ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end
    
end
