FROM node:16

# Folder to work
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./
RUN npm install

COPY src ./src

#Mult Strategy Builder
#Softy version
FROM node:16

ARG NODE_ENV

WORKDIR /usr/src/app
# from previous stage(BUILDER)
COPY --from=BUILDER . ./

EXPOSE 3000

CMD [ "npm", "start" ]

# docker build . -t teste
#docker run --name nodejs-app-demo -it -d -p 8080:8080 teste
# Mais q merda
