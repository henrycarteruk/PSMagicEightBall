Function Get-EightBallAnswers {
    param(
        [ValidateRange(1, 20)]
        [int]$Count = 1
    )

    $answer = @(
        "It is certain",
        "It is decidedly so",
        "Without a doubt",
        "Yes definitely",
        "You may rely on it",
        "As I see it, yes",
        "Most likely",
        "Outlook good",
        "Yes",
        "Signs point to yes",
        "Reply hazy try again",
        "Ask again later",
        "Better not tell you now",
        "Cannot predict now",
        "Concentrate and ask again",
        "Don't count on it",
        "My reply is no",
        "My sources say no",
        "Outlook not so good",
        "Very doubtful"
    )

    $answer | Get-Random -Count $Count
}

Function Use-MagicEightBall {
    param(
        [ValidateRange(1, 20)]
        [int]$Count = 1,

        [switch]$Speak,

        [ValidateRange(-10, 10)]
        [int]$SpeechSpeed = 0
    )

    $answer = Get-EightBallAnswers -Count $count
    
    If ($Speak) {
        Add-Type -AssemblyName System.Speech
        $SpeechSynthesizer = New-Object System.Speech.Synthesis.SpeechSynthesizer

        $SpeechSynthesizer.Rate = $SpeechSpeed

        $answer | ForEach-Object {$SpeechSynthesizer.Speak($_); Start-Sleep -Seconds 0.5}
    }
    else {
        $answer | ForEach-Object {Write-Output $_}
    }
}