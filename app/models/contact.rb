class Contact < ApplicationRecord
    def author
        "PumbaSD"
    end

    def as_json(options={})
        super(methods: :author, root: true, only: [:name, :email, :birthdate])
    end
end
