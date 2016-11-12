
select 'create public synonym '||table_name||' for SMART.'||table_name||';'
from user_tables
where --table_name like 'TEC_%'
table_name like 'SVA%';

select 'grant select on SMART.'||table_name||' to PRFC;'
from user_tables
where table_name like 'SVA_%'

create public synonym TEC_CE_CDC_TPS_IBHW for SMART.TEC_CE_CDC_TPS_IBHW;
create public synonym TEC_CE_CM_TPS_IBHW for SMART.TEC_CE_CM_TPS_IBHW;
create public synonym TEC_CE_CDC_TPS_BH for SMART.TEC_CE_CDC_TPS_BH;
create public synonym TEC_CE_CDC_TPS_DAY for SMART.TEC_CE_CDC_TPS_DAY;
create public synonym TEC_CE_CM_TPS_BH for SMART.TEC_CE_CM_TPS_BH;
create public synonym TEC_CE_CM_TPS_DAY for SMART.TEC_CE_CM_TPS_DAY;
create public synonym TEC_CE_CDC_TPS_HOUR for SMART.TEC_CE_CDC_TPS_HOUR;
create public synonym TEC_CE_CM_TPS_HOUR for SMART.TEC_CE_CM_TPS_HOUR;
create public synonym TEC_CE_CDC_TPS_RAW for SMART.TEC_CE_CDC_TPS_RAW;
create public synonym TEC_CE_CM_TPS_RAW for SMART.TEC_CE_CM_TPS_RAW;
create public synonym SVA_OBJECTS for SMART.SVA_OBJECTS;

grant select on SMART.TEC_CE_CDC_TPS_IBHW to PRFC;
grant select on SMART.TEC_CE_CM_TPS_IBHW to PRFC;
grant select on SMART.TEC_CE_CDC_TPS_BH to PRFC;
grant select on SMART.TEC_CE_CDC_TPS_DAY to PRFC;
grant select on SMART.TEC_CE_CM_TPS_BH to PRFC;
grant select on SMART.TEC_CE_CM_TPS_DAY to PRFC;
grant select on SMART.TEC_CE_CDC_TPS_HOUR to PRFC;
grant select on SMART.TEC_CE_CM_TPS_HOUR to PRFC;
grant select on SMART.SVA_OBJECTS to PRFC;
grant select on SMART.TEC_CE_CDC_TPS_RAW to PRFC;
grant select on SMART.TEC_CE_CM_TPS_RAW to PRFC;