load(new java.io.File(__DIR__, 'util.js').getCanonicalPath());

var pythonVersion='3.5.2'
pythonVersion='2.7.12'
var targetDir=new java.io.File(__DIR__, '../usr/lib/python/'+pythonVersion).getCanonicalFile();

if (!targetDir.exists()){
  //var url = new java.net.URL("https://www.python.org/ftp/python/3.5.1/python-3.5.1-amd64.exe");
  //var tempFile=createKnownTempFile('python-3.5.1.exe');
  //var file=downloadFile(url, tempFile)
  //$EXEC(tempFile.getAbsolutePath()+" /quiet InstallAllUsers=0 Include_pip=1 CompileAll=1 AssociateFiles=0 PrependPath=0 Shortcuts=0 InstallLauncherAllUsers=0 TargetDir="+targetDir.getAbsolutePath())
  if (pythonVersion.startsWith('2.7')){
    var url = new java.net.URL("https://www.python.org/ftp/python/"+pythonVersion+"/python-"+pythonVersion+".amd64.msi");
    var tempFile=createKnownTempFileFromUrl(url);
    var file=downloadFile(url, tempFile)
    //unzip(file, targetDir, 0);
    
    $EXEC('msiexec /a '+tempFile.getCanonicalPath()+" /qb TARGETDIR="+targetDir.getCanonicalPath())
    
    var pipUrl = new java.net.URL("https://bootstrap.pypa.io/get-pip.py");
    var pipTempFile=createKnownTempFileFromUrl(pipUrl);
    downloadFile(pipUrl, pipTempFile)
    $EXEC(new java.io.File(targetDir, 'python').getAbsolutePath()+" "+pipTempFile.getAbsolutePath())
    //https://bootstrap.pypa.io/get-pip.py

  }else{
    var url = new java.net.URL("https://www.python.org/ftp/python/"+pythonVersion+"/python-"+pythonVersion+"-embed-amd64.zip");
    var tempFile=createKnownTempFileFromUrl(url);
    var file=downloadFile(url, tempFile)
    unzip(file, targetDir, 0);
    
    var pipUrl = new java.net.URL("https://bootstrap.pypa.io/get-pip.py");
    var pipTempFile=createKnownTempFileFromUrl(pipUrl);
    downloadFile(pipUrl, pipTempFile)
    $EXEC(new java.io.File(targetDir, 'python').getAbsolutePath()+" "+pipTempFile.getAbsolutePath())
    //https://bootstrap.pypa.io/get-pip.py
  }
}
print(targetDir.getAbsolutePath());
