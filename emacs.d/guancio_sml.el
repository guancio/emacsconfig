(require 'sml-mode)

(add-hook 'sml-mode-hook (lambda ()
			   (setq ac-sources nil)
			   (auto-fill-mode)
			   ;; (my-latex-map)
			   (yas/minor-mode-on)
			   )
)


(provide 'guancio_sml)