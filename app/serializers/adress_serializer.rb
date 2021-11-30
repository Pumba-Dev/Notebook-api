class AdressSerializer < ActiveModel::Serializer
  attributes :id, :street, :city

  belongs_to :contact do
    link(:related) { contact_adress_url(object.contact.id) }
  end
end
