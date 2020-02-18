//
//  MultiDelegate.swift
//  MultiDelegate
//
//  Created by Priya Chopra on 1/2/2020.
//  Copyright © 2020 Priya Chopra. All rights reserved.
//

import UIKit

/**
 MultiDelegate class invoke event to multiple class that conforming to delegate added in multi delegate
 - Remark: MultiDelegate class is generic class that can take any delegate.
 */

final public class MultiDelegate<T> {
    
    /// It contains array of delegates of type Weak
    private var delegates = [Weak]()
    
    /// Serial queue which helps in keeping all public operations syncronised and thread safe
    private var syncQueue = DispatchQueue.init(label: "muticastdelegate")
    
    /// It returns the count of delegates array
    public var count: Int {
        delegates.count
    }
    
    /**
     This function adds the provided delegate to multi delegates so that it can be
     notified later whenever a delegate events occurs.
     
     - Parameter delegate: Object which has to be added as delegate
     - See Also: remove(delegate: T)
     */
    public func add(delegate: T) {
        self.syncQueue.sync {
            let weak = Weak.init(value: delegate as AnyObject)
            if !(self.delegates.contains(weak)) {
                self.delegates.append(weak)
            }
        }
    }
    
    /**
     This function removes the provided delegate from multi delegates
     - Parameter delegate: Object which has to be removed as delegate
     - Note: Call this method from deintializer of the class that confirm to provided delegate
     */
    
    public func remove(delegate: T) {
        self.syncQueue.sync {
            let weak = Weak.init(value: delegate as AnyObject)
            self.delegates.removeAll(where: {$0 == weak})
        }
    }
    
    /**
     This function is used to invoke an event to each delegate in multi delegates
     - Parameter closure - It takes object of delegate and returns nothing
     */
    
    public func invoke(closure: (T) -> Void) {
        for delegate in self.delegates {
            closure(delegate.value as! T)
        }
    }
}

private class Weak: Equatable {
    
    /// Its weak variable of type Any Object
    weak var value: AnyObject?
    
    init(value: AnyObject) {
        self.value = value
    }
    
    static func == (lhs: Weak, rhs: Weak) -> Bool {
        lhs.value === rhs.value
    }
}
