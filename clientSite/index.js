var fs = require('fs');

var process = require("process");
process.chdir("/storage/sd");

console.log('hello world');
console.log('');

console.log('read the file webSiteRoot.txt');
// var contents = fs.readFileSync('webSiteRoot.txt', 'utf8');
// var contents = fs.readFileSync('file:///subs/webSiteRoot.txt', 'utf8');
// var contents = fs.readFileSync('file:///storage/sd/subs/webSiteRoot.txt', 'utf8');
var contents = fs.readFileSync('subs/webSiteRoot.txt', 'utf8');
console.log(contents);

console.log('read the file subfolder/webSiteSubfolder.txt');
var contents = fs.readFileSync('subs/subfolder/webSiteSubfolder.txt', 'utf8');
console.log(contents);
