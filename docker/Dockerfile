FROM golang
MAINTAINER Alexander F Rødseth <xyproto@archlinux.org>

# Install the tsc executable (TypeScript to JavaScript compiler)
RUN apt-get update && \
    apt-get install -y node-typescript && \
    apt-get clean

# Clone the ts_in_go repo within the Docker container
RUN git clone https://github.com/xyproto/ts_in_go

# Install missing dependencies
RUN cd ts_in_go/src && go get -d -v

# Install the go-bindata executable
RUN go get -u github.com/jteeuwen/go-bindata/...

# Set the working directory
WORKDIR ts_in_go

# Mount the /src folder
VOLUME ["/src"]

ENTRYPOINT ["make"]
CMD ["SOURCE_DIR=/src", "OUTPUT_FILE=main"]