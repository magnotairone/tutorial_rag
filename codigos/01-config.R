# Sys.setenv(`OPENAI_API_KEY`= "COLE SUA CHAVE AQUI")
# Sys.setenv(`PINECONE_API_KEY`= "COLE SUA CHAVE AQUI")
# Sys.setenv(`MARITACAAI_API_KEY`= "COLE SUA CHAVE AQUI") # opcional

reticulate::use_python("C:/Users/m_tai/anaconda3/python.exe")
Sys.setenv(WORKON_HOME = "C:/Users/m_tai/.virtualenvs")

library(reticulate)

reticulate::virtualenv_create(envname = "rag",
                              packages = c(
                                "langchain",
                                "langchain-community",
                                "pypdf",
                                "pinecone",
                                "langchain-pinecone",
                                "pinecone-notebooks",
                                "langchain-openai",
                                "pinecone-client"
                              )
)

reticulate::use_virtualenv("rag")

reticulate::py_run_string('
print("Estou programando em python dentro do R!") 
')

chave_api_openai <- Sys.getenv("OPENAI_API_KEY")
chave_api_pinecone <- Sys.getenv("PINECONE_API_KEY")
chave_api_maritaca <- Sys.getenv("MARITACAAI_API_KEY") # opcional

caminho_pasta = "codigos/docs"
if(!(dir.exists(caminho_pasta))) {
  dir.create(caminho_pasta)
}

download.file("https://cran.r-project.org/web/packages/ggplot2/ggplot2.pdf",
              destfile = paste0(caminho_pasta, "/ggplot2.pdf"), mode = "wb")
