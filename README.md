# Mutli Delegate

**Muilt Delegate** is based on delegate pattern but the difference is Multi Delegate is used for one to many communication where as delegate pattern is used for one to one communication. Whenever you have a scenario where multiple delegate objects are interested to listen events from same source then you can opt to use this Multi Delegate pattern.

## Requirements

- iOS 13.0+ 
- Xcode 11.0+
- Swift 5+

## Features

- [x] One to Many Communication
- [x] Support Generic Protocol

## Usage

1. Import the module

```swift
import MulticastDelegateSwift
```

2. Create Your DelegateProtocol

```swift
protocol DelegateProtocol {
    func done()
}
```

3. Instantiate MultiDelegate with your Delegate Protocol

```swift
let multicastDelegate = MultiDelegate<DelegateProtocol>()
```

4. Register your delegate to recieve delegate events

```swift
multicastDelegate.add(delegate: self)
```

5. Fire delegate event and notify all the delegates.

```swift
multicastDelegate.invoke { delegate in delegate.done() }
```
