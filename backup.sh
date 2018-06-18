#!/bin/sh
echo Starting backup ...

elasticdump \
  --input=${INPUT} \
  --output=mapping.json \
  --type=mapping
elasticdump \
  --input=${INPUT} \
  --output=analyzer.json \
  --type=analyzer
elasticdump \
  --input=${INPUT} \
  --output=data.json \
  --type=data

OUTPUT_TAR=${OUTPUT}_`date +"%Y%m%d-%Hh%Mm"`.tar.gz
tar cvfz ${OUTPUT_TAR} mapping.json data.json analyzer.json
az storage blob upload --file ${OUTPUT_TAR} --container-name ${AZURE_CONTAINER} --name ${OUTPUT_TAR} --account-name ${AZURE_ACCOUNT_NAME} --account-key ${AZURE_ACCOUNT_KEY}
rm ${OUTPUT_TAR} mapping.json data.json analyzer.json