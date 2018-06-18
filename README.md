# backup-elasticsearch-azure

Simple utility based on elasticsearch-dump (https://github.com/taskrabbit/elasticsearch-dump) and azure command line utility to backup an elasticsearch index to Azure Blob Storage.

## Environment 

`AZURE_CONTAINER` Azure container to write backup to

`AZURE_ACCOUNT_NAME` Azure account name to use

`AZURE_ACCOUNT_KEY` Azure account key used for authentication

`INPUT` The source URL of the ES index to backup (eg. http://es:9200/index_name )

`OUTPUT` Base output file name (mapping and index will be stored in a single `tar.gz` archive containing a json file for the mapping of the index and another one for the datas), the current date and time will be automatically appended to the output filename.