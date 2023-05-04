SELECT DISTINCT  abpac.pacnom||' '|| abpac.pacap1||' '|| abpac.pacap2 Paciente,pactid TIPO, pacide IDENTIFICACION
 ,TO_CHAR(MOVFEC, 'YYYY/MM/DD') FECHA_EJECUCION,movobsobs OBSERVACION,movobsjus JUSTIFICACION,movdia COD_DIAGNOSTICO,dianom NOMBRE_CIE10,
 idenom ||' '|| ideap1 ||' '|| ideap2 NOM_MEDICO
  FROM ORMOVX
  INNER join ormovultx ON movfue = movultfue AND movdoc = movultdoc
  INNER JOIN oract ON movultcac    = actcod
  INNER JOIN ABPAC ON PACHIS = MOVHIS
  INNER JOIN SIIDE ON idecod  = MOVRES
  INNER JOIN INESP ON ideesp  = espcod
  INNER JOIN ormovobsx ON movobsdoc    = MOVULTdoc AND movultLIN    = movobsLIN
  INNER JOIN INEMP ON  EMPCOD = MOVFIN
  INNER JOIN india ON  diacod = movdia
  WHERE MOVULTFUE   IN ('PR')
  and movultest <> 'CA'
  AND movultcac = '890502'
and movFEC >= TRUNC(SYSDATE)
   UNION ALL
  SELECT DISTINCT  abpac.pacnom||' '|| abpac.pacap1||' '|| abpac.pacap2 Paciente,pactid TIPO, pacide IDENTIFICACION
 ,TO_CHAR(MOVFEC, 'YYYY/MM/DD') FECHA_EJECUCION,movobsobs OBSERVACION,movobsjus JUSTIFICACION,movdia COD_DIAGNOSTICO,dianom NOMBRE_CIE10,
 idenom ||' '|| ideap1 ||' '|| ideap2 NOM_MEDICO
  FROM ORMOV
  INNER join ormovult ON movfue = movultfue AND movdoc = movultdoc
  INNER JOIN oract ON movultcac   = actcod
  INNER JOIN ABPAC ON PACHIS = MOVHIS
  INNER JOIN SIIDE ON idecod  = MOVRES
  INNER JOIN INESP ON ideesp  = espcod
  INNER JOIN ormovobs ON movobsdoc    = MOVULTdoc AND movultLIN    = movobsLIN
  INNER JOIN INEMP ON  EMPCOD = MOVFIN
  INNER JOIN india ON  diacod = movdia
  WHERE MOVULTFUE   IN ('PR')
  and movultest <> 'CA'
  AND movultcac = '890502'
  and movFEC >= TRUNC(SYSDATE);
