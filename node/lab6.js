var http = require("http");
var fs = require("fs");
var os = require("os");
var ip = require('ip');



http.createServer(function(req, res){

    if (req.url === "/") {
        fs.readFile("./public/index.html", "UTF-8", function(err, body){
        res.writeHead(200, {"Content-Type": "text/html"});
        res.end(body);
    });
}
    else if(req.url.match("/sysinfo")) {
        myHostName=os.hostname();

        //Convert seconds to D:HH:MM:SS time format
        uptimeSecondsTotal = process.uptime();
        uptimeDays = Math.floor(uptimeSecondsTotal / 86400);
        uptimeHours = Math.floor((uptimeSecondsTotal - (uptimeDays * 86400)) / 3600);
        uptimeMinutes = Math.floor((uptimeSecondsTotal - (uptimeDays * 86400) - (uptimeHours * 3600)) / 60);
        uptimeSeconds = Math.floor((uptimeSecondsTotal - (uptimeDays * 86400) - (uptimeHours * 3600) - (uptimeMinutes * 60)));

        //Get system memory
        totalMemoryMB = os.totalmem() / 1024000;
        freeMemoryMB = os.freemem() / 1024000;

        html=`    
        <!DOCTYPE html>
        <html>
          <head>
            <title>Node JS Response</title>
          </head>
          <body>
            <p>Hostname: ${myHostName}</p>
            <p>IP: ${ip.address()}</p>
            <p>Server Uptime: ${uptimeDays} days, ${uptimeHours} hours, ${uptimeMinutes} minutes, ${uptimeSeconds} seconds</p>
            <p>Total Memory: ${totalMemoryMB} MB </p>
            <p>Free Memory: ${freeMemoryMB} MB</p>
            <p>Number of CPUs: ${os.cpus().length}</p>
          </body>
        </html>` 
        res.writeHead(200, {"Content-Type": "text/html"});
        res.end(html);
    }
    else {
        res.writeHead(404, {"Content-Type": "text/plain"});
        res.end(`404 File Not Found at ${req.url}`);
    }
}).listen(3000);

console.log("Server listening on port 3000...");