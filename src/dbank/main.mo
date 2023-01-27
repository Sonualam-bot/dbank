import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";
//this imports the mokoto base library

//.this block of code is referred to as canister
actor DBank {

  //variable is created
  stable var currentValue : Float = 300;
  //and to further change this we need to assign by
  //using := colon+equal to
  currentValue := 300;
  Debug.print(debug_show (currentValue));

  stable var startTime = Time.now();
  startTime := Time.now();
  Debug.print(debug_show (startTime));

  //here a contant is created using let
  let id = 3251554135;

  //and now to print this we need to use
  //Debug command and also this debug command
  //expects some text not var value therefore to show
  //output use debug_show() function

  // Debug.print(debug_show (currentValue));
  // Debug.print(debug_show (id));

  public func topUp(amount : Float) {
    currentValue += amount;
    Debug.print(debug_show (currentValue));
  };

  public func withdraw(amount : Float) {
    let tempValue : Float = currentValue - amount;
    if (tempValue >= 0) {
      currentValue -= amount;
      Debug.print(debug_show (currentValue));
    } else {
      Debug.print("Amount too large, currentValue is less than zero.");
    };
  };

  public query func checkBalance() : async Float {
    return currentValue;
  };

  //this function is used to track how much time has elapsed
  public func compound() {
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS = timeElapsedNS / 1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
    startTime := currentTime;
  };

};

// dfx canister call dbank topUp ()
