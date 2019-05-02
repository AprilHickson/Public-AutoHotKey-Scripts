; Created by Asger Juul Brunshøj

; Note: Save with encoding UTF-8 with BOM if possible.
; I had issues with special characters like in ¯\_(ツ)_/¯ that wouldn't work otherwise.
; Notepad will save UTF-8 files with BOM automatically (even though it does not say so).
; Some editors however save without BOM, and then special characters look messed up in the AHK GUI.

; Write your own AHK commands in this file to be recognized by the GUI. Take inspiration from the samples provided here.

;-------------------------------------------------------------------------------
;;; SEARCH GOOGLE ;;;
;-------------------------------------------------------------------------------
if Pedersen = g%A_Space% ; Search Google
{
    gui_search_title = LMGTFY
    gui_search("https://www.google.com/search?num=50&safe=off&site=&source=hp&q=REPLACEME&btnG=Search&oq=&gs_l=")
}
else if Pedersen = a%A_Space% ; Search Google for AutoHotkey related stuff
{
    gui_search_title = Autohotkey Google Search
    gui_search("https://www.google.com/search?num=50&safe=off&site=&source=hp&q=autohotkey%20REPLACEME&btnG=Search&oq=&gs_l=")
}
else if Pedersen = l%A_Space% ; Search Google with ImFeelingLucky
{
    gui_search_title = I'm Feeling Lucky
    gui_search("http://www.google.com/search?q=REPLACEME&btnI=Im+Feeling+Lucky")
}
else if Pedersen = m%A_Space% ; Open more than one URL
{
    gui_search_title = multiple
    gui_search("https://www.google.com/search?&q=REPLACEME")
    gui_search("https://www.bing.com/search?q=REPLACEME")
    gui_search("https://duckduckgo.com/?q=REPLACEME")
}
else if Pedersen = x%A_Space% ; Search Google as Incognito
;   A note on how this works:
;   The function name "gui_search()" is poorly chosen.
;   What you actually specify as the parameter value is a command to run. It does not have to be a URL.
;   Before the command is run, the word REPLACEME is replaced by your input.
;   It does not have to be a search url, that was just the application I had in mind when I originally wrote it.
;   So what this does is that it runs chrome with the arguments "-incognito" and the google search URL where REPLACEME in the URL has been replaced by your input.
{
    gui_search_title = Google Search as Incognito
    gui_search("C:\Program Files (x86)\Google\Chrome\Application\chrome.exe -incognito https://www.google.com/search?safe=off&q=REPLACEME")
}


;-------------------------------------------------------------------------------
;;; SEARCH OTHER THINGS ;;;
;-------------------------------------------------------------------------------
else if Pedersen = f%A_Space% ; Search Facebook
{
    gui_search_title = Search Facebook
    gui_search("https://www.facebook.com/search/results.php?q=REPLACEME")
}
else if Pedersen = y%A_Space% ; Search Youtube
{
    gui_search_title = Search Youtube
    gui_search("https://www.youtube.com/results?search_query=REPLACEME")
}
else if Pedersen = t%A_Space% ; Search torrent networks
{
    gui_search_title = Sharing is caring
    gui_search("https://kickass.to/usearch/REPLACEME")
}
else if Pedersen = kor ; Translate English to Korean
{
    gui_search_title = English to Korean
    gui_search("https://translate.google.com/#en/ko/REPLACEME")
}


