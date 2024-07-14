# Use a Node.js base image
FROM node:14

# Set the working directory
WORKDIR /home/container

# Copy the local files to the container
COPY . .

# Install dependencies
RUN npm install

# Run the application
CMD ["./entrypoint.sh"]
