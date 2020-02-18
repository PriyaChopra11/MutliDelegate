# Mutli Delegate

This framework fire event to multipe classes that are added in multi delegate.  

## Usage

1. Import the module
   import MulticastDelegateSwift
  
2. Add to your class: 

     let multicastDelegate = MultiDelegate<MyProtocol>()
     
3.  Other classes must add as a delegate: multicastDelegate.addDelegate(self)

     When you need to notify your delegates: multicastDelegate.invoke { delegate in delegate.done() }


 ## Example

protocol MessageDelegate {

func sendMessage(msg: String)
func recieveMessage(msg: String)

}

class Message: MessageDelegate {

func sendMessage(msg: String) {
print(msg)
}
func recievedMessage() {
print(msg)
}
}

class MessageHandler {

 var messageDelegate = MultiDelegate<MessageDelegate>.init()
 
 override func viewDidLoad() {
     super.viewDidLoad()
     let messager = Message.init()
     messageDelegate.add(messager)
     messageDelegate.invoke {
     delegate in
     delegate.didReceivedMessage(message: "Hi whatsapp")
 }
  
}

