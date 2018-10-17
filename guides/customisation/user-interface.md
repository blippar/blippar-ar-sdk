# User Interface Customisation

There are a number of ways of customising a host app's UI when interacting with the Blippar SDK.

## Strings

The Blippar SDK has a number of strings that are embedded in the UI. It is possible for a host app to modify these strings. See the following documents for the instructions and list of strings that can be changed:

[Android - Strings](../android/android-strings.md)

[iOS - Strings](../ios/ios-strings.md)

## User UI Elements

In BlippJS there is an API modify the state of UI elements called [uiVisible](https://developer.blippar.com/portal/ar-api/documentation/method/Blipp/uiVisible/). This command takes a UI element of a given name and allows a blipp developer to modify whether it is visible or not. This can be used if there are several blipps linked to the host app and buttons are needed in some scenarios but not in others.

### Registration Process

The BlipparSDK allows a host app to register UI elements which can then be targetted directly from the BlippJS script.

For example:

**Objective C**

    #define UIElement_LightButtonID 444

    // Register the element
    [[BlipparSDK sharedInstance] registerUIElement:@"lightButton" userID:UIElement_LightButtonID];
    // Set the default state
    [[BlipparSDK sharedInstance] setUIElementVisibility:@"lightButton" visible:true];


**Java**

    public enum ElementId {
        Default,
        LightButton,
        NumElements

        public static ElementId getElementFromId(int id) {
            if (id >= Default.ordinal() && id <= NumElements.ordinal()) {
                return ElementId.values()[id];
            }

            return Unknown;
        }
    };

    // Register the element
    Blippar.getSDK().registerUIElement("lightButton", ElementId.LightButton.ordinal());
    // Set the default state
    Blippar.getSDK().setUIElementVisibility("lightButton", true);

The second parameter to the `registerUIElement` call is an integer that allows for efficient comparison without string comparisons when the states change.
The default state for visible, enabled and highlights is false.

### Changing state

Once registered, a blipp can change the state of the UI element by doing the following:

    blipp.uiVisible('lightButton', false);


Internally the SDK maintains the current state of the UI element and tells the app if there are changes.

### Receiving callbacks

If the JS changes the state the app will receive a callback via the `UIElementDelegate` or `UIElementListener`.
Note here that the `userElementID` being used is the integer value passed in during `registerUIElement` to allow for efficient switching.

**Objective C**

    - (void) onUIElementsChange:(NSArray<BlipparSDKUIElementState*> *)elementStates {
        for (BlipparSDKUIElementState* elementState in elementStates) {
            const bool vis = elementState.visible;
            const bool enabled = elementState.enabled;
            
            switch(elementState.userElementID) {
                case UIElement_LightButtonID:{
                    // Set the light button to visible or gone
                    break;
                }
                default:
                    // Handle other buttons
                    break;
            }
        }
    }

**Java**

    @Override
    public void onUIElementsChanged(@NonNull UIElementList uiElementList) {
        for (UIElementState uiElement : uiElementList) {
            final bool vis = uiElement.visible();
            final UIElements.ElementId elementId = ElementId.getElementFromId(uiElement.userElementId());
            switch (elementId) {
                case LightButton:
                    // Set the light button to visible or gone
                    break;
                default:
                    // Handle other buttons
                    break;
            }
        }
    }

>![Warning Icon](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/BlipparSDK_Warning.png) If deriving from the BlipparSDKVieewController or BlipparSDKFragment don't forget to call super!

#### Blipp Contexts and User UI Elements

When a blipp starts there is often different user interface to when scanning is running.

To this end there are methods on the `BlipparSDKBlippContext`/`BlippContext` that allow elements to have their state changed only when a blipp is running.

When a blipp is active the state set on the blipp context overrides the state set during scanning. For example, setting a user element visibility to false during scanning and then when a blipp context is activated they can set it to visible:

**Objective C**

    [context setUIElementVisibility:@"lightButton" visible:true];


**Java**

    context.setUIElementVisibility("lightButton", true);

This could be done in one of the blipp lifecycle callbacks such as `onBlippLoaded` for example.

The app will now receive a callback to set the visibility.

When the blipp closes, the UI element automatically reverts back to the detection state i.e. 'lightButton' will become false in the example above.

### Unregistering the UI element

If the app no longer wants the blipp to be able to change the state of the UI element it is possible to unregister the UI element altogether:

**Objective C**

    [[BlipparSDK sharedInstance] unregisterUIElement:@"lightButton"];

**Java**

    Blippar.getSDK().unregisterUIElement("lightButton");
