virsh vol-list --pool rac19c01_shared_pool | awk '{ if(NR > 2) print $0 }' | while read vol path
do
    test "$vol" && virsh vol-delete --pool rac19c01_shared_pool $vol
done
