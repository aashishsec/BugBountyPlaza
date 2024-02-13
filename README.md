# BugBountyPlaza
- It's a Docker Environment for Bug Bounties which having all the required tools.

## Overview

This tool is a Docker image that provides a pre-configured environment with various security testing tools and utilities. It is designed to streamline the setup process for security professionals and enthusiasts who need to perform various security testing tasks.

## Features

- Includes a wide range of security testing tools such as BBHTv2, reconftw, waymore, and API Security Testing Tools.
- Utilizes Docker to provide a consistent and isolated environment across different systems.
- Automates the installation process, reducing setup time and complexity.

## Requirements

- Docker: The tool requires Docker to be installed on your system.
- You can download and install Docker from the official website: [Docker](https://www.docker.com/)

## Installation

### From Github

1. Clone the repository containing the Dockerfile:
   ```
   git clone https://github.com/aashishsec/BugBountyPlaza.git
   ```

2. Navigate to the directory containing the Dockerfile:
   ```
   cd BugBountyPlaza
   ```

3. Build the Docker image using the provided Dockerfile:
   ```
   docker build -t bugbountyplaza .
   ```

### From Docker Hub

- You can pull the Docker image directly from the Docker Hub repository:

```sh
docker pull aashish1947/bugbountyplaza
```

## Usage

Once the Docker image is built, you can run containers based on it to access the installed security testing tools. Here's how you can run a container:

```
docker run -it BugBountyPlaza
```

This command will start a container based on the Docker image interactively, allowing you to access the command line within the container.

## Included Tools

The Docker image includes the following security testing tools:

- BBHTv2
- reconftw
- waymore
- API Security Testing Tools (APITools.sh)

## Contributing

If you would like to contribute to the development of this tool, feel free to submit pull requests or open issues on the GitHub repository.

## License

This tool is distributed under the [MIT License](LICENSE).

---
