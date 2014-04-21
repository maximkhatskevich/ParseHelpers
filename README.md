ParseHelpers
===

[Parse.com][0] iOS and OSX SDK helpers. Based on Parse SDK for iOS/OSX.

> **NOTE:**
> The author of this library has no relation to [Parse.com][0].

iOS support
---

This library supports iOS 5 and above. Tested on real projects for iOS 6 and iOS 7.

OS X support
---

This library should support Parse OSX SDK out of the box, but didn't test it yet. If you have a real OSX project based on Parse OSX SDK - it would be great if you test this library on your project and let me know if it works well or not.

How to install
---

This library has been implemented as staic library. You can install it into your project as a pod via [CocoaPods][1] (recommended) OR add as a git submodule (it should work, but didn't test yet).

How to install via **CocoaPods**
---

- Add `pod "Parse-SDK-Helpers"` to your Podfile to install generic helpers.
- Add `pod "Parse-SDK-Helpers/UserExt"` to your Podfile to install `PFUser` class extention called `PFUserExt`.

How to use
---

- Import `"ParseHelpers.h"` to use generic helpers.
- Import `"PFUserExt.h"` to use extended version of `PFUser` class.

How to contribute
---

Feel free to fork this repo and add any reusable functionality to improve the way iOS/OSX developers may work with Parse SDK.

[0]: https://parse.com
[1]: http://cocoapods.org
