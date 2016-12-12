load(new java.io.File(__DIR__, 'util.js').getAbsolutePath());


var targetVersion=arguments[0]
var targetDir=new java.io.File(arguments[1]).getCanonicalFile();

if (!targetDir.exists()){
  var url = new java.net.URL("https://nodejs.org/dist/v"+targetVersion+"/win-x64/node.exe");
  var tempFile=createKnownTempFileFromUrl(url);
  var file=downloadFile(url, tempFile);
  var nodejsExe=new java.io.File(targetDir, 'bin/node.exe');
  
  //print(getChecksumFromString(url.toString()));
  nodejsExe.getParentFile().mkdirs();
  copyFile(file, nodejsExe);
  
}
//print(targetDir.getAbsolutePath());
