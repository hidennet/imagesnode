FROM node:14

# Set working directory
WORKDIR /home/container

# Copy the current directory contents into the container at /home/container
COPY . .

# Install any needed packages specified in package.json
RUN npm install

# Make entrypoint.sh executable
RUN chmod +x /entrypoint.sh

# Run entrypoint.sh when the container launches
ENTRYPOINT ["/entrypoint.sh"]
