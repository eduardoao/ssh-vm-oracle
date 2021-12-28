# FROM resin/armv7hf-debian as BUILDER
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


FROM arm64v8/node

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

EXPOSE 8080
CMD [ "node", "server.js" ]
