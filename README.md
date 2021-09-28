
## Requirements
- Terraform - configuring Nexus
- Nginx - proxying queries to Nexus
- SSL cert and key - for ssl vhost (*docker works only through SSL)
- Nexus - deployed and ready to operate

## List of variables
Variable name | Description                  
--------| --------                      
nexus_url*  | Nexus url without trailing slash         
nexus_username*  | Name of user in Nexus for authorization
nexus_password*  | Password for nexus user for authorization
nexus_insecure   | Allow insecure SSL connections 

``* mandatory variables``
## Installing
1. Replace domain name and cert name in vhost.conf
2. Add cert to trusted on machines where docker daemon is installed
3. Deploy Nexus
4. Create terraform.tfvars file and place mandatory varibales there.
5. Run terraform init && terraform apply commands