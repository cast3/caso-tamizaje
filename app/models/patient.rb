class Patient < ApplicationRecord
    validates :identification, presence: { message: "El campo de identificación es obligatorio" }
    validates :name, presence: { message: "El nombre es obligatorio" }
    validates :height, presence: { message: "La altura es obligatoria" }
    validates :mass, presence: { message: "La masa es obligatoria" }
    validates :systolic_pressure, presence: { message: "La presión sistólica es obligatoria" }
    validates :diastolic_pressure, presence: { message: "La presión diastólica es obligatoria" }
    
    validates :height, length: { maximum: 10, message: "La altura no puede tener más de 10 caracteres" }
    validates :mass, length: { maximum: 10, message: "La masa no puede tener más de 10 caracteres" }
    validates :systolic_pressure, length: { maximum: 10, message: "La presión sistólica no puede tener más de 10 caracteres" }
    validates :diastolic_pressure, length: { maximum: 10, message: "La presión diastólica no puede tener más de 10 caracteres" }

    def calcularIndiceMasaCorporal
        self.mass / (self.height * self.height)
    end

    def calcularMasaMaximaNormal
        25 * (self.height * self.height)
    end

    def calcularCategoriaPresionArterial
        if self.systolic_pressure <= 119 && self.diastolic_pressure <= 79
           "Normal"
        elsif self.systolic_pressure <= 119 && self.diastolic_pressure <= 79
           "Prehipertensión"
        else
           "Hipertensión"
        end
    end

    def calcularCategoriaMasaCorporal
        if (calcularIndiceMasaCorporal() <= 18.5)
            "Bajo peso"
        elsif (calcularIndiceMasaCorporal() <= 25)
            "Normal"
        elsif (calcularIndiceMasaCorporal() <= 30)
            "Sobrepeso"
        else
            "Obesidad"
        end
    end
end
