# UNMANAGED for use with developer edition or playground

echo "Clearing namespace"
sed -i "" "s|\"namespace\": \"\"|\"namespace\": \"\"|" sfdx-project.json

# For use with developer edition or playground
echo "Pushing source..."
sfdx force:source:deploy -p force-app

echo "Assigning Permissions"
sfdx force:user:permset:assign -n My_Permission_Set

# To install additional sample Accounts/Contacts
# sfdx force:data:tree:import -p ./data/action-plan-data-plan.json

# To install sample action plan template
echo "Adding sample data"
sfdx force:apex:execute -f ./data/sample-data.apex

# To install sample Flow and other metadata
echo "deploying sample metadata"
sfdx force:source:deploy -p force-app/unmanaged

echo "opening org..."
sfdx force:org:open