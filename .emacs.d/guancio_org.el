(add-hook 'org-load-hook
	  (lambda ()
	    (define-key org-mode-map [(shift left)] nil)
	    (define-key org-mode-map [(shift right)] nil)
	    (define-key org-mode-map [(shift up)] nil)
	    (define-key org-mode-map [(shift down)] nil)
	    (define-key org-mode-map [(control shift left)] nil)
	    (define-key org-mode-map [(control shift right)] nil)
	    (define-key org-mode-map [(control shift up)] nil)
	    (define-key org-mode-map [(control shift down)] nil)
	    (define-key org-mode-map (kbd "M-]") 'org-shiftright)
	    (define-key org-mode-map (kbd "M-[") 'org-shiftleft)
	    (define-key org-mode-map (kbd "M-=") 'org-shiftup)
	    (define-key org-mode-map (kbd "M--") 'org-shiftdown)
	    
	    (define-key org-mode-map (kbd "M-a") nil)

	    (define-key org-mode-map "\C-a" nil)
	    (define-key org-mode-map (kbd "M-<right>") nil)
	    (define-key org-mode-map (kbd "M-<left>") nil)
	    (define-key org-mode-map  (kbd "M-<down>") nil)
	    (define-key org-mode-map (kbd "M-<up>") nil)
	    )
	  )
(setq org-log-done t)

(setq org-icalendar-include-todo t)

(setq org-agenda-files (list "~/Desktop/agenda.org"))

(define-key global-map "\M-a" 'org-agenda)

(setq org-enforce-todo-dependencies t)

(provide 'guancio_org)