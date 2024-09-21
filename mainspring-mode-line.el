;;; mainspring-mode-line.el --- Custom mode line.

;; Copyright (C) 2019 Jonathan Hope

;; Author: Jonathan Hope <jonathan.douglas.hope@gmail.com>
;; Version: 1.0
;; Package-Requires ((projectile "0.15.0-cvs") (window-numbering "1.1.2"))
;; Keywords: mode-line

;; This file is not part of GNU Emacs.

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this file.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; mainspring-mode-line is a custom mode line that reports the current window number,
;; whether the file is dirty, the name of the file, the project, the major mode,
;; a scroll bar, and the location in the file. It will also change depending on which
;; window is active

;;; Code:

;; Group

(defgroup mainspring-mode-line nil
  "Custome modeline theme."
  :group 'mode-line)

;; Faces

(defface mainspring-mode-line-face
  '()
  "Face used for the inactive mode line."
  :group 'mainspring-mode-line)

(defface mainspring-mode-line-inactive-face
  '()
  "Face used for the inactive mode line."
  :group 'mainspring-mode-line)

(defface mainspring-mode-line-window-number-face
  '()
  "Face used for the window number in the mode line."
  :group 'mainspring-mode-line)

(defface mainspring-mode-line-file-status-face
  '()
  "Face used for the file status in the mode line."
  :group 'mainspring-mode-line)

(defface mainspring-mode-line-buffer-name-face
  '()
  "Face used for the buffer name in the mode line."
  :group 'mainspring-mode-line)

(defface mainspring-mode-line-projectile-face
  '()
  "Face used for the project name mode line."
  :group 'mainspring-mode-line)

(defface mainspring-mode-line-mode-face
  '()
  "Face used for the major mode in the mode line."
  :group 'mainspring-mode-line)

(defface mainspring-mode-line-row-column-face
  '()
  "Face used for the row/column in the mode line."
  :group 'mainspring-mode-line)

(defface mainspring-mode-line-scroll-bar-face
  '()
  "Face used for the scroll bar in the mode line."
  :group 'mainspring-mode-line)

;; Strings

(defcustom mainspring-mode-line-window-1 "❶"
  "What character to demark the first window with."
  :group 'mainspring-mode-line)

(defcustom mainspring-mode-line-window-2 "❷"
  "What character to demark the second window with."
  :group 'mainspring-mode-line)

(defcustom mainspring-mode-line-window-3 "❸"
  "What character to demark the third window with."
  :group 'mainspring-mode-line)

(defcustom mainspring-mode-line-window-4 "❹"
  "What character to demark the fourth window with."
  :group 'mainspring-mode-line)

(defcustom mainspring-mode-line-window-5 "❺"
  "What character to demark the fifth window with."
  :group 'mainspring-mode-line)

(defcustom mainspring-mode-line-window-6 "❻"
  "What character to demark the sixth window with."
  :group 'mainspring-mode-line)

(defcustom mainspring-mode-line-window-7 "❼"
  "What character to demark the seventh window with."
  :group 'mainspring-mode-line)

(defcustom mainspring-mode-line-window-8 "❽"
  "What character to demark the eigth window with."
  :group 'mainspring-mode-line)

(defcustom mainspring-mode-line-window-9 "❾"
  "What character to demark the ninth window with."
  :group 'mainspring-mode-line)

(defcustom mainspring-mode-line-progress-0 "❰          ❱"
  "What characters to show for a progress bar of zero percent."
  :group 'mainspring-mode-line)

(defcustom mainspring-mode-line-progress-10 "❰━         ❱"
  "What characters to show for a progress bar of 10 percent."
  :group 'mainspring-mode-line)

(defcustom mainspring-mode-line-progress-20 "❰━━        ❱"
  "What characters to show for a progress bar of 20 percent."
  :group 'mainspring-mode-line)

(defcustom mainspring-mode-line-progress-30 "❰━━━       ❱"
  "What characters to show for a progress bar of 30 percent."
  :group 'mainspring-mode-line)

(defcustom mainspring-mode-line-progress-40 "❰━━━━      ❱"
  "What characters to show for a progress bar of 40 percent."
  :group 'mainspring-mode-line)

(defcustom mainspring-mode-line-progress-50 "❰━━━━━     ❱"
  "What characters to show for a progress bar of 50 percent."
  :group 'mainspring-mode-line)

(defcustom mainspring-mode-line-progress-60 "❰━━━━━━    ❱"
  "What characters to show for a progress bar of 60 percent."
  :group 'mainspring-mode-line)

(defcustom mainspring-mode-line-progress-70 "❰━━━━━━━   ❱"
  "What characters to show for a progress bar of 70 percent."
  :group 'mainspring-mode-line)

(defcustom mainspring-mode-line-progress-80 "❰━━━━━━━━  ❱"
  "What characters to show for a progress bar of 80 percent."
  :group 'mainspring-mode-line)

(defcustom mainspring-mode-line-progress-90 "❰━━━━━━━━━ ❱"
  "What characters to show for a progress bar of 90 percent."
  :group 'mainspring-mode-line)

(defcustom mainspring-mode-line-progress-100 "❰━━━━━━━━━━❱"
  "What characters to show for a progress bar of 100 percent."
  :group 'mainspring-mode-line)

(defcustom mainspring-mode-line-dirty-file "●"
  "What characters to show for a dirty file."
  :group 'mainspring-mode-line)

(defcustom mainspring-mode-line-missing-project "N/A"
  "What characters to show for a missing project."
  :group 'mainspring-mode-line)

(defcustom mainspring-mode-line-bullet "⬢"
  "What characters to use for a bullet in the mode line formatting."
  :group 'mainspring-mode-line)

(defcustom mainspring-mode-line-dash "━"
  "What characters to use for a dash in the mode line formatting."
  :group 'mainspring-mode-line)

(defcustom mainspring-mode-line-row-column-divider ","
  "What characters to use for a dividing the row and column."
  :group 'mainspring-mode-line)

;; Abstraction to figure out if mode-line is the selected window or not.


(defvar mainspring-mode-line-selected-window
  (frame-selected-window))

(defun mainspring-mode-line-set-selected-window
    (&optional window)
  (setq-default
    mainspring-mode-line-selected-window (or window (frame-selected-window))))

(defun mainspring-mode-line-selected-window-p
    (&optional window)
  (eq (or window (selected-window))
      (default-value 'mainspring-mode-line-selected-window)))

(defun mainspring-mode-line-maybe
    (&optional arg)
  (interactive "p")
  (unless (mainspring-mode-line-selected-window-p)
    (mainspring-mode-line-set-selected-window)))

(add-hook 'buffer-list-update-hook #'mainspring-mode-line-maybe)

(defun mainspring-mode-line-selected-window-active ()
  (eq mainspring-mode-line-selected-window (selected-window)))

(defun mainspring-mode-sidebar-active ()
  (derived-mode-p 'dired-sidebar-mode))

;; Force winum to behave like the rest of the modeline.

(eval-after-load "winum"
  '(progn
     (setq winum-mode-line-position 3)
     (defun winum-get-number-string (&optional window)
       (let* ((n (winum-get-number window))
              (s (when (numberp n) (cond ((string= (int-to-string n) "1") mainspring-mode-line-window-1)
                                         ((string= (int-to-string n) "2") mainspring-mode-line-window-2)
                                         ((string= (int-to-string n) "3") mainspring-mode-line-window-3)
                                         ((string= (int-to-string n) "4") mainspring-mode-line-window-4)
                                         ((string= (int-to-string n) "5") mainspring-mode-line-window-5)
                                         ((string= (int-to-string n) "6") mainspring-mode-line-window-6)
                                         ((string= (int-to-string n) "7") mainspring-mode-line-window-7)
                                         ((string= (int-to-string n) "8") mainspring-mode-line-window-8)
                                         ((string= (int-to-string n) "9") mainspring-mode-line-window-9)
                                         (t (int-to-string n))))))
         (propertize s 'face (if (mainspring-mode-line-selected-window-active) 'mainspring-mode-line-window-number-face 'mainspring-mode-line-inactive-face))))))

;; Bits of the mode-line.

;; The start of the mode line.
(defvar mainspring-mode-line-start
  '(:eval (propertize
           mainspring-mode-line-dash
           'face (if (mainspring-mode-line-selected-window-active) 'mainspring-mode-line-face 'mainspring-mode-line-inactive-face))))
(put 'mainspring-mode-line-start 'risky-local-variable t)

;; Start of a section.
(defvar mainspring-mode-line-section-start
  '(:eval (propertize
           (concat mainspring-mode-line-bullet " ")
           'face (if (mainspring-mode-line-selected-window-active) 'mainspring-mode-line-face 'mainspring-mode-line-inactive-face))))
(put 'mainspring-section-start 'risky-local-variable t)

;; End of a section.
(defvar mainspring-mode-line-section-end
  '(:eval (propertize
           (concat " " mainspring-mode-line-bullet mainspring-mode-line-dash mainspring-mode-line-dash)
           'face (if (mainspring-mode-line-selected-window-active) 'mainspring-mode-line-face 'mainspring-mode-line-inactive-face))))
(put 'mainspring-section-end 'risky-local-variable t)

;; Start of a active only section.
(defvar mainspring-mode-line-active-section-start
  '(:eval (propertize
           (if (and (not (mainspring-mode-sidebar-active)) (mainspring-mode-line-selected-window-active)) (concat mainspring-mode-line-bullet " ") "")
           'face (if (mainspring-mode-line-selected-window-active) 'mainspring-mode-line-face 'mainspring-mode-line-inactive-face))))
(put 'mainspring-active-section-start 'risky-local-variable t)

;; End of a active only section.
(defvar mainspring-mode-line-active-section-end
  '(:eval (propertize
           (if (and (not (mainspring-mode-sidebar-active)) (mainspring-mode-line-selected-window-active)) (concat " " mainspring-mode-line-bullet mainspring-mode-line-dash mainspring-mode-line-dash) "")
           'face (if (mainspring-mode-line-selected-window-active) 'mainspring-mode-line-face 'mainspring-mode-line-inactive-face))))
(put 'mainspring-mainspring-active-section-end 'risky-local-variable t)

;; Start of a non sidebar only section.
(defvar mainspring-mode-line-non-sidebar-section-start
  '(:eval (propertize
           (if (not (mainspring-mode-sidebar-active)) (concat mainspring-mode-line-bullet " ") "")
           'face (if (mainspring-mode-line-selected-window-active) 'mainspring-mode-line-face 'mainspring-mode-line-inactive-face))))
(put 'mainspring-active-section-start 'risky-local-variable t)

;; End of a non sidebar only section.
(defvar mainspring-mode-line-non-sidebar-section-end
  '(:eval (propertize
           (if (not (mainspring-mode-sidebar-active)) (concat " " mainspring-mode-line-bullet mainspring-mode-line-dash mainspring-mode-line-dash) "")
           'face (if (mainspring-mode-line-selected-window-active) 'mainspring-mode-line-face 'mainspring-mode-line-inactive-face))))
(put 'mainspring-mainspring-active-section-end 'risky-local-variable t)

;; This char is used to adjust the height of the mode line to have perfectly even padding.
(defvar mainspring-mode-line-adjust-height
  (propertize "\u200b" 'display '((raise -0.08) (height 1.1))))
(put 'mainspring-mode-line-adjust-height 'risky-local-variable t)

;; The number tied to the window the buffer is residing in.
(defvar mainspring-mode-line-window-number
  '(:eval ""))
(put 'mainspring-mode-line-window-number 'risky-local-variable t)

;; Whether the file has been edited since the last save.
(defvar mainspring-mode-line-file-status
  '(:eval
    (propertize (if (and (buffer-modified-p) (not (mainspring-mode-sidebar-active)))
                    (concat mainspring-mode-line-dirty-file " ") "")
                'face
                (if (mainspring-mode-line-selected-window-active)
                    'mainspring-mode-line-file-status-face
                  'mainspring-mode-line-inactive-face))))
(put 'mainspring-mode-line-file-status 'risky-local-variable t)

;; The name of the file being edited.
(defvar mainspring-mode-line-filename
  '(:eval (propertize (if (mainspring-mode-sidebar-active) nil "%b")
                      'face
                      (if (mainspring-mode-line-selected-window-active) 'mainspring-mode-line-buffer-name-face 'mainspring-mode-line-inactive-face))))
(put 'mainspring-mode-line-filename 'risky-local-variable t)

;; What project we are in.
(defvar mainspring-mode-line-projectile
  '(:eval  (if (and (not (mainspring-mode-sidebar-active)) (mainspring-mode-line-selected-window-active))
               (if (projectile-project-p)
                   (propertize (projectile-project-name) 'face (if (mainspring-mode-line-selected-window-active) 'mainspring-mode-line-projectile-face 'mainspring-mode-line-inactive-face))
                 (propertize mainspring-mode-line-missing-project 'face (if (mainspring-mode-line-selected-window-active) 'mainspring-mode-line-projectile-face 'mainspring-mode-line-inactive-face)))
             "")))
(put 'mainspring-mode-line-projectile 'risky-local-variable t)

;; The current major mode.
(defvar mainspring-mode-line-major-mode
  '(:eval (if (and (not (mainspring-mode-sidebar-active)) (mainspring-mode-line-selected-window-active)) (propertize "%m" 'face (if (mainspring-mode-line-selected-window-active) 'mainspring-mode-line-mode-face 'mainspring-mode-line-inactive-face)) "")))
(put 'mainspring-mode-line-major-mode 'risky-local-variable t)

(defun mainspring-mode-line-what-line-no-print ()
  "Get the current buffer line number and narrowed line number of point."
  (let ((start (point-min))
        (n (line-number-at-pos)))
    (if (= start 1)
        n
      (save-excursion
        (save-restriction
          (widen)
          (+ n (line-number-at-pos start) -1))))))

(defun mainspring-mode-line-get-scroll-percent ()
  "Calculate how far down the buffer the cursor is by line."
  (let ((current-line (- (mainspring-mode-line-what-line-no-print) 1))
        (max-line (count-lines (point-min) (point-max))))
    (if (= 0 max-line)
        0
      (* 100.0 (/ (float current-line) (float max-line))))))

(defun mainspring-mode-line-get-scroll-bar ()
  "Build an text based horizontal scroll bar."
  (let* ((p (mainspring-mode-line-get-scroll-percent))
         (s (cond ((and (> p 0) (<= p 10)) mainspring-mode-line-progress-10)
                  ((and (> p 10) (<= p 20)) mainspring-mode-line-progress-20)
                  ((and (> p 20) (<= p 30)) mainspring-mode-line-progress-30)
                  ((and (> p 30) (<= p 40)) mainspring-mode-line-progress-40)
                  ((and (> p 40) (<= p 50)) mainspring-mode-line-progress-50)
                  ((and (> p 50) (<= p 60)) mainspring-mode-line-progress-60)
                  ((and (> p 60) (<= p 70)) mainspring-mode-line-progress-70)
                  ((and (> p 70) (<= p 80)) mainspring-mode-line-progress-80)
                  ((and (> p 80) (<= p 90)) mainspring-mode-line-progress-90)
                  ((> p 90) mainspring-mode-line-progress-100)
                  (t mainspring-mode-line-progress-0))))
    (propertize s 'face (if (mainspring-mode-line-selected-window-active) 'mainspring-mode-line-scroll-bar-face 'mainspring-mode-line-inactive-face))))

;; A horizontal scroll line.
(defvar mainspring-mode-line-scroll-bar
  '(:eval (if (and (not (mainspring-mode-sidebar-active)) (mainspring-mode-line-selected-window-active)) (mainspring-mode-line-get-scroll-bar) "")))
(put 'mainspring-mode-line-scroll-bar 'risky-local-variable t)

;; The current row and column being edited.
(defvar mainspring-mode-line-row-column
  '(:eval
    (if (and (not (mainspring-mode-sidebar-active)) (mainspring-mode-line-selected-window-active))
        (concat (propertize "%01l" 'face (if (mainspring-mode-line-selected-window-active) 'mainspring-mode-line-row-column-face 'mainspring-mode-line-inactive-face))
                (propertize mainspring-mode-line-row-column-divider 'face (if (mainspring-mode-line-selected-window-active) 'mainspring-mode-line-row-column-face 'mainspring-mode-line-inactive-face))
                (propertize "%01c" 'face (if (mainspring-mode-line-selected-window-active) 'mainspring-mode-line-row-column-face 'mainspring-mode-line-inactive-face)))
      "")))
(put 'mainspring-mode-line-row-column 'risky-local-variable t)

;; The end of the mode line.
(defvar mainspring-mode-line-end
  '(:eval (propertize (make-string 400 (string-to-char mainspring-mode-line-dash)) 'face (if (mainspring-mode-line-selected-window-active) 'mainspring-mode-line-face 'mainspring-mode-line-inactive-face))))
(put 'mainspring-mode-line-end 'risky-local-variable t)

;; The mode-line.

(setq-default mode-line-format
              (list
               mainspring-mode-line-start

               mainspring-mode-line-section-start
               mainspring-mode-line-adjust-height
               mainspring-mode-line-window-number
               mainspring-mode-line-adjust-height
               mainspring-mode-line-section-end

               mainspring-mode-line-non-sidebar-section-start
               mainspring-mode-line-file-status
               mainspring-mode-line-filename
               mainspring-mode-line-non-sidebar-section-end

               mainspring-mode-line-active-section-start
               mainspring-mode-line-projectile
               mainspring-mode-line-active-section-end

               mainspring-mode-line-active-section-start
               mainspring-mode-line-major-mode
               mainspring-mode-line-active-section-end

               mainspring-mode-line-active-section-start
               mainspring-mode-line-scroll-bar
               mainspring-mode-line-active-section-end

               mainspring-mode-line-active-section-start
               mainspring-mode-line-row-column
               mainspring-mode-line-active-section-end

               mainspring-mode-line-end))

(provide 'mainspring-mode-line)

;; mainspring-mode-line.el ends here
