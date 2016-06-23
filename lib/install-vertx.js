load(new java.io.File(__DIR__, 'util.js').getAbsolutePath());

var targetDir=new java.io.File(__DIR__, '../usr/lib/vertx/3.2.1');

if (!targetDir.exists()){
  var url = new java.net.URL("https://bintray.com/artifact/download/vertx/downloads/vert.x-3.2.1.zip");
  var tempFile=createKnownTempFileFromUrl(url);
  var file=downloadFile(url, tempFile)
  unzip(file, targetDir, 1);
}
print(targetDir.getAbsolutePath());
