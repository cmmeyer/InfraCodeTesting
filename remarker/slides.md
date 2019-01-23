class: center, middle

# Infrastructure Testing 
#for CI/CD Pipelines

---
class: center, middle

# **Cloud** Infrastructure Testing 
# **in** CI/CD Pipelines

---

# Agenda

1. Who I am
2. Infrastructure as code
3. Automating infrastructure
4. Layering in testing
5. Putting it all together

---
background-image: url(assets/8-bit-chuck.jpg)
background-position: right
background-repeat: no-repeat

# Who I am

**Chuck Meyer**  
[cmmeyer@amazon.com](mailto:cmmeyer@amazon.com)  
Sr Developer Advocate, AWS CloudFormation

* 5 years at AWS
* Infrastructure as Code and DevOps
* Security Automation / DevSecOps
* 20+ Years in Technology

[@chuckm](https://twitter.com/chuckm)

---

# Infrastructure as Code

*Declarative or imperative statements describing hardware, software and services and their relationships.*

--

```yaml
Resource: MyWebServer
    Class: Server
    Type: ExtraBig
    Ports:
        - 80
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


*(we can probably fight about this)*

---

# Automating Infrastructure

*Infrastructure is code, so deploy it like code*

* Source control
* Orchestration
* Permissioning
* Deployment and Promotion
--

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
  * [foodcritic](http://www.foodcritic.io/)
  * [cfn-lint](https://pypi.org/project/cfn-lint/) (CloudFormation)
  * [terraform-validator](https://pypi.org/project/terraform-validator/)

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
(Preferably in a congtrolled test account)

* [TestKitchen](https://kitchen.ci/) (Chef)
* [TaskCat](https://github.com/aws-quickstart/taskcat) (CloudFormation)
* [Kitchen-Terraform](https://github.com/newcontext-oss/kitchen-terraform)

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