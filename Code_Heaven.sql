/*
DROP DATABASE code_heaven;

CREATE DATABASE code_heaven;

SELECT * FROM usuarios;

SHOW TABLES;

SHOW COLUMNS FROM usuarios;
*/

CREATE DATABASE code_heaven;

USE code_heaven;

SELECT DATABASE();

CREATE TABLE usuarios(
    usu_nome varchar(100) NOT NULL,
    usu_email varchar(100) NOT NULL,
    usu_senha varchar(255) NOT NULL,
    usu_nivel_acesso ENUM("ADMIN", "USUARIO") NOT NULL,
    usu_id INT AUTO_INCREMENT,
    PRIMARY KEY(usu_id)
);

CREATE TABLE categorias(
    categ_nome VARCHAR(100) NOT NULL,
    categ_id INT AUTO_INCREMENT,
    PRIMARY KEY(categ_id)
);

CREATE TABLE perfil (
    perfil_biografia LONGTEXT NOT NULL,
    perfil_data_nascimento DATE NOT NULL,
    usu_id INT NOT NULL,
    perfil_id INT AUTO_INCREMENT,
    PRIMARY KEY(perfil_id)
);

CREATE TABLE perguntas (
    perg_titulo VARCHAR(100) NOT NULL,
    perg_descricao LONGTEXT NOT NULL,
    usu_id INT,
    categ_id INT,
    conte_id INT,
    perg_id INT AUTO_INCREMENT,
    PRIMARY KEY (perg_id)
);

CREATE TABLE conteudos (
    conte_nome VARCHAR(100) NOT NULL,
    conte_ordem INT NOT NULL,
    conte_icone VARCHAR(255) NOT NULL,
    usu_id INT,
    conte_id INT AUTO_INCREMENT,
    PRIMARY KEY(conte_id)
);

CREATE TABLE mensagens (
    msg_mensagem LONGTEXT NOT NULL,
    msg_data_envio DATE NOT NULL,
    msg_remetente_id INT,
    msg_destinatario_id INT,
    msg_id INT AUTO_INCREMENT,
    PRIMARY KEY(msg_id)
);

CREATE TABLE respostas (
    resp_data DATE NOT NULL,
    perg_id INT,
    usu_id INT,
    resp_id INT AUTO_INCREMENT,
    PRIMARY KEY(resp_id)
);

ALTER TABLE perfil ADD CONSTRAINT fk_perfil_usuarios FOREIGN KEY (usu_id) REFERENCES usuarios(usu_id);

ALTER TABLE perguntas ADD CONSTRAINT fk_perguntas_usuarios FOREIGN KEY (usu_id) REFERENCES usuarios(usu_id);

ALTER TABLE perguntas ADD CONSTRAINT fk_perguntas_categorias FOREIGN KEY (categ_id) REFERENCES categorias(categ_id);

ALTER TABLE perguntas ADD CONSTRAINT fk_perguntas_conteudos FOREIGN KEY (conte_id) REFERENCES conteudos(conte_id);

ALTER TABLE conteudos ADD CONSTRAINT fk_conteudos_usuarios FOREIGN KEY (usu_id) REFERENCES usuarios(usu_id);

ALTER TABLE mensagens ADD CONSTRAINT fk_mensagens_remetente FOREIGN KEY (msg_remetente_id) REFERENCES usuarios(usu_id);

ALTER TABLE mensagens ADD CONSTRAINT fk_mensagens_destinatario FOREIGN KEY (msg_destinatario_id) REFERENCES usuarios(usu_id);

ALTER TABLE respostas ADD CONSTRAINT fk_respostas_perguntas FOREIGN KEY (perg_id) REFERENCES perguntas(perg_id);

ALTER TABLE respostas ADD CONSTRAINT fk_respostas_usuarios FOREIGN KEY (usu_id) REFERENCES usuarios(usu_id);

INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ("Victor", "victor@kashima.com", "123123", "ADMIN");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ("Matheus", "theu.morandi@gmail.com", "321321", "ADMIN");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ("Jefferson", "jerso@gmail.com", "333222111", "ADMIN");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ("Giovanni", "giovann@jacto.com", "112233", "ADMIN");

INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Stillmann', 'sbenion0@twitpic.com', 'WuIV9Yyuq', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Herc', 'hbaptist1@bluehost.com', 'Zo2ZzZq8KRT2', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Ryann', 'rsheaber2@ted.com', 'hTOJ1J', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Wolfie', 'wgurdon3@macromedia.com', 'SSGiZDx3tuCc', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Hazlett', 'hhilland4@baidu.com', 'l8C3kOwo4', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Zora', 'zduxbarry5@google.de', 'YFyVtBeo', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Janean', 'joger6@ft.com', 'PCGBwF7J5rY', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Alecia', 'aadamovsky7@amazon.co.jp', '9PX64pZ5rjj2', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Nisse', 'nniesing8@typepad.com', 'AIdEWaxl', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Cherida', 'cfarthin9@jugem.jp', 'JG1OeMw', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Dew', 'dgavea@wisc.edu', 'IVKxd01cbv', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Tiffany', 'tlayburnb@deviantart.com', 'FeYBEawmKz48', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Korrie', 'kswalwellc@paypal.com', '1hX0EY', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Berkie', 'bbodmand@stumbleupon.com', '0HcifnXnR5n', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Meryl', 'mbarwacke@chronoengine.com', 'isudtWxiY', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Vivi', 'vpittockf@narod.ru', 'BKknPo9pK', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Hanson', 'hwysomeg@ebay.com', 'EC4F1s', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Francene', 'falejandroh@people.com.cn', 'uH0LMmK', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Alyosha', 'aburlesi@nature.com', 'MaDtXNrk', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Horten', 'hstroyanj@barnesandnoble.com', '7ceUMa9Ay', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Andra', 'aferridayk@mac.com', 'trHS2pgxm', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Genovera', 'gclewsl@economist.com', 'bWMto2p', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Allistir', 'abernonm@bing.com', '9tFqolKetZ', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Jareb', 'jlacyn@disqus.com', 'Aluh6yjiA', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Marsiella', 'mivanyukovo@google.com.au', 'aKPkFT', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Alessandro', 'acominettip@ask.com', '9BSNSPg5OKV', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Prescott', 'pbehnekeq@yelp.com', '6lnsjf0', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Tammy', 'tlockneyr@wordpress.com', 'MrVynE4bd4B', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Erik', 'ehaynesfords@ycombinator.com', 'K1QmI1OQOkRX', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Janice', 'jkeyhoet@phoca.cz', 'E5Mg5Y', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Kyle', 'kdumbrillu@lycos.com', '5FwflIcN5pd', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Llewellyn', 'ljerminv@forbes.com', 'uiMH8yR1xnOk', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Sarene', 'sskrzynskiw@thetimes.co.uk', '9R1KFxaCed', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Carly', 'crubrowx@marriott.com', 'sTAqUg', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Winny', 'wgewery@hibu.com', 'kniTv8lD1eT', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Bernadina', 'bmaundersz@telegraph.co.uk', '8hGIC9xXZqR', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Cornie', 'celvy10@drupal.org', 'ag9wyTIfjg', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Lexis', 'lharle11@reverbnation.com', 'uHwLyJ', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Elisa', 'espikins12@multiply.com', 'qMMzZx', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Filbert', 'fzanettini13@elegantthemes.com', 'wtnBO1oBEKo', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Shawn', 'skennler14@storify.com', 'IHb26B8Rj', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Leigh', 'llipgens15@bluehost.com', 'PmyRtAbqh', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Egon', 'ecatlette16@ca.gov', 'tV3odmhTtd', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Sybille', 'sjurries17@example.com', 'oQ0e4f', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Lawry', 'lcahill18@wikimedia.org', 'ya42sFZ', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Norbert', 'nboustred19@upenn.edu', 'xQPNtctVIY14', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Trescha', 'tfagan1a@tumblr.com', 'V039knydbQ', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Zeb', 'zbownas1b@blogger.com', 'EpoQPkjioOBg', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Carmencita', 'cattwill1c@gravatar.com', 'YrAhLnI', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Shepard', 'sdallimore1d@pen.io', '4jCv3C', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Bastien', 'bsimmon1e@wp.com', 'lQ5Yjpi8BW', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Pryce', 'pcoltherd1f@adobe.com', 'UMzWJ9Fer', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Quinlan', 'qsighard1g@opera.com', 'evyuNv0', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Budd', 'bvanderson1h@uiuc.edu', 'LQghfJjbC', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Justino', 'jisherwood1i@dot.gov', 'GWF9JqAHyZC', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Marie-jeanne', 'mklaesson1j@skyrock.com', 'EDdmG6lSXu6', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Charlot', 'cwintringham1k@reverbnation.com', 'Vc5HJ3y', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Isadora', 'idwire1l@globo.com', 'i7PQFaA', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Vevay', 'vkennifeck1m@ning.com', 'eRt7fB1iVD', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Ronni', 'riorizzo1n@angelfire.com', 'RMZvzo0', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Julina', 'jdengate1o@infoseek.co.jp', 'yHo8Opg2Dx', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Marcella', 'mscardifield1p@spiegel.de', 'G7jPDJB', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Becka', 'bpavlovsky1q@thetimes.co.uk', 'c0DE4x', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Berty', 'bdownes1r@hubpages.com', 'CM2lsf382j', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Arleta', 'aancell1s@economist.com', '3eGXKdj', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Natty', 'nvallintine1t@irs.gov', 'aclBBk5TJyBO', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Abbie', 'acrooke1u@blogtalkradio.com', 'xkFSkcr0Fw', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Bernetta', 'bbetteson1v@cisco.com', 'xTzQstwUE', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Armand', 'akaser1w@google.cn', 'ZeGXGAA40', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Austin', 'awinter1x@angelfire.com', 'l4Mlex', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Hobey', 'hbraisby1y@prweb.com', 'HtpR11iurMew', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Sutton', 'smorcomb1z@shinystat.com', 'lwLOlq7hAp', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Parker', 'pruffey20@360.cn', 'ENtAv6lAsJqw', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Hans', 'htiesman21@bravesites.com', 'kor5AK2kq', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Goldi', 'gcordner22@home.pl', 'um73wzFUO', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Ida', 'icapener23@discovery.com', '1ahuuvx', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Carmel', 'csimla24@elpais.com', 'oaE1dRSJ', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Angeli', 'adyde25@un.org', 'zSqDPuxgFp5', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Bunny', 'bhrus26@goo.ne.jp', 'CTVSezn9xE', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Cameron', 'cberthelet27@360.cn', 'pfyzV2joH3', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Hugh', 'hsignoret28@dmoz.org', 'ZgTVy6', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Rosa', 'rkinchlea29@ovh.net', 'Hqu0rU0', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Arabelle', 'aroskrug2a@unicef.org', 'ISgRl6', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Grethel', 'gdunster2b@wisc.edu', 'W20iTD0qE', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Kriste', 'kvaughn2c@sohu.com', 'a32oQOnDSP4', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Stacee', 'spegden2d@toplist.cz', '29G8PN', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Zacharia', 'zhapps2e@gnu.org', 'U1LLJhI', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Rem', 'rstrasse2f@reddit.com', '5Nw1Vd', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Yvette', 'ycarhart2g@icio.us', 'UU0Dv04XXj', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Tommy', 'tsaffle2h@moonfruit.com', '1TozdTb', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Zelig', 'zpuddephatt2i@msu.edu', 'w3YXeZCU2', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Dav', 'dtunnadine2j@123-reg.co.uk', 'D5eAB2T5', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Chance', 'cantalffy2k@epa.gov', '9Fsl5QEe925', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Clerc', 'ccadogan2l@netscape.com', 'uzuqJKq9Uihi', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Hans', 'hfrancombe2m@blog.com', '2Gw3KfzJ4', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Welch', 'wmccaghan2n@nsw.gov.au', 'CmuuqOv', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Lise', 'lpendrid2o@techcrunch.com', 'o0aWofCSSM', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Mildrid', 'mfeaveryear2p@cloudflare.com', '0ra7PRhMH', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Jaimie', 'jmcentee2q@wunderground.com', 'lTdjs5hRhOi', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('NUMAN', 'sstickney2r@simbiose.com', 'zOyTtKJHk', "USUARIO");

INSERT INTO categorias (categ_nome) VALUES ("GAMES");
INSERT INTO categorias (categ_nome) VALUES ("PROGRAMMING");