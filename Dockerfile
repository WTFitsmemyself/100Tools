FROM alpine:3.13
RUN apk add htop cmatrix vim bash zsh 
RUN mkdir app
COPY auto.sh /app 
WORKDIR /app 
CMD zsh auto.sh