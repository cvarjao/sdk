load(new java.io.File(__DIR__, 'util.js').getCanonicalPath());
var pythonVersion=arguments[0]
var targetDir=new java.io.File(arguments[1]).getCanonicalFile();

if (!targetDir.exists()){
  if (pythonVersion.startsWith('2.7')){
    var url = new java.net.URL("https://www.python.org/ftp/python/"+pythonVersion+"/python-"+pythonVersion+".amd64.msi");
    var tempFile=createKnownTempFileFromUrl(url);
    var file=downloadFile(url, tempFile)
    //unzip(file, targetDir, 0);
    
    $EXEC('msiexec /a '+tempFile.getCanonicalPath()+" /qn TARGETDIR="+targetDir.getCanonicalPath())
    
    //PIP included
    $EXEC(new java.io.File(targetDir, 'python').getAbsolutePath()+" -m pip install virtualenv")
  }else if (pythonVersion.startsWith('3.5')){
    var packages=[
        "https://www.python.org/ftp/python/"+pythonVersion+"/amd64/core.msi",
        "https://www.python.org/ftp/python/"+pythonVersion+"/amd64/exe.msi",
        "https://www.python.org/ftp/python/"+pythonVersion+"/amd64/lib.msi",
        "https://www.python.org/ftp/python/"+pythonVersion+"/amd64/launcher.msi",
        "https://www.python.org/ftp/python/"+pythonVersion+"/amd64/tcltk.msi"]
    for (i = 0; i < packages.length; i++) {
      var url = new java.net.URL(packages[i]);
      var tempFile=createKnownTempFileFromUrl(url);
      downloadFile(url, tempFile)
      $EXEC('msiexec /a '+tempFile.getCanonicalPath()+" /qn TARGETDIR="+targetDir.getCanonicalPath())
    }
    
    var pipUrl = new java.net.URL("https://bootstrap.pypa.io/get-pip.py");
    var pipTempFile=createKnownTempFileFromUrl(pipUrl);
    downloadFile(pipUrl, pipTempFile)
    $EXEC(new java.io.File(targetDir, 'python').getAbsolutePath()+" "+pipTempFile.getAbsolutePath())
    $EXEC(new java.io.File(targetDir, 'python').getAbsolutePath()+" -m pip install virtualenv")
  }
}
