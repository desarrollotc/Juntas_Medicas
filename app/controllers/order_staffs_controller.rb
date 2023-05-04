class OrderStaffsController < ApplicationController
  def staff
    @staff = OrderStaff.where(:asignados => [])
    @fecha_actual = Time.now.strftime("%F")
    id_usuario = current_user.id
  end

  def charts
    staff = OrderStaff.all
    staff_pendientes = OrderStaff.where(:estado_gestion => "pendiente")
    staff_gestionados = OrderStaff.where(:estado_gestion => "terminada")
    @todas_ls_ordenes = staff.size
    @ordenes_pendientes =  staff_pendientes.size
    @ordenes_resueltas = staff_gestionados.size
    $porcentaje_ordenes_pendientes = @ordenes_pendientes*100/@todas_ls_ordenes
    $porcentaje_ordenes_resueltas = @ordenes_resueltas*100/@todas_ls_ordenes
    


    @barv = Gchart.pie(
      :size => '600x400',
      :bar_colors => ['24346C','000000','6786B8'],
      :title => "Pacientes Gestionados y Sin Gestionar",
      :bg => 'EFEFEF',
      :legend => ['Pendientes '+@ordenes_pendientes.to_s+' ('+$porcentaje_ordenes_pendientes.to_s+'%)', 'Gestionados '+ @ordenes_resueltas.round.to_s+' ('+ $porcentaje_ordenes_resueltas.to_s+'%)'],
      :data =>[@ordenes_pendientes, @ordenes_resueltas],
      :stacked => false,
      :legend_position => 'left',
      :axis_with_labels =>[["A|B|C|D|E"]],
    )

    #obtengo pacientes cirugia_mohs
    mohs = []
    
    orden = OrderStaff.all.each do |ord|
       
        if ord.grupos["cirugia_mohs"]["incluido"] == true
          mohs << ord
        end
    end
    @total_mohs = mohs.size

    #obtengo pacientes dermatologia
    derma = []
    orden = OrderStaff.all.each do |ord|
        if ord.grupos["dermatologia"]["incluido"] == true
           derma << ord
        end
    end
    @total_derma = derma.size
    #obtengo pacientes linfomas
    linfomas = []
    orden = OrderStaff.all.each do |ord|
        if ord.grupos["linfomas_cutaneos"]["incluido"] == true
          linfomas << ord
        end
    end
    @total_linfomas = linfomas.size
    #obtengo pacientes funcional_clinico
    funcional_clinico = []
    orden = OrderStaff.all.each do |ord|
        if ord.grupos["funcional_clinico"]["incluido"] == true
          funcional_clinico << ord
        end
    end
    @total_funcional_clinico = funcional_clinico.size

    #obtengo pacientes funcional_quirurgico
    quirurgico = []
    orden = OrderStaff.all.each do |ord|
        if ord.grupos["funcional_quirurgico"]["incluido"] == true
          quirurgico << ord
        end
    end
    @total_quirurgico = quirurgico.size

    #obtengo pacientes torax 
    torax = []
    orden = OrderStaff.all.each do |ord|
        if ord.grupos["torax"]["incluido"] == true
           torax << ord
        end
    end
    @total_torax = torax.size
    #obtengo pacientes gastrointestinal
    gastro = []
    orden = OrderStaff.all.each do |ord|
        if ord.grupos["gastrointestinal"]["incluido"] == true
           gastro << ord
        end
    end
    @total_gastro = gastro.size

    #obtengo pacientes mastologia
    mastologia = []
    orden = OrderStaff.all.each do |ord|
        if ord.grupos["mastologia"]["incluido"] == true
           mastologia << ord
        end
    end
    @total_mastologia = mastologia.size

    #obtengo pacientes terapias especiales
    especiales = []
    orden = OrderStaff.all.each do |ord|
        if ord.grupos["terapias_especiales"]["incluido"] == true
           especiales << ord
        end
    end
    @total_especiales = especiales.size

     #obtengo pacientes terapias Oncologia

     oncologia = []
     orden = OrderStaff.all.each do |ord|
         if ord.grupos["oncologia"]["incluido"] == true
            oncologia << ord
         end
     end
     @total_oncologia = oncologia.size

     #obtengo pacientes Cirugia_cabeza_cuello
     cabeza_cuello = []
     orden = OrderStaff.all.each do |ord|
         if ord.grupos["cirugia_cabeza_cuello"]["incluido"] == true
            cabeza_cuello << ord
         end
     end
     @total_cabeza_cuello = cabeza_cuello.size

     #obtengo pacientes tumores_pelvicos
     pelvicos = []
    orden = OrderStaff.all.each do |ord|
        if ord.grupos["tumores_pelvicos"]["incluido"] == true
           pelvicos << ord
        end
    end
    @total_pelvicos = pelvicos.size

    #obtengo pacientes peritoneo
    peritoneo = []
    orden = OrderStaff.all.each do |ord|
        if ord.grupos["peritoneo"]["incluido"] == true
           peritoneo << ord
        end
    end
    @total_peritoneo = peritoneo.size

    #obtengo pacientes hematologia
    hematologia = []
    orden = OrderStaff.where(:estado_gestion => "pendiente").each do |ord|
        if ord.grupos["hematologia"]["incluido"] == true
           hematologia << ord
        end
    end
    @total_hematologia = hematologia.size


    #obtengo pacientes dolor
    dolor = []
    orden = OrderStaff.where(:estado_gestion => "pendiente").each do |ord|
        if ord.grupos["dolor"]["incluido"] == true
           dolor << ord
        end
    end
    @total_dolor = dolor.size

    #obtengo pacientes muerte digna
    muerte_digna = []
    orden = OrderStaff.where(:estado_gestion => "pendiente").each do |ord|
        if ord.grupos["muerte_digna"]["incluido"] == true
           dolor << ord
        end
    end
    @total_muerte_digna = muerte_digna.size

    #obtengo pacientes extra institucional
    extra_institucional = []
    orden = OrderStaff.where(:estado_gestion => "pendiente").each do |ord|
        if ord.grupos["extra_institucional"]["incluido"] == true
           dolor << ord
        end
    end
    @total_extra_institucional = extra_institucional.size

   

    $todos_los_grupos_tumor = @total_mohs+@total_derma+@total_linfomas+@total_funcional_clinico+@total_quirurgico+@total_torax+@total_gastro+@total_mastologia+@total_especiales+@total_oncologia+@total_cabeza_cuello+@total_pelvicos+@total_peritoneo+@total_hematologia
    @todos_los_grupos =  $todos_los_grupos_tumor
    $porcentaje_mohs = @total_mohs*100/$todos_los_grupos_tumor
    $porcentaje_dermatologia = @total_derma*100/$todos_los_grupos_tumor
    $porcentaje_linfomas = @total_linfomas*100/$todos_los_grupos_tumor
    $procentaje_funcional_clinico = @total_funcional_clinico*100/$todos_los_grupos_tumor
    $porcentaje_quirurgico = @total_quirurgico*100/$todos_los_grupos_tumor
    $porcentaje_torax = @total_torax*100/$todos_los_grupos_tumor
    $porcentaje_gastro = @total_gastro*100/$todos_los_grupos_tumor
    $porcentaje_mastologia = @total_mastologia*100/$todos_los_grupos_tumor
    $porcentaje_especiales = @total_especiales*100/$todos_los_grupos_tumor
    $porcentaje_oncologia = @total_oncologia*100/$todos_los_grupos_tumor
    $porcentaje_cabeza_cuello = @total_cabeza_cuello*100/$todos_los_grupos_tumor
    $porcentaje_pelvicos = @total_pelvicos*100/$todos_los_grupos_tumor
    $porcentaje_peritoneo = @total_peritoneo*100/$todos_los_grupos_tumor
    $porcentaje_hematologia = @total_hematologia*100/$todos_los_grupos_tumor
    $porcentaje_dolor = @total_dolor*100/$todos_los_grupos_tumor
    $porcentaje_muerte_digna = @total_muerte_digna*100/$todos_los_grupos_tumor
    $porcentaje_extra_institucional = @total_extra_institucional*100/$todos_los_grupos_tumor
    @barv2 = Gchart.pie(
      :size => '600x400',
      :bar_colors => ['24346C','000000','6786B8','3371FF','FFCE33','FF8633','FF4C33',
      '6234AF','8C1226','128C88','8C4D12','819994','1BD8B3','C70039','3BAF34'],
      :title => "Grupos De Tumor",
      :bg => 'EFEFEF',
      :legend => ['Cirugía De Mohs '+@total_mohs.to_s+' ('+$porcentaje_mohs.round.to_s+'%)', 'Dermatología '+@total_derma.to_s+' ('+ $porcentaje_dermatologia.round.to_s+'%)','Linfomas Citáneos '+@total_linfomas.round.to_s+' ('+$porcentaje_linfomas.round.to_s+'%)','Funcional Clínico '+@total_funcional_clinico.to_s+' ('+$procentaje_funcional_clinico.round.to_s+'%)',
      'Funcional Quirúrgico '+@total_quirurgico.to_s+' ('+$porcentaje_quirurgico.round.to_s+'%)','Tórax '+@total_torax.to_s+' ('+$porcentaje_torax.round.to_s+'%)','Gastrointestinal '+@total_gastro.to_s+' ('+$porcentaje_gastro.round.to_s+'%)','Mastología '+@total_mastologia.to_s+' ('+$porcentaje_mastologia.round.to_s+'%)','Terapias Especiales '+@total_especiales.to_s+' ('+$porcentaje_especiales.round.to_s+'%)',
      'Oncología '+@total_oncologia.to_s+' ('+$porcentaje_oncologia.round.to_s+'%)','Cirugía cabeza y cuello '+@total_cabeza_cuello.to_s+' ('+$porcentaje_cabeza_cuello.round.to_s+'%)','Tumores Pélvicos '+@total_pelvicos.to_s+' ('+$porcentaje_pelvicos.round.to_s+'%)','Peritoneo '+@total_peritoneo.to_s+' ('+$porcentaje_peritoneo.round.to_s+'%)','Hematología '+@total_hematologia.to_s+' ('+$porcentaje_hematologia.round.to_s+'%)',
      'Dolor '+@total_dolor.to_s+' ('+$porcentaje_dolor.round.to_s+'%)','Muerte Digna '+@total_muerte_digna.to_s+' ('+$porcentaje_muerte_digna.round.to_s+'%)','Extra Institucional '+@total_extra_institucional.to_s+' ('+$porcentaje_extra_institucional.round.to_s+'%)'],
      :data =>[@total_mohs, @total_derma, @total_linfomas, @total_funcional_clinico,@total_quirurgico,@total_torax,@total_gastro,@total_mastologia,@total_especiales,@total_oncologia,@total_cabeza_cuello,@total_pelvicos,@total_peritoneo,@total_hematologia,@total_dolor,@total_muerte_digna,@total_extra_institucional],
      :stacked => false,
      :legend_position => 'left',
      :axis_with_labels =>[["A|B|C|D|E"]],
    )



    

     


  end

  

  def todos_los_pacientes
    @order_staffs = OrderStaff.all
  end

  def pendientes
    @order_staffs = OrderStaff.where(:estado_gestion => "pendiente")
  end

  def completados
    @order_staffs = OrderStaff.where(:estado_gestion => "terminada")
  end

  def gestionados
    @fecha_actual = Time.now.strftime("%F")
    arreglo = []
    
    orden = OrderStaff.all.each do |ord|
       
        if ord.estado_gestion == "terminada"
           arreglo << ord
        end
    end
    @staff = arreglo
  end


  def gestionador
    @fecha_actual = Time.now.strftime("%F")
    @tipo = params[:tipo]
    @cedula = params[:identificacion]
    @id_relacional = params[:id_relacional]

    if @tipo.nil? == true  or @cedula.nil? == true
      redirect_to root_path
    end

    @orden = OrderStaff.where(:tipo => "#{@tipo}",:identificacion => "#{@cedula}",:id => "#{@id_relacional}")     
                                                     

    
  end


  def ver_gestion
   
    if params[:gestion].nil? == true
      params[:gestion] = "sin dato"
    end
    @fecha_actual = Time.now.strftime("%F")
    @estado_de_gestionado = params[:estado_de_gestionado]
    @gestion_grupo = params[:gestion_grupo]
    @tipo = params[:tipo]
    @cedula = params[:identificacion]
    @tumor = params[:tumor]
    @id_relacional = params[:id_relacional]
    

     if @tipo.nil? == true  or @cedula.nil? == true
       redirect_to root_path
     end

    @orden = OrderStaff.where(:tipo => "#{@tipo}",:identificacion => "#{@cedula}",:id=>"#{@id_relacional}")   
    #información del usuario de sesion  
    $informacion_usuario=[]
    usuario = User.where(:id => current_user.id).each do |item_usuario|
      $informacion_usuario<<item_usuario
    end
    @responsable = $informacion_usuario[0]["email"]
  end

  def cirugia_mohs
    @fecha_actual = Time.now.strftime("%F")
    arreglo = []
    
    orden = OrderStaff.where(:estado_formulario => false).each do |ord|
       
        if ord.grupos["cirugia_mohs"]["incluido"] == true
           arreglo << ord
        end
    end
    @staff = arreglo
  end

  def dermatologia
    @fecha_actual = Time.now.strftime("%F")
    arreglo = []
    orden = OrderStaff.where(:estado_formulario => false).each do |ord|
        if ord.grupos["dermatologia"]["incluido"] == true
           arreglo << ord
        end
    end
    @staff = arreglo
  end

  def linfomas_cutaneos
    @fecha_actual = Time.now.strftime("%F")
    arreglo = []
    orden = OrderStaff.where(:estado_formulario => false).each do |ord|
        if ord.grupos["linfomas_cutaneos"]["incluido"] == true
           arreglo << ord
        end
    end
    @staff = arreglo
  end

  def funcional_clinico
    @fecha_actual = Time.now.strftime("%F")
    arreglo = []
    orden = OrderStaff.where(:estado_formulario => false).each do |ord|
        if ord.grupos["funcional_clinico"]["incluido"] == true
           arreglo << ord
        end
    end
    @staff = arreglo
  end

  def funcional_quirurgico
    @fecha_actual = Time.now.strftime("%F")
    arreglo = []
    orden = OrderStaff.where(:estado_formulario => false).each do |ord|
        if ord.grupos["funcional_quirurgico"]["incluido"] == true
           arreglo << ord
        end
    end
    @staff = arreglo
  end

  def torax
    @fecha_actual = Time.now.strftime("%F")
    arreglo = []
    orden = OrderStaff.where(:estado_formulario => false).each do |ord|
        if ord.grupos["torax"]["incluido"] == true
           arreglo << ord
        end
    end
    @staff = arreglo
  end

  def gastrointestinal
    @fecha_actual = Time.now.strftime("%F")
    arreglo = []
    orden = OrderStaff.where(:estado_formulario => false).each do |ord|
        if ord.grupos["gastrointestinal"]["incluido"] == true
           arreglo << ord
        end
    end
    @staff = arreglo

  end

  def mastologia
    @fecha_actual = Time.now.strftime("%F")
    arreglo = []
    orden = OrderStaff.where(:estado_formulario => false).each do |ord|
        if ord.grupos["mastologia"]["incluido"] == true
           arreglo << ord
        end
    end
    @staff = arreglo
  end

  def terapias_especiales
    @fecha_actual = Time.now.strftime("%F")
    arreglo = []
    orden = OrderStaff.where(:estado_formulario => false).each do |ord|
        if ord.grupos["terapias_especiales"]["incluido"] == true
           arreglo << ord
        end
    end
    @staff = arreglo
  end

  def oncologia
    @fecha_actual = Time.now.strftime("%F")
    arreglo = []
    orden = OrderStaff.where(:estado_formulario => false).each do |ord|
        if ord.grupos["oncologia"]["incluido"] == true
           arreglo << ord
        end
    end
    @staff = arreglo
  end

  def cirugia_cabeza_cuello
    @fecha_actual = Time.now.strftime("%F")
    arreglo = []
    orden = OrderStaff.where(:estado_formulario => false).each do |ord|
        if ord.grupos["cirugia_cabeza_cuello"]["incluido"] == true
           arreglo << ord
        end
    end
    @staff = arreglo
  end

  def tumores_pelvicos
    @fecha_actual = Time.now.strftime("%F")
    arreglo = []
    orden = OrderStaff.where(:estado_formulario => false).each do |ord|
        if ord.grupos["tumores_pelvicos"]["incluido"] == true
           arreglo << ord
        end
    end
    @staff = arreglo
  end

  def peritoneo
    @fecha_actual = Time.now.strftime("%F")
    arreglo = []
    orden = OrderStaff.where(:estado_formulario => false).each do |ord|
        if ord.grupos["peritoneo"]["incluido"] == true
           arreglo << ord
        end
    end
    @staff = arreglo
  end

  def hematologia
    @fecha_actual = Time.now.strftime("%F")
    arreglo = []
    orden = OrderStaff.where(:estado_formulario => false).each do |ord|
        if ord.grupos["hematologia"]["incluido"] == true
           arreglo << ord
        end
    end
    @staff = arreglo
  end

  def dolor
    @fecha_actual = Time.now.strftime("%F")
    arreglo = []
    orden = OrderStaff.where(:estado_formulario => false).each do |ord|
       
        if ord.grupos["dolor"]["incluido"] == true
           arreglo << ord
        end
    end
    @staff = arreglo
  end

  def muerte_digna
    @fecha_actual = Time.now.strftime("%F")
    arreglo = []
    orden = OrderStaff.where(:estado_formulario => false).each do |ord|
       
        if ord.grupos["muerte_digna"]["incluido"] == true
           arreglo << ord
        end
    end
    @staff = arreglo
  end

  def extra_institucional
    @fecha_actual = Time.now.strftime("%F")
    arreglo = []
    orden = OrderStaff.where(:estado_formulario => false).each do |ord|
       
        if ord.grupos["extra_institucional"]["incluido"] == true
           arreglo << ord
        end
    end
    @staff = arreglo
  end

  def asignar
    grupos_asignar = []
    tipo = params[:tipo]
    identificacion = params[:identificacion]
    id_relacional = params[:id_relacional]

    cirugia_mohs = params[:cirugia_mohs]
    dermatologia = params[:dermatologia]
    linfomas_cutaneos = params[:linfomas_cutaneos]
    funcional_clinico = params[:funcional_clinico]
    funcional_quirurgico = params[:funcional_quirurgico]
    torax = params[:torax]
    gastrointestinal = params[:gastrointestinal]
    mastologia = params[:mastologia]
    terapias_especiales = params[:terapias_especiales]
    oncologia = params[:oncologia]
    cirugia_cabeza_cuello = params[:cirugia_cabeza_cuello]
    tumores_pelvicos = params[:tumores_pelvicos]
    peritoneo = params[:peritoneo]
    hematologia = params[:hematologia]
    dolor = params[:dolor]
    muerte_digna = params[:muerte_digna]
    extra_institucional = params[:extra_institucional]

    if cirugia_mohs != nil
      grupos_asignar << cirugia_mohs
    end
    if dermatologia != nil
      grupos_asignar << dermatologia
    end
    if linfomas_cutaneos != nil
      grupos_asignar << linfomas_cutaneos
    end
    if funcional_clinico != nil
      grupos_asignar << funcional_clinico
    end
    if funcional_quirurgico != nil
       grupos_asignar << funcional_quirurgico
    end
    if torax != nil
       grupos_asignar << torax
    end
    if  gastrointestinal != nil
       grupos_asignar << gastrointestinal
    end
    if  mastologia != nil
       grupos_asignar << mastologia
    end
    if  terapias_especiales != nil
         grupos_asignar << terapias_especiales
    end
    if oncologia != nil
         grupos_asignar << oncologia
    end
    if cirugia_cabeza_cuello != nil
         grupos_asignar << cirugia_cabeza_cuello
    end
    if tumores_pelvicos != nil
          grupos_asignar << tumores_pelvicos
    end
    if peritoneo != nil
          grupos_asignar << peritoneo
    end
    if hematologia != nil
          grupos_asignar << hematologia
    end

    if dolor != nil
      grupos_asignar << dolor
    end

    if muerte_digna != nil
      grupos_asignar << muerte_digna
    end

    if extra_institucional != nil
      grupos_asignar << extra_institucional
    end

    if grupos_asignar.empty? == true
      redirect_to "/errors/sin_grupo"
    end

    

     orden = OrderStaff.where(:tipo => "#{tipo}",:identificacion => "#{identificacion}",:id => "#{id_relacional}")
     $contador = -1
      orden.each do |orden_desglosada|
          
       loop do
        $contador +=1
       orden_desglosada["asignados"].push(grupos_asignar[$contador])
       orden_desglosada.save
       orden_desglosada["grupos"][grupos_asignar[$contador]]["incluido"] = true
       orden_desglosada.save
       break  if $contador >= grupos_asignar.size-1
       end
       
       @nombre=grupos_asignar
      end
      
     

     
   
    
   

      
     redirect_to "/alertas/asignar_grupo"

   
