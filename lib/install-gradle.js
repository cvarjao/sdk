load(new java.io.File(__DIR__, 'util.js').getAbsolutePath());

var targetVersion=arguments[0]
var targetDir=new java.io.File(arguments[1]).getCanonicalFile();

if (!targetDir.exists()){
  var url = new java.net.URL("https://services.gradle.org/distributions/gradle-"+targetVersion+"-bin.zip");
  var tempFile=createKnownTempFileFromUrl(url);
  downloadFile(url, tempFile)
  unzip(tempFile, targetDir, 1);
}
