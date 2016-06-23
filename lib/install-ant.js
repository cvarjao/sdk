load(new java.io.File(__DIR__, 'util.js').getAbsolutePath());

var targetDir=new java.io.File(__DIR__, '../usr/lib/ant/1.9.7');

if (!targetDir.exists()){
  var url = new java.net.URL("http://archive.apache.org/dist/ant/binaries/apache-ant-1.9.7-bin.zip");
  var tempFile=createKnownTempFileFromUrl(url);
  var file=downloadFile(url, tempFile)
  unzip(file, targetDir, 1);
}
print(targetDir.getAbsolutePath());
