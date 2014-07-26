;;; flatui-theme.el --- A color theme for Emacs based on flatuicolors.com

;; Copyright (C) 2014 John Louis Del Rosario

;; Author: John Louis Del Rosario <john2x@gmail.com>
;; URL: https://github.com/john2x/flatui-theme.el
;; Version: 0.2

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; A light theme based on the colors from http://flatuicolors.com.
;; Vim version can be found at https://github.com/john2x/flatui.vim.


;;; Credits:

;; This theme was modified from zenburn-theme.el by Bozhidar Batsov
;; https://github.com/bbatsov/zenburn-emacs

;;; Code:

(deftheme flatui "FlatUI based color theme.")

;;; Color Palette

(defvar flatui-colors-alist
  '(("clouds"          . "#ecf0f1")
    ("silver"          . "#dfe4ea")
    ("concrete"        . "#95a5a6")
    ("asbestos"        . "#7f8c8d")
    ("wet-asphalt"     . "#34495e")
    ("midnight-blue"   . "#2c3e50")

    ("turquoise"       . "#1abc9c")
    ("green-sea"       . "#16a085")

    ("emerald"         . "#2ecc71")
    ("nephritis"       . "#27ae60")

    ("peter-river"     . "#2492db")
    ("belize-hole"     . "#0a74b9")

    ("amethyst"        . "#9b59b6")
    ("wisteria"        . "#8e44ad")

    ("sun-flower"      . "#f1c40f")
    ("orange"          . "#d98c10")

    ("carrot"          . "#e67e22")
    ("pumpkin"         . "#d35400")

    ("alizarin"        . "#e74c3c")
    ("pomegranate"     . "#c0392b"))
  "List of FlatUI colors.
Each element has the form (NAME . HEX). ")

