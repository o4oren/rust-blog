FROM rust:1.42 as builder
WORKDIR /usr/src/blog-actix
COPY . .
RUN cargo install --path .
RUN cargo install diesel_cli --no-default-features --features "mysql"

FROM debian:stable-slim
WORKDIR /app
COPY --from=builder /usr/local/cargo/bin/blog-actix /usr/local/bin/blog-actix
COPY --from=builder /usr/local/cargo/bin/diesel /usr/local/bin/diesel
COPY migrations ./migrations
ENV MYSQL_HOST=mysql
ENV MYSQL_USER=dbuser
ENV MYSQL_PASSWORD=password
RUN apt-get update && apt-get install default-mysql-client -y
EXPOSE 8998
CMD ["diesel migration run && blog-actix"]

