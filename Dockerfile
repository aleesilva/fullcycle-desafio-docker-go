FROM golang:latest as build

WORKDIR /usr/go/app


COPY . .

RUN go mod init github.com/aleesilva17/fullcycle-desafio-docker-go
RUN go build -a -o main .
RUN chmod +x main


FROM scratch

COPY --from=build /usr/go/app/main .


CMD [ "./main" ]
