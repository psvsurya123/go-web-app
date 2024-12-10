FROM golang:1.22.5 AS base
<<<<<<< HEAD
WORKDIR /app
COPY go.mod .
RUN go mod download
COPY . .
RUN go build -o main .
# first stage distroless img build
FROM gcr.io/distroless/base
COPY --from=base /app/main .
COPY --from=base /app/static ./static
EXPOSE 8080
CMD [ "./main" ]



=======

WORKDIR /app

COPY go.mod .

RUN go mod download

COPY . .
RUN  go build -o main .

#final stage - distroless img
FROM gcr.io/distroless/base

COPY  --from=base /app/main .

COPY  --from=base /app/static ./static

EXPOSE 8080

CMD [ "./main" ]
>>>>>>> d486cf4640ca9c408158c22ad160a4001a235cc2
