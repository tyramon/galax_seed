#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: user
#------------------------------------------------------------

CREATE TABLE user(
        u_id               int (11) Auto_increment  NOT NULL ,
        u_pseudo           Varchar (200) NOT NULL ,
        u_password         Varchar (200) NOT NULL ,
        u_mail             Varchar (200) NOT NULL ,
        u_date_inscription Date NOT NULL ,
        u_nb_partie        Int NOT NULL ,
        u_nb_victoire      Int NOT NULL ,
        r_id               Int NOT NULL ,
        d_id               Int NOT NULL ,
        p_id               Int NOT NULL ,
        i_id               Int NOT NULL ,
        PRIMARY KEY (u_id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: carte
#------------------------------------------------------------

CREATE TABLE carte(
        c_id        int (11) Auto_increment  NOT NULL ,
        c_nom       Varchar (200) NOT NULL ,
        c_pv        Int ,
        c_point_att Int ,
        c_cout      Int ,
        c_bouclier  TinyINT NOT NULL ,
        d_id        Int NOT NULL ,
        t_id        Int NOT NULL ,
        PRIMARY KEY (c_id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: deck
#------------------------------------------------------------

CREATE TABLE deck(
        d_id  int (11) Auto_increment  NOT NULL ,
        d_nom Varchar (50) NOT NULL ,
        PRIMARY KEY (d_id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: type
#------------------------------------------------------------

CREATE TABLE type(
        t_id  int (11) Auto_increment  NOT NULL ,
        t_nom Varchar (25) NOT NULL ,
        PRIMARY KEY (t_id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: role
#------------------------------------------------------------

CREATE TABLE role(
        r_id  int (11) Auto_increment  NOT NULL ,
        r_nom Varchar (25) NOT NULL ,
        PRIMARY KEY (r_id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: autorisation
#------------------------------------------------------------

CREATE TABLE autorisation(
        a_id  int (11) Auto_increment  NOT NULL ,
        a_nom Varchar (25) NOT NULL ,
        PRIMARY KEY (a_id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: partie
#------------------------------------------------------------

CREATE TABLE partie(
        p_id         int (11) Auto_increment  NOT NULL ,
        p_joueur1_fk Varchar (200) NOT NULL ,
        p_joueur2_fk Varchar (200) NOT NULL ,
        PRIMARY KEY (p_id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: inscrit_news
#------------------------------------------------------------

CREATE TABLE inscrit_news(
        i_id   int (11) Auto_increment  NOT NULL ,
        i_mail Varchar (50) NOT NULL ,
        i_date Date NOT NULL ,
        PRIMARY KEY (i_id )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: donne
#------------------------------------------------------------

CREATE TABLE donne(
        r_id Int NOT NULL ,
        a_id Int NOT NULL ,
        PRIMARY KEY (r_id ,a_id )
)ENGINE=InnoDB;

ALTER TABLE user ADD CONSTRAINT FK_user_r_id FOREIGN KEY (r_id) REFERENCES role(r_id);
ALTER TABLE user ADD CONSTRAINT FK_user_d_id FOREIGN KEY (d_id) REFERENCES deck(d_id);
ALTER TABLE user ADD CONSTRAINT FK_user_p_id FOREIGN KEY (p_id) REFERENCES partie(p_id);
ALTER TABLE user ADD CONSTRAINT FK_user_i_id FOREIGN KEY (i_id) REFERENCES inscrit_news(i_id);
ALTER TABLE carte ADD CONSTRAINT FK_carte_d_id FOREIGN KEY (d_id) REFERENCES deck(d_id);
ALTER TABLE carte ADD CONSTRAINT FK_carte_t_id FOREIGN KEY (t_id) REFERENCES type(t_id);
ALTER TABLE donne ADD CONSTRAINT FK_donne_r_id FOREIGN KEY (r_id) REFERENCES role(r_id);
ALTER TABLE donne ADD CONSTRAINT FK_donne_a_id FOREIGN KEY (a_id) REFERENCES autorisation(a_id);
