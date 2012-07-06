(cua-mode t)
(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
(setq cua-keep-region-after-copy t) ;; Standard Windows behaviour

;; Hack Emacs to manage clipboard in a human way
(setq transient-mark-mode t)  ;  makes the region act quite like the text "highlight" in many apps.
(setq mouse-drag-copy-region nil)  ; stops selection with a mouse being immediately injected to the kill ring
(setq x-select-enable-primary nil)  ; stops killing/yanking interacting with primary X11 selection 
(setq x-select-enable-clipboard t)  ; makes killing/yanking interact with clipboard X11 selection

;; these will probably be already set to these values, leave them that way if so!
					; (setf interprogram-cut-function 'x-select-text)
					; (setf interprogram-paste-function 'x-cut-buffer-or-selection-value)

					; this doesn't always quite work right at time of writing, see emacs bug #902, but when it does,
					; it makes "highlight/middlebutton" style (X11 primary selection based) copy-paste work as expected
					; if you're used to other modern apps (that is to say, the mere act of highlighting doesn't
					; overwrite the clipboard or alter the kill ring, but you can paste in merely highlighted 
					; text with the mouse if you want to)
(setq select-active-regions t) ;  active region sets primary X11 selection
(global-set-key [mouse-2] 'mouse-yank-primary)  ; make mouse middle-click only paste from primary X11 selection, not clipboard and kill ring.

;; with this, doing an M-y will also affect the X11 clipboard, making emacs act as a sort of clipboard history, at
;; least of text you've pasted into it in the first place.
					; (setq yank-pop-change-selection t)  ; makes rotating the kill ring change the X11 clipboard.  


(delete-selection-mode 1) ; make delete or typing delete whole selected text

(provide 'guancio_copy_paste)
