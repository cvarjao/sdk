
function sayHello(){
  print('Hello there!');
}

function printSystemProperties(){
  var System = Java.type("java.lang.System");
  systemProperties = System.getProperties();
  systemPropertiesKeys = systemProperties.keys();
  while (systemPropertiesKeys.hasMoreElements()) {
    var key = systemPropertiesKeys.nextElement();
    var value = systemProperties.get(key);
    System.out.println(key + ": " + value);
  }
}

function createKnownTempFileFromUrl(url){
  return createKnownTempFile(getFileNameFromUrl(url));
}
function createKnownTempFile(name){
  return new java.io.File(__DIR__, '../var/tmp/'+name);
}

function downloadFile(url, file){
  if (!file.exists()){
    //print('Downloading')
    file.getParentFile().mkdirs();
    var rbc = java.nio.channels.Channels.newChannel(url.openStream());
    var fos = new java.io.FileOutputStream(file);
    fos.getChannel().transferFrom(rbc, 0, java.lang.Long.MAX_VALUE);
    rbc.close();
    fos.close();
  }
  return file;
}

function getFileNameFromUrl(url){
  var urlFilePath=url.getFile();
  return urlFilePath.substring( urlFilePath.lastIndexOf('/')+1, urlFilePath.length() );
}
function getLocalMavenArtifact(artifact){
  var groupId=artifact.group;
  var moduleId=artifact.module;
  var artifactId=artifact.artifact||artifact.module;
  var version=artifact.version;
  var extension=artifact.extension?('.'+artifact.extension):'';
  var classifier=artifact.classifier?('-'+artifact.classifier):'';
  
  var groupIdWithSlashes=groupId.replaceAll('\\.', '/');
  var artifactFileName=artifactId+'-'+version+classifier+extension;
  var url = new java.net.URL("http://central.maven.org/maven2/"+groupIdWithSlashes+"/"+moduleId+'/'+version+'/'+artifactFileName);
  var file=createKnownTempFileFromUrl(url);
  
  downloadFile(url, file);
  
  return file;
}

function unzip(sourceFile, targetDirectory, cutDirectories){
  var zipFile=new java.util.zip.ZipFile(sourceFile);
  var zipFileEntries=zipFile.entries();
  
  //print('Extracting:'+sourceFile)
  while (zipFileEntries.hasMoreElements()){
    var zipEntry = zipFileEntries.nextElement();
    var zipEntryInputStream=zipFile.getInputStream(zipEntry);
    var outFilePath=zipEntry.getName().split('/').slice(cutDirectories).join('/');
    
    
    //print(outFilePath);
    if (outFilePath.length > 0){
      var zipEntryFile=new java.io.File(targetDirectory, outFilePath)
      //print('extracting:'+outFilePath);
      
      if (zipEntry.isDirectory()){
        zipEntryFile.mkdirs();
      }else{
        zipEntryFile.getParentFile().mkdirs();
        var fos = new java.io.FileOutputStream(zipEntryFile);
        var rbc = java.nio.channels.Channels.newChannel(zipEntryInputStream);
        fos.getChannel().transferFrom(rbc, 0, java.lang.Long.MAX_VALUE);
        fos.close();
        rbc.close();
      }
    }
    zipEntryInputStream.close();
  }
}