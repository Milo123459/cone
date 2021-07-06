# A scoop command to steal a manifest from a locally installed bucket and put it in the current bucket.

# NOTE!
# The code is pretty sloppy, was my first time using powershell.
# NOTE!

function Scoop-Steal($bucket, $app) {
    if (!$bucket -or !$app) {
        Write-Host "
This is Scoop-Steal, an easy way to take a manifest from one bucket and port it into the bucket you are currently in.

Usage is simple: Scoop-Steal BUCKET APP
        
For example,
Scoop-Steal main glitter"
    }
    else {
        if (Test-Path -Path "bucket/${app}.json") {
            Write-Host "
File already exists, cancelling."
            exit 1
        }
        New-Item -Path "${PWD}/bucket/${app}.json"
        Get-Content "~/scoop/buckets/${bucket}/bucket/${app}.json" | Add-Content -Path "${PWD}/bucket/${app}.json"
        Clear-Host
        Write-Host "Successfully stole app ${app} from bucket ${bucket}"
    }
}

Scoop-Steal $args[0] $args[1]