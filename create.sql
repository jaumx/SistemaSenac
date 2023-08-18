CREATE TABLE t_cliente (
    cd_cliente INT NOT NULL,
    nm_cliente VARCHAR(100) NOT NULL,
    ds_cpf_cliente VARCHAR(20) NOT NULL,
    ds_email_cliente VARCHAR(100) NOT NULL,
    ds_sexo_cliente CHAR(1) NOT NULL,
    ds_endereco_cliente VARCHAR(100) NOT NULL,
    PRIMARY KEY (cd_cliente)
);

CREATE TABLE t_compra (
    cd_compra INT NOT NULL,
    t_funcionario_cd_funcionario INT NOT NULL,
    t_cliente_cd_cliente INT NOT NULL,
    dt_hora_compra DATETIME NOT NULL,
    ob_observacao VARCHAR(100),
    vl_desconto DECIMAL(8, 2),
    vl_frete DECIMAL(8, 2),
    PRIMARY KEY (cd_compra),
    FOREIGN KEY (t_funcionario_cd_funcionario) REFERENCES t_funcionario(cd_funcionario),
    FOREIGN KEY (t_cliente_cd_cliente) REFERENCES t_cliente(cd_cliente)
);

CREATE TABLE t_funcionario (
    cd_funcionario INT NOT NULL,
    nm_funcionario VARCHAR(100) NOT NULL,
    ds_cargo_funcionario VARCHAR(100) NOT NULL,
    ds_cpf_funcionario VARCHAR(14) NOT NULL,
    ds_rg_funcionario VARCHAR(20) NOT NULL,
    dt_nascimento DATE NOT NULL,
    dt_cadastro DATE NOT NULL,
    sg_genero_funcionario CHAR(1) NOT NULL,
    PRIMARY KEY (cd_funcionario)
);

CREATE TABLE t_produto (
    cd_produto INT NOT NULL,
    nm_produto VARCHAR(100) NOT NULL,
    ds_produto VARCHAR(300) NOT NULL,
    vl_preco DECIMAL(9, 2) NOT NULL,
    ds_ativo CHAR(1) NOT NULL,
    ds_fabricante VARCHAR(100) NOT NULL,
    ds_grupo VARCHAR(100) NOT NULL,
    nr_estoque INT NOT NULL,
    PRIMARY KEY (cd_produto)
);

CREATE TABLE t_produto_vendido (
    t_produto_cd_produto INT NOT NULL,
    t_compra_cd_compra INT NOT NULL,
    ds_quantidade INT,
    PRIMARY KEY (t_compra_cd_compra, t_produto_cd_produto),
    FOREIGN KEY (t_compra_cd_compra) REFERENCES t_compra(cd_compra),
    FOREIGN KEY (t_produto_cd_produto) REFERENCES t_produto(cd_produto)
);
