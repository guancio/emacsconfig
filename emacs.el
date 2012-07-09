; Add ~/.emacs.d to load-path
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/modules")
(add-to-list 'load-path "~/.emacs.d/modules/popup-el")
(add-to-list 'load-path "~/.emacs.d/modules/auto-complete")
(add-to-list 'load-path "~/.emacs.d/modules/emacs-calfw")
(add-to-list 'load-path "/usr/share/emacs23/site-lisp/sml-mode")

(require 'guancio_custom)
(require 'guancio_global_key)
(require 'guancio_buffer)
(require 'guancio_search)
(require 'guancio_copy_paste)

(require 'guancio_clean_menu)

(require 'guancio_autocomplete)

(require 'guancio_spell)
(require 'guancio_yas)

(require 'guancio_latex)
(require 'guancio_ledger)

(require 'guancio_org)

(require 'guancio_sml)

;; (require 'guancio_sc)
