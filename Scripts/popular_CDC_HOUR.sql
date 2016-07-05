insert into TEC_CE_CDC_TPS_RAW (START_DTIME,END_DTIME,PAIS,MAX_TPS)--,ARCHIVO)
select START_DTIME,END_DTIME,PAIS,MAX_TPS--,'TEMPLATE'
from tec_ce_cdc_tps_aux_template tat
where  --substr(start_dtime,1,11) = '06-JAN-2016'
--and 
(START_DTIME,END_DTIME,PAIS) not in (select START_DTIME,END_DTIME,PAIS 
                                        from tec_ce_cdc_tps_aux ta
                                        where ta.pais = tat.pais
                                        --and substr(start_dtime,1,11) = '06-JAN-2016'
                                        )--;
 union                                       
--insert into TEC_CE_CDC_TPS_RAW (START_DTIME,END_DTIME,PAIS,MAX_TPS)
select START_DTIME,END_DTIME,PAIS,MAX_TPS--,'TEMPLATE'
from tec_ce_cdc_tps_aux;
--where pais = 'URY'
--and substr(start_dtime,1,11) = '06-JAN-2016';


--delete from TEC_CE_CDC_TPS_HOUR where PAIS ='PRY';

--
-- insert tabla hour --
--
insert into tec_ce_cdc_tps_hour (fecha,pais,max_tps)
select  TO_CHAR(START_DTIME,'dd.mm.yyyy HH24') FECHA,
        PAIS,
        SUM(MAX_TPS) MAX_TPS
from TEC_CE_CDC_TPS_RAW
--where to_char(start_dtime,'dd.mm.yyyy') = '06.01.2016'
--and pais = 'ARG'
group by TO_CHAR(start_dtime,'dd.mm.yyyy HH24'),pais
order by TO_CHAR(start_dtime,'dd.mm.yyyy HH24') asc;


--
-- Merge para incluir max_cap_hw y max_cap_sw CDC table
--
MERGE INTO TEC_CE_CDC_TPS_HOUR TA
USING(SELECT PAIS,MAX_CAP_HW,MAX_CAP_SW FROM sva_objects WHERE TECNOLOGIA = 'TECNOTREECE' AND ACTIVO = 1) SVA
ON (TA.PAIS = SVA.PAIS)
WHEN MATCHED THEN
  UPDATE SET TA.max_cap_hw = SVA.MAX_CAP_HW, TA.max_cap_sw = SVA.max_cap_sw
  where TA.max_cap_hw = 1 and TA.max_cap_sw = 1;
  

--
-- Merge para incluir max_cap_hw y max_cap_sw CM table
--  
MERGE INTO TEC_CE_CM_TPS_HOUR TA
USING(SELECT PAIS,MAX_CAP_HW,MAX_CAP_SW FROM sva_objects WHERE TECNOLOGIA = 'TECNOTREECE' AND ACTIVO = 1) SVA
ON (TA.PAIS = SVA.PAIS)
WHEN MATCHED THEN
  UPDATE SET TA.max_cap_hw = SVA.MAX_CAP_HW, TA.max_cap_sw = SVA.max_cap_sw
  where TA.max_cap_hw = 1 and TA.max_cap_sw = 1;  
  
 
 
 --
 --
 set serveroutput on
declare
linea varchar2(4000 char) := '';
begin
for i in (select to_char(fecha,'DDMMYYYY') ff
            from (
              SELECT DISTINCT(TO_DATE(SUBSTR(NOMBRE_CSV,-12,8),'DDMMYYYY')) fecha
              FROM FILES
              WHERE nombre_csv like '%TecnotreeCE/%CM%_'
              AND STATUS != 0
              ORDER BY 1)) loop
    linea := linea ||'"'||i.ff||'" ';
    
end loop;
dbms_output.put_line(linea);
end;