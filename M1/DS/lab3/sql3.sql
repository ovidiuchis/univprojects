set serveroutput on
declare
  rezultat rezType;        
  rezult MultimeRez:=MultimeRez();
  stud StudObj;
  sec integer;
  num varchar2(30);
  cnp1 varchar(13):='2890928080029';
  pre varchar2(30);
  nrm char(10);
  rezline master.rezultate%rowtype;
begin
        dbms_output.enable;    
        select nume into num from master.studenti where cnp=cnp1 ;
        select prenume into pre from master.studenti where cnp=cnp1;
        select sectia into sec from master.studenti where cnp=cnp1 ;
        select  nrmatricol into nrm  from master.studenti where cnp=cnp1 ; 
        stud:= StudObj(num ,pre ,cnp1,sec,nrm,rezult);
        dbms_output.put_line('Studentul ' || stud.nume || ' are ' || stud.NrRezultate || ' rezultat  ');

        for rezline in ( select * from master.rezultate where nrmatricol=nrm) loop
           stud.AdaugaRezultat(rezType(rezline.anuniv,rezline.disciplina,rezline.nota,rezline.nrcredite) );
        end loop;
        dbms_output.put_line('Studentul ' || stud.nume || ' are ' || stud.NrRezultate || ' rezultat  ');
        dbms_output.put_line(stud.retRezultate);
        dbms_output.put_line('Studentul' || stud.nume || ' are media =' || stud.Media(2011)|| '  ');
       
       
    

        dbms_output.put_line('Studentul ' || stud.nume || ' are ' || stud.NrRezultate || ' rezultat  ');
        dbms_output.put_line(stud.retRezultate);
        dbms_output.put_line('Studentul' || stud.nume || ' are media =' || stud.Media(2011)|| '  ');


        stud.EliminaRezultat(2007,'MID0005');

        dbms_output.put_line('Studentul ' || stud.nume || ' are ' || stud.NrRezultate || ' rezultat  ');
        dbms_output.put_line(stud.retRezultate);
        dbms_output.put_line('Studentul' || stud.nume || ' are media =' || stud.Media(2011)|| '  ');

    
end;














