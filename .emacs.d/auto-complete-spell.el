(require 'auto-complete)

(defun ac-ispell-wrapper (word)
  (let (suggestions ispell-filter)
    ;; Now check spelling of word.
    (ispell-send-string "%\n") ; put in verbose mode
    (ispell-send-string (concat "^" word "\n")) ; lookup the word
    ;; Wait until ispell has processed word.
    (while (progn
	     (accept-process-output ispell-process)
	     (not (string= "" (car ispell-filter)))))
    ;; Remove leading empty element
    (setq ispell-filter (cdr ispell-filter))
    ;; ispell process should return something after word is sent.
    ;; Tag word as valid (i.e., skip) otherwise
    (or ispell-filter
	(setq ispell-filter '(*)))
    (when (consp ispell-filter)
      (setq suggestions (ispell-parse-output (car ispell-filter))))
    (cond
     ((or (eq suggestions t) (stringp suggestions))
      (message "Ispell: %s is correct" word)
      nil)
     ((null suggestions)
      (error "Ispell: error in Ispell process")
      nil)
     (t (car (cdr (cdr suggestions)))))))

(defun ac-ispell-candidate ()
  (let ((cursor-location (point))	; retain cursor location
	(word (ispell-get-word nil))
	start end poss new-word replace)
    ;; De-structure return word info list.
    (setq start (car (cdr word))
    	  end (car (cdr (cdr word)))
    	  word (car word)
    	  suggestions (ac-ispell-wrapper word)
    	  )
     suggestions
    )
)


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

(provide 'auto-complete-spell)
