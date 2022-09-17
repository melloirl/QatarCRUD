CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW jogadores_com_lesões AS
    SELECT 
        jogador.Nome AS Nome,
        jogador.Posição AS Posição,
        selecao.`Nome` AS Seleção,
        estatistica.Lesao AS Lesões
    FROM
        ((jogador
        JOIN estatistica ON ((jogador.ESTATISTICA_Cod_Estatistica = estatistica.Cod_Estatistica)))
        JOIN selecao ON ((jogador.SELECAO_Cod_Selecao = selecao.Cod_Selecao)))
    WHERE
        (estatistica.Lesao IS NOT NULL)