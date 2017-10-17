cp /etc/kubernetes/admin.conf $HOME/
chown $(id -u):$(id -g) $HOME/admin.conf
echo "export KUBECONFIG=$HOME/admin.conf" > .bashrc