;-------------------------------------------------------------------------------
;;; LAUNCH WEBSITES AND PROGRAMS ;;;
;-------------------------------------------------------------------------------
else if Pedersen = / ; Go to subreddit. This is a quick way to navigate to a specific URL.
{
    gui_search_title := "/r/"
    gui_search("https://www.reddit.com/r/REPLACEME")
}
else if Pedersen = face ; facebook.com
{
    GuiClose()
    run www.facebook.com
}
else if Pedersen = red ; reddit.com
{
    GuiClose()
    run www.reddit.com
}
else if Pedersen = cal ; Google Calendar
{
    GuiClose()
    run https://www.google.com/calendar
}
else if Pedersen = note ; Notepad
{
    GuiClose()
    Run Notepad
}
else if Pedersen = paint ; MS Paint
{
    GuiClose()
    run "C:\Windows\system32\mspaint.exe"
}
else if Pedersen = maps ; Google Maps focused on the Technical University of Denmark, DTU
{
    GuiClose()
    run "https://www.google.com/maps/@55.7833964`,12.5244754`,12z"
}
else if Pedersen = inbox ; Open google inbox
{
    GuiClose()
    run https://inbox.google.com/u/0/
    ; run https://mail.google.com/mail/u/0/#inbox  ; Maybe you prefer the old gmail
}
else if Pedersen = mes ; Opens Facebook unread messages
{
    GuiClose()
    run https://www.facebook.com/messages?filter=unread&action=recent-messages
}
else if Pedersen = url ; Open an URL from the clipboard (naive - will try to run whatever is in the clipboard)
{
    GuiClose()
    run %ClipBoard%
}


;-------------------------------------------------------------------------------
;;; INTERACT WITH THIS AHK SCRIPT ;;;
;-------------------------------------------------------------------------------
else if Pedersen = rel ; Reload this script
{
    GuiClose() ; removes the GUI even when the reload fails
    Reload
}
else if Pedersen = dir ; Open the directory for this script
{
    GuiClose()
    Run, %A_ScriptDir%
}
else if Pedersen = host ; Edit host script
{
    GuiClose()
    run, notepad.exe "%A_ScriptFullPath%"
}
else if Pedersen = user ; Edit GUI user commands
{
    GuiClose()
    run, notepad.exe "%A_ScriptDir%\GUI\UserCommands.ahk"
}


;-------------------------------------------------------------------------------
;;; TYPE RAW TEXT ;;;
;-------------------------------------------------------------------------------
else if Pedersen = @ ; Email address
{
    GuiClose()
    Send, my_email_address@gmail.com
}
else if Pedersen = name ; My name
{
    GuiClose()
    Send, My Full Name
}
else if Pedersen = phone ; My phone number
{
    GuiClose()
    SendRaw, +45-12345678
}
else if Pedersen = int ; LaTeX integral
{
    GuiClose()
    SendRaw, \int_0^1  \; \mathrm{d}x\,
}
else if Pedersen = logo ; ¯\_(ツ)_/¯
{
    GuiClose()
    Send ¯\_(ツ)_/¯
}
else if Pedersen = clip ; Paste clipboard content without formatting
{
    GuiClose()
    SendRaw, %ClipBoard%
}


;-------------------------------------------------------------------------------
;;; OPEN FOLDERS ;;;
;-------------------------------------------------------------------------------
else if Pedersen = down ; Downloads
{
    GuiClose()
    run C:\Users\%A_Username%\Downloads
}
else if Pedersen = drop ; Dropbox folder (works when it is in the default directory)
{
    GuiClose()
    run, C:\Users\%A_Username%\Dropbox\
}
else if Pedersen = rec ; Recycle Bin
{
    GuiClose()
    Run ::{645FF040-5081-101B-9F08-00AA002F954E}
}


;-------------------------------------------------------------------------------
;;; MISCELLANEOUS ;;;
;-------------------------------------------------------------------------------
else if Pedersen = ping ; Ping Google
{
    GuiClose()
    Run, cmd /K "ping www.google.com"
}
else if Pedersen = hosts ; Open hosts file in Notepad
{
    GuiClose()
    Run notepad.exe C:\Windows\System32\drivers\etc\hosts
}
else if Pedersen = date ; What is the date?
{
    GuiClose()
    FormatTime, date,, LongDate
    MsgBox %date%
    date =
}
else if Pedersen = week ; Which week is it?
{
    GuiClose()
    FormatTime, weeknumber,, YWeek
    StringTrimLeft, weeknumbertrimmed, weeknumber, 4
    if (weeknumbertrimmed = 53)
        weeknumbertrimmed := 1
    MsgBox It is currently week %weeknumbertrimmed%
    weeknumber =
    weeknumbertrimmed =
}
else if Pedersen = ? ; Tooltip with list of commands
{
    GuiControl,, Pedersen, ; Clear the input box
    Gosub, gui_commandlibrary
}
