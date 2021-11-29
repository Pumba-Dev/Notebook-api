class Contact < ApplicationRecord

    # Associations
    belongs_to :kind, optional: false
    
    has_many :phones
    accepts_nested_attributes_for :phones, allow_destroy: true
    
    has_one :adress
    accepts_nested_attributes_for :adress

    # def author
    #     "PumbaSD"
    # end

    # def kind_description
    #     self.kind.description
    # end
    
    def as_json(options={})
        hashJson = super(options)
        hashJson[:birthdate] = I18n.l(hashJson[:birthdate]) unless hashJson[:birthdate].blank?
        hashJson
    end
    
    # def to_br
    #     {
    #         name: self.name,
    #         email: self.email,
    #         birthdate: (I18n.l(self.birthdate) unless self.birthdate.blank?)
    #     }
    # end

end
