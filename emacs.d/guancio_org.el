(require 'org)

(defun guancio-org-menu ()
  "Pop up a menu of possible corrections for misspelled word before point."
  (interactive)
  ;; use the correct dictionary
  (let ((items '()))
  (cond
   ((org-at-timestamp-p t)
    (setq items (cons
		 (popup-make-item "Prev day" :value 'guancio-popup-shiftleft)
		 items))
    (setq items (cons
		 (popup-make-item "Next day" :value 'guancio-popup-shiftright)
		 items)))
   ((org-on-heading-p)
    (setq items (cons
		 (popup-make-item "None<TODO<DONE" :value 'guancio-popup-shiftleft)
		 items))
    (setq items (cons
		 (popup-make-item "None>TODO>DONE" :value 'guancio-popup-shiftright)
		 items)))
   ((org-at-item-p)
    (setq items (cons
		 (popup-make-item "List <" :value 'guancio-popup-shiftleft)
		 items))
    (setq items (cons
		 (popup-make-item "List >" :value 'guancio-popup-shiftright)
		 items)))
   ;; ((org-at-property-p)
   ;;  (call-interactively 'org-property-next-allowed-value))
   ;; ((org-clocktable-try-shift 'right arg))
   (t t))
  (if t 
      (setq items (cons
		   (popup-make-item "Close" :value 'guancio-popup-close)
		   items))
    )
  (let 
      ((selected
	(popup-menu* items)))
    (cond
     ((eq selected 'guancio-popup-close) t)
     ((eq selected 'guancio-popup-shiftleft) (org-shiftleft))
     ((eq selected 'guancio-popup-shiftright) (org-shiftright))
     (t t)
     )
    )))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(add-hook 'org-mode-hook
	  (lambda ()
	    (define-key org-mode-map [(shift left)] nil)
	    (define-key org-mode-map [(shift right)] nil)
	    (define-key org-mode-map [(shift up)] nil)
	    (define-key org-mode-map [(shift down)] nil)
	    (define-key org-mode-map [(control shift left)] nil)
	    (define-key org-mode-map [(control shift right)] nil)
	    (define-key org-mode-map [(control shift up)] nil)
	    (define-key org-mode-map [(control shift down)] nil)
	    
	    (define-key org-mode-map (kbd "M-a") nil)

	    (define-key org-mode-map "\C-a" nil)
	    (define-key org-mode-map (kbd "M-<right>") nil)
	    (define-key org-mode-map (kbd "M-<left>") nil)
	    (define-key org-mode-map  (kbd "M-<down>") nil)
	    (define-key org-mode-map (kbd "M-<up>") nil)

	    (define-key org-mode-map (kbd "M-d") 'org-shiftright)
	    (define-key org-mode-map (kbd "M-a") 'org-shiftleft)
	    (define-key org-mode-map (kbd "M-w") 'org-shiftup)
	    (define-key org-mode-map (kbd "M-s") 'org-shiftdown)

	    (define-key org-mode-map (kbd "M-D") 'org-shiftmetaright)
	    (define-key org-mode-map (kbd "M-A") 'org-shiftmetaleft)
	    (define-key org-mode-map (kbd "M-W") 'org-shiftmetaup)
	    (define-key org-mode-map (kbd "M-S") 'org-shiftmetadown)
	    (turn-on-auto-fill)
	    (flyspell-mode t)
	    )
	  )
(setq org-log-done t)

(setq org-agenda-files (list "~/Desktop/agenda.org"))

(define-key global-map [f2] 'org-agenda)

(setq org-enforce-todo-dependencies t)

(provide 'guancio_org)