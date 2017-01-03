FROM node

WORKDIR /app
COPY . /app
RUN npm install && npm run build

WORKDIR /app/example
RUN npm install

EXPOSE 8080

ENV GRAPHQL_URL /graphql

CMD sh -c 'sed -i "s;/graphql;$GRAPHQL_URL;" index.html && npm start'
