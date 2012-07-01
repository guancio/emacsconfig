;; Graphics stuff
(column-number-mode t)
(setq inhibit-startup-screen t)
(menu-bar-mode t)
(set-scroll-bar-mode 'right)
(show-paren-mode t)


;; ; Use wombat theme
(load "color-theme-wombat+.el")
(color-theme-wombat+)

(setq ido-default-buffer-method (quote selected-window))
(setq ido-default-file-method (quote selected-window))
;; Activate the ido-mode, a useful tool to navigate buffers and files
;; inside the minibuffer
(ido-mode t)

(setq use-dialog-box nil)

;; Disable the tollbars
(tool-bar-mode -1)


(provide 'guancio_custom)