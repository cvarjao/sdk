load(new java.io.File(__DIR__, 'util.js').getAbsolutePath());

var targetDir=new java.io.File(__DIR__, '../usr/lib/groovy/2.4.7');

if (!targetDir.exists()){
  var file=getLocalMavenArtifact({group:'org.codehaus.groovy', module:'groovy', version:'2.4.7', artifact:'apache-groovy-binary', extension:'zip'})
  unzip(file, targetDir, 1);
}
print(targetDir.getAbsolutePath());
