# Raspberry Kubernetes Cluster

## Why?


That is not a very good reason aside from get some fun. Beside this pretty much obvious, and definitely the most important, reason I must notice that in my work there are lots of distributed systems to play. So aside from the fun part it is also a nice thing to have when you must put in practice some ideas that usually run in a cluster of machines. 

### Why Raspberry

The reason for Raspberry as the bare metal solution is pretty obvious. Its **cheap**. I definitely do not have the most performant cluster in the world, not even in this block of apartments but it is enough to tinker with some cool ideas. 

### Why Kubernetes

Kubernetes is a well suported toolkit to manage the lifecycle of container applications and give us a very interesting set of features to deploy, update and scale our containers. Since it was developed by google has a very active developer community, so that's pretty much it.

### The setup

### The first version
First and foremost let me say this a working in progress. Now we are clarified lets put all this in context.
So, the initial idea consisted in deploying a kubernetes cluster running on a set of 5 Raspberry Pi model 3
as we can see in the following picture

![Raspberry Cluster](http://shared.balhau.net/imgs/kuber/IMG_20171028_135826.jpg)

The setup of the hardware, OS configuration and Kubernetes installation took me a whole week of iteration over iteration to fine tune the container versions, the ARM troubleshooting of incompatible versions and so on. 

In the end I was able to setup a minimalistic kubernetes cluster. We achieved the following

    * Integration with kubernetes dashboard
    * Integration with heapster
    * Integration with grafana and influx database for metrics visualization

As more and more things were being added I notice that the filesystem used was the ext4 mounted partition of the local sd cards on the raspberry nodes. While not a short term problem I noticed that this will consume cycles of life from these cards and on the other side the amount of GB available were not so much.

### The NFS shared folder

To overcome the problem of local overuse of io operations on the sd cards as well as the fact that the total amount of space was relatively small. I decided to use an extra raspberry node to share 5Tb of disk by mounting there a NFS shared folder. 


 
 ### More info

 The lab here was developed with the help of several interesting resources, namely

* [Kubeadm Workshop](https://github.com/luxas/kubeadm-workshop)
* [HypriotOS](https://blog.hypriot.com/post/setup-kubernetes-raspberry-pi-cluster/) 