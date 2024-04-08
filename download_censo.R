library(censobr)

download_censo <- function(caminho, anos) {
  # Define o diretório de cache
  base::dir.create(path = caminho)
  censobr::set_censobr_cache_dir(path = caminho)
  
  # Itera sobre os anos fornecidos
  for (ano in anos) {
    censobr::read_population(year = ano)
    censobr::read_households(year = ano)
  }
}

caminho <- "arquivos_censo"
anos <- c(1970, 1980, 1991, 2000, 2010)
download_censo(caminho, anos)
