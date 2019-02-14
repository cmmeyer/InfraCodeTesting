title: Infrastructure Code Testing in CI/CD Pipelines
class: animation-fade
layout: true

<!-- This slide will serve as the base layout for all your slides -->
<!-- .bottom-bar[
  {{title}}
]
-->
---
class: left, middle

# {{title}}
Chuck Meyer, Sr. Dev Advocate AWS CloudFormation

---

# Agenda

1. Who I am
2. Infrastructure as code
3. Automating infrastructure
4. Layering in testing
5. Putting it all together

---
<!--
background-image: url(assets/8-bit-chuck.jpg)
background-position: right
background-repeat: no-repeat
-->
# Who I am

 <img alt="[8-bit Chuck]" src="assets/8-bit-chuck.jpg" width="150" align="right">

**Chuck Meyer**  
[cmmeyer@amazon.com](mailto:cmmeyer@amazon.com)  
Sr Developer Advocate, AWS CloudFormation

* 5 years at AWS
* Infrastructure as Code and DevOps
* Security Automation / DevSecOps
* 20+ Years in Technology
* Recent Ohio boomerang

<img alt="[twitter]" src="assets/twitter-logo.png" width="40" align="left">@[chuckm](https://twitter.com/chuckm)

---

# Infrastructure as Code

*Declarative or imperative statements describing hardware, software and services and their relationships.*

--

```yaml
Resource: MyWebServer
    Class: Server
    Type: ExtraBig
    Ports:
        - 443
```

--
(or maybe)

```python
server_names = [ 'Red', 'Blue', 'Green']
for name in server_names:
    launch_server(name, 'web')
```

---

# Infrastructure as Code Flavors

## Declarative

* Chef/Puppet/Ansible/Salt
* Terraform
* CloudFormation (AWS)
* Azure Resource Manager (ARM)
* Cloud Deployment Manager (GCP)

## Imperative

* Pulumi
* Cloud Development Kit (AWS)

--

*(we can probably fight about this)*

---

# Automating Infrastructure

*Infrastructure is code, so deploy it like code*

* Source control
* Orchestration
* Permissioning
* Deployment and Promotion

--

*(So basically, CI/CD)*

---

# Layering in Testing

*Infrastructure is code, so test it like code*

* Validation/Linting
* Unit Tests
* Integration Tests

---

# Validation

*Is my code syntactically viable?*

* Built in validators  
  * `terraform validate`
  * `aws cloudformation validate-template`

* Linters
  * [FoodCritic](http://www.foodcritic.io/) (Chef)
  * [cfn-lint](https://pypi.org/project/cfn-lint/) (CloudFormation)
  * [terraform-validator](https://pypi.org/project/terraform-validator/)

---

# Unit Testing

*Validate the behavior of individual components*

But you can't mock infrastructure...  

---

Well, you can...

.center[![Mock](assets/mock.gif)]

--

... but it's not nice.
---

# Unit Testing

*Validate the behavior of individual components*

But you can't mock infrastructure...  
Decompose into multiple files and test either statically or in a live account.

* [ChefSpec](https://docs.chef.io/chefspec.html) (static)
* [cfn_nag](https://github.com/stelligent/cfn_nag) (static)
* [Terratest](https://github.com/gruntwork-io/terratest) (live)

---

# Integration Testing

*Validate the behavior of the complete infrastructure*

Deploy the full infrastructure and test it end-to-end. 
(Preferably in a controlled test account)

* [TestKitchen](https://kitchen.ci/) (Chef)
* [TaskCat](https://github.com/aws-quickstart/taskcat) (CloudFormation)
* [Kitchen-Terraform](https://github.com/newcontext-oss/kitchen-terraform)

---

# What to test?

* Resource misconfiguration (Will it deploy?)
* Software defined network (Unexpected ingress or egress?)
* Permissions (Too many wildcards)
* Encryption
* Dependencies (Is everything else there?)
* Lifecycle (Are you going to delete my database?)

---
background-image: url(assets/infra-cicd.png)
background-position: right
background-repeat: no-repeat
background-size: contain

# Infrastructure CI/CD – DIY Tools

---
class: center, middle

![Questions?](assets/questions.jpg)

@chuckm | cmmeyer@amazon.com