(require 'auto-complete)

(defun prefix-list-elements (list prefix)
  (let (value)
    (nreverse
     (dolist (element list value)
      (setq value (cons (format "%s%s" prefix element) value))))))

(defun ac-rope-candidate ()
  (prefix-list-elements (rope-completions) ac-target))


(defface ac-rope-candidate-face
  '((t (:background "white" :foreground "black")))
  "Face for yasnippet candidate.")

(defface ac-rope-selection-face
  '((t (:background "green" :foreground "black"))) 
  "Face for the yasnippet selected candidate.")

(defvar ac-source-rope
  '((candidates . ac-rope-candidate)
    (action)
    (limit . 3)
    (candidate-face . ac-rope-candidate-face)
    (selection-face . ac-rope-selection-face)) 
  "Source for Rope.")

(provide 'auto-complete-rope)
