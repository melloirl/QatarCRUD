CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `jogadores_com_faltas` AS
    SELECT 
        `jogador`.`Nome` AS `Nome`,
        `jogador`.Posição AS Posição,
        selecao.Nome AS Seleção,
        estatistica.Falta AS Faltas
    FROM
        ((jogador
        JOIN estatistica ON ((jogador.ESTATISTICA_Cod_Estatistica = estatistica.Cod_Estatistica)))
        JOIN selecao ON ((jogador.SELECAO_Cod_Selecao = selecao.Cod_Selecao)))
    WHERE
        (estatistica.Falta IS NOT NULL)