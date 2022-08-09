INSERT INTO tbl_member(id, pw, name, age, addr) VALUES("id001", "pw001", "김신우", 33, "부산 동래구");

desc tbl_member;
desc tbl_member_schedule;

select * from tbl_member_schedule;

select last_day(date) from tbl_member_schedule;
select last_day(date - interval 1 month) from tbl_member_schedule;