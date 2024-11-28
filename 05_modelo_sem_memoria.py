# --- teste inicial: chat sem contexto ---
from langchain.chains import RetrievalQA  
from langchain_openai import ChatOpenAI  
from langchain_openai import OpenAIEmbeddings
from langchain_pinecone import PineconeVectorStore

llm = ChatOpenAI(  
    openai_api_key = os.environ["OPENAI_API_KEY"],  
    model_name = "gpt-4o-mini",  
    temperature = 0 
)  

nome_indice = "rag-ggplot"
embeddings = OpenAIEmbeddings(model="text-embedding-ada-002")
base_conhecimento = PineconeVectorStore.from_existing_index(
    index_name = nome_indice,
    embedding = embeddings
)

qa = RetrievalQA.from_chain_type(  
    llm = llm,  
    chain_type = "stuff",  
    retriever = base_conhecimento.as_retriever()  
)

pergunta = "Em um gráfico ggplot, como rotacionar o texto no eixo x?"
resposta = qa.invoke(pergunta) 
resposta["result"]

pergunta = "Como fazer grafico de linha no ggplot?"
resposta = qa.invoke(pergunta) 
resposta["result"]
