# 🎡 SMTP Relay Docker

![Docker](https://img.shields.io/badge/Docker-2496ED?logo=docker&logoColor=fff)
[![Postfix](https://img.shields.io/badge/Postfix-3.7+-brightgreen)](http://www.postfix.org/)
![Status](https://img.shields.io/badge/Status-Development-blue.svg)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0.en.html)

A lightweight Docker container that acts as an SMTP relay using Postfix. This container is designed for environments where you need to relay emails from your applications (for example, via Docker Compose or Kubernetes) without the overhead of a full mail server setup.

## 📚 Table of Contents

- [Features](#-features)
- [Getting Started](#-getting-started)
  - [Prerequisites](#-prerequisites)
  - [Installation](#-installation)
- [Usage](#-usage)
- [Contributing](#-contributing)
- [License](#-license)
- [Contact](#-contact)

## 🌟 Features

- **SMTP Relay:** Forwards emails to an upstream SMTP server.
- **Postfix Based:** Uses Postfix (version 3.7 or later) for robust mail handling.
- **Container-Friendly Logging:** Logs are directed to stdout for easy Docker log collection.
- **Lightweight & Secure:** Built on Alpine Linux for minimal footprint and quick startup.
- **Easy Configuration:** Environment variables allow simple customization of relay settings.

## 🚀 Getting Started

### 📋 Prerequisites

Before you begin, ensure you have the following installed:

- [Docker](https://docs.docker.com/get-docker/)
- (Optional) [Docker Compose](https://docs.docker.com/compose/install/)

### 🔨 Installation

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/JuanVilla424/smtp-relay.git
   cd smtp-relay-docker
   ```

2. **Set Up Environment Variables**

   - Rename the `.env.example` file to `.env`:
     ```bash
     cp .env.example .env
     ```
   - Open the `.env` file and configure the environment variables as needed.

## 🛠️ Usage

### 🪃 **Running the Container**

- Run the container with the necessary environment variables:

  ```bash
  docker compose up -d
  ```

  - Send mails to `localhost` ... `.env` SMTP_RELAY_PORT

## 🤝 Contributing

**Contributions are welcome! To contribute to this repository, please follow these steps**:

1. **Fork the Repository**

2. **Create a Feature Branch**

   ```bash
   git checkout -b feature/your-feature-name
   ```

3. **Commit Your Changes**

   ```bash
   git commit -m "feat(<scope>): your feature commit message - lower case"
   ```

4. **Push to the Branch**

   ```bash
   git push origin feature/your-feature-name
   ```

5. **Open a Pull Request into** `dev` **branch**

Please ensure your contributions adhere to the Code of Conduct and Contribution Guidelines.

## 📫 Contact

For any inquiries or support, please open an issue or contact [r6ty5r296it6tl4eg5m.constant214@passinbox.com](mailto:r6ty5r296it6tl4eg5m.constant214@passinbox.com).

---

## 📜 License

2025 - This project is licensed under the [GNU General Public License v3.0](https://www.gnu.org/licenses/gpl-3.0.en.html). You are free to use, modify, and distribute this software under the terms of the GPL-3.0 license. For more details, please refer to the [LICENSE](LICENSE) file included in this repository.
