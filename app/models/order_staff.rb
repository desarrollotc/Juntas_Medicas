class OrderStaff
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :paciente, type: Symbol
  field :tipo, type: Symbol
  field :identificacion, type: Symbol
  field :fecha_ejecucion, type: Date
  field :observacion, type: String, default:"sin observacion"
  field :justificacion, type: String, default:"sin justificacion"
  field :cod_diagnostico, type: String
  field :nombre_diagnostico, type: String
  field :gestionado, type: Boolean, default: false
  field :estado_formulario, type: Boolean, default: false
  field :medico_remitente, type: String
  field :grupos, type:Hash, default: {"cirugia_mohs" =>  {"incluido" => false,
    "estado" => false,
    "responsable" => "",
    "nota" => "",
    "fecha_captacion" => Time.now.strftime("%F")
},
"dermatologia" =>  {"incluido" => false,
"estado" => false,
"responsable" => "",
"nota" => "",
"fecha_captacion" => Time.now.strftime("%F")
},
"linfomas_cutaneos" =>  {"incluido" => false,
"estado" => false,
"responsable" => "",
"nota" => "",
"fecha_captacion" => Time.now.strftime("%F")
},
"funcional_clinico" =>  {"incluido" => false,
"estado" => false,
"responsable" => "",
"nota" => "",
"fecha_captacion" => Time.now.strftime("%F")
},
"funcional_quirurgico" =>  {"incluido" => false,
"estado" => false,
"responsable" => "",
"nota" => "",
"fecha_captacion" => Time.now.strftime("%F")
},
"torax" =>  {"incluido" => false,
"estado" => false,
"responsable" => "",
"nota" => "",
"fecha_captacion" => Time.now.strftime("%F")
},
"gastrointestinal" =>  {"incluido" => false,
"estado" => false,
"responsable" => "",
"nota" => "",
"fecha_captacion" => Time.now.strftime("%F")
},
"mastologia" =>  {"incluido" => false,
"estado" => false,
"responsable" => "",
"nota" => "",
"fecha_captacion" => Time.now.strftime("%F")
},
"terapias_especiales" =>  {"incluido" => false,
"estado" => false,
"responsable" => "",
"nota" => "",
"fecha_captacion" => Time.now.strftime("%F")
},
"oncologia" =>  {"incluido" => false,
"estado" => false,
"responsable" => "",
"nota" => "",
"fecha_captacion" => Time.now.strftime("%F")
},
"cirugia_cabeza_cuello" =>  {"incluido" => false,
"estado" => false,
"responsable" => "",
"nota" => "",
"fecha_captacion" => Time.now.strftime("%F")
},
"tumores_pelvicos" =>  {"incluido" => false,
"estado" => false,
"responsable" => "",
"nota" => "",
"fecha_captacion" => Time.now.strftime("%F")
},
"peritoneo" =>  {"incluido" => false,
"estado" => false,
"responsable" => "",
"nota" => "",
"fecha_captacion" => Time.now.strftime("%F")
},
"hematologia" =>  {"incluido" => false,
"estado" => false,
"responsable" => "",
"nota" => "",
"fecha_captacion" => Time.now.strftime("%F")
}

}
  field :eps, type:String, default:"sin eps"
  field :estado_gestion, type:String, default: "pendiente"
  field :asignados, type:Array, default: []
  field :gestionados, type:Array, default: []

  has_many :form
 
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      OrderStaff.create! row.to_hash
    end
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |order_staff|
        csv << order_staff.attributes.values_at(*column_names)
      end
    end
  end

end
