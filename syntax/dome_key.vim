if exists('b:current_syntax')
	finish
endif

syntax region domeKeyComment display start="#" end="$" contains=@Spell

" Special keys
syntax match domeKeySpecialKeyEscape display "\\<"he=e-1
syntax match domeKeySpecialKeyEscape display "\\\\"
syntax region domeKeySpecialKey display matchgroup=domeKeySpecialKeyGroup start="[^\\]<" end=">" contained contains=domeKeySpecialKeyKeyword

syntax match domeKeyDefinitionTrigger "\c\(<\(Up\|Play\|Down\)>\)\+" contained


" Map definitions
syntax match domeKeyMapDefinitionStart "^\s*map" contains=domeKeyType nextgroup=domeKeyMapDefinitionTrigger skipwhite
syntax match domeKeyMapDefinitionTrigger "[^ \t]\+" contained contains=domeKeyDefinitionTrigger nextgroup=domeKeyMapDefinitionAction skipwhite
syntax match domeKeyMapDefinitionAction ".*$" contained contains=domeKeySpecialKey,domeKeySpecialKeyEscape

" Cmd definitions
syntax match domeKeyCmdDefinitionStart "^\s*cmd" contains=domeKeyType nextgroup=domeKeyCmdDefinitionTrigger skipwhite
syntax match domeKeyCmdDefinitionTrigger "[^ \t]\+" contained contains=domeKeyDefinitionTrigger nextgroup=domeKeyCmdDefinitionAction skipwhite
syntax match domeKeyCmdDefinitionAction ".*$" contained

" Mode definitions
syntax match domeKeyModeDefinitionStart "^\s*mode" contains=domeKeyType nextgroup=domeKeyModeDefinitionTrigger skipwhite
syntax match domeKeyModeDefinitionTrigger "[^ \t]\+" contained contains=domeKeyDefinitionTrigger nextgroup=domeKeyModeDefinitionAction skipwhite
syntax region domeKeyModeDefinitionAction matchgroup=NONE start="{" end="}" contained contains=domeKeyMapDefinitionStart,domeKeyCmdDefinitionStart,domeKeyComment


syntax keyword domeKeyType contained containedin=domeKeyMapDefinitionStart map cmd mode

syntax case ignore
syntax keyword domeKeySpecialKeyKeyword contained Nop
syntax keyword domeKeySpecialKeyKeyword contained F1 F2 F3 F4 F5 F6 F7 F8 F9 F10 F11 F12
syntax keyword domeKeySpecialKeyKeyword contained Left Right Down Up
syntax keyword domeKeySpecialKeyKeyword contained Home End PageUp PageDown
syntax keyword domeKeySpecialKeyKeyword contained Return Enter CR
syntax keyword domeKeySpecialKeyKeyword contained Del BS
syntax keyword domeKeySpecialKeyKeyword contained Esc
syntax keyword domeKeySpecialKeyKeyword contained CapsLock
syntax keyword domeKeySpecialKeyKeyword contained Tab Space
syntax keyword domeKeySpecialKeyKeyword contained VolumeUp VolumeDown Mute
syntax keyword domeKeySpecialKeyKeyword contained BrightnessUp BrightnessDown
syntax keyword domeKeySpecialKeyKeyword contained Help
syntax keyword domeKeySpecialKeyKeyword contained Power
syntax keyword domeKeySpecialKeyKeyword contained NumLock
syntax keyword domeKeySpecialKeyKeyword contained ContrastUp ContrastDown
syntax keyword domeKeySpecialKeyKeyword contained Eject
syntax keyword domeKeySpecialKeyKeyword contained VidMirror
syntax keyword domeKeySpecialKeyKeyword contained Play Next Previous Fast Rewind
syntax keyword domeKeySpecialKeyKeyword contained IlluminationUp IlluminationDown IlluminationToggle
syntax case match


highlight default link domeKeyComment Comment
highlight default link domeKeyType Statement
highlight default link domeKeySpecialKeyGroup Special
highlight default link domeKeySpecialKeyKeyword domeKeySpecialKeyGroup
highlight default link domeKeyDefinitionTrigger domeKeySpecialKeyGroup
highlight default link domeKeySpecialKeyEscape Special

" TODO:
" - Escaping only in actions
" - Don't highlight special keys inside command actions
" - Trigger keys are the only special keys after a map kind

let b:current_syntax = 'dome_key'
