$ADconnector = (Get-ADSyncConnector | Where-Object {$_.Name -like "*AAD"}).Name
Set-ADSyncAADPasswordResetConfiguration -Connector $ADconnector -Enable:$False