# Umbraco 13-LTS Linux Container Demo

Umbraco CMS as a Linux container demo featuring:

* [Umbraco Forms](https://our.umbraco.com/packages/developer-tools/umbraco-forms/) - Dynamic form authoring
* [Umbraco.BlockGrid.Example.Website](https://marketplace.umbraco.com/package/umbraco.blockgrid.example.website) - Enhanced authoring experience using BlockGrid components in page editing mode
* [Umbraco Workflows](https://umbraco.com/products/add-ons/workflow/) - Basic workflow approvals 

# Setup

**Debian / Ubuntu**

1. Ensure docker.io is installed and clone repo to designated location
   * sudo apt-get install docker-io 
   * git clone https://github.com/villarin/umbraco-linux-container-demo.git
2. Build and run the docker image 
   * docker build -t umbraco-demo:13.2 .
   * docker run  -dit -p 8000:8000  -v ${PWD}:/mnt/volume --name Umbraco.Demo.13 umbraco-demo:13.2
     
**Windows 11**

1. Ensure WSL is installed from command prompt:
    * wsl --list --online - to display available linux distros
    * wsl --install -d DESIRED-DISTRO-NAME - to install desired distro   
2. Install latest [docker desktop](https://www.docker.com/products/docker-desktop/)
3. Ensure WSL 2 is configured as the engine to use in the Docker settings ![image](https://github.com/villarin/umbraco-linux-container-demo/assets/2571310/2baac9f2-1bb2-4ed3-aa72-7c2302ab3ed4)
4. Clone repo to designated location
   * git clone https://github.com/villarin/umbraco-linux-container-demo.git
5. Build and run the docker image 
   * docker build -t umbraco-demo:13.2 .
   * docker run  -dit -p 8000:8000  -v ${PWD}:/mnt/volume --name Umbraco.Demo.13 umbraco-demo:13.2

# Endpoints

* Frontend: http://localhost:8000
* Back Office: http://localhost:8000/umbraco
  
Change localhost to your hostname/ip address if not using your local machine. 

# Notes:

This demo project intended for developers and CMS solution evaluators hence:

* Security hardening is not addressed here
* SQL Lite is used as the demo database - consider SQL Server for production systems.
* A [pre-packaged database](https://github.com/villarin/umbraco-linux-container-demo/files/14934132/data.tar.gz)
  is provided to include basic approval workflow configuration based on the following users:


  User | Pass | Note
  ---  | ---  | ---
  editor@localdev | Pass4editor | Can author and submit content for approval
  approver@localdev | Pass4approver | Can author, review and publish / reject submitted content
  admin@localdev | Pass4admin | All migthy admin

  

