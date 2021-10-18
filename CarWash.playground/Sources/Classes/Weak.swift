import Foundation

public class Weak<T: AnyObject> {    
    
  public weak var object: T?
    
  init (object: T) {
    self.object = object
  }
}
