## Comando obrigatório
## Baixa a imagem do node com versão alpine (versão mais simplificada e leve)
FROM node:alpine

## Define o local onde o app vai ficar no disco do container
## Pode ser o diretório que você quiser
WORKDIR /usr/app

## Copia tudo que começa com package e termina com .json para dentro da pasta /usr/app
COPY package*.json ./

## Executa npm install para adicionar as dependências e criar a pasta node_modules
RUN npm install

## Copia tudo que está no diretório onde o arquivo Dockerfile está 
## para dentro da pasta /usr/app do container
## Vamos ignorar a node_modules por isso criaremos um .dockerignore
COPY . .

## Container ficará ouvindo os acessos na porta 3000
EXPOSE 3000

## Não se repete no Dockerfile
## Executa o comando npm start para iniciar o script que que está no package.json
CMD npm start

# FROM #resin/armv7hf-debian as BUILDER
# #node:16

# # Folder to work
# WORKDIR /usr/src/app

# # Install app dependencies
# COPY package*.json ./
# RUN npm install

# COPY . ./src

# #Mult Strategy Builder
# #Softy version
# FROM resin/armv7hf-debian
# #node:16

# ARG NODE_ENV

# WORKDIR /usr/src/app
# # from previous stage(BUILDER)
# COPY --from=BUILDER . ./

# EXPOSE 3000

# CMD [ "npm", "start" ]

# docker build . -t teste
#docker run --name nodejs-app-demo -it -d -p 8080:8080 teste
# Mais q merda


# FROM node:16
# #arm64v8/node

# # Create app directory
# WORKDIR /usr/src/app

# # Install app dependencies
# # A wildcard is used to ensure both package.json AND package-lock.json are copied
# # where available (npm@5+)
# COPY package*.json ./

# RUN npm install
# # If you are building your code for production
# # RUN npm ci --only=production

# # Bundle app source
# COPY . .

# EXPOSE 8080
# CMD [ "node", "server.js" ]
