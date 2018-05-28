Function Set-GoogleTranslateAPIKey {

    [CmdletBinding()]
    Param (

        [Parameter(Mandatory=$True,Position=0,ValueFromPipeline=$True)]
        [String]$APIKey

    )

    $Key = [PSCustomObject]@{
        
        "APIKey" = $APIKey
    
    }

    $ModulePath = Get-Module -Name PoSH-Translator | Select-Object -ExpandProperty ModuleBase
    $KeyFileName = "key.json"

    $Key | ConvertTo-JSON | Out-File -FilePath "$ModulePath\$KeyFileName" -Force

}