; ---------------------------------------
; prime
; mouse clicks
; ---------------------------------------

`::
   win := WinExist("A")
   click, down
   WinActivate %win%
return

` up::
   win := WinExist("A")
   click, up
   WinActivate %win%
return

+`::
   win := WinExist("A")
   click, down, right
   WinActivate %win%
return

+` up::
   win := WinExist("A")
   click, up, right
   WinActivate %win%
return

^`::
   win := WinExist("A")
   click, down
   click, up
   WinActivate %win%
return

^` up::
   win := WinExist("A")
   click, down
   click, up
   WinActivate %win%
return

#MaxThreadsPerHotkey, 2
Toggle = 0

!`::
Toggle = !Toggle
If Toggle
   Click, Down
else
   Click, Up
return

; ---------------------------------------
; ctrl+shift
; volume_change
; delete word
; ---------------------------------------

^+WheelUp::send {volume_up}
^+WheelDown::send {volume_down}
^+x::send ^{delete}


; ---------------------------------------
; alt, alt+shift
; deletion, navigation, quotes, clicks
; ---------------------------------------

!q::WinClose, A
!s::send {Down}

;	!WheelUp::send {pgup}
;       !WheelDown::send {pgdn}
!+WheelUp::send {Home}
!+WheelDown::send {End}

!'::EncQuote("'")
!+'::EncQuote("""")
 
EncQuote(q) {
  oldClipboard = %clipboard%
  Clipboard := 
  Send ^c
  Sleep 100
  if (Clipboard != "") {
    Clipboard = %q%%clipboard%%q%
    Sleep 100
    Send ^v
  }
  clipboard = %oldClipboard%
}

; ---------------------------------------
; alt+shift
; number_row
; ---------------------------------------

!+z::send 1
!+x::send 2
!+c::send 3
!+a::send 4
!+s::send 5
!+d::send 6
!+q::send 7
!+w::send 8
!+e::send 9
!+r::send {+}
!+f::send 0
!+v::send `-
!+2::send `=
!+1::send `_
!+`::send .

!+.::send .
!+-::send -
!+/::send /
!+(::send (
!+)::send )
!+8::send *
!+backspace::send {Backspace}

+!Left::Media_Prev
+!Right::Media_Next
+!Down::Media_Play_Pause

; ---------------------------------------
; ctrl+shift+alt
; shift+number_row
; ---------------------------------------

^+!a::send {!}
^+!s::send @
^+!d::send {#}
^+!f::send $
^+!g::send `%
^+!h::send {^}
^+!i::send {&}
^+!j::send *
^+!k::send (
^+!l::send )
^+!;::send _
^+!'::send {+}

; ---------------------------------------
; ctrl+alt
; vim commands, navigation, paste
; ---------------------------------------

^!h::send {left}
^!j::send {down}
^!k::send {up}
^!l::send {right}
^!b::send ^{left}
^!e::send ^{right}
^!y::send ^c
^!p::send ^v
^!x::send ^{Backspace}
^!backspace::send {backspace}
^!d::send {end}+{home}+{home}+{left}{backspace}{right}
^!o::send {end}{enter}
^!u::send ^z
^!r::send ^y
^!w::send ^s

^!left::send {shift down}{ralt down}{tab}{ralt up}{shift up}
^!down::send {pgdn}
^!up::send {pgup}
^!right::send {ralt down}{tab}{ralt up}
^!0::send {home}
^!4::send {end}

^!v::                            ; Text–only paste from ClipBoard
   Clip0 = %ClipBoardAll%
   ClipBoard = %ClipBoard%       ; Convert to text
   Send ^v                       ; For best compatibility: SendPlay
   Sleep 50                      ; Don't change clipboard while it is pasted! (Sleep > 0)
   ClipBoard = %Clip0%           ; Restore original ClipBoard
   VarSetCapacity(Clip0, 0)      ; Free memory
Return

F1::