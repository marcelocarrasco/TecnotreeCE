insert into TEC_CE_CDC_TPS_RAW (START_DTIME,END_DTIME,PAIS,MAX_TPS)--,ARCHIVO)
select START_DTIME,END_DTIME,PAIS,MAX_TPS--,'TEMPLATE'
from tec_ce_cdc_tps_aux_template tat
where  --substr(start_dtime,1,11) = '06-JAN-2016'
--and 
(START_DTIME,END_DTIME,PAIS) not in (select START_DTIME,END_DTIME,PAIS 
                                        from tec_ce_cdc_tps_aux ta
                                        where ta.pais = tat.pais
                                        --and substr(start_dtime,1,11) = '06-JAN-2016'
                                        );
                                        
insert into TEC_CE_CDC_TPS_RAW (START_DTIME,END_DTIME,PAIS,MAX_TPS)
select START_DTIME,END_DTIME,PAIS,MAX_TPS--,'TEMPLATE'
from tec_ce_cdc_tps_aux;
--where pais = 'URY'
--and substr(start_dtime,1,11) = '06-JAN-2016';


--delete from TEC_CE_CDC_TPS_HOUR where PAIS ='PRY';

--
-- insert tabla hour --
--
insert into tec_ce_cdc_tps_hour (fecha,pais,max_tps)
select  to_char(start_dtime,'dd.mm.yyyy HH24') fecha,
        pais,
        sum(max_tps) max_tps
from TEC_CE_CDC_TPS_RAW
--where to_char(start_dtime,'dd.mm.yyyy') = '06.01.2016'
--and pais = 'ARG'
group by TO_CHAR(start_dtime,'dd.mm.yyyy HH24'),pais
order by TO_CHAR(start_dtime,'dd.mm.yyyy HH24') asc;


--
-- Merge para incluir max_cap_hw y max_cap_sw
--
MERGE INTO TEC_CE_CDC_TPS_HOUR TA
USING(SELECT PAIS,MAX_CAP_HW,MAX_CAP_SW FROM sva_objects WHERE TECNOLOGIA = 'TECNOTREECE' AND ACTIVO = 1) SVA
ON (TA.PAIS = SVA.PAIS)
WHEN MATCHED THEN
  UPDATE SET TA.max_cap_hw = SVA.MAX_CAP_HW, TA.max_cap_sw = SVA.max_cap_sw
  where TA.max_cap_hw = 1 and TA.max_cap_sw = 1;
  
  
  
  
  