FROM node:10.15.1-alpine
LABEL author="MAK"


# set working directory
RUN mkdir /usr/share/app
WORKDIR /usr/share/app

# install and cache app dependencies
RUN npm i -g @angular/cli@8.0.3
COPY package.json package.json
COPY package-lock.json package-lock.json
RUN npm i --silent


# add the app
COPY . ./

RUN ng serve --host=0.0.0.0 --port 8000 --disable-host-check
