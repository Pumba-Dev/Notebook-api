class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate
  
  belongs_to :kind
  has_many :phones
  has_one :adress
  
  def attributes(*args)
    hashObject = super(*args)
    hashObject[:birthdate] = ( hashObject[:birthdate].to_time.iso8601 unless hashObject[:birthdate].blank?)
    hashObject
  end
end
