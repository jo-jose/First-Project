
$SubIDs = (Get-AzureRmSubscription).SubscriptionId
foreach ($sub in $SubIDs) {
    Set-AzureRmContext -SubscriptionId $sub | Out-Null
    $SubName = (Get-AzureRmContext).Subscription.SubscriptionName
    Write-Host "Logged into subscription $SubName.." -ForegroundColor Green
    $rgs = Get-AzureRmResourceGroup
    foreach ($rg in $rgs) {
        $rgName = $rg.ResourceGroupName
        $filename = $SubName + "_" + $rgName
        Write-Host "Fetching details of resource group $rgName. ..." -ForegroundColor Yellow
        $rg >> "$filename.csv"
    }
}