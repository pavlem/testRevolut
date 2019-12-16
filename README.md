# testRevolut Instructions
There is no special stuff required, just start the project and build since there are no third party libs. Add your bundle ID to build on real iPhone device. 

I spent on the assignment about 8 hours. Additional 1h I spent on XCode 11 problems, but that is not related to this assignment (arbitrary XCode crashing etc but it happens on other projects).

# User Interface:
- It is as in the video demo, first screen which when there are no currencies selected, has an ADD button in the center. 
- On Add Currency, List of currencies appears modaly for the first choice, and it is pushed for the second choice. After second is selected, user is returned to the main screen 
- There is swipe to delete to delete a currency
- Currencies are refreshed every 1s, but when adding a new one or swiping to delete, that refresh is paused. 
- Currencies are persisted between launches

# Architecture:
- MMVM used as an app design pattern
- Networking module is independent and can be implemented anywhere. It is based on apple’s “URLSession”, but in this case I made it very very short. Usually I make it more robust with Error handling, parsing, services etc...
- There are Unit tests
- File organization:
	- App - App related data
	- Models - models
	- ViewModels - view models 
	- Lib - networking module under “Networking” and image caching helper class
	- Sections - all screens view controllers
	- Resources - storyboards, strings, images
- NSUserDefaults used for persistance 

# Future improvements:
- UI always needs improvements :)
- Internet reachability (not to fetch if no net)
- more unit tests
- persitance via core data or realm. At the moment NSUserDefaults is used
