class Weight < ActiveRecord::Base
  validates_numericality_of :weight, :message => "O peso deve ser um número e os decimais devem ser separados por ponto"
  # validates_size_of :weight, :within => 1..200, :message => "O peso deve ser maior que zero e menor que 200 quilos"
end
