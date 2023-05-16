# Use the latest version of Alpine Linux as the base image
FROM alpine:latest

# Install necessary packages
RUN apk update && \
    apk add neovim git curl python3 python3-dev py3-pip go nodejs npm

# Set up Go environment
ENV GOPATH=/go
ENV PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

RUN go install github.com/go-delve/delve/cmd/dlv@latest

# Install Packer
RUN mkdir -p ~/.local/share/nvim/site/pack/packer/start && \
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Copy the customized init.lua file
COPY ./nvim /root/.config/nvim

# Set the working directory to the user's home directory
WORKDIR /root

# Start NeoVim and install plugins using Packer
ENTRYPOINT ["nvim", "+PackerSync"]
