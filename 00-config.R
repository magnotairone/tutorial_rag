# Sys.setenv(`OPENAI_API_KEY`= "COLE SUA CHAVE AQUI")
# Sys.setenv(`PINECONE_API_KEY`= "COLE SUA CHAVE AQUI")

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
                                "langchain-openai"
                              )
)


# reticulate::virtualenv_remove(envname = "rag", packages = "pinecone-client")
# reticulate::virtualenv_install("rag", packages = c("pinecone-plugin-inference>=2.0.0,<4.0.0"))
reticulate::virtualenv_install("rag", packages = c("langchain-pinecone",
                                                   "pinecone-notebooks"))

reticulate::virtualenv_install("rag", packages = c("langchain", 
                                                   "langchain-pinecone", 
                                                   "pinecone-client"), 
                               ignore_installed = TRUE)

reticulate::use_virtualenv("rag")


reticulate::py_run_string('
print("Estou programando em python dentro do R!") 
')

chave_api_openai <- Sys.getenv("OPENAI_API_KEY")
chave_api_pinecone <- Sys.getenv("PINECONE_API_KEY")
chave_api_maritaca <- Sys.getenv("MARITACAAI_API_KEY") # opcional

if(!(dir.exists("docs"))) {
  dir.create("docs")
}

download.file("https://cran.r-project.org/web/packages/ggplot2/ggplot2.pdf",
              destfile = "docs/ggplot2.pdf", mode = "wb")
