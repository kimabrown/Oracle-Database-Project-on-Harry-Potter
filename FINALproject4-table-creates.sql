DROP TABLE characters CASCADE CONSTRAINT;
DROP TABLE school CASCADE CONSTRAINT;
DROP TABLE spells CASCADE CONSTRAINT;
DROP TABLE species CASCADE CONSTRAINT;
DROP TABLE faction CASCADE CONSTRAINT;
DROP TABLE wand CASCADE CONSTRAINT;
DROP TABLE casts CASCADE CONSTRAINT;
DROP TABLE type CASCADE CONSTRAINT;
DROP TABLE affiliates CASCADE CONSTRAINT;
DROP TABLE owner CASCADE CONSTRAINT;
DROP TABLE seen_mention CASCADE CONSTRAINT;

CREATE TABLE characters
(cname  VARCHAR2(45) CONSTRAINT characters_cname_pk PRIMARY KEY,
 marital_status VARCHAR2(1),
 Bdate DATE, 
 house varchar2 (15),
 blood_status VARCHAR2(2),
 attends_by VARCHAR2(30),
 species_relations VARCHAR2(30),
 instructs VARCHAR2(15)
);

CREATE TABLE school
(sname  VARCHAR2(45) CONSTRAINT characters_sname_pk PRIMARY KEY,
 location VARCHAR2(30),
 date_founded DATE,
 range VARCHAR(15));

CREATE TABLE Spells  
(incantation  VARCHAR2(45) CONSTRAINT spells_incantation_pk PRIMARY KEY,
 pronunciation VARCHAR2(30),
 feature VARCHAR2(35),
 seen_mention VARCHAR2(15),
 type VARCHAR2(35));

CREATE TABLE species 
(type VARCHAR2(45) CONSTRAINT species_type_pk PRIMARY KEY,
 eye_color VARCHAR2(20),
 skin VARCHAR2(35),
 hair_color VARCHAR2(30));

CREATE TABLE faction
(fname  VARCHAR2(45) CONSTRAINT faction_fame_pk PRIMARY KEY,
 intentions VARCHAR2(50),
 headquarters VARCHAR2(70), 
 founded DATE,
 enemies VARCHAR2(40));

CREATE TABLE wand
(wname  VARCHAR2(45) CONSTRAINT wand_wname_pk PRIMARY KEY,
 wood VARCHAR2(20),
 length NUMBER(4,2), 
 manufacturer VARCHAR2(18),
 flexibility VARCHAR2(25),
 core VARCHAR2(20),
 master_name VARCHAR2(30));

CREATE TABLE casts
(cincantation  VARCHAR2(45),
 ca_name VARCHAR2(30),
 CONSTRAINT casts_cincantion_ca_name_pk PRIMARY KEY(cincantation, ca_name));

CREATE TABLE type
(tincantation VARCHAR2(45),
 ttype varchar (35),
 CONSTRAINT type_tincant_ttype_pk PRIMARY KEY(tincantation, ttype));

CREATE TABLE seen_mention
(sm_incantation VARCHAR2(45),
 sm_seen_mention VARCHAR2(30),
 CONSTRAINT seen_mention_incant_sm_pk PRIMARY KEY(sm_incantation, sm_seen_mention));

CREATE TABLE owner
(char_name VARCHAR2(45),
 wand_name VARCHAR2(45),
 CONSTRAINT owner_cn_wn_pk PRIMARY KEY(char_name, wand_name));

CREATE TABLE affiliates
(char_name VARCHAR2(45),
 fac_name VARCHAR2(45),
 CONSTRAINT affiliates_cn_fn_pk PRIMARY KEY(char_name, fac_name));

ALTER TABLE characters ADD CONSTRAINT charcaters_instructs_fk FOREIGN KEY(cname) 
  REFERENCES characters(cname);

ALTER TABLE casts ADD CONSTRAINT casts_cincantation_fk FOREIGN KEY(cincantation)
  REFERENCES spells(incantation);

ALTER TABLE type ADD CONSTRAINT type_tincantation_fk FOREIGN KEY(tincantation)
  REFERENCES spells(incantation);

ALTER TABLE seen_mention ADD CONSTRAINT sm_sm_incantation_fk FOREIGN KEY(sm_incantation)
  REFERENCES spells(incantation);

ALTER TABLE owner ADD CONSTRAINT owner_char_name_fk FOREIGN KEY(char_name)
  REFERENCES characters(cname);

ALTER TABLE wand ADD CONSTRAINT wand_master_name_fk FOREIGN KEY(master_name)
  REFERENCES characters(cname);

ALTER TABLE owner ADD CONSTRAINT owner_wand_name_fk FOREIGN KEY(wand_name)
  REFERENCES wand(wname);
 
ALTER TABLE affiliates ADD CONSTRAINT aff_char_name_fk FOREIGN KEY(char_name)
  REFERENCES characters(cname);

ALTER TABLE affiliates ADD CONSTRAINT aff_fac_name_fk FOREIGN KEY(fac_name)
  REFERENCES faction(fname);
 
ALTER TABLE characters ADD CONSTRAINT chara_attendby_fk FOREIGN KEY(attends_by)
  REFERENCES school(sname);

ALTER TABLE characters ADD CONSTRAINT chara_spec_relation_fk FOREIGN KEY(species_relations)
  REFERENCES species(type);
