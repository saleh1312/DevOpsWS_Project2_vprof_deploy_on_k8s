FROM centos

# Set the working directory
WORKDIR /app

# Copy the Bash script into the container
COPY . /app/

# Give execution permissions to the script
RUN chmod +x /app/main.sh

# Run the script when the container starts
RUN /app/main.sh