Function Resolve-Language {

    [CmdletBinding()]
    Param (

        [Parameter(Mandatory=$True,Position=0)]
        [String]$SourceText

    )

    $Body = @{

        "q" = $SourceText

    }

    $Response = Invoke-GoogleTranslateAPIRequest -Method POST -Resource detect -Body $Body

    Write-Output $Response

}