(defmacro flatui/with-color-variables (&rest body)
  "`let' bind all colors defined in `flatui-colors-alist' around BODY.
Also bind `class' to ((class color) (min-colors 89))."
  (declare (indent 0))
  `(let ((class '((class color) (min-colors 89)))
         ,@(mapcar (lambda (cons)
                     (list (intern (car cons)) (cdr cons)))
                   flatui-colors-alist))
     ,@body))

;;; Theme Faces
(flatui/with-color-variables
  (custom-theme-set-faces
   'flatui
;;;; Built-in
;;;;; basic coloring
   '(button ((t (:underline nil))))
   `(link ((t (:foreground ,peter-river :underline nil :weight normal))))
   `(link-visited ((t (:foreground ,amethyst :underline nil :weight normal))))
   `(default ((t (:foreground ,midnight-blue :background ,clouds))))
   `(cursor ((t (:foreground ,midnight-blue :background ,pumpkin))))
   `(escape-glyph ((t (:foreground ,sun-flower :bold t))))
   `(fringe ((t (:foreground ,wet-asphalt :background ,asbestos))))
   `(header-line ((t (:foreground ,midnight-blue :background ,wet-asphalt :box nil :height ,(face-attribute 'default :height)))))
   `(highlight ((t (:background ,turquoise))))
   `(success ((t (:foreground ,nephritis :weight normal))))
   `(warning ((t (:foreground ,pumpkin :weight normal))))

;;;;; company
   `(company-tooltip ((t (:foreground ,peter-river :background ,clouds))))
   `(company-tooltip-selection ((t (:foreground ,peter-river :background ,silver))))
   `(company-tooltip-mouse ((t (:foreground ,orange :background ,clouds))))
   `(company-tooltip-common ((t (:foreground ,midnight-blue :background ,clouds))))
   `(company-tooltip-common-selection ((t (:foreground ,midnight-blue :background ,silver))))
   `(company-tooltip-annotation ((t (:foreground ,orange :background ,clouds))))
   `(company-scrollbar-fg ((t (:foreground ,concrete :background ,concrete))))
   `(company-scrollbar-bg ((t (:foreground ,silver :background ,silver))))
   `(company-preview ((t (:foreground ,orange :background ,clouds))))
   `(company-preview-common ((t (:foreground ,asbestos :background ,silver))))
   `(company-preview-search ((t (:foreground ,midnight-blue :background ,clouds))))
   `(company-echo ((t (:foreground ,midnight-blue :background ,clouds))))
   `(company-echo-common ((t (:foreground ,midnight-blue :background ,clouds))))

;;;;; compilation
   `(compilation-column-face ((t (:foreground ,orange))))
   `(compilation-enter-directory-face ((t (:foreground ,green-sea))))
   `(compilation-error-face ((t (:foreground ,pomegranate :weight normal :underline nil))))
   `(compilation-face ((t (:foreground ,midnight-blue))))
   `(compilation-info-face ((t (:foreground ,peter-river))))
   `(compilation-info ((t (:foreground ,nephritis :underline nil))))
   `(compilation-leave-directory-face ((t (:foreground ,wisteria))))
   `(compilation-line-face ((t (:foreground ,sun-flower))))
   `(compilation-line-number ((t (:foreground ,sun-flower))))
   `(compilation-message-face ((t (:foreground ,wet-asphalt))))
   `(compilation-warning-face ((t (:foreground ,pumpkin :weight normal :underline nil))))
   `(compilation-mode-line-exit ((t (:foreground ,turquoise :weight normal))))
   `(compilation-mode-line-fail ((t (:foreground ,pomegranate :weight normal))))
   `(compilation-mode-line-run ((t (:foreground ,orange :weight normal))))
;; ;;;;; grep
   `(grep-context-face ((t (:foreground ,wet-asphalt))))
   `(grep-error-face ((t (:foreground ,pomegranate :weight normal :underline nil))))
   `(grep-hit-face ((t (:foreground ,turquoise :weight normal))))
   `(grep-match-face ((t (:foreground ,sun-flower :weight normal))))
   `(match ((t (:background ,turquoise :foreground ,wet-asphalt))))
;; ;;;;; isearch
   `(isearch ((t (:foreground ,clouds :weight normal :background ,alizarin))))
   `(isearch-fail ((t (:foreground ,sun-flower :weight normal :background ,pomegranate))))
   `(lazy-highlight ((t (:foreground ,clouds :weight normal :background ,sun-flower))))

   `(menu ((t (:foreground ,midnight-blue :background ,silver))))
   `(minibuffer-prompt ((t (:foreground ,wet-asphalt :weight normal))))
   `(region ((,class (:background ,sun-flower :foreground ,midnight-blue))
             (t :inverse-video t)))
   `(secondary-selection ((t (:background ,turquoise))))
   `(trailing-whitespace ((t (:background ,alizarin))))
   `(vertical-border ((t (:foreground ,silver))))
;;;;; font lock
   `(font-lock-builtin-face ((t (:foreground ,green-sea))))
   `(font-lock-comment-face ((t (:foreground ,asbestos))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,concrete))))
   `(font-lock-constant-face ((t (:foreground ,carrot))))
   `(font-lock-doc-face ((t (:foreground ,asbestos))))
   `(font-lock-function-name-face ((t (:foreground ,peter-river :weight normal))))
   `(font-lock-keyword-face ((t (:foreground ,orange))))
   `(font-lock-negation-char-face ((t (:foreground ,peter-river :weight normal))))
   `(font-lock-preprocessor-face ((t (:foreground ,alizarin :weight normal))))
   `(font-lock-regexp-grouping-construct ((t (:foreground ,orange :weight normal))))
   `(font-lock-regexp-grouping-backslash ((t (:foreground ,amethyst :weight normal))))
   `(font-lock-string-face ((t (:foreground ,belize-hole))))
   `(font-lock-type-face ((t (:foreground ,peter-river))))
   `(font-lock-variable-name-face ((t (:foreground ,wisteria))))
   `(font-lock-warning-face ((t (:foreground ,pumpkin :weight normal))))

   `(c-annotation-face ((t (:inherit font-lock-constant-face))))
;;;; Third-party
;;;;; ace-jump
   `(ace-jump-face-background
     ((t (:foreground ,asbestos :background ,clouds :inverse-video nil))))
   `(ace-jump-face-foreground
     ((t (:foreground ,pumpkin :background ,clouds :inverse-video nil))))
;;;;; anzu
   `(anzu-mode-line ((t (:foreground ,turquoise :weight normal))))
;;;;; auto-complete
   `(ac-candidate-face ((t (:background ,concrete :foreground ,midnight-blue))))
   `(ac-selection-face ((t (:background ,asbestos :foreground ,midnight-blue))))
   `(popup-tip-face ((t (:background ,sun-flower :foreground ,midnight-blue))))
   `(popup-scroll-bar-foreground-face ((t (:background ,asbestos))))
   `(popup-scroll-bar-background-face ((t (:background ,silver))))
   `(popup-isearch-match ((t (:background ,clouds :foreground ,midnight-blue))))
;;;;; TODO: bm
   ;; `(bm-face ((t (:background ,zenburn-yellow-1 :foreground ,zenburn-bg))))
   ;; `(bm-fringe-face ((t (:background ,zenburn-yellow-1 :foreground ,zenburn-bg))))
   ;; `(bm-fringe-persistent-face ((t (:background ,zenburn-green-1 :foreground ,zenburn-bg))))
   ;; `(bm-persistent-face ((t (:background ,zenburn-green-1 :foreground ,zenburn-bg))))
;;;;; clojure-test-mode
   `(clojure-test-failure-face ((t (:foreground ,carrot :weight normal :underline nil))))
   `(clojure-test-error-face ((t (:foreground ,alizarin :weight normal :underline nil))))
   `(clojure-test-success-face ((t (:foreground ,emerald :weight normal :underline nil))))
;;;;; diff
   `(diff-added ((,class (:foreground ,nephritis :background ,clouds))
                 (t (:foreground ,nephritis :background ,clouds))))
   `(diff-changed ((t (:foreground ,carrot))))
   `(diff-context ((t (:foreground ,concrete))))
   `(diff-removed ((,class (:foreground ,alizarin :background ,clouds))
                   (t (:foreground ,alizarin :background ,clouds))))
   `(diff-refine-added ((t :inherit diff-added :background ,nephritis :foreground ,clouds :weight normal)))
   `(diff-refine-change ((t :inherit diff-changed :weight normal :foreground ,clouds)))
   `(diff-refine-removed ((t :inherit diff-removed :background ,alizarin :weight normal :foreground ,clouds)))
   `(diff-header ((,class (:foreground ,midnight-blue :weight normal))
                  (t (:foreground ,midnight-blue :weight normal))))
   `(diff-file-header
     ((,class (:foreground ,midnight-blue :weight normal))
      (t (:foreground ,midnight-blue :weight normal))))
   `(diff-hunk-header
     ((,class (:foreground ,wisteria :weight normal))
      (t (:foreground ,wisteria :weight normal))))

;;;;; diff-hl
   `(diff-hl-insert ((t (:foreground ,green-sea :background ,nephritis))))
   `(diff-hl-delete ((t (:foreground ,pomegranate :background ,alizarin))))
   `(diff-hl-change ((t (:foreground ,pumpkin :background ,carrot))))

;;;;; dired/dired+/dired-subtree
   `(diredp-display-msg ((t (:foreground ,belize-hole))))
   `(diredp-compressed-file-suffix ((t (:foreground ,amethyst))))
   `(diredp-date-time ((t (:foreground ,carrot))))
   `(diredp-deletion ((t (:foreground ,alizarin))))
   `(diredp-deletion-file-name ((t (:foreground ,alizarin))))
   `(diredp-dir-heading ((t (:foreground ,peter-river :background ,silver :weight normal))))
   `(diredp-dir-priv ((t (:foreground ,peter-river))))
   `(diredp-exec-priv ((t (:foreground ,carrot))))
   `(diredp-executable-tag ((t (:foreground ,pumpkin))))
   `(diredp-file-name ((t (:foreground ,midnight-blue))))
   `(diredp-file-suffix ((t (:foreground ,wisteria))))
   `(diredp-flag-mark ((t (:foreground ,sun-flower))))
   `(diredp-flag-mark-line ((t (:foreground ,orange))))
   `(diredp-ignored-file-name ((t (:foreground ,concrete))))
   `(diredp-link-priv ((t (:foreground ,amethyst))))
   `(diredp-mode-line-flagged ((t (:foreground ,sun-flower))))
   `(diredp-mode-line-marked ((t (:foreground ,orange))))
   `(diredp-no-priv ((t (:foreground ,midnight-blue))))
   `(diredp-number ((t (:foreground ,belize-hole))))
   `(diredp-other-priv ((t (:foreground ,wet-asphalt))))
   `(diredp-rare-priv ((t (:foreground ,pumpkin))))
   `(diredp-read-priv ((t (:foreground ,green-sea))))
   `(diredp-symlink ((t (:foreground ,clouds :background ,amethyst))))
   `(diredp-write-priv ((t (:foreground ,pumpkin))))
   `(dired-subtree-depth-1-face ((t (:background ,silver))))
   `(dired-subtree-depth-2-face ((t (:background ,concrete))))
   `(dired-subtree-depth-3-face ((t (:background ,asbestos))))
;;;;; ediff
   `(ediff-current-diff-A ((t (:foreground ,midnight-blue :background ,alizarin))))
   `(ediff-current-diff-Ancestor ((t (:foreground ,midnight-blue :background ,alizarin))))
   `(ediff-current-diff-B ((t (:foreground ,midnight-blue :background ,emerald))))
   `(ediff-current-diff-C ((t (:foreground ,midnight-blue :background ,peter-river))))
   `(ediff-even-diff-A ((t (:background ,clouds))))
   `(ediff-even-diff-Ancestor ((t (:background ,clouds))))
   `(ediff-even-diff-B ((t (:background ,silver))))
   `(ediff-even-diff-C ((t (:background ,silver))))
   `(ediff-fine-diff-A ((t (:foreground ,midnight-blue :background ,alizarin :weight normal))))
   `(ediff-fine-diff-Ancestor ((t (:foreground ,midnight-blue :background ,alizarin weight bold))))
   `(ediff-fine-diff-B ((t (:foreground ,midnight-blue :background ,emerald :weight normal))))
   `(ediff-fine-diff-C ((t (:foreground ,midnight-blue :background ,peter-river :weight normal ))))
   `(ediff-odd-diff-A ((t (:background ,silver))))
   `(ediff-odd-diff-Ancestor ((t (:background ,silver))))
   `(ediff-odd-diff-B ((t (:background ,silver))))
   `(ediff-odd-diff-C ((t (:background ,silver))))
;;;;; TODO: erc
;;    `(erc-action-face ((t (:inherit erc-default-face))))
;;    `(erc-bold-face ((t (:weight normal))))
;;    `(erc-current-nick-face ((t (:foreground ,zenburn-blue :weight normal))))
;;    `(erc-dangerous-host-face ((t (:inherit font-lock-warning-face))))
;;    `(erc-default-face ((t (:foreground ,zenburn-fg))))
;;    `(erc-direct-msg-face ((t (:inherit erc-default))))
;;    `(erc-error-face ((t (:inherit font-lock-warning-face))))
;;    `(erc-fool-face ((t (:inherit erc-default))))
;;    `(erc-highlight-face ((t (:inherit hover-highlight))))
;;    `(erc-input-face ((t (:foreground ,zenburn-yellow))))
;;    `(erc-keyword-face ((t (:foreground ,zenburn-blue :weight normal))))
;;    `(erc-nick-default-face ((t (:foreground ,zenburn-yellow :weight normal))))
;;    `(erc-my-nick-face ((t (:foreground ,zenburn-red :weight normal))))
;;    `(erc-nick-msg-face ((t (:inherit erc-default))))
;;    `(erc-notice-face ((t (:foreground ,zenburn-green))))
;;    `(erc-pal-face ((t (:foreground ,zenburn-orange :weight normal))))
;;    `(erc-prompt-face ((t (:foreground ,zenburn-orange :background ,zenburn-bg :weight normal))))
;;    `(erc-timestamp-face ((t (:foreground ,zenburn-green+4))))
;;    `(erc-underline-face ((t (:underline nil))))
;;;;; eshell
   `(eshell-prompt ((t (:foreground ,pomegranate :weight normal))))
   `(eshell-ls-archive ((t (:foreground ,amethyst :weight normal))))
   `(eshell-ls-backup ((t (:inherit font-lock-comment-face))))
   `(eshell-ls-clutter ((t (:inherit font-lock-comment-face))))
   `(eshell-ls-directory ((t (:foreground ,peter-river :weight normal))))
   `(eshell-ls-executable ((t (:foreground ,pumpkin))))
   `(eshell-ls-unreadable ((t (:foreground ,concrete))))
   `(eshell-ls-missing ((t (:inherit font-lock-warning-face))))
   `(eshell-ls-product ((t (:inherit font-lock-doc-face))))
   `(eshell-ls-special ((t (:foreground ,sun-flower :weight normal))))
   `(eshell-ls-symlink ((t (:foreground ,clouds :background ,amethyst))))
;;;;; flx
   `(flx-highlight-face ((t (:foreground ,orange :weight normal))))
;;;;; flycheck
   `(flycheck-error
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,alizarin) :inherit unspecified))
      (t (:foreground ,alizarin :weight normal :underline nil))))
   `(flycheck-warning
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,orange) :inherit unspecified))
      (t (:foreground ,sun-flower :weight normal :underline nil))))
   `(flycheck-info
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,wisteria) :inherit unspecified))
      (t (:foreground ,amethyst :weight normal :underline nil))))
   `(flycheck-fringe-error ((t (:foreground ,pomegranate :weight normal))))
   `(flycheck-fringe-warning ((t (:foreground ,orange :weight normal))))
   `(flycheck-fringe-info ((t (:foreground ,wisteria :weight normal))))
;;;;; flymake
   `(flymake-errline
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,alizarin)
                   :inherit unspecified :foreground unspecified :background unspecified))
      (t (:foreground ,alizarin :weight normal :underline nil))))
   `(flymake-warnline
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,orange)
                   :inherit unspecified :foreground unspecified :background unspecified))
      (t (:foreground ,orange :weight normal :underline nil))))
   `(flymake-infoline
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,wisteria)
                   :inherit unspecified :foreground unspecified :background unspecified))
      (t (:foreground ,wisteria :weight normal :underline nil))))
