-- ----------------------------------------------
CREATE TABLE ESTADOS (							#		
	idEstado INTEGER,							#		
	nomeEstado VARCHAR(20) NOT NULL,			#
	UF CHAR(2) CHECK(UF IN('SP','RJ','MG')),	#
	PRIMARY KEY(idEstado)						#
);												#
-- OK--OK--OK--OK--OK--OK--OK--OK--OK--OK--OK--OK
CREATE TABLE CIDADES (
	idCidade INTEGER,
	nomeCidade VARCHAR(30) NOT NULL,
	idEstado INTEGER,-- chave estrangeira
	PRIMARY KEY(idCidade),
	FOREIGN KEY(idEstado)
	REFERENCES ESTADOS(idEstado)
);
-- OK--OK--OK--OK--OK--OK--OK--OK--OK--OK--OK--OK
CREATE TABLE CLIENTES (
	CPF CHAR(11),
	nome VARCHAR(60) NOT NULL,
	sexo CHAR(1) CHECK(SEXO IN('M','F')) NOT NULL,
	nomeMae VARCHAR(60),
	CTPS CHAR(4) NOT NULL, -- usamos apenas os 4 digitos da série
	RG CHAR(9) UNIQUE NOT NULL,
	dataNascimento DATE NOT NULL,
	telefone VARCHAR(11) NOT NULL,
	email VARCHAR(60),
	endereco VARCHAR(100) NOT NULL,
	bairro VARCHAR(100) NOT NULL,
	cep CHAR(8) NOT NULL,
	idCidade INTEGER,-- chave estrangeira
	nomeEmpresa VARCHAR(60) NOT NULL,
	cargo VARCHAR(40) NOT NULL,
	PRIMARY KEY(CPF),
	FOREIGN KEY(idCidade)
	REFERENCES CIDADES(idCidade)
);
-- OK--OK--OK--OK--OK--OK--OK--OK--OK--OK--OK--OK
CREATE TABLE ADVOGADOS (
	OAB CHAR(6),
	nomeADV VARCHAR(30) NOT NULL,
	cpfADV CHAR(11) UNIQUE NOT NULL,
	emailADV VARCHAR(40) UNIQUE NOT NULL,
	PRIMARY KEY (OAB)
);
-- OK--OK--OK--OK--OK--OK--OK--OK--OK--OK--OK--OK
CREATE TABLE TIPOSACOES (
	idAcao INTEGER,
	tipoAcao VARCHAR(40) NOT NULL,
	descricaoAcao VARCHAR(120),
	PRIMARY KEY(idAcao)
);
-- OK--OK--OK--OK--OK--OK--OK--OK--OK--OK--OK--OK
CREATE TABLE PROCESSOS (
	numProcesso CHAR(20),
	vara CHAR(2),
	dataProcesso DATE,
	idAcao INTEGER, -- chave estrangeira
	OAB CHAR(6), -- chave estrangeira
	PRIMARY KEY(numProcesso),
	FOREIGN KEY(idAcao)
	REFERENCES TIPOSACOES(idACao),
	FOREIGN KEY(OAB)
	REFERENCES ADVOGADOS(OAB)
);
-- OK--OK--OK--OK--OK--OK--OK--OK--OK--OK--OK--OK
CREATE TABLE PASTAS( -- Junção das tabelas CLIENTES_PROCESSOS
	CPF CHAR(11) NOT NULL,
	numProcesso CHAR(20) NOT NULL,
	PRIMARY KEY(CPF, numProcesso),
	FOREIGN KEY(CPF)
	REFERENCES CLIENTES(CPF),
	FOREIGN KEY(numProcesso)
	REFERENCES PROCESSOS(numProcesso)	
);
-- OK--OK--OK--OK--OK--OK--OK--OK--OK--OK--OK--OK