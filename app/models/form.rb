class Form
  include Mongoid::Document
  include Mongoid::Timestamps
  field :fecha_de_staff, type: Date
  field :dias_transcurridos, type: Integer
  field :staff, type: String
  field :identificacion, type: String
  field :paciente, type: String
  field :eps, type: String
  field :medico_tratante, type: String
  field :medico_remitente, type: String
  field :fecha_de_remision, type: Date
  field :cod_diagnostico, type: String
  field :nombre_diagnostico, type: String
  field :manejo_actual, type: String
  field :estado_enfermedad, type: String
  field :propuesta_discutir, type: String
  field :revision_histologica, type: String
  field :hallazgos_diferentes, type: String
  field :revision_imagenes, type: String
  field :hallazgos_revision_imagenes, type: String
  field :qt, type: String
  field :rt, type: String
  field :cx, type: String
  field :consulta_especialidad_quirurgica, type: String
  field :consulta_oncologo_hematologo, type: String
  field :consulta_dolor_cuidados_paliativos, type: String
  field :estudios_imagenes, type: String
  field :estudios_moleculares, type: String
  field :estudios_genomicos, type: String
  field :biopsia, type: String
  field :medicamento_alto_costo, type: String
  field :cual_medicamento_alto_costo, type: String
  field :intencion_del_tratamiento, type: String
  field :valoracion_otro_staff, type: String
  field :staff_remitente, type: String
  field :responsable_cigespa, type: String
  field :fecha_gestion, type: Date
  field :gestion_realizada, type: String
  field :order_staff_id, type: BSON::ObjectId

  belongs_to :order_staff, foreign_key: :order_staff_id
  index({ order_staff_id: 1 })

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Form.create! row.to_hash
    end
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |form|
        csv << form.attributes.values_at(*column_names)
      end
    end
  end

end
