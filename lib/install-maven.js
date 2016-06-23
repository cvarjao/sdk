load(new java.io.File(__DIR__, 'util.js').getAbsolutePath());

var targetDir=new java.io.File(__DIR__, '../usr/lib/maven/3.3.9');

if (!targetDir.exists()){
  var file=getLocalMavenArtifact({group:'org.apache.maven', module:'apache-maven', version:'3.3.9', extension:'zip', classifier:'bin'})
  unzip(file, targetDir, 1);
}
print(targetDir.getAbsolutePath());
