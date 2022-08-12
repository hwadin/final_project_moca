INSERT INTO tbl_member(id, pw, name, age, addr) VALUES("id001", "pw001", "김신우", 33, "부산 동래구");

delete from tbl_member_schedule;
insert into tbl_member_schedule(member_no, start, end, title) VALUES(1, "2022-08-11T16:49:42.411+09:00", "2022-08-12T16:49:42.411+09:00", "테스트");
insert into tbl_member_schedule(member_no, start, end, title) VALUES(1, "2022-08-11T17:00:42.411+09:00", "2022-08-11T18:00:42.411+09:00", "테스트2");
insert into tbl_member_schedule(member_no, start, end, title) VALUES(1, "2022-09-11T17:00:42.411+09:00", "2022-09-12T18:00:42.411+09:00", "테스트3");

insert into tbl_member_schedule(member_no, start, end, title, allDay) VALUES(1, "2022-08-10T00:00:00.000+09:00", "2022-08-10T00:00:00.000+09:00", "테스트4", 1);

select * from tbl_member_schedule
where member_no=1 and
start like '2022-08%' or end like '2022-08%';

select * from tbl_member_schedule
where member_no=1 and
str_to_date(start, );

select str_to_date(substr(start,1,19), '%Y-%m-%dT%T') from tbl_member_schedule;
select substring(start,1,19) from tbl_member_schedule;
select * from tbl_member_schedule;
select date_format(regdate, '%Y-%m-%dT%T') from tbl_member;

select * from tbl_member_schedule where start between last_day('2022-08-12' - interval 1 month) and last_day('2022-08-12');

desc tbl_member;
desc tbl_member_schedule;

select * from tbl_member_schedule;

select last_day(date) from tbl_member_schedule;
select last_day(date - interval 1 month) from tbl_member_schedule;