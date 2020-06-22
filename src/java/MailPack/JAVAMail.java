/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MailPack;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

public class JAVAMail {
    
    public static String SendMail(String to, String name, String homeaddress){
        String result="777999888";
        final String from = "mwt.wjd.f19@gmail.com";
        final String pass = "MWT-WJD-Project";
        final String subject="Case Request was CONFIRMED";
        final String body="Kindly note that patient "+name+" has been confirmed as POSITIVE and the patient must visit the nearest Health center availabe to "+homeaddress+" ... Stay Safe and Follow health instructions";
        String host = "smtp.gmail.com";
        String port = "587";
        Properties props = new Properties();
        props.put("mail.smtp.port", port);
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.host", host);
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.user", from);
        props.put("mail.password", pass);
        Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, pass);
            }
        });
        try {
            MimeMessage message = new MimeMessage(mailSession);
            message.setFrom(new InternetAddress(from));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(subject);
            message.setText(body);
            Transport.send(message);
            result = "An email was sent successfully to: "+to;
        } catch (MessagingException mex) {
            mex.printStackTrace();
            result = "Error: unable to send mail....";
        }
        return result;
    }
}