end
  #controladores de error no borrar
  def sin_grupo

  end

  def sin_item

  end 



  def cambiar_estado_tumor

    @tipo = params[:tipo]
    @cedula = params[:identificacion]
    @id_relacional = params[:id_relacional]
    @grupo_tumor = params[:tumor]
    @responsable = params[:responsable]
    @nota_tumor = params[:nota_tumor]
    $fecha_actual = Time.now.strftime("%F %T")
   
    if @tipo.nil? == true  or @cedula.nil? == true
      redirect_to root_path
    end

    orden = OrderStaff.where(:tipo => "#{@tipo}",:identificacion => "#{@cedula}",:id => @id_relacional)

    orden.each do |objeto_orden|
      objeto_orden.grupos["#{@grupo_tumor}"]["responsable"] = @responsable.to_s
      objeto_orden.save

      objeto_orden.grupos["#{@grupo_tumor}"]["nota"] =  @nota_tumor.to_s
      objeto_orden.save

      objeto_orden.grupos["#{@grupo_tumor}"]["estado"] = true
      objeto_orden.save

      objeto_orden.grupos["#{@grupo_tumor}"]["fecha_captacion"] = $fecha_actual
      objeto_orden.save

      $pacientes_asignados = objeto_orden.asignados
      $pacientes_gestionados = objeto_orden.gestionados

       objeto_orden["gestionados"].push(@grupo_tumor)
       objeto_orden.save

      if $pacientes_asignados.size == $pacientes_gestionados.size
         objeto_orden.estado_gestion = "terminada"
         objeto_orden.save
         redirect_to "/alertas/terminar_gestion"
         
      end


      
   
      break
      
    end
 
  end

  


 

  
    
  

  def enrutador

    $tumor = params[:grupo_t]

    case $tumor
      when "Cirugía de Mohs"
        redirect_to "/order_staffs/cirugia_mohs"
      when "Dermatología"
        redirect_to "/order_staffs/dermatologia"
      when "Linfomas cutáneos"
        redirect_to "/order_staffs/linfomas_cutaneos"
      when "Funcional clínico"
        redirect_to "/order_staffs/funcional_clinico"
      when "Funcional quirúrgico"
        redirect_to "/order_staffs/funcional_quirurgico"
      when "Tórax"
        redirect_to "/order_staffs/torax"
      when "Gastrointestinal"
        redirect_to "/order_staffs/gastrointestinal"
      when "Mastología"
        redirect_to "/order_staffs/mastologia"
      when "Terapias especiales"
        redirect_to "/order_staffs/terapias_especiales"
      when "Oncología"
        redirect_to "/order_staffs/oncologia"
      when  "Cirugía cabeza y cuello"
        redirect_to "/order_staffs/cirugia_cabeza_cuello"
      when "Tumores pélvicos"
        redirect_to "/order_staffs/tumores_pelvicos"
      when "Peritoneo"
        redirect_to "/order_staffs/peritoneo"
      when "Hematología"
        redirect_to "/order_staffs/hematologia"
      when "Dolor"
        redirect_to "/order_staffs/dolor"
      when "Muerte Digna"
        redirect_to "/order_staffs/muerte_digna"
      when "Extra Institucional"
        redirect_to "/order_staffs/extra_institucional"
      else
        redirect_to "/order_staffs/staff"
    
    end

   
  end

  def envio_excel
   

  end


end
