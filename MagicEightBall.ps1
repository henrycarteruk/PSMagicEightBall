Function Get-EightBallAnswers {
    param(
        [ValidateRange(1, 20)]
        [int]$Count = 1,

        [ValidateSet("Yes", "No", "Maybe")]
        [array]$AnswerSet = ("Yes", "No", "Maybe")
    )

    $answer_set_yes = @(
        "As I see it, yes",
        "It is certain",
        "It is decidedly so",
        "Most likely",
        "Outlook good",
        "Signs point to yes",
        "Without a doubt",
        "Yes",
        "Yes - definitely",
        "You may rely on it"
    )
    $answer_set_maybe = @(
        "Reply hazy, try again",
        "Ask again later",
        "Better not tell you now",
        "Cannot predict now",
        "Concentrate and ask again"
    )
    $answer_set_no = @(
        "Don't count on it",
        "My reply is no",
        "My sources say no",
        "Outlook not so good",
        "Very doubtful"
    )

    switch ($AnswerSet) {
        "Yes" {$answer += $answer_set_yes}
        "No" {$answer += $answer_set_no}
        "maybe" {$answer += $answer_set_maybe}
    }
    $answer | Get-Random -Count $Count
}

Function Use-MagicEightBall {
    param(
        [ValidateRange(1, 20)]
        [int]$Count = 1,

        [ValidateSet("Yes", "No", "Maybe")]
        [array]$AnswerSet = ("Yes", "No", "Maybe"),

        [switch]$Speak,

        [ValidateRange(-10, 10)]
        [int]$SpeechSpeed = 0
    )

    $answer = Get-EightBallAnswers -Count $count -AnswerSet $AnswerSet
    
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