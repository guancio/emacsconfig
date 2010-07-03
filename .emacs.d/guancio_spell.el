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

;; (defun lookup-word-definition ()
;;   "Look up the current word's definition in a browser.
;; If a region is active (a phrase), lookup that phrase."
;;  (interactive)
;;  (let (myword myurl)
;;    (setq myword
;;          (if (and transient-mark-mode mark-active)
;;              (buffer-substring-no-properties (region-beginning) (region-end))
;;            (thing-at-point 'symbol)))

;;   (setq myword (replace-regexp-in-string " " "%20" myword))
;;   (setq myurl (concat "http://en.wiktionary.org/wiki/" myword))
;;   ;; (split-window-horizontally)
;;   (w3m-browse-url myurl)
;;   ;;(browse-url myurl)
;;    ))


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


(global-set-key "\M-d" 'dictem-run-define)
(setq dictem-use-existing-buffer t)
(setq dictem-use-content-history t)
(define-key dictem-mode-map (kbd "C-<down>") 'dictem-next-link)
(define-key dictem-mode-map (kbd "C-<up>") 'dictem-previous-link)
(define-key dictem-mode-map [(backspace)] 'dictem-last)
(setq dictem-default-database "*")
(setq dictem-default-strategy "lev")

(provide 'guancio_spell)