;;;;; flyspell
   `(flyspell-duplicate
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,orange) :inherit unspecified))
      (t (:foreground ,orange :weight normal :underline nil))))
   `(flyspell-incorrect
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,alizarin) :inherit unspecified))
      (t (:foreground ,alizarin :weight normal :underline nil))))
;;;;; TODO: full-ack
   ;; `(ack-separator ((t (:foreground ,zenburn-fg))))
   ;; `(ack-file ((t (:foreground ,zenburn-blue))))
   ;; `(ack-line ((t (:foreground ,zenburn-yellow))))
   ;; `(ack-match ((t (:foreground ,zenburn-orange :background ,zenburn-bg-1 :weight normal))))
;;;;; git-gutter
   `(git-gutter:added ((t (:foreground ,emerald :weight normal))))
   `(git-gutter:deleted ((t (:foreground ,alizarin :weight normal))))
   `(git-gutter:modified ((t (:foreground ,carrot :weight normal))))
   `(git-gutter:unchanged ((t (:foreground ,midnight-blue :weight normal))))
;;;;; git-gutter-fr
   `(git-gutter-fr:added ((t (:foreground ,emerald  :weight normal))))
   `(git-gutter-fr:deleted ((t (:foreground ,alizarin :weight normal))))
   `(git-gutter-fr:modified ((t (:foreground ,carrot :weight normal))))
;; ;;;;; git-rebase-mode
;;    `(git-rebase-hash ((t (:foreground, zenburn-orange))))
;;;;; guide-key
   `(guide-key/highlight-command-face ((t (:foreground ,peter-river))))
   `(guide-key/key-face ((t (:foreground ,orange))))
   `(guide-key/prefix-command-face ((t (:foreground ,wisteria))))
;;;;; helm
   `(helm-M-x-key ((t (:foreground ,nephritis))))
   `(helm-action ((t (:underline nil))))
   `(helm-buffer-saved-out ((t (:foreground ,orange :background nil))))
   `(helm-candidate-number ((t (:foreground ,(face-attribute 'mode-line :foreground) :background ,(face-attribute 'mode-line :foreground)))))
   `(helm-ff-directory ((t (:foreground ,peter-river))))
   `(helm-ff-executable ((t (:foreground ,pumpkin))))
   `(helm-ff-prefix ((t (:foreground ,alizarin))))
   `(helm-ff-symlink ((t (:foreground ,clouds :background ,amethyst))))
   `(helm-grep-file ((t (:foreground ,turquoise))))
   `(helm-grep-finish ((t (:foreground ,turquoise))))
   `(helm-grep-lineno ((t (:foreground ,sun-flower))))
   `(helm-grep-running ((t (:foreground ,alizarin))))
   `(helm-moccur-buffer ((t (:foreground ,sun-flower))))
   `(helm-selection ((t (:background ,sun-flower :underline nil :weight normal))))
   `(helm-header ((t (:weight normal))))
   `(helm-source-header ((t (:foreground ,green-sea :background ,wet-asphalt :weight normal :height ,(face-attribute 'default :height) :family ,(face-attribute 'default :family)))))
   `(helm-visible-mark ((t (:foreground ,alizarin))))

