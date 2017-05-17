  # Terraform---Create-VM-in-GCE
1. Open free tier account in GCE and create project if default project is not there
2. Create service account key in GCE console
   Google Cloud Platform -> API Manager -> Credentials -> Create Credentials -> Service account key
   Select service account select box as "App  engine default service engine"
   Select key type as "JSON"
   Click create button will ddownload the private key file with junk name.
   Rename the file name as "account.json" and place it in the same folder where main.js resides.
3. Create default region and zone if is not there
    Compute engine -> metadata data
    Click create metedata
    Add below key values
    google-compute-default-region	 = us-west1
    google-compute-default-zone = us-west1-a
    Refer "https://cloud.google.com/compute/docs/regions-zones/regions-zones" to get region and zone mapping
 4. Open the command prompt, go to the folder of main.ts and execute below commands
    $ terraform plan
    $ terraform apply
    
    Go to GCE console open Compute Engine -> VM instances. You can see the newly created instance
    
