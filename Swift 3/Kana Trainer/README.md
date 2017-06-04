# Kana Fighter

A Japanese quiz app that makes use of Protocols, Delegates, Segues and more.


## Finished App
![View Controller (Home)](https://github.com/Mycroft1891/swift_box/Images/kana-home.JPG)

In the home screen the user can choose between two play modes for different symbols (Katakana and Hiragana).
If the user doesn't know how to play, there is a button that shows the 'How to Play' view with the rules.
Finally the user can share their score from the home view via Facebook or Twitter. When the game ends, the home controller acts as the delegate for the Play Controller and receives the User's score. In the share action, the text is pre-populated with the User's score.

![RulesViewController (How to Play)](https://github.com/Mycroft1891/swift_box/Images/kana-how-to.JPG)

The how to play view controller is straight forward. The use is presented with a TextField showing the rules. At the bottom is a Pagination Controller but the UX was not great because it requires fiddling with the small ellipses so the TextField has a two Gesture Recognizers that that alter the Pagination Controller. This allows the user to swipe on the entire TextField rather than on the ellipses themselves.


![Kana ViewController (Play)](https://github.com/Mycroft1891/swift_box/Images/kana-play.JPG)

When the user chooses a game mode (Katakana or Hiragana) the Home ViewController sends a boolean value to let the Game ViewController know which game mode the user chose. 4 random choices are generated and a random answer is picked from among the choices. The user has one try to get the right character and if he/she fails, the live count drops by 1. For every right answer the Score count increases by 1 and the count down gains 2 seconds. The game ends if the user has no more lives or the count down reached 0 (zero). When that happens the Controller sends the game information via the delegate to the Home ViewController and dismisses the Play ViewController.

![View Controller (Game Over)](https://github.com/Mycroft1891/swift_box/Images/kana-game-over.JPG)

When the game ends, the Home ViewController acts as the Game Over screen. It acts as the delegate and receives the user's game information. The share action pre-populates the text with the user's score.
