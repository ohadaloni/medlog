create table medLog (
  id int auto_increment,
  user varchar(255),
  dosage double,
  mg varchar(255),
  description varchar(255),
  date date,
  datetime datetime,
  comments text,
  primary key (id)
);
