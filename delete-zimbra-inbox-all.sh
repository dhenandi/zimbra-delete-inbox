!/bin/sh
 
#Hapus Layar
clear

echo "Deleting Inbox. Please Wait..." 
LOCATION=`pwd`
USERS=`su - zimbra -c "zmprov -l gaa | sort"`

echo "Looping for all users"
for ACCOUNT in $USERS; do
        ACC1=`echo $ACCOUNT | awk -F@ '{print $1}'`;
        ACC2=`echo $ACCOUNT | cut -d '.' -f1`
 
#Delete Inbox
        su - zimbra -c "zmmailbox -z -m $ACCOUNT emptyFolder /Inbox"
        echo "Inbox dari email Account $ACCOUNT telah selesai"
done
echo "Proses sinkronisasi email selesai dilakukan"
