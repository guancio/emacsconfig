(require 'auto-complete)

;;(setq ac-auto-start nil)
(setq ac-auto-start 1)
(setq ac-dwim t)
;; non so perche' da errore con l'emacs stable non cvs
;; (global-auto-complete-mode t)

(global-set-key (kbd "C-SPC") 'ac-start)
(define-key ac-complete-mode-map [escape] 'ac-stop)
(define-key ac-complete-mode-map (kbd "C-SPC") 'ac-stop)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                                         
;;; End Auto Completion                                                                                        
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; BUG: Problems when resizing the text
;; BUG: Find a way to sort different source of completition
(provide 'guancio_autocomplete)
