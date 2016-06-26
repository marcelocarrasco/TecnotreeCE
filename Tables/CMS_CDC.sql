
-- drop table TEC_CE_CM_TPS_AUX;

create table TEC_CE_CM_TPS_AUX(
START_DTIME	varchar2(20 char),
END_DTIME   varchar2(20 char),
PAIS	      char(3 char) GENERATED ALWAYS AS (CASE  WHEN instr(ARCHIVO,'/arce/') != 0 THEN 'ARG'
                                                    WHEN instr(ARCHIVO,'/pyce/') != 0 THEN 'PRY'
                                                    WHEN instr(ARCHIVO,'/uyce/') != 0 THEN 'URY'
                                                    ELSE 'S/P'
                                              END) VIRTUAL,
MAX_TPS	    number,
ARCHIVO     varchar2(500 char));
--PARTITION BY RANGE (START_DTIME) 
--INTERVAL(NUMTODSINTERVAL (1, 'DAY'))
--(  
--  PARTITION TEC_CE_CMS_TPS_RAW_FIRST VALUES LESS THAN (TO_DATE('24.05.2016','dd.mm.yyyy'))
-- );

-- drop table TEC_CE_CDC_TPS_AUX;

create table TEC_CE_CDC_TPS_AUX(
START_DTIME	varchar2(20 char),
END_DTIME	  varchar2(20 char),
PAIS	      char(3 char) GENERATED ALWAYS AS (CASE  WHEN instr(ARCHIVO,'/arce/') != 0 THEN 'ARG'
                                                    WHEN instr(ARCHIVO,'/pyce/') != 0 THEN 'PRY'
                                                    WHEN instr(ARCHIVO,'/uyce/') != 0 THEN 'URY'
                                                    ELSE 'S/P'
                                              END) VIRTUAL,
MAX_TPS	    number,
ARCHIVO     varchar2(500 char));

--PARTITION BY RANGE (START_DTIME) 
--INTERVAL(NUMTODSINTERVAL (1, 'DAY'))
--(  
--  PARTITION TEC_CE_CMS_TPS_RAW_FIRST VALUES LESS THAN (TO_DATE('24.05.2016','dd.mm.yyyy'))
-- );


