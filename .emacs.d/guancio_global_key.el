;; Remove standard Emacs KeyBinding to correctly print mapping on menus
(global-set-key "\C-x\C-c" nil) ;; Old Quit
(global-set-key "\C-x\C-s" nil) ;; Old Save File
(global-set-key "\C-x\C-f" nil) ;; Old Open File
(global-set-key "\C-x\C-w" nil) ;; Old Save as
(global-set-key "\C-x2" nil) ;; Old Open File
(global-set-key "\C-x1" nil) ;; Old Open File
(global-set-key "\C-xu" nil) ;; Old Open File
(global-set-key "\C-r" nil) ;; Old Open File
(global-set-key [(control shift c)] nil) ;; SEARCH
(global-set-key [(control meta s)] nil) ;; SEARCH
(global-set-key [(control meta r)] nil) ;; SEARCH
(global-set-key "\M-gg" nil) ;; GOTO
(global-set-key "\M-g\M-g" nil) ;; GOTO
(global-set-key (kbd "C-SPC") nil)



;; File Bindings
(global-set-key "\C-o" 'ido-find-file) ;; Open a file
(global-set-key "\C-s" 'save-buffer) ;; Save the current file (buffer)
(global-set-key "\C-r" 'guancio-revert-buffer) ;; Revert (reload from disk) the current buffer
(global-set-key [(control shift s)] 'ido-write-file) ;; Save As
(global-set-key [(control shift w)] 'guancio-close-current-buffer) ;; Close the current buffer
(global-set-key [(control shift n)] 'guancio-new-empty-buffer) ;; New empty buffer
(global-set-key "\M-q" 'save-buffers-kill-terminal) ;; Quit Emacs

;; Edit
(global-set-key "\C-a" 'mark-whole-buffer) ;; Select All
(global-set-key "\C-h" 'replace-string)    ;; String replace in the current buffer
(global-set-key [(control shift h)] 'replace-regexp) ;; Regexp  replace in the current buffer
(global-set-key "\C-g" 'goto-line) ;; Go to line
(global-set-key "\M-c" 'comment-or-uncomment-region) ;; Toggle region comment

;; Edit -> Search
(global-set-key "\C-f" 'isearch-forward) ;; Search
(global-set-key [(control shift f)] 'isearch-backward) ;; Search backward
(global-set-key "\M-f" 'isearch-forward-regexp) ;; Search regexp
(global-set-key [(meta shift f)] 'isearch-backward-regexp) ;; Search regexp beckward

(define-key isearch-mode-map (kbd "C-f") 'isearch-repeat-forward) ;; Next occurrence
(define-key isearch-mode-map [(control shift f)] 'isearch-repeat-backward) ;; Previus occurrence
(define-key isearch-mode-map (kbd "C-s") nil) ;; Prevent isearch to handle C-s, that is globally binded to save buffer
(define-key isearch-mode-map (kbd "C-v") 'isearch-yank-kill) ;; Allow using C-v to paste from the clipbuard into the isearch propmpt
(define-key isearch-mode-map (kbd "C-a") 'guancio-isearch-occur) ;; Find all occurrence in the current buffer
(define-key isearch-mode-map [(control shift a)] 'guancio-isearch-grep) ;; Find all occurrence in th ecurrent directory

;; Fonts
(global-set-key [(control =)] (lambda () (interactive)
                                      (text-scale-increase 1)))
(global-set-key [(control -)] (lambda () (interactive)
                                      (text-scale-decrease 1)))
(global-set-key (kbd "C-\)") (lambda () (interactive)
                                      (text-scale-increase 0)))


;; Frames and Windows
(global-set-key "\C-n" 'detach-window)
(global-set-key "\C-t" 'split-window-horizontally)
(global-set-key "\C-q" 'delete-frame)
(global-set-key "\C-w" 'delete-window)
(global-set-key [(control escape)] 'delete-other-windows)

(global-set-key (kbd "M-<right>") 'other-window)
(global-set-key (kbd "M-<left>")  'select-previous-window)
(global-set-key (kbd "M-<down>") 'other-window)
(global-set-key (kbd "M-<up>")  'select-previous-window)

(global-set-key [(meta shift up)] 'tabbar-backward-group)
(global-set-key [(meta shift down)] 'tabbar-forward-group)
(global-set-key [(meta shift left)] 'tabbar-backward-tab)
(global-set-key [(meta shift right)] 'tabbar-forward-tab)

;; Buffers
(global-set-key "\C-b" 'ido-switch-buffer)
(global-set-key [(control shift b)] 'ibuffer)

;; External processes
(global-set-key "\M-b" 'smart-compile)
(global-set-key "\M-s" 'speedbar)

;; Others
;; (global-set-key (kbd "C-<tab>") 'ispell-word)
;; (global-set-key (kbd "M-h") 'lookup-word-definition)


(provide 'guancio_global_key)