;;;;; highlight-symbol
   `(highlight-symbol-face ((t (:background ,silver :weight bold))))

;;;;; hl-line-mode
   `(hl-line-face ((,class (:background ,silver))
                   (t :weight normal)))
   `(hl-line ((,class (:background ,silver)) ; old emacsen
              (t :weight normal)))
;;;;; hl-sexp
   `(hl-sexp-face ((,class (:background ,silver))
                   (t :weight normal)))
;;;;; ido-mode
   `(ido-first-match ((t (:foreground ,pumpkin :weight normal))))
   `(ido-only-match ((t (:foreground ,carrot :weight normal))))
   `(ido-subdir ((t (:foreground ,orange))))
   `(ido-indicator ((t (:foreground ,sun-flower :background ,pumpkin))))
;;;;; indent-guide
   `(indent-guide-face ((t (:foreground ,concrete))))
;;;;; js2-mode
   `(js2-warning ((t (:underline ,pumpkin))))
   `(js2-error ((t (:foreground ,alizarin :weight normal))))
   `(js2-jsdoc-tag ((t (:foreground ,amethyst))))
   `(js2-jsdoc-type ((t (:foreground ,wisteria))))
   `(js2-jsdoc-value ((t (:foreground ,peter-river))))
   `(js2-function-param ((t (:foreground, wet-asphalt))))
   `(js2-external-variable ((t (:foreground ,pumpkin))))
