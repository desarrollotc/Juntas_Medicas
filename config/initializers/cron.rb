class Cron

  def self.ordenes_hospitalarias_ambulatorias
    oracle=Oracleq.new
    @query=oracle.obtener_ordenes_ambulatorias_hospitalarias

    if @query.present?
      @ejemplo = "si traje"
    else
        @ejemplo = "no traje"
    end
    

    @query.each do |elemento|
        orden = OrderStaff.new(:paciente => elemento["PACIENTE"],:tipo => elemento["TIPO"],
        :identificacion => elemento["IDENTIFICACION"], :fecha_ejecucion => elemento["FECHA_EJECUCION"],
        :justificacion => elemento["JUSTIFICACION"],:observacion => elemento["OBSERVACION"],
        :cod_diagnostico => elemento["COD_DIAGNOSTICO"],:nombre_diagnostico => elemento["NOMBRE_CIE10"],
        :medico_remitente => elemento["NOM_MEDICO"])
        orden.save
    end
 

  

end

end
