# Tested on Ubuntu 16
# call this script to remove old kernel versions and free up boot partition space
# ./updatekernel.sh $(dpkg -l | tail -n +6 | grep -E 'linux-image-[0-9]+' | grep -Fv $(uname -r)  | grep  ii | awk '{ print $3}' | awk -F . '{ print $1"."$2"."$3}')
#

for var in "$@"
do
   echo "$var"
   update-initramfs -d -k $var-generic
   dpkg --purge linux-image-$var-generic linux-image-extra-$var-generic
   dpkg --purge linux-headers-$var-generic
   dpkg --purge linux-headers-$var
done

apt-get autoremove --purge
