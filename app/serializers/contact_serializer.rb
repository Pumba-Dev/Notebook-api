class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate
  
  belongs_to :kind do
    link(:related) { contact_kind_url(object.id) }
  end

  has_many :phones do
    link(:related) { contact_phones_url(object.id) }
  end

  has_one :adress do
    link(:related) { contact_adress_url(object.id) }
  end

  def attributes(*args)
    hashObject = super(*args)
    hashObject[:birthdate] = ( hashObject[:birthdate].to_time.iso8601 unless hashObject[:birthdate].blank?)
    hashObject
  end
end
