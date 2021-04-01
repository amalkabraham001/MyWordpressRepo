<#
this script is created and owned by Amalkabraham@gmail.com
Reference articles:- https://docs.microsoft.com/en-us/powershell/module/az.storage/new-azstorageaccountsastoken?view=azps-5.6.0
https://docs.microsoft.com/en-us/azure/storage/common/storage-use-azcopy-files
#>
#this section is to fetch the  sas token from source storage account
$context = (Get-AzStorageAccount -ResourceGroupName <sourceRG> -AccountName <sourcestorageaccount>).context
$srcsastoken=New-AzStorageAccountSASToken -Context $context -Service Blob,File -ResourceType Service,Container,Object -Permission racwdlup

#this section is to fetch the sas token from target storage account
$context = (Get-AzStorageAccount -ResourceGroupName <targetRG> -AccountName <targetstorageaccount>).context
$targetsastoken=New-AzStorageAccountSASToken -Context $context -Service Blob,File -ResourceType Service,Container,Object -Permission racwdlup

#azcopy command for replication.
azcopy sync https://<sourcestorage.file.core.windows.net/fileshare>$srcsastoken https://<targetstorage.file.core.windows.net/fileshare>$targetsastoken --recursive
