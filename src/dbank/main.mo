import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var currentValue: Float = 300;
  currentValue := 300;
  Debug.print(debug_show(currentValue));


  
  stable var startTime = Time.now();
  // startTime := Time.now();
  // Debug.print(debug_show(startTime));

  let id = 425422565;
  // Debug.print(debug_show(id));

  public func topUp(amount: Float) {
    currentValue +=amount;
    Debug.print(debug_show(currentValue));
  };

  public func withdraw(amount: Float) {
    let tempValue:Float = currentValue - amount;

    if (tempValue >= 0) {
      currentValue -=amount;
      Debug.print(debug_show(currentValue));
    }else {
      Debug.print("amount exceeded or invalid amount");
    }
  };

  public query func checkBalance(): async Float {
    return currentValue;

  };

  // topup();

  public func compound(){
    let currentTime = Time.now();
    let durationNs = currentTime - startTime;
    let durationS = durationNs/1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(durationS));
    startTime := Time.now();
  }  
}