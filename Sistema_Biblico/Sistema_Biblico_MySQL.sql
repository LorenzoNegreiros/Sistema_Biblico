
CREATE TABLE mapas (
                cod_mapa VARCHAR(20) NOT NULL,
                nome_mapa VARCHAR(50) NOT NULL,
                mapa_regiao VARCHAR(50) NOT NULL,
                mapa_relevo VARCHAR(50) NOT NULL,
                mapa_vegetacao VARCHAR(50) NOT NULL,
                mapa_clima VARCHAR(50) NOT NULL,
                mapa_temp_media CHAR(2) NOT NULL,
                mapa_temp_max CHAR(2) NOT NULL,
                mapa_temp_min CHAR(2) NOT NULL,
                PRIMARY KEY (cod_mapa)
);


CREATE TABLE professias (
                cod_professia VARCHAR(20) NOT NULL,
                nome_professia VARCHAR(50) NOT NULL,
                descricao_professia VARCHAR(100) NOT NULL,
                PRIMARY KEY (cod_professia)
);


CREATE TABLE datas_relevantes (
                cod_data VARCHAR(20) NOT NULL,
                dia CHAR(2),
                mes CHAR(2),
                ano CHAR(4),
                tempo CHAR(2),
                PRIMARY KEY (cod_data)
);


CREATE TABLE professias_datas (
                cod_professia VARCHAR(20) NOT NULL,
                cod_data VARCHAR(20) NOT NULL,
                PRIMARY KEY (cod_professia, cod_data)
);


CREATE TABLE fatos_relevantes (
                cod_fato VARCHAR(20) NOT NULL,
                nome_fato VARCHAR(50) NOT NULL,
                descricao_fato VARCHAR(100) NOT NULL,
                PRIMARY KEY (cod_fato)
);


CREATE TABLE pessoas (
                cod_pessoas VARCHAR(20) NOT NULL,
                nome_pessoa VARCHAR(50) NOT NULL,
                idade CHAR(3),
                local_nascimento VARCHAR(50),
                local_habitou VARCHAR(50) NOT NULL,
                PRIMARY KEY (cod_pessoas)
);


CREATE TABLE locais_habitados (
                cod_pessoas VARCHAR(20) NOT NULL,
                nome_cidade VARCHAR(50) NOT NULL,
                regiao VARCHAR(50) NOT NULL,
                PRIMARY KEY (cod_pessoas)
);


CREATE TABLE ascendentes (
                cod_ascendentes VARCHAR(20) NOT NULL,
                cod_descendentes VARCHAR(20) NOT NULL,
                PRIMARY KEY (cod_ascendentes)
);


CREATE TABLE fatos_pessoas (
                cod_fato VARCHAR(20) NOT NULL,
                cod_pessoas VARCHAR(20) NOT NULL,
                PRIMARY KEY (cod_fato, cod_pessoas)
);


CREATE TABLE versiculos (
                cod_versi VARCHAR(20) NOT NULL,
                nome_versi VARCHAR(50) NOT NULL,
                texto VARCHAR(50) NOT NULL,
                objetivo VARCHAR(50) NOT NULL,
                reflexao_tema VARCHAR(100) NOT NULL,
                PRIMARY KEY (cod_versi)
);


CREATE TABLE versiculos_mapas (
                cod_versi VARCHAR(20) NOT NULL,
                cod_mapa VARCHAR(20) NOT NULL,
                PRIMARY KEY (cod_versi, cod_mapa)
);


CREATE TABLE versiculos_fatos (
                cod_versi VARCHAR(20) NOT NULL,
                cod_fato VARCHAR(20) NOT NULL,
                PRIMARY KEY (cod_versi, cod_fato)
);


CREATE TABLE datas_versiculos (
                cod_data VARCHAR(20) NOT NULL,
                cod_versi VARCHAR(20) NOT NULL,
                PRIMARY KEY (cod_data, cod_versi)
);


CREATE TABLE professias_versiculos (
                cod_aparecimento VARCHAR(20) NOT NULL,
                cod_professia VARCHAR(20) NOT NULL,
                cod_versi VARCHAR(20) NOT NULL,
                PRIMARY KEY (cod_aparecimento, cod_professia, cod_versi)
);


CREATE TABLE plano_de_leitura (
                cod_plano_leitura VARCHAR(20) NOT NULL,
                objetivo VARCHAR(100) NOT NULL,
                duracao VARCHAR(100) NOT NULL,
                PRIMARY KEY (cod_plano_leitura)
);


CREATE TABLE livros (
                cod_livro VARCHAR(20) NOT NULL,
                cod_plano_leitura VARCHAR(20) NOT NULL,
                nome_livro VARCHAR(50) NOT NULL,
                quant_capitulos INT NOT NULL,
                epoca VARCHAR(50) NOT NULL,
                abreviatura VARCHAR(3) NOT NULL,
                PRIMARY KEY (cod_livro, cod_plano_leitura)
);


