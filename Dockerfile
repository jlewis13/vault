FROM node:8
RUN apt-get update && \
    apt-get install -y ruby ruby-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN gem install sass
WORKDIR /usr/src/app
COPY package.json ./
ENV NODE_ENV=production
COPY . .
RUN make
EXPOSE 4096
CMD ["npm", "start"]
