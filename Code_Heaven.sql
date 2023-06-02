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

CREATE TABLE perfil (
    perfil_biografia LONGTEXT NOT NULL,
    perfil_data_nascimento DATE NOT NULL,
    usu_id INT NOT NULL,
    perfil_id INT AUTO_INCREMENT,
    PRIMARY KEY(perfil_id)
);

CREATE TABLE mensagens (
    msg_mensagem LONGTEXT NOT NULL,
    msg_data_envio DATE NOT NULL,
    msg_remetente_id INT,
    msg_destinatario_id INT,
    msg_id INT AUTO_INCREMENT,
    PRIMARY KEY(msg_id)
);

CREATE TABLE conteudos (    
    conte_nome VARCHAR(100) NOT NULL,
    conte_ordem INT NOT NULL,
    conte_icone VARCHAR(255) NOT NULL,
    conte_id INT AUTO_INCREMENT,
    categ_id INT,
    PRIMARY KEY(conte_id)
);

CREATE TABLE categorias(
    categ_nome VARCHAR(100) NOT NULL,
    categ_id INT AUTO_INCREMENT,
    PRIMARY KEY(categ_id)
);

CREATE TABLE perguntas (
    perg_titulo VARCHAR(100) NOT NULL,
    perg_descricao LONGTEXT NOT NULL,
    usu_id INT,
    categ_id INT,
    perg_id INT AUTO_INCREMENT,
    PRIMARY KEY (perg_id)
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
ALTER TABLE conteudos ADD CONSTRAINT fk_conteudos_categorias FOREIGN KEY (categ_id) REFERENCES categorias(categ_id);
ALTER TABLE mensagens ADD CONSTRAINT fk_mensagens_remetente FOREIGN KEY (msg_remetente_id) REFERENCES usuarios(usu_id);
ALTER TABLE mensagens ADD CONSTRAINT fk_mensagens_destinatario FOREIGN KEY (msg_destinatario_id) REFERENCES usuarios(usu_id);
ALTER TABLE respostas ADD CONSTRAINT fk_respostas_perguntas FOREIGN KEY (perg_id) REFERENCES perguntas(perg_id);
ALTER TABLE respostas ADD CONSTRAINT fk_respostas_usuarios FOREIGN KEY (usu_id) REFERENCES usuarios(usu_id);

INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ("Victor", "victor@kashima.com", "123123", "ADMIN");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ("Matheus", "theu.morandi@gmail.com", "321321", "ADMIN");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ("Jefferson", "jerso@gmail.com", "333222111", "ADMIN");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ("Giovanni", "giovann@jacto.com", "112233", "ADMIN");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Trescha', 'tfagan1a@tumblr.com', 'V039knydbQ', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Zeb', 'zbownas1b@blogger.com', 'EpoQPkjioOBg', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Carmencita', 'cattwill1c@gravatar.com', 'YrAhLnI', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Shepard', 'sdallimore1d@pen.io', '4jCv3C', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('Bastien', 'bsimmon1e@wp.com', 'lQ5Yjpi8BW', "USUARIO");
INSERT INTO usuarios (usu_nome, usu_email, usu_senha, usu_nivel_acesso) VALUES ('NUMAN', 'sstickney2r@simbiose.com', 'zOyTtKJHk', "USUARIO");

INSERT INTO perfil (perfil_biografia, perfil_data_nascimento, usu_id) VALUES ('19 anos e cursando 3° termo de Big Data no Agronegócio na Fatec Shunji Nishimura de Pompeia', '2004-04-19', 1);

INSERT INTO mensagens (msg_mensagem, msg_data_envio, msg_remetente_id, msg_destinatario_id)
VALUES
    ('Olá, como você está?', '2023-05-19', 1, 2),
    ('Estou bem, e você?', '2023-05-19', 2, 1),
    ('Também estou bem, obrigado.', '2023-05-19', 1, 2),
    ('Que bom! O que está fazendo?', '2023-05-19', 2, 1),
    ('Estou estudando para uma prova.', '2023-05-19', 1, 2),
    ('Boa sorte! Você vai se sair bem.', '2023-05-19', 2, 1),
    ('Obrigado!', '2023-05-19', 1, 2),
    ('De nada. Se precisar de ajuda, me avise.', '2023-05-19', 2, 1),
    ('Pode deixar. Obrigado novamente.', '2023-05-19', 1, 2),
    ('Estou sempre aqui para ajudar.', '2023-05-19', 2, 1);

INSERT INTO conteudos (conte_nome, conte_ordem, conte_icone, categ_id) VALUES ('Linux', 1, 'icone-linux.png', 1);
INSERT INTO conteudos (conte_nome, conte_ordem, conte_icone, categ_id) VALUES ('Windows', 2, 'icone-windows.png', 2);
INSERT INTO conteudos (conte_nome, conte_ordem, conte_icone, categ_id) VALUES ('Programação', 3, 'icone-programacao.png', 3);
INSERT INTO conteudos (conte_nome, conte_ordem, conte_icone, categ_id) VALUES ('Hardware', 4, 'icone-hardware.png', 4);
INSERT INTO conteudos (conte_nome, conte_ordem, conte_icone, categ_id) VALUES ('Metodologia Ágil', 5, 'icone-metodologia-agil.png', 5);
INSERT INTO conteudos (conte_nome, conte_ordem, conte_icone, categ_id) VALUES ('Mobile', 6, 'icone-mobile.png', 6);

INSERT INTO categorias (categ_nome)
VALUES
    ('Kernel do Linux'),
    ('Distribuições Linux'),
    ('Administração de Servidores Linux'),
    ('Programação em Shell Script'),
    ('Segurança em Sistemas Linux');
INSERT INTO categorias (categ_nome)
VALUES
    ('Introdução ao Windows Server'),
    ('Administração de Redes no Windows'),
    ('Desenvolvimento de Aplicações .NET'),
    ('Virtualização com Hyper-V'),
    ('Segurança em Ambiente Windows');

INSERT INTO perguntas (perg_titulo, perg_descricao, usu_id, categ_id)
VALUES
    ('Como instalar uma distribuição Linux?', 'Estou interessado em instalar uma distribuição Linux em meu computador. Alguém pode me explicar o processo passo a passo?', 1, 1),
    ('Qual é a melhor distribuição Linux para iniciantes?', 'Gostaria de começar a utilizar o Linux, mas não sei qual distribuição escolher. Alguém pode me recomendar uma opção amigável para iniciantes?', 2, 2),
    ('Como atualizar o kernel do Linux?', 'Gostaria de saber como posso atualizar o kernel do Linux em meu sistema. Existe algum procedimento específico a ser seguido?', 3, 3),
    ('Quais são os principais comandos do terminal no Linux?', 'Estou começando a utilizar o terminal no Linux e gostaria de conhecer os comandos básicos. Alguém pode me fornecer uma lista?', 4, 4),
    ('Como instalar e configurar o servidor Apache no Linux?', 'Preciso configurar um servidor web no Linux utilizando o Apache. Alguém pode me explicar o processo de instalação e configuração?', 1, 5),
    ('Quais são os principais editores de texto no Linux?', 'Estou procurando um bom editor de texto para usar no Linux. Alguém pode me recomendar algumas opções populares?', 2, 6),
    ('Como instalar e usar o Docker no Linux?', 'Gostaria de aprender a utilizar o Docker para criar e gerenciar contêineres no Linux. Alguém pode me fornecer um guia passo a passo?', 3, 7),
    ('Qual é a diferença entre o sistema de arquivos Ext4 e XFS no Linux?', 'Estou planejando formatar um disco no Linux e gostaria de saber qual sistema de arquivos escolher entre o Ext4 e o XFS. Alguém pode me explicar as diferenças?', 4, 8),
    ('Como montar uma partição NTFS no Linux?', 'Tenho uma partição NTFS em um disco externo e gostaria de montá-la no Linux para acessar os arquivos. Qual é o procedimento correto?', 1, 9),
    ('Quais são as melhores práticas de segurança no Linux?', 'Estou preocupado com a segurança do meu sistema Linux. Quais são as melhores práticas para proteger o sistema contra ameaças?', 2, 10);

INSERT INTO respostas (resp_data, perg_id, usu_id)
VALUES
    ('Para instalar uma distribuição Linux, baixe a imagem ISO, grave em um pendrive ou DVD e siga as instruções de instalação.', 1, 1),
    ('O Ubuntu é uma ótima distribuição Linux para iniciantes.', 2, 2),
    ('Para atualizar o kernel do Linux, utilize o gerenciador de pacotes da sua distribuição, como o "apt" no Ubuntu.', 3, 3),
    ('Alguns comandos básicos do terminal Linux são: ls, cd, mkdir, rm, cat, grep e sudo.', 4, 4),
    ('Para instalar e configurar o servidor Apache no Linux, instale o pacote e faça as configurações necessárias no arquivo de configuração.', 5, 1),
    ('Alguns editores de texto populares no Linux são: nano, vim, emacs e Sublime Text.', 6, 2),
    ('Para usar o Docker no Linux, instale-o e siga as instruções de uso fornecidas pela documentação oficial.', 7, 3),
    ('O Ext4 é um sistema de arquivos mais comum e o XFS é conhecido por sua escalabilidade e desempenho.', 8, 4),
    ('Para montar uma partição NTFS no Linux, use o comando "mount" especificando o dispositivo e o ponto de montagem.', 9, 1),
    ('Algumas melhores práticas de segurança no Linux incluem manter o sistema atualizado, usar senhas fortes e configurar corretamente as permissões de arquivos e diretórios.', 10, 2);

