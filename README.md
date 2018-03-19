# PSMagicEightBall-
Powershell Magic Eight Ball

## Examples

### Basic Usage

Ask for a single random answer:

    Use-MagicEightBall

Ask for a two random answers:

    Use-MagicEightBall -Count 2

### Speak The Answer

Use `System.Speech` to speak the answer:

    Use-MagicEightBall -Speak

Speak two answers:

    Use-MagicEightBall -Count 2 -Speak

#### Speech Speed

Decrease speech speed:

    Use-MagicEightBall -Speak -SpeechSpeed -5

Increase speech speed:

    Use-MagicEightBall -Speak -SpeechSpeed 6
