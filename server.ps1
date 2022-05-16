$url = 'http://localhost:8080/'

$htmlcontents = @{
  'GET /'  =  Get-Content .\index.html
  'GET /assets/main.js'  =  Get-Content .\assets\main.js
  'GET /assets/style.css'  =  Get-Content .\assets\style.css
  'GET /services'  =  Get-Service | ConvertTo-Html

}

$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add($url)
$listener.Start()

pause

try
{
  while ($listener.IsListening) {  
    # process received request
    $context = $listener.GetContext()
    $Request = $context.Request
    echo $Request
    echo "--------------------------------------"
    $Response = $context.Response

    $received = '{0} {1}' -f $Request.httpmethod, $Request.url.localpath
    
    $html = $htmlcontents[$received]
    if ($html -eq $null) {
      $Response.statuscode = 404
      $html = '404 - cette page est indisponible'
    } 
    
    $buffer = [Text.Encoding]::UTF8.GetBytes($html)
    $Response.ContentLength64 = $buffer.length
    $Response.OutputStream.Write($buffer, 0, $buffer.length)
    
    $Response.Close()
  }
}
finally
{
  $listener.Stop()
}