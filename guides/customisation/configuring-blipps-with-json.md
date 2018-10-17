# Configuring Blipps with JSON

## Associating the JSON

This feature allows a user to change blipp contents based on the user profile or specific settings, selected by the host app.
When configured, a block of JSON can be associated with a blipp and read in the `onCreate` function of the blipp.
This can be used for a variety of purposes.
For example, if there are many markers associated with the blipp but each marker has some particular configuration data, e.g. images, video urls, text etc. 
Another option is to have template blipp(s) and pass in JSON data that allows the blipp to layout and behaviour.
The JSON configuration is quite flexible, it is possible to associate JSON with _all_ blipps, a blipp with a specific blipp address (and all markers), a specific marker (which may be associated with many blipps) or a specific marker and specific blipp address.

To associated JSON with a blipp you can use the `setConfigJSONForEntity` function. The first parameter of this function is a `EntityDescriptor`, this is created programatically:

**Objective C**

    // Matches on all markers for blipp with address 'abcdefgh'
    NSString* blippAddress = @"abcdefgh";
    BlipparSDKEntityDescriptor *addressOnly = [BlipparSDKEntityDescriptor entityWithAddress:blippAddress];

    // Matches on blipp with address 'abcdefgh' and marker '12345'
    NSString* blippAddress = @"abcdefgh";
    NSString* blippMarkerId = @"12345";
    BlipparSDKEntityDescriptor *addressAndMarker = [BlipparSDKEntityDescriptor entityWithAddress:blippAddress andMarkerID:blippMarkerId];

    // Matches on marker '12345' for any blipp
    NSString* blippAddress = @"";
    NSString* blippMarkerId = @"12345";
    BlipparSDKEntityDescriptor *markerOnly = [BlipparSDKEntityDescriptor entityWithAddress:blippAddress andMarkerID:blippMarkerId];

    // Matches on all blipps and markers
    NSString* blippAddress = @"";
    NSString* blippMarkerId = @"";
    BlipparSDKEntityDescriptor *allBlipps = [BlipparSDKEntityDescriptor entityWithAddress:blippAddress andMarkerID:blippMarkerId];

**Java**

    // Matches on all markers for blipp with address 'abcdefgh'
    String blippAddress = "abcdefgh";
    EntityDescriptor addressOnly = EntityDescriptorFactory.createFromAddress(blippAddress);

    // Matches on blipp with address 'abcdefgh' and marker '12345'
    String blippAddress = "abcdefgh";
    String blippMarkerId = "12345";
    EntityDescriptor addressAndMarker = EntityDescriptorFactory.createFromParameters(blippAddress, blippMarkerId);

    // Matches on marker '12345' for any blipp
    String blippAddress = "";
    String blippMarkerId = "12345";
    EntityDescriptor markerOnly = EntityDescriptorFactory.createFromParameters(blippAddress, blippMarkerId);

    // Matches on all blipps and markers
    String blippAddress = "";
    String blippMarkerId = "";
    EntityDescriptor allBlipps = EntityDescriptorFactory.createFromParameters(blippAddress, blippMarkerId);

Once the entity is created the next step is to pass in the JSON using `setConfigJSONForEntity`, it can be passed as either a string or a platform JSON object, a `JSONObject` on Android and `NSDictionary` on iOS.

## Using the JSON

In a blipp you can access the associated data using the `blipp.getBlippData()` function, of course you'll need to call `JSON.parse` also if you want to use it.

Alternatively when the blipp is launched the `onCreate` receives a JSON string that contains various creation parameters. One of these is `associatedData`, the blipp needs to read this data by parsing the JSON and pulling out the JSON.

    scene.jsonData = null;

    scene.onCreate = function(createJson)
    {	
        json = JSON.parse(createJson);
        if (json.hasOwnProperty("associatedData")) {
            console.log("Associated data: '" + json["associatedData"] + "'");
            scene.jsonData = json["associatedData"];
            
            // Second parse is needed for JSON that is nested inside creation JSON
            var parsedJSON = JSON.parse(scene.jsonData);

            // Use the associated json data
        }
    }