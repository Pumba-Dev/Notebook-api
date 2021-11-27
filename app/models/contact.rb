class Contact < ApplicationRecord

    # Associations
    belongs_to :kind, optional: false
    has_many :phones

    # def author
    #     "PumbaSD"
    # end

    # def kind_description
    #     self.kind.description
    # end
    
    # def as_json(options={})
    #     super(
    #         root: true,
    #         methods: [:to_br]
    #     )
    # end
    
    def to_br
        {
            name: self.name,
            email: self.email,
            birthdate: (I18n.l(self.birthdate) unless self.birthdate.blank?)
        }
    end

end
