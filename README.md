# Grindr User Agent Tools

Tools to parse Http User Agents for Grindr supported platforms.

Because many services receive requests with a User Agent, this library contains the currently supported User Agent 
formats and tools to extract data elements from them.

## User Agent parsing

To obtain a UserAgent object, use `UserAgentParser.parse(<userAgentString>)`.

iOS: For example `Grindr3/3.28.5.6349.6433 (6349.6433; iPhone; iOS 11.3.1)`
Android: For example ``
All other user agents are not supported, so `null` is returned as the result of this call.

## Version checking

To check a version, use the `VersionChecker.isVersionAtLeast()` methods. 
These methods compare Semantic Version numbers (`major.minor.patch.build`).
