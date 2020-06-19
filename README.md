# WWDC2020 Submission: a playground on security
## Description

The topics of the playground are privacy and security when exchanging messages. I did it to explain in an easy and maybe a bit playful manner some of the differences between **symmetric** and **asymmetric cryptography** applied to that context.

In particular there is a graphical simulation of a **"man in the middle" attack**, in which I tried to explain what are some possible pre-requisites for being exposed to an attack of that type, and some possible consequences for the victims. After that simulation there is an explanation for a possible fix. I used only everyday objects like padlocks and keys in the entire playground because I think it’s a good way to begin to understand what are the issues and the remedies when talking about cryptography and about security.

I’ve used **SwiftUI** for the GUI and AVFoundation for the audio effects. I coded the entities used in the playground following some of the **objects oriented programming principles**, and exploited the overloading and the type-checking features of the swift language to create items and behaviors as close to reality as possibile.

## Content of the playground
### 1 - Introduction
Privacy is something we start appreciating since we were kids. Do you remember your first crush ❤️ ? Yeah, exactly! And I remember too. And I also remember that we wrote each others some love notes, but I wanted only she could read them. When we were close we exchanged directly the notes, but sometimes when we were not sitted at the same desk in the classroom, other kids read our notes and made fun of us 😳 . . .  Anyway, privacy is an important topic. Let's dive into it !

### 2 - Safe medium
Here we are. My girlfriend wants to send me a love message. So i send her 3 things :
* a chest in which she will put the message she wants to send me
* a padlock for securing the chest
* the key for that padlock

She writes the love message, put it into the chest, closes the padlock with the key and sends everything back to me.
I open the padlock with the key, get the love message from the chest, read it and I'm happy 😍
Do you spot some weak points in that this way of comunicating ?
Let's take a closer look at the padlock and the key.
```swift
// Create a chest with a padlock
let chestAndPadlock = ChestAndPadlock()

// Obtain the key of that padlock
let key = chestAndPadlock.generateKey()

// Send to my girlfriend chest,padlock and key and wait for everything to come back
// The comunication medium will be safe
safeSendToGirlFriend(chestAndPadlock, key)

// Unlock the padlock and open the chest
chestAndPadlock.tryToOpen(key: key)

// Read the love message my girlfriend wrote
var girlfriendMessage = chestAndPadlock.readSecretMessage()
```
<img src="/assets_for_readme/safe_medium.gif" width="250" height="auto"/>

### 3 - Symmetric key
These are the padlock and the key I sent her. As you can see running the code, clicking on the key will **open and close** the padlock.
We have one key that does two things. This is why  keys like this are called **"symmetric"** : because the actions they can perform are the opposite of each other.
 
As long as the key is safe, there will be no problems.
But I have to send the key to my girlfriend to have her close the padlock and secure the chest.
 
What will happen if someone is in the medium we are using to comunicate?

<img src="/assets_for_readme/symmetric_key.gif" width="250" height="auto"/>

### 4 - Unsafe medium
Oh no! Our comunication medium is not safe anymore!
As you will see running the code, a dangerous hacker is in the medium we are using for comunications. And since we are sending the padlock together with the key, he is able to open it and look into the chest.
He can read the love message my girlfriend sent me, in the worst case he can also modify it and I will never be sure if the message I will receive was written by my girlfriend, or by the hacker.

😭

We should do something!
Do we really need to send a key like this in the comunication medium?
Does my girlfriend really **needs a key capable of locking and unlocking** the padlock?
```swift
// Create a chest with a padlock
let chestAndPadlock = ChestAndPadlock()

// Obtain the key of that padlock
let key = chestAndPadlock.generateKey()

// Send to my girlfriend chest,padlock and key and wait for everything to come back
// The comunication medium will NOT be safe
unsafeSendToGirlFriend(chestAndPadlock, key)

// Unlock the padlock and open the chest
chestAndPadlock.tryToOpen(key: key)

// The hacker overwrite the message my girlfriend wrote
var girlfriendMessage = chestAndPadlock.readSecretMessage()
```
<img src="/assets_for_readme/unsafe_medium.gif" width="250" height="auto"/>

### 5 - Asymmetric keys
Remember what we said before? We had one key that did two things. It could open and close the padlock. That's the weak point!
 
To solve this problem we should have one padlock, but with two keys. **One key opens the padlock, the other one closes it**. This way I will send to my girlfriend the open padlock, and the key for closing it. I will keep the other key, the one that opens the padlock.
 
If you run the code, you will be able to see how this works by tapping on keys and observing how the padlock changes.
 
This type of keys are called **asymmetric** because each key can perform only one action, and it's not capable to perform the opposite of that action.
 
* **Red key** : this one closes the padlock. I will send this to my girlfriend together with the open padlock and the chest.
* **Blue key** : this one opens the padlock. I will keep this safe by not sending it trough the comunication medium. This way I will be the only one able to open the padlock.
 
The keys that are made like the red one are also called **public keys** because you have to share them in order to make the comunication happen.
 
The keys that are made like the blue one are also called **private keys** because you have to keep them private and safe to be sure nobody will read messages intended for you.
<img src="/assets_for_readme/asymmetric_keys.gif" width="250" height="auto"/>

### 6 - Back to safety
A-HA ! CHECKMATE HACKER!
 
Run the code, and see what happens now.
After that my girlfriend closes the padlock, even if the hackers intercepts our communication he is not able anymore to open the padlock because only I have the key for doing it!
 
I'm happy again!
```swift
// Create a chest with a padlock
let chestAndPadlock = ChestAndPadlock()

// Obtain a pair of keys, one for opening and one for closing
let (keyThatOpens,keyThatCloses) = chestAndPadlock.generateAsymmetricKeys()

// Send to my girlfriend chest,padlock and ONLY the key for closing and wait for everything to come back
// The comunication medium will NOT be safe
unsafeSendToGirlFriend(chestAndPadlock, keyThatCloses)

// Unlock the padlock with the key for opening, and open the chest
chestAndPadlock.tryToOpen(key: keyThatOpens)

// Read the love message my girlfriend wrote
let girlfriendMessage = chestAndPadlock.readSecretMessage()
```

## How to run it

The playground is made to run on Swift Playgrounds 3.3 on macOS 10.15.4.
