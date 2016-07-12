load(new java.io.File(__DIR__, 'util.js').getAbsolutePath());

var targetDir=new java.io.File(__DIR__, '../usr/lib/orientdb/2.2.3').getCanonicalFile();

if (!targetDir.exists()){
  var file=downloadMavenArtifact({group:'com.orientechnologies', module:'orientdb-community', version:'2.2.3', extension:'zip'})
  
  unzip(file, targetDir, 1);
}
print(targetDir.getAbsolutePath());
