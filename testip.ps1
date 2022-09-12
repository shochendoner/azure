$tests = import-csv testlist.txt
  
$results=   foreach ($test in $tests){
       # Create a custom object 
       #$Test = $null
       $FQDN = $null

       $server = $test.server
       $port = $test.port
       
       #$Object = New-Object PSCustomObject
       #$Object | Add-Member -MemberType NoteProperty -Name "Server name" -Value $server
       #$Object | Add-Member -MemberType NoteProperty -Name "Port" -Value $port
       
   $FQDN = Resolve-DnsName -name $Server | select name 

   If(!$FQDN)
   {
       Write-Host "$Server does not exist"
       $FQDN = "Not Found"
   }

     
           
           Try
           {
               $Testresult =  Test-netconnection -Port $Port -cn $Server -InformationLevel Quiet 
               If($Testresult)
               {
                   #$Object | Add-Member -MemberType NoteProperty -Name "Result" -Value $Test
               }
           }
           Catch
           {
               Write-Warning $_.Exception.Message
               #$Object | Add-Member -MemberType NoteProperty -Name "Result" -Value "null"
           }
       
       
       
       #$Array += $Object  
           [PSCustomObject]@{
               Name     = $server
               FQDN = $FQDN.Name
               Port = $port
               Result    = $Testresult
           }

       }
   

Write-Host "Results:" -Foreground Yellow
$results | Format-Table -Wrap -AutoSize
$results | Export-Csv -Path results.csv -NoTypeInformation 
