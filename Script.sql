
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS QATAR22 DEFAULT CHARACTER SET utf8 ;
USE QATAR22;
-- drop database QATAR22;
-- -----------------------------------------------------
-- Table QATAR22.SELECAO
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS QATAR22.SELECAO
(
	  Cod_Selecao INT NOT NULL,
	  Nome VARCHAR(45) NOT NULL,
	  Confederacao VARCHAR(45) NOT NULL,
	  Titulo INT NOT NULL,
	  Ranking VARCHAR(45) NOT NULL,
	  PRIMARY KEY (Cod_Selecao)
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table QATAR22.ESTATISTICA
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS QATAR22.ESTATISTICA
(
	  Cod_Estatistica INT NOT NULL,
	  Golo VARCHAR(45) NULL,
	  Falta VARCHAR(45) NULL,
	  Amarelo VARCHAR(45) NULL,
	  Vermelho VARCHAR(45) NULL,
	  Lesao VARCHAR(45) NULL,
	  PRIMARY KEY (Cod_Estatistica)
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table QATAR22.JOGADOR
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS QATAR22.JOGADOR
(
	  Cod_Jogador INT NOT NULL,
	  Nome VARCHAR(45) NOT NULL,
	  Idade INT NOT NULL,
	  Clubo VARCHAR(45) NULL,
	  Posição VARCHAR(45) NOT NULL,
	  Titulo INT NOT NULL,
	  SELECAO_Cod_Selecao INT NOT NULL,
	  ESTATISTICA_Cod_Estatistica INT NOT NULL,
	  PRIMARY KEY (Cod_Jogador, SELECAO_Cod_Selecao),
	  INDEX fk_JOGADOR_SELECAO1_idx (SELECAO_Cod_Selecao ASC) VISIBLE,
	  INDEX fk_JOGADOR_ESTATISTICA1_idx (ESTATISTICA_Cod_Estatistica ASC) VISIBLE,
	  CONSTRAINT fk_JOGADOR_SELECAO1
		FOREIGN KEY (SELECAO_Cod_Selecao)
		REFERENCES QATAR22.SELECAO (Cod_Selecao)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	  CONSTRAINT fk_JOGADOR_ESTATISTICA1
		FOREIGN KEY (ESTATISTICA_Cod_Estatistica)
		REFERENCES QATAR22.ESTATISTICA (Cod_Estatistica)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
	)
	ENGINE = InnoDB;


	-- -----------------------------------------------------
	-- Table QATAR22.GRUPO   -----------------------------------------------------
	CREATE TABLE IF NOT EXISTS QATAR22.GRUPO
	(
		  Cod_Grupo INT NOT NULL,
		  Jogo INT NOT NULL,
		  Vitoria INT NOT NULL,
		  Empate INT NOT NULL,
		  Derrota INT NOT NULL,
		  GM INT NOT NULL,
		  GS INT NOT NULL,
		  Sigla VARCHAR(45) NULL,
		  PRIMARY KEY (Cod_Grupo)
	  )
	ENGINE = InnoDB;


	-- -----------------------------------------------------
	-- Table QATAR22.ARBITRO
	-- -----------------------------------------------------
	CREATE TABLE IF NOT EXISTS QATAR22.ARBITRO
	(
	Cod_Arbitro INT NOT NULL,
	Nome VARCHAR(45) NOT NULL,
	Idade VARCHAR(45) NOT NULL,
	Sexo VARCHAR(45) NOT NULL,
	Pais VARCHAR(45) NOT NULL,
	Confederacao VARCHAR(45) NOT NULL,
	PRIMARY KEY (Cod_Arbitro)
	)
	ENGINE = InnoDB
	COMMENT = ' ';


	-- -----------------------------------------------------
	-- Table QATAR22.ALOJAMENTO
	-- -----------------------------------------------------
	CREATE TABLE IF NOT EXISTS QATAR22.ALOJAMENTO
	(
	  Cod_Alojamento INT NOT NULL,
	  Nome VARCHAR(45) NOT NULL,
	  Cidade VARCHAR(45) NULL,
	  Bairro VARCHAR(45) NULL,
	  Rua VARCHAR(45) NULL,
	  CEP VARCHAR(45) NULL,
	  Entrada VARCHAR(45) NOT NULL,
	  Saida VARCHAR(45) NOT NULL,
	  SELECAO_Cod_Selecao INT NOT NULL,
	  PRIMARY KEY (Cod_Alojamento, SELECAO_Cod_Selecao),
	  INDEX fk_ALOJAMENTO_SELECAO1_idx (SELECAO_Cod_Selecao ASC) VISIBLE,
	  CONSTRAINT fk_ALOJAMENTO_SELECAO1
		FOREIGN KEY (SELECAO_Cod_Selecao)
		REFERENCES QATAR22.SELECAO (Cod_Selecao)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION)
	ENGINE = InnoDB
	COMMENT = '	';


	-- -----------------------------------------------------
	-- Table QATAR22.ESTADIO
	-- -----------------------------------------------------
	CREATE TABLE IF NOT EXISTS QATAR22.ESTADIO
	(
		  Cod_Estadio INT NOT NULL,
		  Nome VARCHAR(45) NOT NULL,
		  Capacidade VARCHAR(45) NOT NULL,
		  Cidade VARCHAR(45) NOT NULL,
		  Ano VARCHAR(45) NOT NULL,
		  PRIMARY KEY (Cod_Estadio)
	  )
	ENGINE = InnoDB;


	-- -----------------------------------------------------
	-- Table QATAR22.PARTIDA
	-- -----------------------------------------------------
	CREATE TABLE IF NOT EXISTS QATAR22.PARTIDA
	(
	  Cod_Partida INT NOT NULL,
	  Inicio TIME NULL,
	  Final TIME NULL,
	  Data DATE NULL,
	  Golo_Casa INT NULL,
	  Marcodor VARCHAR(45) NULL,
	  Golo_Visitante INT NULL,
	  SELECAO_Cod_Selecao INT NOT NULL,
	  SELECAO_Cod_Selecao1 INT NOT NULL,
	  ESTADIO_Cod_Estadio INT NOT NULL,
	  PRIMARY KEY (Cod_Partida, SELECAO_Cod_Selecao, SELECAO_Cod_Selecao1, ESTADIO_Cod_Estadio),
	  INDEX fk_PARTIDA_SELECAO1_idx (SELECAO_Cod_Selecao ASC) VISIBLE,
	  INDEX fk_PARTIDA_SELECAO2_idx (SELECAO_Cod_Selecao1 ASC) VISIBLE,
	  INDEX fk_PARTIDA_ESTADIO1_idx (ESTADIO_Cod_Estadio ASC) VISIBLE,
	  CONSTRAINT fk_PARTIDA_SELECAO1
		FOREIGN KEY (SELECAO_Cod_Selecao)
		REFERENCES QATAR22.SELECAO (Cod_Selecao)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	  CONSTRAINT fk_PARTIDA_SELECAO2
		FOREIGN KEY (SELECAO_Cod_Selecao1)
		REFERENCES QATAR22.SELECAO (Cod_Selecao)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	  CONSTRAINT fk_PARTIDA_ESTADIO1
		FOREIGN KEY (ESTADIO_Cod_Estadio)
		REFERENCES QATAR22.ESTADIO (Cod_Estadio)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
    )
ENGINE = InnoDB
COMMENT = '	';


-- -----------------------------------------------------
-- Table QATAR22.TREINADOR
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS QATAR22.TREINADOR
(
	  Cod_Treinador INT NOT NULL,
	  Nome VARCHAR(45) NOT NULL,
	  Idade INT NOT NULL,
	  Sexo VARCHAR(45) NOT NULL,
	  Pais VARCHAR(45) NOT NULL,
	  Titulo VARCHAR(45) NULL,
	  SELECAO_Cod_Selecao INT NOT NULL,
	  PRIMARY KEY (Cod_Treinador, SELECAO_Cod_Selecao),
	  INDEX fk_TREINADOR_SELECAO1_idx (SELECAO_Cod_Selecao ASC) VISIBLE,
	  CONSTRAINT fk_TREINADOR_SELECAO1
		FOREIGN KEY (SELECAO_Cod_Selecao)
		REFERENCES QATAR22.SELECAO (Cod_Selecao)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table QATAR22.MARCADOR
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS QATAR22.MARCADOR
(
	  Cod_Marcador INT NOT NULL,
	  Nome VARCHAR(45) NOT NULL,
	  Posicao VARCHAR(45) NOT NULL,
	  ESTATISTICA_Cod_Estatistica INT NOT NULL,
	  PRIMARY KEY (Cod_Marcador),
	  INDEX fk_MARCADOR_ESTATISTICA1_idx (ESTATISTICA_Cod_Estatistica ASC) VISIBLE,
	  CONSTRAINT fk_MARCADOR_ESTATISTICA1
		FOREIGN KEY (ESTATISTICA_Cod_Estatistica)
		REFERENCES QATAR22.ESTATISTICA (Cod_Estatistica)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table QATAR22.MELHOR_JOGADOR
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS QATAR22.MELHOR_JOGADOR
(
  Cod_Melhor_Jogador INT NOT NULL,
  Nome VARCHAR(45) NOT NULL,
  Posicao VARCHAR(45) NOT NULL,
  ESTATISTICA_Cod_Estatistica INT NOT NULL,
  PRIMARY KEY (Cod_Melhor_Jogador),
  INDEX fk_MELHOR_JOGADOR_ESTATISTICA1_idx (ESTATISTICA_Cod_Estatistica ASC) VISIBLE,
  CONSTRAINT fk_MELHOR_JOGADOR_ESTATISTICA1
    FOREIGN KEY (ESTATISTICA_Cod_Estatistica)
    REFERENCES QATAR22.ESTATISTICA (Cod_Estatistica)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table QATAR22.SELECAO_has_GRUPO
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS QATAR22.SELECAO_has_GRUPO
(
  SELECAO_Cod_Selecao INT NOT NULL,
  GRUPO_Cod_Grupo INT NOT NULL,
  PRIMARY KEY (SELECAO_Cod_Selecao, GRUPO_Cod_Grupo),
  INDEX fk_SELECAO_has_GRUPO_GRUPO1_idx (GRUPO_Cod_Grupo ASC) VISIBLE,
  INDEX fk_SELECAO_has_GRUPO_SELECAO_idx (SELECAO_Cod_Selecao ASC) VISIBLE,
  CONSTRAINT fk_SELECAO_has_GRUPO_SELECAO
    FOREIGN KEY (SELECAO_Cod_Selecao)
    REFERENCES QATAR22.SELECAO (Cod_Selecao)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_SELECAO_has_GRUPO_GRUPO1
    FOREIGN KEY (GRUPO_Cod_Grupo)
    REFERENCES QATAR22.GRUPO (Cod_Grupo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table QATAR22.PARTIDA_has_ARBITRO
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS QATAR22.PARTIDA_has_ARBITRO
(
	  PARTIDA_Cod_Partida INT NOT NULL,
	  PARTIDA_SELECAO_Cod_Selecao INT NOT NULL,
	  PARTIDA_SELECAO_Cod_Selecao1 INT NOT NULL,
	  PARTIDA_ESTADIO_Cod_Estadio INT NOT NULL,
	  ARBITRO_Cod_Arbitro INT NOT NULL,
	  PRIMARY KEY (PARTIDA_Cod_Partida, PARTIDA_SELECAO_Cod_Selecao, PARTIDA_SELECAO_Cod_Selecao1, PARTIDA_ESTADIO_Cod_Estadio, ARBITRO_Cod_Arbitro),
	  INDEX fk_PARTIDA_has_ARBITRO_ARBITRO1_idx (ARBITRO_Cod_Arbitro ASC) VISIBLE,
	  INDEX fk_PARTIDA_has_ARBITRO_PARTIDA1_idx (PARTIDA_Cod_Partida ASC, PARTIDA_SELECAO_Cod_Selecao ASC, PARTIDA_SELECAO_Cod_Selecao1 ASC, PARTIDA_ESTADIO_Cod_Estadio ASC) VISIBLE,
	  CONSTRAINT fk_PARTIDA_has_ARBITRO_PARTIDA1
		FOREIGN KEY (PARTIDA_Cod_Partida , PARTIDA_SELECAO_Cod_Selecao, PARTIDA_SELECAO_Cod_Selecao1, PARTIDA_ESTADIO_Cod_Estadio)
		REFERENCES QATAR22.PARTIDA (Cod_Partida, SELECAO_Cod_Selecao, SELECAO_Cod_Selecao1, ESTADIO_Cod_Estadio)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	  CONSTRAINT fk_PARTIDA_has_ARBITRO_ARBITRO1
		FOREIGN KEY (ARBITRO_Cod_Arbitro)
		REFERENCES QATAR22.ARBITRO (Cod_Arbitro)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table QATAR22.PARTIDA_has_ESTATISTICA
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS QATAR22.PARTIDA_has_ESTATISTICA
(
  PARTIDA_Cod_Partida INT NOT NULL,
  PARTIDA_SELECAO_Cod_Selecao INT NOT NULL,
  PARTIDA_SELECAO_Cod_Selecao1 INT NOT NULL,
  PARTIDA_ESTADIO_Cod_Estadio INT NOT NULL,
  ESTATISTICA_Cod_Estatistica INT NOT NULL,
  PRIMARY KEY (PARTIDA_Cod_Partida, PARTIDA_SELECAO_Cod_Selecao, PARTIDA_SELECAO_Cod_Selecao1, PARTIDA_ESTADIO_Cod_Estadio, ESTATISTICA_Cod_Estatistica),
  INDEX fk_PARTIDA_has_ESTATISTICA_ESTATISTICA1_idx (ESTATISTICA_Cod_Estatistica ASC) VISIBLE,
  INDEX fk_PARTIDA_has_ESTATISTICA_PARTIDA1_idx (PARTIDA_Cod_Partida ASC, PARTIDA_SELECAO_Cod_Selecao ASC, PARTIDA_SELECAO_Cod_Selecao1 ASC, PARTIDA_ESTADIO_Cod_Estadio ASC) VISIBLE,
  CONSTRAINT fk_PARTIDA_has_ESTATISTICA_PARTIDA1
    FOREIGN KEY (PARTIDA_Cod_Partida, PARTIDA_SELECAO_Cod_Selecao, PARTIDA_SELECAO_Cod_Selecao1, PARTIDA_ESTADIO_Cod_Estadio)
    REFERENCES QATAR22.PARTIDA (Cod_Partida , SELECAO_Cod_Selecao, SELECAO_Cod_Selecao1, ESTADIO_Cod_Estadio)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_PARTIDA_has_ESTATISTICA_ESTATISTICA1
    FOREIGN KEY (ESTATISTICA_Cod_Estatistica)
    REFERENCES QATAR22.ESTATISTICA (Cod_Estatistica)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
