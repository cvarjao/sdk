load(new java.io.File(__DIR__, 'util.js').getAbsolutePath());

var targetDir=new java.io.File(__DIR__, '../usr/lib/node/4.4.7').getCanonicalFile();

if (!targetDir.exists()){
  var url = new java.net.URL("https://nodejs.org/dist/v4.4.7/win-x64/node.exe");
  var tempFile=createKnownTempFileFromUrl(url);
  var file=downloadFile(url, tempFile);
  var nodejsExe=new java.io.File(targetDir, 'bin/node.exe');
  nodejsExe.getParentFile().mkdirs();
  copyFile(file, nodejsExe);
  
  var npmUrl = new java.net.URL("https://nodejs.org/download/release/npm/npm-1.4.12.zip");
  var npmTempFile=createKnownTempFileFromUrl(npmUrl);
  downloadFile(npmUrl, npmTempFile)
  unzip(npmTempFile, targetDir, 0);
  
  new java.io.File(targetDir, 'npm.cmd').delete();
}
print(targetDir.getAbsolutePath());
