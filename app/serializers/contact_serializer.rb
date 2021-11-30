class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate
  
  belongs_to :kind do
    link(:related) { kind_url(object.kind.id) }
  end
  has_many :phones
  has_one :adress

  def attributes(*args)
    hashObject = super(*args)
    hashObject[:birthdate] = ( hashObject[:birthdate].to_time.iso8601 unless hashObject[:birthdate].blank?)
    hashObject
  end
end
