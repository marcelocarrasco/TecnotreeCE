insert into TEC_CE_CDC_TPS_HOUR (START_DTIME,END_DTIME,PAIS,MAX_TPS)--,ARCHIVO)
select START_DTIME,END_DTIME,PAIS,MAX_TPS--,'TEMPLATE'
from tec_ce_cdc_tps_aux_template
where pais = 'URY'
and substr(start_dtime,1,11) = '06-JAN-2016'
and (START_DTIME,END_DTIME,PAIS) not in (select START_DTIME,END_DTIME,PAIS 
                                        from tec_ce_cdc_tps_aux 
                                        where pais = 'URY'
                                        and substr(start_dtime,1,11) = '06-JAN-2016');
                                        
insert into TEC_CE_CDC_TPS_HOUR (START_DTIME,END_DTIME,PAIS,MAX_TPS)
select START_DTIME,END_DTIME,PAIS,MAX_TPS--,'TEMPLATE'
from tec_ce_cdc_tps_aux
where pais = 'URY'
and substr(start_dtime,1,11) = '06-JAN-2016';


--delete from TEC_CE_CDC_TPS_HOUR where PAIS ='PRY';

--
-- insert tabla hour --
--
select to_char(start_dtime,'dd.mm.yyyy HH24') fecha,pais,sum(max_tps)
from TEC_CE_CDC_TPS_HOUR
where to_char(start_dtime,'dd.mm.yyyy') = '06.01.2016'
--and pais = 'ARG'
group by TO_CHAR(start_dtime,'dd.mm.yyyy HH24'),pais
order by TO_CHAR(start_dtime,'dd.mm.yyyy HH24') asc;