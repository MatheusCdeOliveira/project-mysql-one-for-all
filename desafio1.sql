DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.plano(
      plano_id INT PRIMARY KEY AUTO_INCREMENT,
      tipo_do_plano VARCHAR(45) NOT NULL,
      valor_plano decimal(3, 2) NOT NULL
  ) engine = InnoDB;

CREATE TABLE SpotifyClone.users(
      usuario_id INT PRIMARY KEY AUTO_INCREMENT,
      nome_usuario VARCHAR(45) NOT NULL,
      sobrenome_usuario VARCHAR(45) NOT NULL,
      idade INT NOT NULL,
      plano_id INT NOT NULL,
      FOREIGN KEY (plano_id) REFERENCES SpotifyClone.plano(plano_id)
  ) engine = InnoDB;
  

CREATE TABLE SpotifyClone.artista(
      artista_id INT PRIMARY KEY AUTO_INCREMENT,
      nome_artista VARCHAR(45) NOT NULL
  ) engine = InnoDB;

CREATE TABLE SpotifyClone.album(
      album_id INT PRIMARY KEY AUTO_INCREMENT,
      nome_album VARCHAR(100) NOT NULL,
      ano_lançamento VARCHAR(4) NOT NULL,
      artista_id INT NOT NULL,
      FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artista(artista_id)
  ) engine = InnoDB;
  
CREATE TABLE SpotifyClone.cancoes(
      cancao_id INT PRIMARY KEY AUTO_INCREMENT,
      nome_cancao VARCHAR(100) NOT NULL,
      duracao_segundos decimal(3) NOT NULL,
      album_id INT NOT NULL,
      artista_id INT NOT NULL,
	FOREIGN KEY (album_id) REFERENCES SpotifyClone.album(album_id),
    FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artista(artista_id)
  ) engine = InnoDB;

CREATE TABLE SpotifyClone.historico_reproducoes(
      usuario_id INT NOT NULL,
      cancao_id INT NOT NULL,
      data_reproducao DATETIME,
      CONSTRAINT PRIMARY KEY (usuario_id, cancao_id),
      FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.users(usuario_id),
      FOREIGN KEY (cancao_id) REFERENCES SpotifyClone.cancoes(cancao_id)
  ) engine = InnoDB;


CREATE TABLE SpotifyClone.seguindo_artistas(
    usuario_id INT NOT NULL,
    artista_id INT,
    CONSTRAINT PRIMARY KEY (usuario_id, artista_id),
    FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.users(usuario_id),
    FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artista(artista_id)
  ) engine = InnoDB;


INSERT INTO SpotifyClone.plano (tipo_do_plano, valor_plano)
  VALUES
  ('Gratuito', 0.00),
  ('Familiar', 7.99 ),
  ('Universitário', 5.99),
  ('Pessoal', 6.99);
  
INSERT INTO SpotifyClone.users (nome_usuario, sobrenome_usuario, idade, plano_id)
  VALUES
    ('Barbara', 'Liskov', 82, 1),
    ('Robert', 'Cecil Martin', 58, 1),
    ('Ada', 'Lovelace', 37, 2),
    ('Martin', 'Fowler', 46, 2),
    ('Sandi', 'Metz', 46, 2),
    ('Paulo', 'Freire', 19, 3),
    ('Bell', 'Hooks', 26, 3),
    ('Christopher', 'Alexander', 46, 4),
    ('Judith', 'Butler', 45, 4),
    ('Jorge', 'Amado', 58, 4);
    
INSERT INTO SpotifyClone.artista (nome_artista)
  VALUES
  ('Beyoncé'),
  ('Queen'),
  ('Elis Regina'),
  ('Baco Exu do Blues'),
  ('Blind Guardian'),
  ('Nina Simone');
  
INSERT INTO SpotifyClone.album (nome_album, ano_lançamento, artista_id)
  VALUES
  ('Renaissance', 2022, 1),
  ('Jazz', 1978, 2),
  ('Hot Space', 1982, 2),
  ('Falso Brilhante', 1998, 3),
  ('Vento de Maio', 2001, 3),
  ('QVVJFA?', 2003, 4),
  ('Somewhere Far Beyond', 2007, 5),
  ('I Put A Spell On You', 2012, 6);
  
INSERT INTO SpotifyClone.cancoes (nome_cancao, duracao_segundos, album_id, artista_id)
  VALUES
  ('BREAK MY SOUL', "279", 1, 1),
  ("VIRGO'S GROOVE", "369", 1, 1),
  ('ALIEN SUPERSTAR', '116', 1, 1),
  ("Don't Stop Me Now", '203', 2, 2),
  ("Under Pressure", '152', 3, 2),
  ("Como Nossos Pais", '105', 4, 3),
  ("O Medo de Amar é o Medo de Ser Livre", '207', 5, 3),
  ("Samba em Paris", '267', 6, 4),
  ("The Bard's Song", '244', 7, 5),
  ("Feeling Good", "100", 8, 6);

INSERT INTO SpotifyClone.historico_reproducoes (usuario_id, cancao_id, data_reproducao)
 VALUES
   (1, 8, "2022-02-28 10:45:55"),
   (1, 2, "2020-05-02 05:30:35"),
   (1, 10, "2020-03-06 11:22:33"),
   (2, 10, "2022-08-05 08:05:17"),
   (2, 7, "2020-01-02 07:40:33"),
   (3, 10, "2020-11-13 16:55:13"),
   (3, 2, "2020-12-05 18:38:30"),
   (4, 8, "2021-08-15 17:10:10"),
   (5, 8, "2022-01-09 01:44:33"),
   (5, 5, "2020-08-06 15:23:43"),
   (6, 7, "2017-01-24 00:31:17"),
   (6, 1, "2017-10-12 12:35:20"),
   (7, 4, "2011-12-15 22:30:49"),
   (8, 4, "2012-03-17 14:56:41"),
   (9, 9, "2022-02-24 21:14:22"),
   (10, 3, "2015-12-13 08:30:22");
   
INSERT INTO SpotifyClone.seguindo_artistas (usuario_id, artista_id)
 VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 6),
    (6, 1),
    (7, 6),
    (9, 3),
    (10, 2);