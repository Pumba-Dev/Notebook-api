class Contact < ApplicationRecord

    # Associations
    belongs_to :kind
    has_many :phones
    has_one :adress
    
    accepts_nested_attributes_for :phones, allow_destroy: true
    accepts_nested_attributes_for :adress, update_only: true
    
    
    def as_json(options={})
        hashJson = super(options)
        hashJson[:birthdate] = I18n.l(hashJson[:birthdate]) unless hashJson[:birthdate].blank?
        hashJson
    end
end
