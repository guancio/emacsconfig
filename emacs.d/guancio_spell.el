(require 'popup)
(require 'auto-complete)
(require 'ispell)
(require 'flyspell)

(if (on-guancio-studio-debian-p)
    (require 'dictem)
)

(require 'guancio_autocomplete)

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Ispell source for auto-complete
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun ac-ispell-candidate ()
  (let ((word (ispell-get-word nil "\\*")))
    (setq word (car word))
    (message word)
    (lookup-words (concat word "*") ispell-complete-word-dict)))


(defface ac-ispell-candidate-face
  '((t (:background "white" :foreground "black")))
  "Face for yasnippet candidate.")

(defface ac-ispell-selection-face
  '((t (:background "green" :foreground "black"))) 
  "Face for the yasnippet selected candidate.")

(defvar ac-source-ispell
  '((candidates . ac-ispell-candidate)
    (action . (lambda () 
		(delete-region (point) (search-forward-regexp "\\w*")))
		)
    (limit . 1)
    (candidate-face . ac-ispell-candidate-face)
    (selection-face . ac-ispell-selection-face)) 
  "Source for Ispell.")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;Guancio fix word menu ;;;;;;;;;;;;;;;;;;;;;;
(defun guancio-spell-mouse-menu (event)
  "Pop up a menu of possible corrections for a misspelled word.
The word checked is the word at the mouse position."
  (interactive "e")
  (let ((save (point)))
    (mouse-set-point event)
    (guancio-spell-menu)
    (goto-char save)
    ))

;; Bug: I cannot close the popup
;; Bug: I can not use the mouse
;; Bug: I can not use page up/down
(define-key popup-menu-keymap [esc] 'popup-close)

(defun guancio-spell-menu ()
  "Pop up a menu of possible corrections for misspelled word before point."
  (interactive)
  ;; use the correct dictionary
  (flyspell-accept-buffer-local-defs)
  (let ((cursor-location (point))
	(word (flyspell-get-word nil)))
    (if (consp word)
	(let ((start (car (cdr word)))
	      (end (car (cdr (cdr word))))
	      (word (car word))
	      poss ispell-filter)
	  ;; now check spelling of word.
	  (ispell-send-string "%\n")	;put in verbose mode
	  (ispell-send-string (concat "^" word "\n"))
	  ;; wait until ispell has processed word
	  (while (progn
		   (accept-process-output ispell-process)
		   (not (string= "" (car ispell-filter)))))
	  ;; Remove leading empty element
	  (setq ispell-filter (cdr ispell-filter))
	  ;; ispell process should return something after word is sent.
	  ;; Tag word as valid (i.e., skip) otherwise
	  (or ispell-filter
	      (setq ispell-filter '(*)))
	  (if (consp ispell-filter)
	      (setq poss (ispell-parse-output (car ispell-filter))))
	  (cond
	   ((or (eq poss t) (stringp poss))
	    ;; don't correct word
	    t)
	   ((null poss)
	    ;; ispell error
	    (error "Ispell: error in Ispell process"))
	   (t
	    ;; The word is incorrect, we have to propose a replacement.
	    (let ((selected
	    	   (popup-menu* 
	    	    (cons 
	    	     (popup-make-item "Close" :value 'guancio-popup-close)
	    	     (nth 2 poss))
	    	    )))
	      (cond
	       ((eq selected 'guancio-popup-close) t)
	       (t 
	      	(flyspell-do-correct
	      	 selected
	      	 poss word cursor-location start end cursor-location)
	      	))
	      )
	    ))
	  (ispell-pdict-save t)))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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


;; BUG: must remove ac if no source is used
;; BUG: Work only if you move on the second character of the word
;; TODO: Should be usefoul to complete the word while typing
;; Automatically flyspell a buffer when enablyng flyspell
(add-hook 'flyspell-mode-hook 
	  (lambda ()
	    (if flyspell-mode
		(progn
		  (flyspell-buffer)
		  (auto-complete-mode 1)
		  (setq ac-sources (append ac-sources '(ac-source-ispell)))
		  )
	      (progn
		(setq ac-sources (remove '(ac-source-ispell) ac-sources))
	      ))))


;; I cannot understant wich words is found

(if (on-guancio-studio-debian-p)
    (progn
      (global-set-key "\M-d" 'dictem-run-define)
      (global-set-key (kbd "M-w M-i M-k M-i") 'lookup-word-definition)
      (define-key dictem-mode-map (kbd "C-<down>") 'dictem-next-link)
      (define-key dictem-mode-map (kbd "C-<up>") 'dictem-previous-link)
      (define-key dictem-mode-map [(backspace)] 'dictem-last)))

(define-key flyspell-mode-map (kbd "S-<SPC>") 'guancio-spell-menu)
(define-key flyspell-mouse-map [mouse-3] 'guancio-spell-mouse-menu)

(setq dict-menu-map (make-sparse-keymap "Dictionary"))

(define-key dict-menu-map [dictem]
  `("Open Dictinary (dictem)" . dictem))
(define-key-after dict-menu-map [dictem-run-define]
  `("Define word" . dictem-run-define) 'dictem)
(define-key-after dict-menu-map [lookup-word-definition]
  `("Lookup word (Wiki)" . lookup-word-definition) 'dictem-run-define)

(define-key-after menu-bar-tools-menu [dict] (cons "Dictionary" dict-menu-map) 'spell)

(provide 'guancio_spell)