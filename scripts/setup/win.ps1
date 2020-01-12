# PARAMS
Param(
    [Alias("a")]
    [parameter(
        Mandatory=$true,
        HelpMessage="Scratch Org Alias that will be used for this Org"
    )][string]$alias,
    [Alias("d")]
    [int]$Duration = 7
)

Write-Host "sfdx force:org:create -s -a $alias -d $Duration -f config/project-scratch-def.json"
sfdx force:org:create -s -a $alias -d $Duration -f .\config\project-scratch-def.json

Write-Host "sfdx force:source:push -u $alias"
sfdx force:source:push -u $alias

Write-Host "sfdx force:org:open -u $alias"
sfdx force:org:open -u $alias