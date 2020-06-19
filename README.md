# Raspberry Kubernetes Cluster

## Why?


That is not a very good reason aside from get some fun. Beside this pretty much obvious, and definitely the most important, reason I must notice that in my work there are lots of distributed systems to play. So aside from the fun part it is also a nice thing to have when you must put in practice some ideas that usually run in a cluster of machines. 

### Why Raspberry

The reason for Raspberry as the bare metal solution is pretty obvious. Its **cheap**. I definitely do not have the most performant cluster in the world, not even in this block of apartments but it is enough to tinker with some cool ideas. 

### Why Kubernetes

Kubernetes is a well supported toolkit to manage the lifecycle of container applications and give us a very interesting set of features to deploy, update and scale our containers. Since it was developed by google has a very active developer community, so that's pretty much it.

## The setup

### The first version
First and foremost let me say this a working in progress. Now we are clarified lets put all this in context.
So, the initial idea consisted in deploying a kubernetes cluster running on a set of 5 Raspberry Pi model 3
as we can see in the following picture

![Raspberry Cluster](http://shared.balhau.net/imgs/kuber/kluster.jpg)

The setup of the hardware, OS configuration and Kubernetes installation took me a whole week of iteration over iteration to fine tune the container versions, the ARM troubleshooting of incompatible versions and so on. 

In the end I was able to setup a minimalistic kubernetes cluster. We achieved the following

    * Integration with kubernetes dashboard
    * Integration with heapster
    * Integration with grafana and influx database for metrics visualization

As more and more things were being added I notice that the filesystem used was the ext4 mounted partition of the local sd cards on the raspberry nodes. While not a short term problem I noticed that this will consume cycles of life from these cards and on the other side the amount of GB available were not so much.

### The ideal NFS shared folder

To overcome the problem of local overuse of io operations on the sd cards as well as the fact that the total amount of space was relatively small. I decided to use an extra raspberry node to share **5Tb** of disk by mounting there a NFS shared folder. 

![NFS Shared Folder](http://shared.balhau.net/imgs/kuber/nfsdisk.jpg)

After some reading I notice a nice [article](https://linuxconfig.org/how-to-move-docker-s-default-var-lib-docker-to-another-directory-on-ubuntu-debian-linux) target for debian distributions that explained how we could do the trick of migrating the docker container filesystem into a new folder. This was the base for the [**mountpoints.yml**](ansible/roles/base/tasks/mountpoints.yml) playbook that is responsible for the following:

* Turn off swap
* Install NFS client and RSync utilities
* Setup the remote NFS shared folder as a local mountpoint
* Set a node root folder on the shared folder
* Set docker to use the new shared mountpoint as working folder
* Stop docker service
* Execute daemon-reload
* RSync data from old to new folder
* Start docker service


 ### The reality 
 This was a very promising idea however after some trying to start docker daemon we noticed that the overlay2 filesystem was not correcting mounting the containers when NFS was used as the backing filesystem. After some reading we end up with the sad news that [overlay backing file system list didn't include NFS](https://docs.docker.com/engine/userguide/storagedriver/overlayfs-driver/#prerequisites).

 So instead of completely discard the NFS solution as a way of scaling the storage space and as a practical way to overcome the fact that raspberry pies have a limited number of write flash operations we start looking for other ways to solve the issue. One way was already embedded in the kubernetes arquitectures [Persistent Volumes](https://kubernetes.io/docs/concepts/storage/persistent-volumes/)



 ### Private Docker Registry

 To install a private docker registry you just need to follow [these instructions](https://github.com/kubernetes/kubernetes/tree/master/cluster/addons/registry)

[Here we adapted](kuber/kuber/registry) the kuber files to enable a local volume using a NFS shared mount point.

Build and push image into registry

```shell
    docker build -t image-name:tag-name .
    docker tag image-name:tag-name localhost:5000/image-name:tag-name
    docker push localhost:5000/image-name:tag-name

To get image information on the registry you can query the following endpoint

    curl -X GET http://localhost:5000/v2/_catalog

For instance in our current setup we end up with the following output

    {"repositories":["balhau/pycrawler","kube-api","pycrawler"]}
```

 ### More info

 The lab here was developed with the help of several interesting resources, namely

* [Kubeadm Workshop](https://github.com/luxas/kubeadm-workshop)
* [HypriotOS](https://blog.hypriot.com/post/setup-kubernetes-raspberry-pi-cluster/) 

#### Blog posts

The code in this repository has several blog posts helping the rationale behind

* [Kubernets and PIs](https://codecorner.balhau.net/kubernets-and-raspberry-pis/) - Where kubernets is put under historical perspective and the raspberry pi as the selected architecture for the cluster is justified
* [Provisioning PIs with Ansible](https://codecorner.balhau.net/provisioning-pis-with-ansible/) - A first technical overview about the process of provisioning automation done in ansible to setup the raspberry pi kubernetes cluster

#### Create a token for dashboard

```shell
    kubectl apply -f user.yml
    kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep admin-user | awk '{print $1}')
```





#### Helm init command

```shell
    helm init --service-account tiller --tiller-namespace kube-system --tiller-image=jessestuart/tiller
```