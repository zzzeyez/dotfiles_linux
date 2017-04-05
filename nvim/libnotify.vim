" Vim wrapper for libnotify
" Maintainer: Andreas Müller <http://0x7.ch>
" Version:    0.1
" License:    Same terms as Vim

if exists("g:loaded_libnotify") || &compatible || v:version < 700
	finish
end
	
if !exists("g:notify_send_cmd")
	let g:notify_send_cmd = 'notify-send'
endif

if !exists("g:notify_default_icon")
	if filereadable("/usr/share/pixmaps/vim.svg")
		let g:notify_default_icon = "/usr/share/pixmaps/vim.svg"
	else
		let g:notify_default_icon = "/usr/share/pixmaps/gvim.xpm"
	endif
end

if !exists("g:notify_success_icon")
	let g:notify_success_icon = "/usr/share/icons/gnome/48x48/emblems/emblem-default.png"
end

if !exists("g:notify_error_icon")
	let g:notify_error_icon = "/usr/share/icons/gnome/48x48/status/error.png"
end

function! s:NotifySend(title, text, icon)
	if !executable(g:notify_send_cmd)
		echoerr "g:notify_send_cmd command not executable"
		return
	end

	let l:cmd = g:notify_send_cmd
	if filereadable(a:icon)
		let l:cmd .= " -i ".a:icon
	endif

	let l:title = escape(a:title, '"\')
	let l:text = escape(a:text, '"\')

	call system(l:cmd.' "'.l:title.'" "'.l:text.'"')
endfunction

function! Notify(title, ...)
	if a:0 > 0
		call s:NotifySend(a:title, a:1, g:notify_default_icon)
	else
		call s:NotifySend(a:title, "", g:notify_default_icon)
	endif
endfunction

function! NotifySuccess(title, ...)
	if a:0 > 0
		call s:NotifySend(a:title, a:1, g:notify_success_icon)
	else
		call s:NotifySend(a:title, "", g:notify_success_icon)
	endif
endfunction

function! NotifyError(title, ...)
	if a:0 > 0
		call s:NotifySend(a:title, a:1, g:notify_error_icon)
	else
		call s:NotifySend(a:title, "", g:notify_error_icon)
	endif
endfunction
