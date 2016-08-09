load(new java.io.File(__DIR__, 'util.js').getCanonicalPath());
var targetVersion=arguments[0]
var targetDir=new java.io.File(arguments[1]).getCanonicalFile();

if (!targetDir.exists()){
  var file=getLocalMavenArtifact({group:'org.eclipse.jgit', module:'org.eclipse.jgit.pgm', version:targetVersion, extension:'sh'})
  targetDir.mkdirs();
  copyFile(file, new java.io.File(targetDir, 'jgit-sh.jar'))
}
