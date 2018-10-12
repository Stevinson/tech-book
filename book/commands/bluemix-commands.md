# Bluemix

## General Commands

* Gives you a list of all the available Bluemix service offerings.

```bashrc
bx service offerings
```

* Lists apps in current space.

```bashrc
bx app list
```

* Push (deploy or update) app. This can take a host of parameters, including (i) the command to start the app, (ii) memory allocation, (iii) manifest file, etc.

```bashrc
bx app push
```

* Shows services in current app.

```bashrc
bx service list
```

* Create a service. Note that setting plan to Lite provides a free NoSQL database for nonproduction use

`bx service create <service> <plan> <service_instance_name>`

```bashrc
bx service bind
```

* This deletes the app. The -r parameter removes any mapped application routes. Do this before deleting the services.

```bashrc
bx app delete <app_name> -r
```

* This deletes the service.

```bashrc
bx service delete <service_name>
```

```bashrc
bx app logs
```

* Get various levels of help on Bluemix commands.

```bashrc
bx help <command> or bx <command> help <argument>
```
### Bluemix registries

```bashrc
ibmcloud cr login
docker tag <docker-image> registry.eu-gb.bluemix.net/<my_namespace>/<my_repository>:<my_tag>
docker push registry.eu-gb.bluemix.net/<my_namespace>/<my_repository>:<my_tag>
ibmcloud cr image-list # Check the image has been placed correctly
```

### Cluster setup

For more detailed setup of clusters see the instructions (here)[https://console.bluemix.net/docs/containers/cs_clusters.html#clusters].

```bashrc
ic cs cluster-create --location dal10 --workers 3 --public-vlan <public_VLAN_ID> --private-vlan <private_VLAN_ID> --machine-type <b2c.4x16> --name <cluster_name_or_ID>
```

### Viewing running application

1. Get the port number (the last line of the trace output)
2. Get the public IP

```bashrc
bx dev deploy --trace
bx cs workers <cluster-name>
```


#### Bare metal vs VMs

More compute resources: You can provision your worker node as a single-tenant physical server, also referred to as **bare metal**. Bare metal gives you direct access to the physical resources on the machine, such as the memory or CPU. This setup eliminates the virtual machine hypervisor that allocates physical resources to virtual machines that run on the host. Instead, all of a bare metal machine's resources are dedicated exclusively to the worker.

With VMs, you get greater flexibility, quicker provisioning times, and more automatic scalability features than bare metal, at a more cost-effective price. You can use VMs for most general purpose use cases such as testing and development environments, staging and prod environments, microservices, and business apps.

- bx login -a https://api.ng.bluemix.net -u <IBMid> -p <password> -o <email> -s dev
- bx target
  Check the current space and organisation
  - bx target -s test
  Change to a different space named test
- bx iam spaces
  Display the spaces available in the current organisation
- bx app start <app_name>
  Launch the app.
- bx api <endpoint>
  This is used to set or change the API endpoint. Note that the endpoint for the UK is api.eu-gb.bluemix.net
- bx cf <commands here>
  These are Cloud Foundary command line tools. Allow you to push etc.
- cf logs bluemix-blog —recent
  Check the logs of a Cloud Foundary App.
- bx account orgs
  List all the organisations on the currently logged in account.

Used Since App Launch

General

To log in:

1. bx api api.eu-gb.bluemix.ne - Set the api upon login
2. bx login -sso - Log in using SSO
3. bx target -o edward.stevinson -s cloudnative-dev - Set the organisation and space

Plugins

- bx plugin install IBM-Containers -r bluemix
  Install a plugin

IBM-Containers

- bx ic init
  Upon launching to create authentication.

- bx plugin show IBM-containers

Clound Foundry

bx cf push <app_name> - Deploy the app

bx cf env <app_name> - See the environment variables

OpenWhisk

- wsk package refresh
  This automatically create OpenWhisk packages with the Cloudant credentials in your space.
  NB. wsk is the Openwhisk CLI tool.
  To create an OpenWhisk package:
      wsk package create socialreview --param cloudant_url <cloudant url> \
      --param watson_url <watson tone analyzer url> \
      --param watson_username <watson tone analyzer username> \
      --param watson_password <watson tone analyzer password \
      --param cloudant_reviews_db socialreviewdb
- Then we build actions associated with the package, for example:
  wsk action create socialreview/initCloudant openwhisk/actions/initCloudant.js
- Which are subsequently used with:
  wsk action invoke socialreview/initCloudant —blocking
- Create a REST API gateway:
  wsk api create /api /reviews/list get socialreview/getReviews

IBM Containers

bx ic [COMMAND OPTION][ARGUMENTS…]

---

The order:

1. Create a service instance with service create
2. Push the app with app push
3. Bind the service with the app with service bind
4. Make any changes you may want to the services and app.
5. Use app push again to make these changes live.

## New Commands

Please note that the above commands may be deprecated.

* Bluemix automatically collects data to 'improve the service'. To turn that off use the following command.

```bashrc
ibmcloud config --usage-stats-collect false
```
