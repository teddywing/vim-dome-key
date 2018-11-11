if exists('b:current_syntax')
	finish
endif

syntax region domeKeyComment display start="#" end="$" contains=@Spell
syntax region domeKeySpecialKey display start="<" end=">" contained contains=domeKeySpecialKeyKeyword

" syntax match domeKeyMapDefinition "map\s+" contains=domeKeyMapDefinitionStart,domeKeyMapDefinitionTrigger,domeKeyMapDefinitionAction
" syntax match domeKeyMapDefinitionStart contained "map" contains=domeKeyType
" syntax region domeKeyMapDefinition start="^" end="$" contains=domeKeyMapDefinitionStart,domeKeyDefinitionTrigger,domeKeyMapDefinitionAction
syntax match domeKeyMapDefinitionStart "^\s*map" contains=domeKeyType nextgroup=domeKeyDefinitionTrigger skipwhite
syntax match domeKeyDefinitionTrigger "\c\(<\(Up\|Play\|Down\)>\)\+" contained contains=domeKeySpecialKey nextgroup=domeKeyMapDefinitionAction skipwhite
" syntax match domeKeyMapDefinitionAction "[^\n]" contained contains=domeKeySpecialKey
syntax match domeKeyMapDefinitionAction ".*$" contained contains=domeKeySpecialKey

syntax keyword domeKeyType contained containedin=domeKeyMapDefinitionStart map cmd mode

syntax case ignore
syntax keyword domeKeyTriggerKeyKeyword contained Up Play Down

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
highlight default link domeKeySpecialKey Special
highlight default link domeKeySpecialKeyKeyword domeKeySpecialKey

" TODO:
" - Escaping only in actions
" - Don't highlight special keys inside command actions
" - Trigger keys are the only special keys after a map kind

let b:current_syntax = 'dome_key'
