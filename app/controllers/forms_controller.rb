class FormsController < ApplicationController
  def diligenciador
    @staff = params[:staff]
    @fechas_staff = params[:fechas_staff]
    @identificacion = params[:identificacion]
    @paciente = params[:paciente]
    @eps = params[:eps]
    @responsables = params[:responsables]
    @remitente = params[:remitente]
    @fecha_ejecucion = params[:fecha_ejecucion]
    @cod_diagnostico = params[:cod_diagnostico]
    @diagnostico = params[:diagnostico]
    @dias_transcurridos = params[:dias_transcurridos]
    @id_relacional = params[:id_relacional]
  end


  def visualizador
    if  $identificacion.nil? == true or $id_relacional.nil? == true
      redirect_to "order_staffs/gestionados"
   end
    $id_relacional = params[:id_relacional]
    $identificacion = params[:identificacion]
    form = Form.where(:order_staff_id => $id_relacional, :identificacion => $identificacion)
    @form = form
    

  end
  def formularios
    @forms = Form.all
  end

  def guardar_formulario_staff

    if  $identificacion.nil? == true or $id_relacional.nil? == true
       redirect_to "order_staffs/gestionados"
    end

    $fecha_staff = params[:fecha_staff]
    $id_relacional = params[:id_relacional]
    $dias_trancurridos = params[:dias_trancurridos]
    $staff = params[:staff]
    $identificacion = params[:identificacion]
    $paciente = params[:paciente]
    $eps = params[:eps]
    $medico_tratante = params[:medico_tratante]
    $medico_remitente = params[:medico_remitente]
    $fecha_remision_staff = params[:fecha_remision_staff]
    $codigo_diagnostico = params[:codigo_diagnostico]
    $diagnostico = params[:diagnostico]
    $manejo_actual = params[:manejo_actual]
    $estado_enfermedad = params[:estado_enfermedad]
    $propuesta_discutir = params[:propuesta_discutir]
    $revision_histologica = params[:revision_histologica]
    $hallazgos_diferentes = params[:hallazgos_diferentes]
    $revision_imagenes = params[:revision_imagenes]
    $hallazgos_revision_imagenes = params[:hallazgos_diferentes_imagenes]
    $qt = params[:qt]
    $rt = params[:rt]
    $cx = params[:cx]
    $consulta_especialidad_quirurgica = params[:consulta_especialidad_quirurgica]
    $consulta_oncologo_hematologo = params[:consulta_oncologo_hematologo]
    $dolor_y_paliativos = params[:dolor_y_paliativos]
    $estudios_imagenes = params[:estudios_imagenes]
    $estudios_moleculares = params[:estudios_moleculares]
    $estudios_genomicos = params[:estudios_genomicos]
    $biopsia = params[:biopsia]
    $medicamento_alto_costo = params[:medicamento_alto_costo]
    $cual_medicamento_alto_costo = params[:cual_medicamento_alto_costo]
    $intencion_del_tratamiento = params[:intencion_del_tratamiento]
    $valoracion_otro_staff = params[:valoracion_otro_staff]
    $staff_remitente = params[:staff_remitente]
    $responsable_cigespa = params[:responsable_cigespa]
    $fecha_de_gestion = params[:fecha_de_gestion]
    $gestion_realizada = params[:gestion_realizada]





    form = Form.new(:fecha_de_staff => $fecha_staff,:dias_transcurridos => $dias_trancurridos,
    :staff => $staff,:identificacion => $identificacion,:paciente => $paciente,
    :eps => $eps,:medico_tratante => $medico_tratante,:medico_remitente => $medico_remitente,
    :fecha_de_remision => $fecha_remision_staff, :cod_diagnostico =>  $codigo_diagnostico,
    :nombre_diagnostico => $diagnostico,:manejo_actual => $manejo_actual,
    :estado_enfermedad => $estado_enfermedad, :propuesta_discutir => $propuesta_discutir,:revision_histologica => $revision_histologica,
    :hallazgos_diferentes => $hallazgos_diferentes,:revision_imagenes => $revision_imagenes,:revision_imagenes => $revision_imagenes,
    :hallazgos_revision_imagenes => $hallazgos_revision_imagenes,:qt => $qt,:rt => $rt,:cx => $cx,:consulta_especialidad_quirurgica => $consulta_especialidad_quirurgica,:consulta_oncologo_hematologo => $consulta_oncologo_hematologo,
    :consulta_dolor_cuidados_paliativos => $dolor_y_paliativos,:estudios_imagenes => $estudios_imagenes,:estudios_moleculares => $estudios_moleculares,:estudios_genomicos => $estudios_genomicos,:biopsia => $biopsia,
    :medicamento_alto_costo => $medicamento_alto_costo,:cual_medicamento_alto_costo => $cual_medicamento_alto_costo,:intencion_del_tratamiento => $intencion_del_tratamiento,
    :valoracion_otro_staff => $valoracion_otro_staff,:staff_remitente => $staff_remitente, :responsable_cigespa =>  $responsable_cigespa,:fecha_gestion => $fecha_de_gestion,
    :gestion_realizada => $gestion_realizada,:order_staff_id => $id_relacional)

    form.save

    orden_paciente = OrderStaff.where(:identificacion => $identificacion,:id => $id_relacional)
    orden_paciente.each do |orden|
      orden.estado_formulario = true
      orden.save
    end
    begin
    redirect_to :action => "visualizador",:identificacion => $identificacion,:id_relacional => $id_relacional
    rescue
      redirect_to :action => "visualizador",:identificacion => $identificacion,:id_relacional => $id_relacional
    end
  end
end
