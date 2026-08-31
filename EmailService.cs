using System;
using System.Net;
using System.Net.Mail;

namespace ChildVaccine
{
    public class EmailService
    {
        public static void SendEmail(string toEmail, string subject, string body)
        {
            try
            {
                MailMessage mail = new MailMessage();

                mail.From = new MailAddress("sakshikhot1305@gmail.com");
                mail.To.Add(toEmail); // ✅ dynamic receiver
                mail.Subject = subject;
                mail.Body = body;
                mail.IsBodyHtml = true;

                SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                smtp.Credentials = new NetworkCredential(
                    "sakshikhot1305@gmail.com",
                    "lkob nobv nnkf xnrd"
                );

                smtp.EnableSsl = true;

                smtp.Send(mail); // 🔥 IMPORTANT LINE
            }
            catch (Exception ex)
            {
                // Show error on page (for debugging)
                throw new Exception("Email error: " + ex.Message);
            }
        }
    }
}