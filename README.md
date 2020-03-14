# Blog Actix

### About
Blog backend from the rust fullstack book.
Modified and extended to try out rust web / db concepts.

### Build
cargo build --release

### run migrations
diesel migration run

### Dockerization
Build in the rust container, as it has cargo and all required dependencies.
Run on debian slim as alpine failes to run the binary to see how concise and specific the build can be.
Resulting image is just 100 Mb.