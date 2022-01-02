FROM klakegg/hugo:ext-alpine

RUN apk --no-cache add ca-certificates
WORKDIR /src

COPY . .

RUN npm i && hugo -D --gc