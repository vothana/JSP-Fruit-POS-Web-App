
# Fruit Store

We are from National University of Management.


This is tiny project created by a team has 4 members for final project in **Servlets & JSP**


## Run Locally

- Clone the project

```bash
  git clone https://github.com/vothana/Fruit.git
```

- Download [XAMPP](https://www.apachefriends.org/download.html)

- Copy tomcat folder from XAMPP to Project folder

  You can use xcopy [source] [destination] [options] for Window OS to copy tomcat server from XAMPP to Project folder

  _xcopy you must run command promt as administrator_

```bash
  Xcopy C:\xampp\tomcat "[Project Path]\tomcat" /E /H /C /I
```

- Run apache and MySQL
- Open project with NetBeans IDE or your love IDE. In this case we use NetBeans IDE
- In NetBeans:
  
  Create new Apahce Tomcat Server using tomcat folder in the project directory with your own user

  In project's properties:
  - On Run section: Select server that we have created above
  - On Libraries section: Check if any error jar file not found. If any errors path, please re-add the jar file from WEB-INF\Libraries

- Open phpMyAdmin
  - Create new database fruit and import data. **fruit.sql** is inside databse folder

- Run Project
  - **Admin:** admin, 12345
  - **User:** vothana, 12345

