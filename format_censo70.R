library(arrow)
library(dplyr)

nomes_antigos <- paste0("V", formatC(seq(1, 54), width = 3, flag = "0"))
nomes_novos <- c("codigo_microrregiao",
                 "codigo_municipio",
                 "codigo_distrito",
                 "codigo_situacao_domicilio",
                 "total_pessoas",
                 "condicao_familia",
                 "especie_domicilio",
                 "tipo_domicilio",
                 "condicao_ocupacao",
                 "aluguel_mensal",
                 "tempo_de_residencia",
                 "forma_abastecimento_agua",
                 "tipo_instalacao_sanitaria",
                 "possui_iluminacao_eletrica",
                 "fogao",
                 "radio",
                 "geladeira",
                 "televisao",
                 "automovel",
                 "total_comodos",
                 "numero_dormitorios",
                 "codigo_informate",
                 "sexo",
                 "condicao_presenca",
                 "relacao_com_chefe_familia",
                 "tipo_idade",
                 "idade_em_meses_ou_anos",
                 "religiao",
                 "nacionalidade",
                 "naturalidade",
                 "tempo_residencia_uf",
                 "tempo_residencia_municipio",
                 "uf_residia_antes",
                 "situacao_da_residencia_antes",
                 "alfabetizacao",
                 "frequenta_escola",
                 "ultima_serie_concluidada",
                 "ultimo_grau_concluido",
                 "especie_curso_concluido",
                 "estado_conjugal",
                 "rendimento_medio_mensal",
                 "municipio_trabalho_estuda",
                 "situacao_emprego",
                 "ocupacao_pricipal",
                 "classificacao_atividade",
                 "posicao_ocupacao",
                 "ocupacao_exercia",
                 "horas_trabalhadas",
                 "tempo_procura_emprego",
                 "filhos_nascidos_vivos",
                 "filhos_nascidos_mortos",
                 "filhos_nascidos_ano_anterior",
                 "filhos_nascidos_vivos_e_continuam_vivos",
                 "peso_pessoa")

dicionario_nomes <- stats::setNames(object = nomes_antigos, nm = nomes_novos)
censo <- arrow::read_parquet("arquivos_censo/1970_population_v0.3.0.parquet")

censo <- censo %>%
  dplyr::rename(dplyr::any_of(dicionario_nomes))

arrow::write_parquet(censo, "arquivos_censo/1970__population_renomeado.parquet")