;; ;;;;; linum-mode
   `(linum ((t (:foreground ,clouds :background ,asbestos))))
;;;;; magit
   `(magit-section-title ((t (:foreground ,peter-river :background ,clouds :weight normal :height ,(face-attribute 'default :height)))))
   `(magit-branch ((t (:foreground ,midnight-blue :background ,turquoise :weight normal :box nil))))
   `(magit-item-highlight ((t (:background ,silver))))
   `(magit-log-author ((t (:foreground ,belize-hole))))
   `(magit-log-sha1 ((t (:foreground ,carrot :weight normal))))
   `(magit-tag ((t (:foreground ,wisteria :weight normal))))
   `(magit-log-head-label-head ((t (:foreground ,midnight-blue :background ,turquoise :weight normal :box nil))))
   `(magit-log-head-label-local ((t (:foreground ,midnight-blue :background ,turquoise :weight normal :box nil))))
   `(magit-log-head-label-default ((t (:foreground ,midnight-blue :background ,turquoise :weight normal :box nil))))
   `(magit-log-head-label-remote ((t (:foreground ,midnight-blue :background ,sun-flower :weight normal :box nil))))
   `(magit-log-head-label-tags ((t (:foreground ,wisteria :weight normal))))

;;;;; org-mode
   `(org-block-begin-line ((t (:foreground ,pumpkin :background ,silver))))
   `(org-block-background ((t (:background ,silver))))
   `(org-block-end-line ((t (:foreground ,pumpkin :background ,silver))))
   `(org-link ((t (:foreground ,peter-river :underline nil))))
   `(org-footnote ((t (:foreground ,peter-river :underline nil))))
   `(org-date ((t (:foreground ,peter-river :underline nil))))
   `(org-todo ((t (:foreground ,alizarin))))
   `(org-done ((t (:foreground ,nephritis))))
   `(org-special-keyword ((t (:foreground ,orange))))
   `(org-hide ((t (:foreground ,clouds))))
   `(org-level-1 ((t (:foreground ,green-sea))))
   `(org-level-2 ((t (:foreground ,belize-hole))))
   `(org-level-3 ((t (:foreground ,wisteria))))
   `(org-level-4 ((t (:foreground ,carrot))))

;;;;; outline
   `(outline-1 ((t (:foreground ,green-sea))))
   `(outline-2 ((t (:foreground ,belize-hole))))
   `(outline-3 ((t (:foreground ,wisteria))))
   `(outline-4 ((t (:foreground ,orange))))
   `(outline-5 ((t (:foreground ,pumpkin))))
   `(outline-6 ((t (:foreground ,pomegranate))))
;;;;; rainbow-delimiters
   `(rainbow-delimiters-depth-1-face ((t (:foreground ,wet-asphalt))))
   `(rainbow-delimiters-depth-2-face ((t (:foreground ,turquoise))))
   `(rainbow-delimiters-depth-3-face ((t (:foreground ,emerald))))
   `(rainbow-delimiters-depth-4-face ((t (:foreground ,peter-river))))
   `(rainbow-delimiters-depth-5-face ((t (:foreground ,amethyst))))
   `(rainbow-delimiters-depth-6-face ((t (:foreground ,sun-flower))))
   `(rainbow-delimiters-depth-7-face ((t (:foreground ,carrot))))
   `(rainbow-delimiters-depth-8-face ((t (:foreground ,alizarin))))
   `(rainbow-delimiters-depth-9-face ((t (:foreground ,green-sea))))
   `(rainbow-delimiters-depth-10-face ((t (:foreground ,nephritis))))
   `(rainbow-delimiters-depth-11-face ((t (:foreground ,belize-hole))))
   `(rainbow-delimiters-depth-12-face ((t (:foreground ,wisteria))))
;;;;; show-paren
   `(show-paren-mismatch ((t (:foreground ,sun-flower :background ,pomegranate :weight normal))))
   `(show-paren-match ((t (:background ,concrete :weight normal))))
;;;;; mode-line/sml-mode-line
   `(mode-line
     ((,class (:foreground ,clouds :background ,midnight-blue :box nil))
      (t :inverse-video t)))
   `(mode-line-inactive ((t (:foreground ,wet-asphalt :background ,silver :box nil))))
   `(mode-line-buffer-id ((t (:foreground ,alizarin :weight normal))))
   `(mode-line-highlight ((t (:foreground ,sun-flower :weight normal :box nil))))
   `(sml/global ((t (:foreground ,clouds))))
   `(sml/modes ((t (:foreground ,nephritis))))
   `(sml/filename ((t (:foreground ,nephritis))))
   `(sml/folder ((t (:foreground ,carrot))))
   `(sml/prefix ((t (:foreground ,carrot))))
   `(sml/read-only ((t (:foreground ,wisteria))))
   `(sml/modified ((t (:foreground ,pomegranate :weight normal))))
   `(sml/outside-modified ((t (:foreground ,pomegranate :weight normal))))
   `(sml/line-number ((t (:foreground ,turquoise :weight normal))))
   `(sml/col-number ((t (:foreground ,turquoise :weight normal))))
   `(sml/vc ((t (:foreground ,peter-river :weight normal))))
   `(sml/vc-edited ((t (:foreground ,pumpkin :weight normal))))
   `(sml/git ((t (:foreground ,peter-river :weight normal))))
;;;;; SLIME
   `(slime-repl-output-face ((t (:foreground ,midnight-blue))))
   `(slime-repl-inputed-output-face ((t (:foreground ,wet-asphalt))))
   `(slime-error-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,alizarin)))
      (t
       (:underline ,alizarin))))
   `(slime-warning-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,orange)))
      (t
       (:underline ,orange))))
   `(slime-style-warning-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,sun-flower)))
      (t
       (:underline ,sun-flower))))
   `(slime-note-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,wisteria)))
      (t
       (:underline ,wisteria))))
   `(slime-highlight-face ((t (:inherit turquoise))))
