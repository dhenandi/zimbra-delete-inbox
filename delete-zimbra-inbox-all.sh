!/bin/sh
 
#Hapus Layar
clear

echo "Deleting Inbox. Please Wait..." 
LOCATION=`pwd`
USERS=`su - zimbra -c "zmprov -l gaa | sort"`

for ACCOUNT in $USERS; do
        ACC1=`echo $ACCOUNT | awk -F@ '{print $1}'`;
        ACC2=`echo $ACCOUNT | cut -d '.' -f1`
 
#Delete Inbox
        su - zimbra -c "zmmailbox -z -m $ACCOUNT emptyFolder /Inbox"
        echo "$ACCOUNT Inbox has been deleted"
done
echo ""
echo "All Inbox Has Been Deleted"
