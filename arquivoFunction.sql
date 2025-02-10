--Criação da tabela Cliente para realizar os teste necessários
CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
  	sobrenome VARCHAR(50),
    data_cadastro DATE DEFAULT CURRENT_TIMESTAMP
);


--Inserts para teste da função
INSERT INTO clientes (nome, sobrenome, data_cadastro) VALUES
('João', 'Silva', '2025-02-10'),
('Maria', 'Oliveira', '2025-02-10'),
('Carlos', 'Souza', '2025-02-10'),
('Ana', 'Santos', '2025-02-09'),
('Pedro', 'Lima', '2025-02-08');



--Select para confirmar se deu tudo certo
SELECT * FROM clientes;


-- Criação da função
CREATE OR REPLACE FUNCTION contar_clientes_por_dia(data_consulta DATE)
RETURNS INTEGER AS $$
DECLARE
    total_clientes INTEGER;
BEGIN
    SELECT COUNT(*) INTO total_clientes
    FROM clientes
    WHERE DATE(data_cadastro) = data_consulta;

    RETURN total_clientes;
END;
$$ LANGUAGE plpgsql;



-- Verificar se a função está certa
SELECT contar_clientes_por_dia('2025-02-10');


