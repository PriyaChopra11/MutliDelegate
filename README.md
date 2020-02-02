# Bit-Movin Event Bus

**BMEventBus** is a coco framework which provides an publish/subscribe event flow. User can use this library to achieve publish/subscribe event flow with minimum lines of code.

## Features
- Thread Safe
- Duplicacy of subscribers not allowed
- Priorities can be assigned to important subscribers.
- Custom data can be sent with every Event.
- Subscribers can be un-registered.
- Tested Via Unit Testing.


## Subscriber

A `subscriber` can simply conforms the `BMMessageSubscriber` Protocol and implement it's requirements. User can provide the list events that it is interested in through `eventsToSubscribe` variable. 

Subscriber also must implement  `didReceiveEvent` whenever any publish will publish the event you are interested  in you will be notfied via this method.

## Event Bus

User can use the  `BMEventBus` in 2 ways :-

1. By using the shared instance of `BMCommunicationBus` -> `BMEventBusManager.shared`
2. By creating a new instance of the event bus using ` BMEventBusManager.getNewEventBus(with queueName: String)`  method.

### Register Subscriber

User can register subscriber by calling `add` function on `BMEventBus`. User can pass subscriber object and priority as arguments. Subscriber with high priority will be notified first when an event is fired. Default priority is high.
Usage shown below :-

```swift

add(subscriber: self, with priority: .high)

```

### UnRegister Subscriber

When a subscriber is no longer interested in listening events It can be removed as a listener from event bus by calling `remove`
function as shown below.

```swift

remove(subscriber: self) 

```
### DidReceiveEvent

When an event is published subscriber is notified via `didReceiveEvent(for event: String, with data: [String: Any]?)`.
In this function you will get the event for which the function has been fired and custom data corresponding to the event.
