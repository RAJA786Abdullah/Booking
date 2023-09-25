using System;
using System.Diagnostics;
using System.IO;

public static class Logger
{
    
    private static readonly string LogFilePath = @"D:\daily.log";

    public static void LogInformation(string message)
    {
        Log("INFO", message);
    }

    public static void LogError(string message, Exception exception = null)
    {
        Log("ERROR", message, exception);
    }

    private static void Log(string level, string message, Exception exception = null)
    {
        try
        {
            string logEntry = $"{DateTime.Now:yyyy-MM-dd HH:mm:ss} [{level}] - {message}";
            if (exception != null)
            {
                logEntry += Environment.NewLine + exception.ToString();
            }

            Trace.WriteLine(logEntry);

            using (StreamWriter sw = File.AppendText(LogFilePath))
            {
                sw.WriteLine(logEntry);
            }
        }
        catch (Exception ex)
        {
            // Handle any exceptions or log them to another source
        }
    }
}
