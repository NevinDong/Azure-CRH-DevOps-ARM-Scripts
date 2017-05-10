---
layout: post
title: "One-click deployment model based on ARM templates"
author: "Nevin Dong"
author-link: "#"
date:   2017-01-01 20:30:43 +08:00
categories: [DevOps]
color: "blue"
excerpt: Redoop and Microsoft worked together through DevOps workshops and hackfest,  using ARM templates to help customers quickly and easily deploy Hadoop cluster and large-scale nodes by just a few clicks, and has successfully published their solution in Azure Marketplace in China.
language: English
verticals: [Other]

---


## Overview ##

Redoop CRH platform deployments consists of many key components, including image sources, master node VMs and data node VMs, virtual network, DNS, IPs, storage account, security groups, etc. IT professionals or developers can create CRH Hadoop cluster and VMs step by step as following the user manual provided, but this approach would be time consuming and error-prone. The process can be automated by using scripts and command lines, but it would not be easy to debug and customize upon different types of requirements.
Azure Resource Manager (ARM) technology enables Redoop to deploy, manage, and monitor these components as a resource group. It would be fast and easy to deploy, provision, update, or delete all the resources in a single, coordinated operation.  ARM also provides security, auditing, diagnostics and tagging features to help IT professionals manage the resources after deployment. This would dramatically increase Redoop and customer’s DevOps efficiency and productivity.
Redoop defines the configurations in a JSON file named “deploy.json”.
By using ARM templates, Linux VMs and DSC extensions technologies in Azure, Redoop can help customers quickly and easily deploy Hadoop cluster and large-scale nodes by just a few clicks. 



## More resources ##

- Azure Resource Manager (ARM) overview: [https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-overview](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-overview)

- Azure Marketplace in China: [https://market.azure.cn/](https://market.azure.cn/)

- Redoop CRH publishing in Azure Marketplace in China: [https://market.azure.cn/Vhd/Show?vhdID=12034&version=14181](https://market.azure.cn/Vhd/Show?vhdID=12034&version=14181)

- Redoop CRH ARM template repository: [http://www.redhub.io/OpenCloud/Azure-CRH-ARM/src/master/release](http://www.redhub.io/OpenCloud/Azure-CRH-ARM/src/master/release)



