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

                "q" = $String

            }

            $Response = Invoke-GoogleTranslateAPIRequest -Method POST -Resource detect -Body $Body
            
            $Obj = [PSCustomObject]@{

                "SourceText" = $String
                "DetectedLanguageCode" = $Response.data.detections.language
                "DetectedLanugage" = $null
                "Confidence" = $Response.data.detections.confidence

            }

            Write-Output $Obj

        }

    }

    End {

    }

}