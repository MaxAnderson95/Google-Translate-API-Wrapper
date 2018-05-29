Function Resolve-Language {

    [CmdletBinding()]
    Param (

        [Parameter(Mandatory=$True,Position=0,ValueFromPipeline=$True)]
        [String[]]$SourceText

    )

    Begin {

    }
    
    Process {

        ForEach ($String in $SourceText) {
        
            $Body = @{

                "q" = $SourceText

            }

            $Response = Invoke-GoogleTranslateAPIRequest -Method POST -Resource detect -Body $Body

            Write-Output $Response

        }

    }

    End {

    }

}