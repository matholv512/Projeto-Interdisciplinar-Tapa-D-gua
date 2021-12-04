CREATE DATABASE tapa_D_agua
USE tapa_D_agua

CREATE TABLE municipe (
codCli INT CONSTRAINT Pk_codCli PRIMARY KEY IDENTITY(1,1),
nome VARCHAR(60),
CPF VARCHAR(20),
e_mail VARCHAR(60),
telefone VARCHAR(20),
senha VARCHAR(60)
)

CREATE TABLE endereco (
codEnd INT CONSTRAINT Pk_codEnd PRIMARY KEY IDENTITY(1,1),
CEP VARCHAR(40),
cidade VARCHAR(70),
rua VARCHAR(120),
bairro VARCHAR(100),
ponto_referencia VARCHAR(80),
numero INT
)

CREATE TABLE denuncia (
codDen INT CONSTRAINT Pk_codDen PRIMARY KEY IDENTITY(1,1),
nro_protocolo INT,
statusDen VARCHAR(60),
dt_denuncia DATETIME,
observacao VARCHAR(100)
)

CREATE TABLE empresa_responsavel (
codEmp INT CONSTRAINT Pk_codEmp PRIMARY KEY IDENTITY(1,1),
razaoSocial VARCHAR(100),
CNPJ VARCHAR(60),
descricao VARCHAR(100)
)

CREATE TABLE funcionario (
codFun INT CONSTRAINT Pk_codFun PRIMARY KEY IDENTITY(1,1),
nome VARCHAR(60),
cargo VARCHAR(60)
)

CREATE TABLE averiguacao (
codAve INT CONSTRAINT Pk_codAve PRIMARY KEY IDENTITY(1,1),
statusAve VARCHAR(60),
dt_averiguacao DATETIME,
observacao VARCHAR(100)
)

CREATE TABLE reparo (
codRep INT CONSTRAINT Pk_codRep PRIMARY KEY IDENTITY(1,1),
statusRep VARCHAR(60),
dt_reparo DATETIME,
observacao VARCHAR(100)
)


--usuario e endereço
CREATE TABLE lig_Mun_End (
codCli INT CONSTRAINT FK_codCli_codEnd FOREIGN KEY REFERENCES municipe(codCli),
codEnd INT CONSTRAINT FK_lig_codEnd_codCli FOREIGN KEY REFERENCES endereco(codEnd)
)

--endereço e denúncia
CREATE TABLE lig_End_Den (
codDen INT CONSTRAINT FK_codDen_codEnd FOREIGN KEY REFERENCES denuncia(codDen),
codEnd INT CONSTRAINT FK_codEnd_codDen FOREIGN KEY REFERENCES endereco(codEnd)
)

--denúncia e empresa_responsável
CREATE TABLE lig_Den_Emp (
codDen INT CONSTRAINT FK_codDen_codEmp FOREIGN KEY REFERENCES denuncia(codDen),
codEmp INT CONSTRAINT FK_codEmp_codDen FOREIGN KEY REFERENCES empresa_responsavel(codEmp)
)

--empresa_responsável e funcionario
CREATE TABLE lig_Emp_Func (
codFun INT CONSTRAINT FK_codFun_codEmp FOREIGN KEY REFERENCES funcionario(codFun),
codEmp INT CONSTRAINT FK_codEmp_codFun FOREIGN KEY REFERENCES empresa_responsavel(codEmp)
)

--empresa_responsável e averiguação
CREATE TABLE lig_Emp_ave (
codAve INT CONSTRAINT FK_codAve_codEmp FOREIGN KEY REFERENCES averiguacao(codAve),
codEmp INT CONSTRAINT FK_codEmp_codAve FOREIGN KEY REFERENCES empresa_responsavel(codEmp)
)

--averiguação e reparo
CREATE TABLE lig_ave_rep (
codAve INT CONSTRAINT FK_codAve_codEmp FOREIGN KEY REFERENCES averiguacao(codAve),
codRep INT CONSTRAINT FK_codEmp_codAve FOREIGN KEY REFERENCES reparo(codRep)
)