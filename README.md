# Basic Learning Website

This project was created to gain a better understanding of tools like **Jenkins**, **Docker**, **Minikube**, and **Git** for learning purposes. It includes essential files to practice and explore deployment concepts.

## Project Structure

- **index.html:** Simple HTML file with embedded video tutorials for learning.
- **Dockerfile:** Used to containerize the application.
- **Jenkinsfile:** Automates CI/CD pipeline setup using Jenkins.
- **deploy.sh:** Script to deploy the application using Minikube.
- **build.sh:** Script to build the Docker image.

## Features

- **Video Tutorials:** Access embedded videos related to Jenkins, Docker, Minikube, and Git.
- **Hands-on Learning:** Practice deployment using Docker, Minikube, and Jenkins.
- **Automation:** Explore CI/CD using Jenkins pipelines.

## Tech Stack

- **Frontend:** HTML, CSS
- **Containerization:** Docker
- **Orchestration:** Minikube
- **CI/CD:** Jenkins
- **Version Control:** Git

## Installation

1. Clone the repository:
    ```bash
    git clone https://github.com/your-username/basic-learning-website.git
    cd basic-learning-website
    ```

2. Open the `index.html` file in your browser for video tutorials:
    ```bash
    open index.html
    ```
    OR
    ```bash
    start index.html  # On Windows
    ```

## Deployment (Optional)

- Build and deploy using Docker and Minikube:
    ```bash
    ./build.sh
    ./deploy.sh
    ```
- Automate the pipeline using Jenkins with the provided Jenkinsfile.

## Jenkins Setup

### Step 1: Install and Start Jenkins
1. Install Jenkins from the official guide: [Jenkins Installation Guide](https://www.jenkins.io/doc/book/installing/).
2. Start Jenkins:
    ```bash
    sudo systemctl start jenkins
    sudo systemctl enable jenkins
    ```
3. Access Jenkins UI:
    ```
    http://localhost:8080
    ```
4. Login using the administrator password from:
    ```bash
    cat /var/lib/jenkins/secrets/initialAdminPassword
    ```

### Step 2: Create a New Project
1. Click on **New Item** → **Freestyle Project**.
2. Enter the project name and click **OK**.
3. Go to **Source Code Management** → Select **Git**.
4. Enter your GitHub repository URL.
5. Configure **Build Triggers** using **Poll SCM**.

### Step 3: Add Build Steps
1. Go to **Build** → **Add Build Step** → **Execute Shell**.
2. Add the following commands:
    ```bash
    docker build -t your-dockerhub-username/project-name .
    docker tag your-dockerhub-username/project-name your-dockerhub-username/project-name:latest
    docker login -u your-dockerhub-username -p your-password
    docker push your-dockerhub-username/project-name:latest
    ```
3. Click **Save**.

### Step 4: Build and Verify
1. Click **Build Now**.
2. Monitor progress in the **Console Output**.

## Docker Hub Verification
1. After a successful build, check the Docker images:
    ```bash
    docker images
    ```
2. Confirm the image is available in Docker Hub.

## Minikube Deployment

### Step 1: Start Minikube
1. Start Minikube:
    ```bash
    minikube start
    ```
2. Check Minikube status:
    ```bash
    minikube status
    ```

### Step 2: Deploy Application
1. Create a deployment:
    ```bash
    kubectl create deployment project-name --image=your-dockerhub-username/project-name:latest
    ```
2. Verify deployment:
    ```bash
    kubectl get deployments
    ```

### Step 3: Expose Application
1. Expose the deployment as a service:
    ```bash
    kubectl expose deployment project-name --type=NodePort --port=80
    ```
2. Get service details:
    ```bash
    kubectl get svc
    ```

### Step 4: Access Application
1. Get the Minikube URL:
    ```bash
    minikube service project-name --url
    ```
2. Open the URL in your browser to view the application.

## Contributing

Feel free to contribute by adding more videos, resources, or improving the scripts. Submit a pull request with your updates.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

