load(new java.io.File(__DIR__, 'util.js').getAbsolutePath());


var targetVersion=arguments[0]
var targetDir=new java.io.File(arguments[1]).getCanonicalFile();

if (!targetDir.exists()){
  var npmUrl = new java.net.URL("https://nodejs.org/download/release/npm/npm-"+targetVersion+".zip");
  var npmTempFile=createKnownTempFileFromUrl(npmUrl);
  downloadFile(npmUrl, npmTempFile)
  targetDir.mkdirs();
  unzip(npmTempFile, targetDir, 0);
  
  //new java.io.File(targetDir, 'npm.cmd').delete();
}
//print(targetDir.getAbsolutePath());
