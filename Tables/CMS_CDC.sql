-- SVA_OBJECT

create table SVA_OBJECTS(
FECHA       DATE DEFAULT SYSDATE NOT NULL,
MAX_CAP_HW  number NOT NULL,
MAX_CAP_SW  number NOT NULL,
TECNOLOGIA  VARCHAR2(100 CHAR) NOT NULL,
PAIS        CHAR(3 CHAR) NOT NULL,
ACTIVO      NUMBER(1) DEFAULT 1 NOT NULL CHECK (ACTIVO IN (1,0))) NOLOGGING;

INSERT INTO SVA_OBJECTS (MAX_CAP_HW,MAX_CAP_SW,TECNOLOGIA,PAIS)
VALUES (2400,2000,'TECNOTREECE','ARG');
INSERT INTO SVA_OBJECTS (MAX_CAP_HW,MAX_CAP_SW,TECNOLOGIA,PAIS)
VALUES (2400,2000,'TECNOTREECE','PRY');
INSERT INTO SVA_OBJECTS (MAX_CAP_HW,MAX_CAP_SW,TECNOLOGIA,PAIS)
VALUES (2400,2000,'TECNOTREECE','URY');


-- drop table TEC_CE_CDC_TPS_AUX;

create table TEC_CE_CDC_TPS_AUX(
START_DTIME	varchar2(20 char),
END_DTIME   varchar2(20 char),
PAIS	      char(3 char) GENERATED ALWAYS AS (CASE  WHEN instr(ARCHIVO,'/arce/') != 0 THEN 'ARG'
                                                    WHEN instr(ARCHIVO,'/pyce/') != 0 THEN 'PRY'
                                                    WHEN instr(ARCHIVO,'/uyce/') != 0 THEN 'URY'
                                                    ELSE 'S/P'
                                              END) VIRTUAL,
MAX_TPS	    number,
MAX_CAP_HW  number,
MAX_CAP_SW  number,
UTIL_HW     number(10,2) generated always as (MAX_TPS / MAX_CAP_HW) virtual,
UTIL_SW     number(10,2) generated always as (MAX_TPS / MAX_CAP_SW) virtual,
ARCHIVO     varchar2(500 char))nologging;
--PARTITION BY RANGE (START_DTIME) 
--INTERVAL(NUMTODSINTERVAL (1, 'DAY'))
--(  
--  PARTITION TEC_CE_CMS_TPS_RAW_FIRST VALUES LESS THAN (TO_DATE('24.05.2016','dd.mm.yyyy'))
-- );

-- drop table TEC_CE_CDC_TPS_AUX_TEMPLATE;

create table TEC_CE_CDC_TPS_AUX_TEMPLATE(
--ID_COL      varchar2(32 char),
START_DTIME	varchar2(20 char),
END_DTIME	  varchar2(20 char),
PAIS        varchar2(3 char),
MAX_TPS	    number,
MAX_CAP_HW  number,
MAX_CAP_SW  number,
UTIL_HW     number(10,2) generated always as (MAX_TPS / MAX_CAP_HW) virtual,
UTIL_SW     number(10,2) generated always as (MAX_TPS / MAX_CAP_SW) virtual) nologging;

alter table TEC_CE_CDC_TPS_AUX_TEMPLATE add constraint TEC_CE_CDC_TPS_AUX_TEMPLATE_PK primary key (pais,start_dtime,end_dtime);
--
--
-- DROP TABLE TEC_CE_CDC_TPS_HOUR
--
create table TEC_CE_CDC_TPS_RAW(
START_DTIME	date not null enable,
END_DTIME	  date not null enable,
PAIS	      char(3 char)      not null enable,
MAX_TPS	    number            not null enable);
--PARTITION BY RANGE (START_DTIME) 
--INTERVAL(NUMTODSINTERVAL (1, 'DAY'))
--(  
--  PARTITION TEC_CE_CMS_TPS_HOUR_24052016 VALUES LESS THAN (TO_DATE('24.05.2016','dd.mm.yyyy'))
-- );

alter table TEC_CE_CDC_TPS_HOUR add constraint TEC_CE_CDC_TPS_HOUR_PK primary key (pais,start_dtime,end_dtime);


create table TEC_CE_CDC_TPS_HOUR(
FECHA	  date not null enable,
PAIS	  char(3 char)      not null enable,
MAX_TPS number            not null enable
);

alter table TEC_CE_CDC_TPS_HOUR add constraint TEC_CE_CDC_TPS_HOUR_PK primary key (PAIS,FECHA);

create table TEC_CE_CDC_TPS_DAY(
FECHA	  date not null enable,
PAIS	  char(3 char)      not null enable,
MAX_TPS number            not null enable
);

alter table TEC_CE_CDC_TPS_DAY add constraint TEC_CE_CDC_TPS_DAY_PK primary key (PAIS,FECHA);

create table TEC_CE_CDC_TPS_BH(
FECHA	  date not null enable,
PAIS	  char(3 char)      not null enable,
MAX_TPS number            not null enable
);

alter table TEC_CE_CDC_TPS_BH add constraint TEC_CE_CDC_TPS_BH_PK primary key (PAIS,FECHA);

create table TEC_CE_CDC_TPS_IBHW(
FECHA	  date not null enable,
PAIS	  char(3 char)      not null enable,
MAX_TPS number            not null enable
);

alter table TEC_CE_CDC_TPS_IBHW add constraint TEC_CE_CDC_TPS_IBHW_PK primary key (PAIS,FECHA);


--========================================================================================================--
-- CM Tables
--========================================================================================================--

CREATE TABLE TEC_CE_CM_TPS_AUX (	
  START_DTIME VARCHAR2(20 CHAR), 
  END_DTIME VARCHAR2(20 CHAR), 
  PAIS CHAR(3 CHAR) GENERATED ALWAYS AS (CASE  
                                          WHEN INSTR(ARCHIVO,'/arce/')<>0 THEN 'ARG' 
                                          WHEN INSTR(ARCHIVO,'/pyce/')<>0 THEN 'PRY' 
                                          WHEN INSTR(ARCHIVO,'/uyce/')<>0 THEN 'URY' 
                                          ELSE 'S/P' 
                                      END) VIRTUAL , 
  MAX_TPS NUMBER, 
  ARCHIVO VARCHAR2(500 CHAR)
) nologging;

create table TEC_CE_CM_TPS_HOUR(
  FECHA	  date not null enable,
  PAIS	  char(3 char)      not null enable,
  MAX_TPS number            not null enable
);
alter table TEC_CE_CM_TPS_HOUR add constraint TEC_CE_CM_TPS_HOUR_PK primary key (PAIS,FECHA);

create table TEC_CE_CM_TPS_DAY(
  FECHA	  date not null enable,
  PAIS	  char(3 char)      not null enable,
  MAX_TPS number            not null enable
);
alter table TEC_CE_CM_TPS_DAY add constraint TEC_CE_CM_TPS_DAY_PK primary key (PAIS,FECHA);

create table TEC_CE_CM_TPS_BH(
  FECHA	  date not null enable,
  PAIS	  char(3 char)      not null enable,
  MAX_TPS number            not null enable
);
alter table TEC_CE_CM_TPS_BH add constraint TEC_CE_CM_TPS_BH_PK primary key (PAIS,FECHA);

create table TEC_CE_CM_TPS_IBHW(
  FECHA	  date not null enable,
  PAIS	  char(3 char)      not null enable,
  MAX_TPS number            not null enable
);
alter table TEC_CE_CM_TPS_IBHW add constraint TEC_CE_CM_TPS_IBHW_PK primary key (PAIS,FECHA);