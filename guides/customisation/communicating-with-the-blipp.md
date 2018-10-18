# Communicating with the Blipp

One of the most powerful features of the Blippar SDK is the ability for the host app to communicate with the blipp. It is possible to call a specific function in the running blipp, with optional JSON data and also have the blipp send events back to the host app. 

Using this mechanism it is possible to create complex custom behaviour or even have a blipp drive native components directly. 

## Calling into the blipp from the app

Once a blipp is launched, either your own app or the BlipparSDKViewController/BlipparSDKFragment cache the BlippContext. On each context there is a method to allow a user to execute a given BlippJS function.

**Objective C**

    NSString* event = @"jsFunction";
    NSArray *values = @[@"{\"key\":\"value\"}"];

    [blippContext callScriptFunction:event values:values];

**Java**

    String event = "jsFunction";
    ArrayList<String> names = new ArrayList<>(1);
    values.add("{\"key\":\"value\"}");

    blippContext.callScriptFunction(event, values);

In the examples above a script function called `jsFunction` is called with named parameter `param1` which has a JSON string as a value. JS currently doesn't support named parameters, this support is there for possible other scripting languages. It can be left as null/nil if desired.

In the BlippJS the function executed will be as follows:

    blipp.jsFunction = function(jsonValue) {
        if (jsonValue !== undefined) {
            var json = JSON.parse(jsonValue);
            // Do something with the JSON
        }
    }

The blipp runs in a different thread to the UI thread, so calls into the blipp aren't executed immediately but delayed for execution on the appropriate thread.

## Calling the host app from the blipp

The BlippJS is able to use the App `sendAppEvent` function.

To access this feature you need to use the BlippJS library `1.9.1`. You can set this in the package.json associated with your blipp.
If running pre-1.9.1 you can use `blipp.getApp().dispatchEvent` instead.

 This function takes an event name, and an optional JSON string.

    // No json passsed to the app
    blipp.getApp().sendAppEvent("event1");
    // JSON passed up to the app
    blipp.getApp().sendAppEvent("event2", JSON.stringify({'parameter1' : 123, 'parameter2': false, 'parameter3': 'some text', 'subarray': ['mixed', 'array', true, 123]}));

To receive events in the host app you need to register as a Blipp delegate or listener. The `onBlippEvent` callback is invoked on each registered blipp delegate or listener and is called in the same sequence that it was registered with the SDK. The first to return true causes the event to stop propogating.

>![Info Icon](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/BlipparSDK_Info.png) 
>Events arrive in on a background thread, to minimise latency with the BlippJS. Do not perform UI operations on a background thread or your app will crash!

**Objective C**

    - (BOOL) onBlippEvent: (nonnull BlipparSDKBlippContext *)context eventName:(nonnull NSString*)name jsonData:(nullable id)jsonData {
        BOOL handled = YES;
        if ([name isEqualToString:@"event1"]) {
            // Handle event1
        } else if ([name isEqualToString:@"event2"]) {
            NSDictionary* json = (NSDictionary*)jsonData; 
            // Handle event2
        } else {
            handled = NO;
        }
        return handled;
    }

**Java**

    @Override
    public boolean onBlippEvent(BlippContext context, String event, JSONObject jsonData) {
        // event == "event1" or event == "event2"
        boolean handled = true;
        switch (event) {
            case "event1":
                // Handle event1
                break;
            case "event2":
                // Handle event2, jsonData contains the JSON passed up from JS
                break;
            default:
                handled = false;
                break;
        }

        return handled;
    }

The blipp runs in a different thread to the UI thread, callbacks into the app always happen on the UI thread. Therefore calls from the blipp to the host app aren't executed immediately.