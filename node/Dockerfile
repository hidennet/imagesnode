FROM node:14

# Set working directory
WORKDIR /home/container

# Copy the contents of the node folder to /home/container in the Docker image
COPY node /home/container

# Set the correct permissions for entrypoint.sh
RUN chmod +x /home/container/entrypoint.sh

# Run entrypoint.sh when the container launches
ENTRYPOINT ["/home/container/entrypoint.sh"]
