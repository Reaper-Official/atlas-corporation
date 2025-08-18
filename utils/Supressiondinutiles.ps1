# Liste des applications à supprimer
$AppsToRemove = @(
    "Microsoft.BingWeather",
    "Microsoft.Getstarted",
    "Microsoft.MicrosoftOfficeHub",
    "Microsoft.YourPhone",
    "Microsoft.WindowsFeedbackHub",
)

# Suppression des applications
foreach ($App in $AppsToRemove) {
    Get-AppxPackage -Name $App -AllUsers | Remove-AppxPackage
}
