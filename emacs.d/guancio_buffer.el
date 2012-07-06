(defun guancio-new-empty-buffer ()
  "Emulate new file function of standard text editors.
Generate a new buffer called Untiled and switch the current window to that buffer"
  (interactive)
  (switch-to-buffer (generate-new-buffer "Untiled"))
)
(defun guancio-close-current-buffer ()
  "Close (kill) the current buffer.
If the frame is splitted into several windows, close the freme that is displaying the buffer.
"
  (interactive)
  (kill-buffer (current-buffer))
  (delete-window)
)

(defun guancio-revert-buffer ()
  "Reload (revert) a buffer (file) from the disk.
Requires user confirmation only if the buffer has been changed.
"
  (interactive)
  (if (buffer-modified-p)
      (revert-buffer t nil t)
      (revert-buffer t t t)
      )
)

;; Window management
;; Detach a window from the current frame
(defun detach-window ()
  (interactive)
  (make-frame-command)
  (delete-window)
  )
;; Move to the previous window
(defun select-previous-window ()
  (interactive)
  (other-window -1)
  )

;;; First version; has bugs!
(defun count-words-region (beginning end)
  "Print number of words in the region.
Words are defined as at least one word-constituent
character followed by at least one character that
is not a word-constituent.  The buffer's syntax
table determines which characters these are."
  (interactive "r")
  (message "Counting words in region ... ")

;;; 1. Set up appropriate conditions.
  (save-excursion
    (goto-char beginning)
    (let ((count 0))

;;; 2. Run the while loop.
      (while (< (point) end)
        (re-search-forward "\\w+\\W*")
        (setq count (1+ count)))

;;; 3. Send a message to the user.
      (cond ((zerop count)
             (message
              "The region does NOT have any words."))
            ((= 1 count)
             (message
              "The region has 1 word."))
            (t
             (message
              "The region has %d words." count))))))

(provide 'guancio_buffer)