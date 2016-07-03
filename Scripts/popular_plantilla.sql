--++--++--++--++--++--++--++--++--++--++--
-- POPULAR TABLA PLANTILLA PARA MERGE
--++--++--++--++--++--++--++--++--++--++--
set serveroutput on
set feedback on
declare
v_start_dtime varchar2(20 char) := '27-JUN-2016 00:00:00';
v_end varchar2(20 char) := '28-JUN-2016 00:00:00';
max_tps number := 0;
start_dtime varchar2(20 char) := '';
end_dtime varchar2(20 char) := '';
v_max_cap_hw_arg number := 1;
v_max_cap_hw_pry number := 1;
v_max_cap_hw_ury number := 1;
v_max_cap_sw_arg number := 1;
v_max_cap_sw_pry number := 1;
v_max_cap_sw_ury number := 1;

begin
  while v_start_dtime != v_end loop
  begin
    select  to_char(to_date(v_start_dtime,'DD-MON-YYYY HH24:MI:SS'),'DD-MON-YYYY HH24:MI:SS') start_dtime,
            to_char(to_date(v_start_dtime,'DD-MON-YYYY HH24:MI:SS')+INTERVAL '5' MINUTE,'DD-MON-YYYY HH24:MI:SS') END_DTIME
    into  start_dtime,
          end_dtime
    from dual;
    --
   /* select  max_cap_hw,
            max_cap_sw
    into    v_max_cap_hw_arg,
            v_max_cap_sw_arg
    from    sva_objects
    where   pais = 'ARG'
    and     tecnologia = 'TECNOTREECE'
    and     activo = 1;
    --
    select  max_cap_hw,
            max_cap_sw
    into    v_max_cap_hw_pry,
            v_max_cap_sw_pry
    from    sva_objects
    where   pais = 'PRY'
    and     tecnologia = 'TECNOTREECE'
    and     activo = 1;
    --
    select  max_cap_hw,
            max_cap_sw
    into    v_max_cap_hw_ury,
            v_max_cap_sw_ury
    from    sva_objects
    where   pais = 'URY'
    and     tecnologia = 'TECNOTREECE'
    and     activo = 1;*/
    --
    insert into TEC_CE_CDC_TPS_AUX_TEMPLATE(start_dtime,END_DTIME,pais,max_tps,max_cap_hw,max_cap_sw)
    values (START_DTIME,END_DTIME,'ARG',0,v_max_cap_hw_arg,v_max_cap_sw_arg);
    --
    insert into TEC_CE_CDC_TPS_AUX_TEMPLATE(start_dtime,END_DTIME,pais,max_tps,max_cap_hw,max_cap_sw)
    values (START_DTIME,END_DTIME,'PRY',0,v_max_cap_hw_pry,v_max_cap_sw_pry);
    --
    insert into TEC_CE_CDC_TPS_AUX_TEMPLATE(start_dtime,END_DTIME,pais,max_tps,max_cap_hw,max_cap_sw)
    values (START_DTIME,END_DTIME,'URY',0,v_max_cap_hw_ury,v_max_cap_sw_ury);

    v_start_dtime := end_dtime;
    --DBMS_OUTPUT.PUT_LINE('new start_dtime '||v_start_dtime);
  end;
  end loop;
  commit;
end;