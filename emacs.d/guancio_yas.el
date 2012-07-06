(require 'guancio_autocomplete)

(require 'yasnippet)

(defun ac-yasnippet-candidate ()
  (let ((table (yas/get-snippet-tables major-mode)))
    (if table
      (let (candidates (list))
            (mapcar (lambda (mode)          
              (maphash (lambda (key value)    
                (push key candidates))          
              (yas/snippet-table-hash mode))) 
            table)
        (all-completions ac-prefix candidates)))))

(defface ac-yasnippet-candidate-face
  '((t (:background "sandybrown" :foreground "black")))
  "Face for yasnippet candidate.")

(defface ac-yasnippet-selection-face
  '((t (:background "coral3" :foreground "white"))) 
  "Face for the yasnippet selected candidate.")

(defvar ac-source-yasnippet
  '((candidates . ac-yasnippet-candidate)
    (action . yas/expand)
    (limit . 3)
    (candidate-face . ac-yasnippet-candidate-face)
    (selection-face . ac-yasnippet-selection-face)) 
  "Source for Yasnippet.")

;; BUG: Do not remove yas from completition on unload
;; BUG: must remove ac if no source is used
(add-hook 'yas/minor-mode-hook
	  (lambda ()
	    (if yas/minor-mode
		(progn
		  (auto-complete-mode 1)
		  (setq ac-sources (append ac-sources '(ac-source-yasnippet)))
		  )
	      (progn
		(setq ac-sources (remove '(ac-source-yasnippet) ac-sources))
	    ))))

(provide 'guancio_yas)