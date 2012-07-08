(require 'org)
(require 'popup)
(require 'calfw-org)

(defun guancio-org-menu ()
  "Pop up a menu of possible corrections for misspelled word before point."
  (interactive)
  ;; use the correct dictionary
  (let ((items '()))
    (let ((times '()))
      (if (org-at-timestamp-p t)
	  (progn
	    (setq times (cons 
			 (popup-make-item "Open calendar" :value 'guancio-popup-opencalendar)
			 times))
	    (setq times (cons 
			 (popup-make-item "Open agenda" :value 'guancio-popup-openagenda)
			 times))
	  ))
      (if (org-on-heading-p)
	  (progn
	    (setq times (cons 
			 (popup-make-item "Schedule" :value 'guancio-popup-schedule)
			 times))
	    (setq times (cons 
			 (popup-make-item "Deadline" :value 'guancio-popup-deadline)
			 times))))
      (setq times (cons 
		   (popup-make-item "Timestamp" :value 'guancio-popup-timestamp)
		   times))
      (setq times (cons "Time" times))
      (setq items (cons times items)))
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
	  (popup-cascade-menu items)))
      (cond
       ((eq selected 'guancio-popup-close) t)
       ((eq selected 'guancio-popup-shiftleft) (org-shiftleft))
       ((eq selected 'guancio-popup-shiftright) (org-shiftright))
       ((eq selected 'guancio-popup-timestamp) (org-time-stamp nil))
       ((eq selected 'guancio-popup-schedule) (org-schedule))
       ((eq selected 'guancio-popup-deadline) (org-deadline))
       ((eq selected 'guancio-popup-opencalendar) (org-goto-calendar))
       ((eq selected 'guancio-popup-openagenda) (org-open-at-point))
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
	    
	    (define-key org-mode-map [(shift end)] nil)
	    (define-key org-mode-map [(shift home)] nil)

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

	    (define-key org-mode-map [(menu)] 'guancio-org-menu)
	    
	    (turn-on-auto-fill)
	    (flyspell-mode t)
	    )
	  )
(setq org-log-done t)
(setq org-enforce-todo-dependencies t)
(setq org-agenda-files (list "~/Desktop/agenda.org"))


(define-key cfw:calendar-mode-map "h" nil)
(define-key cfw:calendar-mode-map "b" nil)
(define-key cfw:calendar-mode-map "f" nil)
(define-key cfw:calendar-mode-map "l" nil)

(define-key cfw:calendar-mode-map "p" nil)
(define-key cfw:calendar-mode-map "k" nil)
(define-key cfw:calendar-mode-map [(control up)] 'cfw:navi-previous-week-command)

(define-key cfw:calendar-mode-map "n" nil)
(define-key cfw:calendar-mode-map "j" nil)
(define-key cfw:calendar-mode-map [(control down)] 'cfw:navi-next-week-command)

(define-key cfw:calendar-mode-map ">" nil)
(define-key cfw:calendar-mode-map "<" nil)
(define-key cfw:calendar-mode-map "." nil)
(define-key cfw:calendar-mode-map "g" nil)
(define-key cfw:calendar-mode-map [(control g)] 'cfw:navi-goto-date-command)

(define-key cfw:calendar-mode-map [(up)] 'cfw:navi-previous-item-command)
(define-key cfw:calendar-mode-map [(down)] 'cfw:navi-next-item-command)


(define-key cfw:calendar-mode-map "D" nil)
(define-key cfw:calendar-mode-map "d" 'cfw:change-view-day)
(define-key cfw:calendar-mode-map "W" nil)
(define-key cfw:calendar-mode-map "w" 'cfw:change-view-week)
(define-key cfw:calendar-mode-map "T" nil)
(define-key cfw:calendar-mode-map "W" 'cfw:change-view-two-week)
(define-key cfw:calendar-mode-map "M" nil)
(define-key cfw:calendar-mode-map "m" 'cfw:change-view-month)

(easy-menu-define cfw:calendar-menu cfw:calendar-mode-map "Calendar"
  '("Calendar"
    ["Today" cfw:navi-goto-today-command t]
    ["Go To" cfw:navi-goto-date-command t]
    ["Day Prev" cfw:navi-previous-day-command t]
    ["Day Next" cfw:navi-next-day-command t]
    ["Week Prev" cfw:navi-previous-week-command t]
    ["Week Next" cfw:navi-next-week-command t]
    ["Month Prev" cfw:navi-previous-month-command t]
    ["Month Next" cfw:navi-next-month-command t]
    ("View"
     ["Day" cfw:change-view-day t]
     ["Week" cfw:change-view-week t]
     ["2 Week" cfw:change-view-two-week t]
     ["Month" cfw:change-view-month t]
     )
    ["Detail" cfw:org-open-agenda-day t]
    ["Open" cfw:org-onclick t]
))


(custom-set-faces
 '(cfw:face-toolbar ((t :foreground "Steelblue4" :background "Steelblue4")))
 '(cfw:face-toolbar-button-off ((t :foreground "#d0bf8f" :weight bold :background "Steelblue4")))
 '(cfw:face-toolbar-button-on ((t :foreground "Gray10" :weight bold :background "Steelblue4"))))


(define-key global-map [f2] 'org-agenda)
(define-key global-map [f3] 'cfw:open-org-calendar)

(provide 'guancio_org)