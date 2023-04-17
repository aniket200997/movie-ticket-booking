using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Net.Mail;
/// <summary>6
/// 
/// Summary description for Utility
/// </summary>
public class Utility
{
    public Utility()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public String sendMail(String to, String subject, String body)
    {
        String from, pass;
        from = "movieportal@yahoo.com";
        pass = "milindbane123";
        String msg = "Mail Send Successfully";
        try
        {
            MailMessage Msg = new MailMessage();
            // Sender e-mail address.
            Msg.From = new MailAddress(from);
            // Recipient e-mail address.
            Msg.To.Add(to);
            Msg.Subject = subject;
            Msg.Body = body;
            // your remote SMTP server IP.
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.mail.yahoo.com";
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential(from, pass);
            smtp.EnableSsl = true;
            smtp.Send(Msg);
            Msg = null;
            System.Threading.Thread.Sleep(5000);
        }
        catch (Exception ex)
        {
            msg = ex.ToString();
        }
        return msg;
    }
}