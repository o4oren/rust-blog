# Blog Actix

### About
Blog backend from the rust fullstack book.
Modified and extended to try out rust web / db concepts.

### Changes from the book version
* mysql db

### Build
cargo build --release

### run migrations
diesel migration run

### Dockerization
Build in the rust container, as it has cargo and all required dependencies.
Run on debian slim as alpine failes to run the binary to see how concise and specific the build can be.
Resulting image is just 100 Mb.

### Database
To run mysql in a separate container: 
docker run --name mysql -e MYSQL_ROOT_PASSWORD=password -e MYSQL_DATABASE=blog -e MYSQL_USER=dbuser -e MYSQL_PASSWORD=password -p 3306:3306 -d mysql:5.7.29
Need to grant privileges to connect externally:
eg. GRANT ALL PRIVILEGES ON blog.* TO 'dbuser'@'%' IDENTIFIED BY 'password';
