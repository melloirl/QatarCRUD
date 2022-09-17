CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW jogadores_com_cartão_vermelho AS
    SELECT 
        jogador.Nome AS Nome,
        jogador.Posição AS Posição,
        selecao.`Nome` AS Seleção,
        estatistica.Vermelho AS Cartões_Vermelhos
    FROM
        ((jogador
        JOIN estatistica ON ((jogador.ESTATISTICA_Cod_Estatistica = estatistica.Cod_Estatistica)))
        JOIN selecao ON ((jogador.SELECAO_Cod_Selecao = selecao.Cod_Selecao)))
    WHERE
        (estatistica.Vermelho IS NOT NULL)