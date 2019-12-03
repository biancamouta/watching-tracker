class General < ApplicationRecord
    validates :name, length: {minimum: 4}
    validates :status, presence: true

    def status_name 
        if status=="in_progress"
            "Em Andamento"
        end

        if status=="done"
            "Finalizada"
        end

        if status=="cancelled"
            "Cancelada"
        end

    end


end
