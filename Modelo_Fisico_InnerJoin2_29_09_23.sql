-- Criar banco de dados "Mercado"
CREATE DATABASE Mercado;

-- Selecionar o banco de dados "Mercado"
USE Mercado;

-- Criar tabela de Produtos
CREATE TABLE Mercado.Produtos(
ProdutoID INT AUTO_INCREMENT,
NomeProduto VARCHAR(100) NOT NULL,
Descricao VARCHAR(255) NOT NULL,
PrecoUnitario DECIMAL(11,2) NOT NULL,
EstoqueMinimo INT NOT NULL,
PRIMARY KEY(ProdutoID)
);

-- Criar tabela de Fornecedores e adicionar uma chave estrangeira referenciando ProdutoID na tabela Produtos
CREATE TABLE Mercado.Fornecedores(
FornecedorID INT AUTO_INCREMENT,
NomeFornecedor VARCHAR(255) NOT NULL,
Endereco VARCHAR(255) NOT NULL,
Telefone VARCHAR(22) NOT NULL,
Email VARCHAR(255) NOT NULL,
Produto INT NOT NULL,
FOREIGN KEY(Produto) REFERENCES Produtos(ProdutoID),
PRIMARY KEY(FornecedorID)
);

INSERT INTO Mercado.Produtos (NomeProduto, Descricao, PrecoUnitario, EstoqueMinimo) VALUES
('Garrafa Térmica Mondial Vermelha 1l', 'Garrafa Térmica Mondial Vermelha 1l - 4 horas de eficácia ', 59.90, 100),
('Detergente Limpa+ Limão 500ml', 'Detergente Limpa+ 500ml com aroma de Limão', 3.40, 200), 
('Banana Prata', 'Banana do tipo Prata', 4.99, 300), 
('Cebola Roxa', 'Cebola do tipo Roxa', 8.99, 400), 
('Laranja-Pera', 'Laranja do tipo Pera do Himalaia', 2.69, 500);

INSERT INTO Mercado.Fornecedores (NomeFornecedor, Endereco, Telefone, Email, Produto) VALUES
('Mondial', 'Parque Industrial Magália das Rosas, KM 902, Distrito Industrial, Curitiba - PR', '(12)3457-2351', 'mondial.contato@gmail.com', 1),
('Limpa+', 'Rua Limpíssima, 200, Magistério, Rio de Janeiro - RJ', '(34)3124-5531', 'limpaMais@outlook.com', 2),
('Sérgio Barreto', 'Rua das Almas, 23, Vitória da Conquista, Salvador -BA', '(71)6312-3435', 'sergio.barreto@hotmail.com', 3),
('Datielle Souza', 'Rua dos Pacientes, 78, Cajazeiras, Feira de Santana - BA', '(71)8352-5135', 'datielle.souza@outlook.com', 4),
('Pedro Costa', 'Avenida dos Reis, 90, Liberdade, Uberlândia - MG', '(71)9552-9315', 'pedro.costa@hotmail.com', 5);

SELECT NomeProduto, NomeFornecedor FROM Mercado.Produtos
INNER JOIN Mercado.Fornecedores
ON Produtos.ProdutoID = Fornecedores.Produto;