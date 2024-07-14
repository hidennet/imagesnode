FROM node:14

# Set working directory
WORKDIR /home/container

# Copy the contents of the node folder to /home/container in the Docker image
COPY node /home/container

# Install any needed packages specified in package.json if it exists
RUN if [ -f /home/container/package.json ]; then npm install; fi

# Make entrypoint.sh executable
RUN chmod +x /home/container/entrypoint.sh

# Run entrypoint.sh when the container launches
ENTRYPOINT ["/home/container/entrypoint.sh"]
