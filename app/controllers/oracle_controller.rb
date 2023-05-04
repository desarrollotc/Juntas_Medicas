class OracleController < ApplicationController

    def self.ordenes_hospitalarias_ambulatorias
        oracle=Oracleq.new
        @query=oracle.obtener_ordenes_ambulatorias_hospitalarias

        if @query.present?
          @ejemplo = "si traje"
        else
            @ejemplo = "no traje"
        end
        

        @query.each do |elemento|
            orden = OrderStaff.new(:paciente => elemento["PACIENTE"].gsub("?",""),:tipo => elemento["TIPO"],
            :identificacion => elemento["IDENTIFICACION"], :fecha_ejecucion => elemento["FECHA_EJECUCION"],
            :justificacion => elemento["JUSTIFICACION"].gsub('?',''),:observacion => elemento["OBSERVACION"].gsub("?",""),
            :cod_diagnostico => elemento["COD_DIAGNOSTICO"],:nombre_diagnostico => elemento["NOMBRE_CIE10"],
            :medico_remitente => elemento["NOM_MEDICO"])
            orden.save
        end
     

        respond_to do |format|
            format.html
            format.json { render json: @query }
        end

    end
       
    
end
