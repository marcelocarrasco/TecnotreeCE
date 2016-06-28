--++--++--++--++--++--++--++--++--++--++--
-- POPULAR TABLA PLANTILLA PARA MERGE
--++--++--++--++--++--++--++--++--++--++--
set serveroutput on
set feedback on
declare
v_start_dtime varchar2(20 char) := '06-JAN-2016 00:00:00';
v_end varchar2(20 char) := '07-JAN-2016 00:00:00';
max_tps number := 0;
start_dtime varchar2(20 char) := '';
end_dtime varchar2(20 char) := '';
begin
  while v_start_dtime != v_end loop
  begin
    select  to_char(to_date(v_start_dtime,'DD-MON-YYYY HH24:MI:SS'),'DD-MON-YYYY HH24:MI:SS') start_dtime,
            to_char(to_date(v_start_dtime,'DD-MON-YYYY HH24:MI:SS')+INTERVAL '5' MINUTE,'DD-MON-YYYY HH24:MI:SS') END_DTIME
    into  start_dtime,
          end_dtime
    from dual;
    --
    insert into TEC_CE_CDC_TPS_AUX_TEMPLATE(start_dtime,END_DTIME,pais,max_tps)
    values (START_DTIME,END_DTIME,'ARG',0);
    --
    insert into TEC_CE_CDC_TPS_AUX_TEMPLATE(start_dtime,END_DTIME,pais,max_tps)
    values (START_DTIME,END_DTIME,'PRY',0);
    --
    insert into TEC_CE_CDC_TPS_AUX_TEMPLATE(start_dtime,END_DTIME,pais,max_tps)
    values (START_DTIME,END_DTIME,'URY',0);
--    dbms_output.put_line('insert into tec_ce_plantilla (id_col,start_dtime,end_dtime,pais,max_tps) values ('||
--                          DBMS_OBFUSCATION_TOOLKIT.MD5(input => UTL_RAW.CAST_TO_RAW (START_DTIME || END_DTIME ||'ARG'))||','
--                          ||start_dtime||','||end_dtime||',ARG,'||to_char(max_tps)||');');
    v_start_dtime := end_dtime;
    --DBMS_OUTPUT.PUT_LINE('new start_dtime '||v_start_dtime);
  end;
  end loop;
  commit;
end;