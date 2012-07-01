; Add ~/.emacs.d to load-path
(add-to-list 'load-path ".emacs.d")
(add-to-list 'load-path "modules")


(require 'guancio_custom)
(require 'guancio_global_key)
(require 'guancio_buffer)
(require 'guancio_search)
(require 'guancio_copy_paste)

(require 'guancio_clean_menu)

(require 'guancio_spell)
