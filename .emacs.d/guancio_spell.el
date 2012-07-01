(require 'dictem)

;; Spell Checking
;; Set the spellchecker program and the default dictionary
(setq-default ispell-program-name "aspell")
(setq ispell-dictionary "en")
;; The function activate the flyspell mode and
;; automatically check the buffer
(defun flyspell-preprocess-buffer ()
  (interactive)
  (flyspell-mode 1)
  (flyspell-buffer)
  )

(defun lookup-word-definition ()
  "Look up the current word's definition in a browser.
If a region is active (a phrase), lookup that phrase."
 (interactive)
 (let (myword myurl)
   (setq myword
         (if (and transient-mark-mode mark-active)
             (buffer-substring-no-properties (region-beginning) (region-end))
           (thing-at-point 'symbol)))

  (setq myword (replace-regexp-in-string " " "%20" myword))
  (setq myurl (concat "http://en.wiktionary.org/wiki/" myword))
  (split-window-horizontally)
  (w3m-browse-url myurl)
  ;;(browse-url myurl)
   ))


; For highlighting the separator between the definitions found.
; This also creates hyperlink on database names.
(add-hook 'dictem-postprocess-definition-hook 
	  'dictem-postprocess-definition-separator)

; For creating hyperlinks in dictem buffer
; that contains definitions.
(add-hook 'dictem-postprocess-definition-hook 
	  'dictem-postprocess-definition-hyperlinks)
; For creating hyperlinks in dictem buffer
; that contains information about a database.
(add-hook 'dictem-postprocess-show-info-hook
	  'dictem-postprocess-definition-hyperlinks)

(setq dictem-default-database "*")
(setq dictem-default-strategy "lev")
(setq dictem-use-existing-buffer t)
(setq dictem-use-content-history t)


;; I cannot understant wich words is found
(global-set-key "\M-d" 'dictem-run-define)
(global-set-key (kbd "M-w M-i M-k M-i") 'lookup-word-definition)
(define-key dictem-mode-map (kbd "C-<down>") 'dictem-next-link)
(define-key dictem-mode-map (kbd "C-<up>") 'dictem-previous-link)
(define-key dictem-mode-map [(backspace)] 'dictem-last)


;; Bug, after the first time, It call the standard function
(define-key ispell-menu-map [flyspell-mode]
  `(menu-item ,(purecopy "Automatic spell checking (Flyspell)")
	      flyspell-preprocess-buffer
	      :help ,(purecopy "Check spelling while you edit the text")
	      :button (:toggle . (bound-and-true-p flyspell-mode))))

(define-key-after ispell-menu-map [sep1]
  `("--") 'flyspell-mode)

(define-key-after ispell-menu-map [dictem]
  `("Open Dictinary (dictem)" . dictem) 'sep1)
(define-key-after ispell-menu-map [dictem-run-define]
  `("Define word" . dictem-run-define) 'dictem)
(define-key-after ispell-menu-map [lookup-word-definition]
  `("Lookup word (Wiki)" . lookup-word-definition) 'dictem-run-define)

(define-key-after ispell-menu-map [sep2]
  `("--") 'lookup-word-definition)

(provide 'guancio_spell)