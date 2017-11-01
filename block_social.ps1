function setHostEntries([hashtable] $entries) {
    $hostsFile = "$env:windir\System32\drivers\etc\hosts"
    $newLines = @()

    $c = Get-Content -Path $hostsFile
    foreach ($line in $c) {
        $bits = [regex]::Split($line, "\s+")
        if ($bits.count -eq 2) {
            $match = $NULL
            ForEach($entry in $entries.GetEnumerator()) {
                if($bits[1] -eq $entry.Key) {
                    $newLines += ($entry.Value + '     ' + $entry.Key)
                    Write-Host Replacing HOSTS entry for $entry.Key
                    $match = $entry.Key
                    break
                }
            }
            if($match -eq $NULL) {
                $newLines += $line
            } else {
                $entries.Remove($match)
            }
        } else {
            $newLines += $line
        }
    }

    foreach($entry in $entries.GetEnumerator()) {
        Write-Host Adding HOSTS entry for $entry.Key
        $newLines += $entry.Value + '     ' + $entry.Key
    }

    Write-Host Saving $hostsFile
    Clear-Content $hostsFile
    foreach ($line in $newLines) {
        $line | Out-File -encoding ASCII -append $hostsFile
    }
}

$entries = @{
    'ok.ru' = "127.0.0.1"
    'facebook.com' = "127.0.0.1"
    'vk.com' = "127.0.0.1"
    'ru-ru.facebook.com' = "127.0.0.1"
    'odnoklassniki.ru' = "127.0.0.1"
    'youtube.com' = "127.0.0.1"
    'instagram.com' = "127.0.0.1"
    'kakao.com' = "127.0.0.1"
    'telegram.org' = "127.0.0.1"
    'linkedin.com' = "127.0.0.1"
    'pinterest.com' = "127.0.0.1"
    'line.me' = "127.0.0.1"
    'viber.com' = "127.0.0.1"
    'baidu.com' = "127.0.0.1"
    'rutube.ru' = "127.0.0.1"
    'twitter.com' = "127.0.0.1"
    'liveinternet.ru' = "127.0.0.1"
    'livejournal.com' = "127.0.0.1"
    'my.mail.ru' = "127.0.0.1"
    'blogger.com' = "127.0.0.1"
    'babyblog.ru' = "127.0.0.1"
    'diary.ru' = "127.0.0.1"
    'tumblr.com' = "127.0.0.1"
    'flickr.com' = "127.0.0.1"
    'myspace.com' = "127.0.0.1"
    'meetup.com' = "127.0.0.1"
    'ask.fm' = "127.0.0.1"
    'meetme.com' = "127.0.0.1"
    'spaces.ru' = "127.0.0.1"
    'altergeo.ru' = "127.0.0.1"
    'moyashkola.com' = "127.0.0.1"
    'shararam.ru' = "127.0.0.1"
    'kindernet.ru' = "127.0.0.1"
    'classmates.com' = "127.0.0.1"
    'ivi.ru' = "127.0.0.1"
    'megogo.net' = "127.0.0.1"
    'baskino.co' = "127.0.0.1"
    'hdkinohit.net' = "127.0.0.1"
    'kinokrad.co' = "127.0.0.1"
    'okino.tv' = "127.0.0.1"
    'bobfilm.club' = "127.0.0.1"
    'tvigle.ru' = "127.0.0.1"
    'simp-fan.ru' = "127.0.0.1"
    'o1plus1.video' = "127.0.0.1"
    'europaplus.ru' = "127.0.0.1"
    'radiovolna.net' = "127.0.0.1"
    'ru.tv' = "127.0.0.1"
};
setHostEntries($entries)
