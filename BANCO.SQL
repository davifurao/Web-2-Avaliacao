create database contato;
use contato;

create user 'contato_user' identified by 'contato_pw';

grant all privileges on contato.* to 'contato_user';