;;;;; term
   `(term-color-black ((t (:foreground ,midnight-blue
                                       :background ,midnight-blue))))
   `(term-color-red ((t (:foreground ,pomegranate
                                       :background ,pomegranate))))
   `(term-color-green ((t (:foreground ,nephritis
                                       :background ,nephritis))))
   `(term-color-yellow ((t (:foreground ,orange
                                       :background ,orange))))
   `(term-color-blue ((t (:foreground ,belize-hole
                                      :background ,belize-hole))))
   `(term-color-magenta ((t (:foreground ,wisteria
                                         :background ,wisteria))))
   `(term-color-cyan ((t (:foreground ,green-sea
                                       :background ,green-sea))))
   `(term-color-white ((t (:foreground ,clouds
                                       :background ,clouds))))
   '(term-default-fg-color ((t (:inherit term-color-white))))
   '(term-default-bg-color ((t (:inherit term-color-black))))
;;;;; web-mode
   `(web-mode-builtin-face ((t (:inherit ,font-lock-builtin-face))))
   `(web-mode-comment-face ((t (:inherit ,font-lock-comment-face))))
   `(web-mode-constant-face ((t (:inherit ,font-lock-constant-face))))
   `(web-mode-css-at-rule-face ((t (:foreground ,pumpkin ))))
   `(web-mode-css-prop-face ((t (:foreground ,pumpkin))))
   `(web-mode-css-pseudo-class-face ((t (:foreground ,orange :weight normal))))
   `(web-mode-css-rule-face ((t (:foreground ,belize-hole))))
   `(web-mode-doctype-face ((t (:inherit ,font-lock-comment-face))))
   `(web-mode-folded-face ((t (:underline nil))))
   `(web-mode-function-name-face ((t (:foreground ,midnight-blue :weight normal))))
   `(web-mode-html-attr-name-face ((t (:foreground ,wisteria))))
   `(web-mode-html-attr-value-face ((t (:inherit ,font-lock-string-face))))
   `(web-mode-html-tag-face ((t (:foreground ,turquoise :weight normal))))
   `(web-mode-keyword-face ((t (:inherit ,font-lock-keyword-face))))
   `(web-mode-preprocessor-face ((t (:inherit ,font-lock-preprocessor-face))))
   `(web-mode-string-face ((t (:inherit ,font-lock-string-face))))
   `(web-mode-type-face ((t (:inherit ,font-lock-type-face))))
   `(web-mode-variable-name-face ((t (:inherit ,font-lock-variable-name-face))))
   `(web-mode-server-background-face ((t (:background ,clouds))))
   `(web-mode-server-comment-face ((t (:inherit web-mode-comment-face))))
   `(web-mode-server-string-face ((t (:inherit web-mode-string-face))))
   `(web-mode-symbol-face ((t (:inherit font-lock-constant-face))))
   `(web-mode-warning-face ((t (:inherit font-lock-warning-face))))
   `(web-mode-whitespaces-face ((t (:background ,alizarin))))
