//
//  MailViewController.swift
//  BaseIOSApp
//
//  Created by Владислав Климов on 09.03.2021.
//

import UIKit
import MessageUI

class MailViewController: UIViewController {

    // MARK: - IBOutletes
    
    @IBAction func sendMessageButtonPressed(_ sender: UIButton) {
        sendMessage()
    }
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension MailViewController: MFMailComposeViewControllerDelegate {
    
//    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
//        controller.dismiss(animated: true)
//    }
//
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
         switch result {
         case .cancelled:
             print("Mail cancelled")
         case .saved:
             print("Mail saved")
         case .sent:
             print("Mail sent")
         case .failed:
             print("Mail sent failure")
         default:
             break
         }
        self.dismiss(animated: true, completion: nil)
      
    }
}

private extension MailViewController {
    
    func sendMessagee() {
        guard MFMailComposeViewController.canSendMail() else {
            print("fuck")
            return
        }
        
        let mail = MFMailComposeViewController()
        mail.mailComposeDelegate = self
        present(mail, animated: true, completion: nil)
    }
    
    func sendMessage() {
         let recipientEmail = "test@email.com"
         let subject = "Тест"
         let body = "Отправляем какое-то тестовое сообщение на электронную почту из ios iOS! :)"

         if MFMailComposeViewController.canSendMail() {
             let mail = MFMailComposeViewController()
             mail.mailComposeDelegate = self
             mail.setToRecipients([recipientEmail])
             mail.setSubject(subject)
             mail.setMessageBody(body, isHTML: true)

             present(mail, animated: true)
         } else if let emailUrl = createEmailUrl(to: recipientEmail, subject: subject, body: body) {
             UIApplication.shared.open(emailUrl)
         }
     }

     private func createEmailUrl(to: String, subject: String, body: String) -> URL? {
         let subjectEncoded = subject.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
         let bodyEncoded = body.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!

         return URL(string: "mailto:\(to)?subject=\(subjectEncoded)&body=\(bodyEncoded)")
     }
    
}