CREATE TABLE livros_pessoas (
                cod_livro VARCHAR(20) NOT NULL,
                cod_plano_leitura VARCHAR(20) NOT NULL,
                cod_pessoas VARCHAR(20) NOT NULL,
                autor VARCHAR(50) NOT NULL,
                PRIMARY KEY (cod_livro, cod_plano_leitura, cod_pessoas)
);


CREATE TABLE capitulos (
                cod_capitulo VARCHAR(20) NOT NULL,
                cod_livro VARCHAR(20) NOT NULL,
                cod_plano_leitura VARCHAR(20) NOT NULL,
                cod_versi VARCHAR(20) NOT NULL,
                nome_cap VARCHAR(50) NOT NULL,
                quant_versiculos INT NOT NULL,
                categoria VARCHAR(50) NOT NULL,
                reflexao_tema VARCHAR(100) NOT NULL,
                PRIMARY KEY (cod_capitulo, cod_livro, cod_plano_leitura, cod_versi)
);


ALTER TABLE versiculos_mapas ADD CONSTRAINT mapas_versiculos_mapas_fk
FOREIGN KEY (cod_mapa)
REFERENCES mapas (cod_mapa)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE professias_versiculos ADD CONSTRAINT professias_professias_versiculos_fk
FOREIGN KEY (cod_professia)
REFERENCES professias (cod_professia)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE professias_datas ADD CONSTRAINT professias_professias_datas_fk
FOREIGN KEY (cod_professia)
REFERENCES professias (cod_professia)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE datas_versiculos ADD CONSTRAINT datas_relevantes_datas_versiculos_fk
FOREIGN KEY (cod_data)
REFERENCES datas_relevantes (cod_data)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE professias_datas ADD CONSTRAINT datas_relevantes_professias_datas_fk
FOREIGN KEY (cod_data)
REFERENCES datas_relevantes (cod_data)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE fatos_pessoas ADD CONSTRAINT fatos_relevantes_fatos_pessoas_fk
FOREIGN KEY (cod_fato)
REFERENCES fatos_relevantes (cod_fato)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE versiculos_fatos ADD CONSTRAINT fatos_relevantes_versiculos_fatos_fk
FOREIGN KEY (cod_fato)
REFERENCES fatos_relevantes (cod_fato)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE fatos_pessoas ADD CONSTRAINT pessoas_fatos_pessoas_fk
FOREIGN KEY (cod_pessoas)
REFERENCES pessoas (cod_pessoas)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE ascendentes ADD CONSTRAINT pessoas_ascendentes_fk
FOREIGN KEY (cod_ascendentes)
REFERENCES pessoas (cod_pessoas)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE ascendentes ADD CONSTRAINT pessoas_ascendentes_fk1
FOREIGN KEY (cod_ascendentes)
REFERENCES pessoas (cod_pessoas)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE locais_habitados ADD CONSTRAINT pessoas_locais_habitados_fk
FOREIGN KEY (cod_pessoas)
REFERENCES pessoas (cod_pessoas)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE livros_pessoas ADD CONSTRAINT pessoas_livros_pessoas_fk
FOREIGN KEY (cod_pessoas)
REFERENCES pessoas (cod_pessoas)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE capitulos ADD CONSTRAINT versiculos_capitulos_fk
FOREIGN KEY (cod_versi)
REFERENCES versiculos (cod_versi)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE professias_versiculos ADD CONSTRAINT versiculos_professias_versiculos_fk
FOREIGN KEY (cod_versi)
REFERENCES versiculos (cod_versi)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE datas_versiculos ADD CONSTRAINT versiculos_datas_versiculos_fk
FOREIGN KEY (cod_versi)
REFERENCES versiculos (cod_versi)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE versiculos_fatos ADD CONSTRAINT versiculos_versiculos_fatos_fk
FOREIGN KEY (cod_versi)
REFERENCES versiculos (cod_versi)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE versiculos_mapas ADD CONSTRAINT versiculos_versiculos_mapas_fk
FOREIGN KEY (cod_versi)
REFERENCES versiculos (cod_versi)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE livros ADD CONSTRAINT plano_de_leitura_livros_fk
FOREIGN KEY (cod_plano_leitura)
REFERENCES plano_de_leitura (cod_plano_leitura)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE capitulos ADD CONSTRAINT livros_capitulos_fk
FOREIGN KEY (cod_livro, cod_plano_leitura)
REFERENCES livros (cod_livro, cod_plano_leitura)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE livros_pessoas ADD CONSTRAINT livros_livros_pessoas_fk
FOREIGN KEY (cod_livro, cod_plano_leitura)
REFERENCES livros (cod_livro, cod_plano_leitura)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
