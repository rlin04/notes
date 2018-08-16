; ---------------------------------------
; shift
; volume_change
; ---------------------------------------

+WheelUp::send {volume_up}
+WheelDown::send {volume_down}

; ---------------------------------------
; alt, alt+shift
; deletion, navigation, quote_enclosure
; ---------------------------------------

!x::send {Delete}
!+x::send {Backspace}
!r::send {browser_refresh}
!h::send <^h
!Space::send _
!WheelUp::send {PgUp}
!WheelDown::send {PgDn}
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
  Clipboard = %oldClipboard%
}

; ---------------------------------------
; ctrl+shift
; number_row
; ---------------------------------------

<^+a::send 1
<^+s::send 2
<^+d::send 3
<^+f::send 4
<^+g::send 5
<^+h::send 6
<^+j::send 7
<^+k::send 8
<^+l::send 9
<^+;::send 0
<^+p::send {+}
<^+m::send `-
<^+e::send `=
<^+Space::send `_
<^+Backspace::send {Backspace}

; ---------------------------------------
; ctrl+shift+alt
; shift+number_row
; ---------------------------------------

<^+!a::send {!}
<^+!s::send @
<^+!d::send {#}
<^+!f::send $
<^+!g::send `%
<^+!h::send {^}
<^+!i::send {&}
<^+!j::send *
<^+!k::send (
<^+!l::send )
<^+!;::send _
<^+!'::send {+}

; ---------------------------------------
; ctrl+alt
; vim commands, navigation, paste
; ---------------------------------------

<^!h::send {left}
<^!j::send {down}
<^!k::send {up}
<^!l::send {right}
<^!b::send ^{left}
<^!e::send ^{right}
<^!y::send ^c
<^!p::send ^v
<^!x::send ^{Delete}
<^!d::send {end}+{home}+{home}+{left}{delete}
<^!o::send {end}{enter}
<^!u::send ^z
<^!r::send ^y
<^!w::send ^s
<^!q::WinClose, A

<^!left::send {shift down}{ralt down}{tab}{ralt up}{shift up}
<^!down::send {ralt down}{tab}{ralt up}
<^!up::send {ralt down}{tab}{ralt up}
<^!right::send {ralt down}{tab}{ralt up}

<^!v::                            ; Text–only paste from ClipBoard
   Clip0 = %ClipBoardAll%
   ClipBoard = %ClipBoard%       ; Convert to text
   Send ^v                       ; For best compatibility: SendPlay
   Sleep 50                      ; Don't change clipboard while it is pasted! (Sleep > 0)
   ClipBoard = %Clip0%           ; Restore original ClipBoard
   VarSetCapacity(Clip0, 0)      ; Free memory
Return