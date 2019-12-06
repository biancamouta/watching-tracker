class General < ApplicationRecord
  
    validates :name, length: {minimum: 4}
    validates :status, presence: true

    def status_name 

        if status=="in_progress"
            "Em Andamento"
        elsif status=="done"
            "Finalizada"
        elsif status=="cancelled"
            "Cancelada"
        end

    end
end
