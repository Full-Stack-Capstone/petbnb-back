<a name="readme-top"></a>

<div align="center">
  <img src="./src/images/logo-no-background.png" alt="logo" width="140"  height="auto" />
  <br/>

  <h3><b>PetBNB</b></h3>

</div>

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
  - [🚀 Live Demo](#live-demo)
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Install](#install)
  - [Usage](#usage)
  - [Run tests](#run-tests)
  - [Deployment](#triangular_flag_on_post-deployment)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [❓ FAQ (OPTIONAL)](#faq)
- [📝 License](#license)

# 📖 [PetBNB] <a name="about-project"></a>

**[PetBNB]** is a platform that allows users to rent rooms for their pets, similar to AirBNB. Users can add rooms to their profile for other users to rent and can make reservations for their pets to stay in a room. Additionally, users can add and remove pets, as well as add and remove rooms.

## 🛠 Built With <a name="built-with"></a>

- Ruby on Rails
- PostgreSQL
- React
- HTML
- JavaScript
- CSS

### Tech Stack <a name="tech-stack"></a>

<details>
  <summary>Client</summary>
  <ul>
    <li><a href="https://reactjs.org/">React.js</a></li>
  </ul>
</details>

<details>
  <summary>Server</summary>
  <ul>
    <li><a href="https://expressjs.com/">Express.js</a></li>
  </ul>
</details>

<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

<details>
<summary>Back-end</summary>
  <ul>
    <li><a href="https://www.rubyonrails.org/">RubyOnRails</a></li>
  </ul>
</details>

### Key Features <a name="key-features"></a>

- **[Rent rooms for pets]**
- **[Add rooms to profile for other users to rent]**
- **[Add and remove pets]**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🚀 Live Demo <a name="live-demo"></a>

- Api documentation in this [link](https://petbnb.onrender.com/api-docs/index.html)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Kanba Board <a name="kanba"></a>
- **Link to our kanban board [here](https://github.com/orgs/Full-Stack-Capstone/projects/1)**
- **Initial state of the Kanban board![image](https://user-images.githubusercontent.com/107952724/222493678-9d10c540-6ff5-4ac1-a33a-5954331f9e35.png)**
- **The project team had 4 members**


## 💻 Getting Started <a name="getting-started"></a>

### Prerequisites

In order to run this project you need:

- `Ruby and Rails` installed in your machine.
- You need to create a new master.key:
  ```
  1. Remove config/master.key and config/credentials. yml.enc
  2. Run in the terminal: EDITOR=code rails   credentials:edit
  3. This command will create a new master.key and  credentials.yml.enc if they do not exist.
### Setup

Clone this repository to your desired folder:

Example commands:

```sh
  cd my-folder
  git https://github.com/Full-Stack-Capstone/petbnb-back.git
```

### Install

Install this project with:

```sh
  cd my-project
  bundle install
  rails db:create
  rails db:migrate
  rails db:seed
```

### Usage

To run the project, execute the following command:

```sh
  rails server
```

### Run tests

To run tests, run the following command:

```sh
  rspec ./spec/routing
  rspec ./spec/models
  rspec ./spec/integration
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 👥 Authors <a name="authors"></a>

👤 _Diego Garcia_

- GitHub: [@taldr27](https://github.com/taldr27)
- LinkedIn: [diegogarcial](https://www.linkedin.com/in/diegogarcial/)

👤 _Erick Hans Martinez_

- GitHub: [@erickhansx](https://github.com/erickhansx)
- Twitter: [@TheErickHans](https://twitter.com/TheErickHans)
- LinkedIn: [LinkedIn](https://linkedin.com/in/linkedinhandle)

👤 _Tiago Lelinski Marin_ 🧑🏻‍💻

- GitHub: [@githubhandle](https://github.com/Tiago-Lelinski-Marin)
- Twitter: [@twitterhandle](https://twitter.com/LelinskiMarin)
- LinkedIn: [Tiago Lelinski](https://www.linkedin.com/in/tiago-lelinski-marin/)

👤 _Gabriel Andrade_

- GitHub: [@gandradep](https://github.com/gandradep)
- Twitter: [@leribagandrade](https://twitter.com/leribagandrade)
- LinkedIn: [LinkedIn](https://linkedin.com/in/gabriel-andrade-silla-turca)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🔭 Future Features <a name="future-features"></a>

- [ ] **[Users can leave a rating to each room]**
- [ ] **[Users can create a full personal profile]**
- [ ] **[Users can upload more than one image]**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## ⭐️ Show your support <a name="support"></a>

If you like this project please leave a like on Github and share it with your friends.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🙏 Acknowledgments <a name="acknowledgements"></a>

I would like to thank [Murat Korkmaz](https://www.behance.net/muratk) from Behance for the original design and layout of the app.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<h2>ERD Diagram</h2>
<div style="max-width: 50%; margin: 0 auto">
<img src="./src/images/erddiagram.jpeg">
</div>
