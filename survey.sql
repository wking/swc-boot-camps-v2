create table person(ident text not null, personal text not null, family text not null);
create table site(name text not null, lat float not null, long float not null);
create table visit(ident int not null, site text not null, visited date);
create table survey(ident integer not null, person text, quant text not null, reading float not null);

insert into person values('dyer', 'William', 'Dyer');
insert into person values('pb', 'Frank', 'Pabodie');
insert into person values('lake', 'Anderson', 'Lake');
insert into person values('roe', 'Valentina', 'Roerich');
insert into person values('danforth', 'Frank', 'Danforth');

insert into site values('DR-1', -49.85, -128.57);
insert into site values('DR-3', -47.15, -126.72);
insert into site values('MSK-4', -48.87, -123.4);

insert into visit values(619, 'DR-1', '1927-02-08');
insert into visit values(622, 'DR-1', '1927-02-10');
insert into visit values(734, 'DR-3', '1939-01-07');
insert into visit values(735, 'DR-3', '1930-01-12');
insert into visit values(751, 'DR-3', '1930-02-26');
insert into visit values(752, 'DR-3', NULL);
insert into visit values(837, 'MSK-4', '1932-01-14');
insert into visit values(844, 'DR-1', '1932-03-22');

insert into survey values(619, 'dyer', 'rad', 9.82);
insert into survey values(619, 'dyer', 'sal', 0.13);
insert into survey values(622, 'dyer', 'rad', 7.8);
insert into survey values(622, 'dyer', 'sal', 0.09);
insert into survey values(734, 'pb', 'rad', 8.41);
insert into survey values(734, 'lake', 'sal', 0.05);
insert into survey values(734, 'pb', 'temp', 21.5);
insert into survey values(735, 'pb', 'rad', 7.22);
insert into survey values(735, NULL, 'sal', 0.06);
insert into survey values(735, NULL, 'temp', 26.0);
insert into survey values(751, 'pb', 'rad', 4.35);
insert into survey values(751, 'pb', 'temp', 18.5);
insert into survey values(751, 'lake', 'sal', 0.1);
insert into survey values(752, 'lake', 'rad', 2.19);
insert into survey values(752, 'lake', 'sal', 0.09);
insert into survey values(752, 'lake', 'temp', 16.0);
insert into survey values(752, 'roe', 'sal', 41.6);
insert into survey values(837, 'lake', 'rad', 1.46);
insert into survey values(837, 'lake', 'sal', 0.21);
insert into survey values(837, 'roe', 'sal', 22.5);
insert into survey values(844, 'roe', 'rad', 11.25);