;;;;; whitespace-mode
   `(whitespace-space ((t (:background ,clouds :foreground ,sun-flower))))
   `(whitespace-hspace ((t (:background ,clouds :foreground ,sun-flower))))
   `(whitespace-tab ((t (:background ,carrot))))
   `(whitespace-newline ((t (:foreground ,sun-flower))))
   `(whitespace-trailing ((t (:background ,alizarin))))
   `(whitespace-line ((t (:background nil :foreground ,alizarin))))
   `(whitespace-space-before-tab ((t (:background ,clouds :foreground ,alizarin))))
   `(whitespace-indentation ((t (:background ,clouds :foreground ,sun-flower))))
   `(whitespace-empty ((t (:background ,orange))))
   `(whitespace-space-after-tab ((t (:background ,clouds :foreground ,alizarin))))
;;;;; which-func-mode
   `(which-func ((t (:foreground ,wisteria :background ,silver))))
;;;;; yascroll
   `(yascroll:thumb-text-area ((t (:background ,silver))))
   `(yascroll:thumb-fringe ((t (:background ,silver :foreground ,sun-flower))))
   ))

;;; Theme Variables
(flatui/with-color-variables
  (custom-theme-set-variables
   'flatui
;;;;; ansi-color
   `(ansi-color-names-vector [,clouds ,alizarin ,emerald ,sun-flower
                                          ,peter-river ,amethyst ,turquoise ,midnight-blue])
;;;;; fill-column-indicator
   `(fci-rule-color ,sun-flower)
;;;;; highlight-parentheses
   `(hl-paren-colors '(,clouds ,clouds ,clouds))
   `(hl-paren-background-colors '(,peter-river ,amethyst ,sun-flower))
;;;;; sml-mode-line
   `(sml/active-foreground-color ,clouds)
   `(sml/active-background-color ,wet-asphalt)
   `(sml/inactive-foreground-color ,wet-asphalt)
   `(sml/inactive-background-color ,silver)
;;;;; vc-annotate
   `(vc-annotate-color-map
     '(( 30. . ,alizarin)
       ( 60. . ,pomegranate)
       ( 90. . ,carrot)
       (120. . ,pumpkin)
       (150. . ,sun-flower)
       (180. . ,orange)
       (210. . ,emerald)
       (240. . ,nephritis)
       (270. . ,turquoise)
       (300. . ,green-sea)
       (330. . ,peter-river)
       (360. . ,belize-hole)))
   `(vc-annotate-very-old-color ,belize-hole)
   `(vc-annotate-background ,clouds)
   ))


;;; Footer

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide-theme 'flatui)

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; End:
;;; flatui-theme.el ends here
