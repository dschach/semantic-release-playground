# UNMANAGED for use with scratch org

# Install scriptecho "Cleaning previous scratch org..."
echo "Cleaning previous scratch org..."
sfdx force:org:delete -p -u ChangeMe

echo "Clearing namespace"
sed -i "" "s|\"namespace\": \"\"|\"namespace\": \"\"|" sfdx-project.json

echo "Creating new scratch org"
sfdx force:org:create --definitionfile config/project-scratch-def.json --setalias ChangeMe --nonamespace --setdefaultusername --noancestors

# For use with namespaced scratch org n package development process
echo "Deploying unmanaged main metadata"
sfdx force:source:deploy -p force-app --tracksource

echo "Assigning permission set"
sfdx force:user:permset:assign -n My_Permission_Set

# To install sample action plan template
echo "Loading sample data"
sfdx force:apex:execute -f ./data/sample-data.apex

# To install sample Flow and other metadata
echo "Deploy unmanaged extra metadata"
sfdx force:source:deploy -p force-app/unmanaged --tracksource

echo "opening org"
sfdx force:org:open