# ctrlh-door-ha

Take a log message for one of the doors at CTRLH, parse it and post it to Home Assistant as structured data using a web hook.

## Structure

Takes a message like:

Jul 19 14:05:04 unit3 accesscontrol[20282]: Chris Smith has opened unit3 back door


{
  "door": "unit3 back door"
  "section": 3,
  "action": "opened",
  "person": "Chris Smith",
  "timestamp": "Jul 19 14:05:04 2022",
  "text": "Jul 19 14:05:04 unit3 accesscontrol[20282]: Chris Smith has opened unit3 back door"
}
