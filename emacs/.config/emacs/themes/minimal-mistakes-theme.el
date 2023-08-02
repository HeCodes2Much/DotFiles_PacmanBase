;;; minimal-mistakes-theme.el --- Minimal-Mistakes Theme

;; Copyright 2022-present, All rights reserved
;;
;; Code licensed under the MIT license
;; SPDX-License-Identifier: MIT

;; Maintainer: minimal-mistakes <wayne6324@gmail.com>
;; Author: minimal-mistakes
;; Version: 1.0.0
;; Package-Requires: ((emacs "24.3"))
;; URL: https://github.com/minimal-mistakes/emacs

;;; Commentary:

;; A dark color theme available for a number of editors.
;; This theme tries as much as possible to follow the consensual
;; specification (see URL 'https://minimalmistakes.org/specs').

;;; Code:
(deftheme minimal-mistakes)


;;;; Configuration options:

(defgroup minimal-mistakes nil
  "Minimal-Mistakes theme options.

The theme has to be reloaded after changing anything in this group."
  :group 'faces)

(defcustom minimal-mistakes-enlarge-headings t
  "Use different font sizes for some headings and titles."
  :type 'boolean
  :group 'minimal-mistakes)

(defcustom minimal-mistakes-height-title-1 1.3
  "Font size 100%."
  :type 'number
  :group 'minimal-mistakes)

(defcustom minimal-mistakes-height-title-2 1.1
  "Font size 110%."
  :type 'number
  :group 'minimal-mistakes)

(defcustom minimal-mistakes-height-title-3 1.0
  "Font size 130%."
  :type 'number
  :group 'minimal-mistakes)

(defcustom minimal-mistakes-height-doc-title 1.44
  "Font size 144%."
  :type 'number
  :group 'minimal-mistakes)

(defcustom minimal-mistakes-alternate-mode-line-and-minibuffer nil
  "Use less bold and pink in the minibuffer."
  :type 'boolean
  :group 'minimal-mistakes)

(defvar minimal-mistakes-use-24-bit-colors-on-256-colors-terms nil
  "Use true colors even on terminals announcing less capabilities.

Beware the use of this variable.  Using it may lead to unwanted
behavior, the most common one being an ugly blue background on
terminals, which don't understand 24 bit colors.  To avoid this
blue background, when using this variable, one can try to add the
following lines in their config file after having load the
Minimal-Mistakes theme:

    (unless (display-graphic-p)
      (set-face-background 'default \"black\" nil))
")


;;;; Theme definition:

;; Assigment form: VARIABLE COLOR [256-COLOR [TTY-COLOR]]
(let ((colors '(;; Upstream theme color
                (minimal-mistakes-bg      "#283036" "#283036" "#283036")        ; official background
                (minimal-mistakes-fg      "#e5e9f0" "#e5e9f0" "#e5e9f0")        ; official foreground
                (minimal-mistakes-current "#434c5e" "#434c5e" "#434c5e")        ; official current-line/selection
                (minimal-mistakes-comment "#81a1c1" "#81a1c1" "#81a1c1")        ; official comment
                (minimal-mistakes-cyan    "#59fff9" "#59fff9" "#a6fffc")        ; official cyan
                (minimal-mistakes-green   "#59ff59" "#59ff59" "#a6ffa6")        ; official green
                (minimal-mistakes-orange  "#ff9c59" "#ff9c59" "#ffc9a6")        ; official orange
                (minimal-mistakes-pink    "#ff59f9" "#ff59f9" "#ffa6fc")        ; official pink
                (minimal-mistakes-purple  "#9059ff" "#9059ff" "#c5a6ff")        ; official purple
                (minimal-mistakes-red     "#ff5959" "#ff5959" "#ffa6a6")        ; official red
                (minimal-mistakes-yellow  "#ffff59" "#ffff59" "#ffffa6")        ; official yellow
                ;; Other colors
                (bg2             "#373844" "#121212" "brightblack")
                (bg3             "#464752" "#262626" "brightblack")
                (bg4             "#565761" "#444444" "brightblack")
                (fg2             "#e2e2dc" "#e4e4e4" "brightwhite")
                (fg3             "#ccccc7" "#c6c6c6" "white")
                (fg4             "#b6b6b2" "#b2b2b2" "white")
                (other-blue      "#0189cc" "#0087ff" "brightblue")))
      (faces '(;; default / basic faces
               (cursor :background ,fg3)
               (default :background ,minimal-mistakes-bg :foreground ,minimal-mistakes-fg)
               (default-italic :slant italic)
               (error :foreground ,minimal-mistakes-red)
               (ffap :foreground ,fg4)
               (fringe :background ,minimal-mistakes-bg :foreground ,fg4)
               (header-line :background ,minimal-mistakes-bg)
               (highlight :foreground ,fg3 :background ,bg3)
               (hl-line :background ,minimal-mistakes-current :extend t)
               (info-quoted-name :foreground ,minimal-mistakes-orange)
               (info-string :foreground ,minimal-mistakes-yellow)
               (lazy-highlight :foreground ,fg2 :background ,bg2)
               (link :foreground ,minimal-mistakes-cyan :underline t)
               (linum :slant italic :foreground ,bg4 :background ,minimal-mistakes-bg)
               (line-number :slant italic :foreground ,bg4 :background ,minimal-mistakes-bg)
               (match :background ,minimal-mistakes-yellow :foreground ,minimal-mistakes-bg)
               (menu :background ,minimal-mistakes-current :inverse-video nil
                     ,@(if minimal-mistakes-alternate-mode-line-and-minibuffer
                           (list :foreground fg3)
                         (list :foreground minimal-mistakes-fg)))
               (minibuffer-prompt
                ,@(if minimal-mistakes-alternate-mode-line-and-minibuffer
                      (list :weight 'normal :foreground minimal-mistakes-fg)
                    (list :weight 'bold :foreground minimal-mistakes-pink)))
               (read-multiple-choice-face :inherit completions-first-difference)
               (region :inherit match :extend t)
               (shadow :foreground ,minimal-mistakes-comment)
               (success :foreground ,minimal-mistakes-green)
               (tooltip :foreground ,minimal-mistakes-fg :background ,minimal-mistakes-current)
               (trailing-whitespace :background ,minimal-mistakes-orange)
               (vertical-border :foreground ,bg2)
               (warning :foreground ,minimal-mistakes-orange)
               ;; syntax / font-lock
               (font-lock-builtin-face :foreground ,minimal-mistakes-cyan :slant italic)
               (font-lock-comment-face :inherit shadow)
               (font-lock-comment-delimiter-face :inherit shadow)
               (font-lock-constant-face :foreground ,minimal-mistakes-purple)
               (font-lock-doc-face :foreground ,minimal-mistakes-comment)
               (font-lock-function-name-face :foreground ,minimal-mistakes-green :weight bold)
               (font-lock-keyword-face :foreground ,minimal-mistakes-pink :weight bold)
               (font-lock-negation-char-face :foreground ,minimal-mistakes-cyan)
               (font-lock-preprocessor-face :foreground ,minimal-mistakes-orange)
               (font-lock-reference-face :inherit font-lock-constant-face) ;; obsolete
               (font-lock-regexp-grouping-backslash :foreground ,minimal-mistakes-cyan)
               (font-lock-regexp-grouping-construct :foreground ,minimal-mistakes-purple)
               (font-lock-string-face :foreground ,minimal-mistakes-yellow)
               (font-lock-type-face :inherit font-lock-builtin-face)
               (font-lock-variable-name-face :foreground ,minimal-mistakes-fg :weight bold)
               (font-lock-warning-face :inherit warning :background ,bg2)
               ;; auto-complete
               (ac-completion-face :underline t :foreground ,minimal-mistakes-pink)
               ;; company
               (company-echo-common :foreground ,minimal-mistakes-bg :background ,minimal-mistakes-fg)
               (company-preview :background ,minimal-mistakes-current :foreground ,other-blue)
               (company-preview-common :inherit company-preview
                                       :foreground ,minimal-mistakes-pink)
               (company-preview-search :inherit company-preview
                                       :foreground ,minimal-mistakes-green)
               (company-scrollbar-bg :background ,minimal-mistakes-comment)
               (company-scrollbar-fg :foreground ,other-blue)
               (company-tooltip :inherit tooltip)
               (company-tooltip-search :foreground ,minimal-mistakes-green
                                       :underline t)
               (company-tooltip-search-selection :background ,minimal-mistakes-green
                                                 :foreground ,minimal-mistakes-bg)
               (company-tooltip-selection :inherit match)
               (company-tooltip-mouse :background ,minimal-mistakes-bg)
               (company-tooltip-common :foreground ,minimal-mistakes-pink :weight bold)
               ;;(company-tooltip-common-selection :inherit company-tooltip-common)
               (company-tooltip-annotation :foreground ,minimal-mistakes-cyan)
               ;;(company-tooltip-annotation-selection :inherit company-tooltip-annotation)
               ;; completions (minibuffer.el)
               (completions-annotations :inherit font-lock-comment-face)
               (completions-common-part :foreground ,minimal-mistakes-green)
               (completions-first-difference :foreground ,minimal-mistakes-pink :weight bold)
               ;; diff-hl
               (diff-hl-change :foreground ,minimal-mistakes-orange :background ,minimal-mistakes-orange)
               (diff-hl-delete :foreground ,minimal-mistakes-red :background ,minimal-mistakes-red)
               (diff-hl-insert :foreground ,minimal-mistakes-green :background ,minimal-mistakes-green)
               ;; dired
               (dired-directory :foreground ,minimal-mistakes-green :weight normal)
               (dired-flagged :foreground ,minimal-mistakes-pink)
               (dired-header :foreground ,fg3 :background ,minimal-mistakes-bg)
               (dired-ignored :inherit shadow)
               (dired-mark :foreground ,minimal-mistakes-fg :weight bold)
               (dired-marked :foreground ,minimal-mistakes-orange :weight bold)
               (dired-perm-write :foreground ,fg3 :underline t)
               (dired-symlink :foreground ,minimal-mistakes-yellow :weight normal :slant italic)
               (dired-warning :foreground ,minimal-mistakes-orange :underline t)
               (diredp-compressed-file-name :foreground ,fg3)
               (diredp-compressed-file-suffix :foreground ,fg4)
               (diredp-date-time :foreground ,minimal-mistakes-fg)
               (diredp-deletion-file-name :foreground ,minimal-mistakes-pink :background ,minimal-mistakes-current)
               (diredp-deletion :foreground ,minimal-mistakes-pink :weight bold)
               (diredp-dir-heading :foreground ,fg2 :background ,bg4)
               (diredp-dir-name :inherit dired-directory)
               (diredp-dir-priv :inherit dired-directory)
               (diredp-executable-tag :foreground ,minimal-mistakes-orange)
               (diredp-file-name :foreground ,minimal-mistakes-fg)
               (diredp-file-suffix :foreground ,fg4)
               (diredp-flag-mark-line :foreground ,fg2 :slant italic :background ,minimal-mistakes-current)
               (diredp-flag-mark :foreground ,fg2 :weight bold :background ,minimal-mistakes-current)
               (diredp-ignored-file-name :foreground ,minimal-mistakes-fg)
               (diredp-mode-line-flagged :foreground ,minimal-mistakes-orange)
               (diredp-mode-line-marked :foreground ,minimal-mistakes-orange)
               (diredp-no-priv :foreground ,minimal-mistakes-fg)
               (diredp-number :foreground ,minimal-mistakes-cyan)
               (diredp-other-priv :foreground ,minimal-mistakes-orange)
               (diredp-rare-priv :foreground ,minimal-mistakes-orange)
               (diredp-read-priv :foreground ,minimal-mistakes-purple)
               (diredp-write-priv :foreground ,minimal-mistakes-pink)
               (diredp-exec-priv :foreground ,minimal-mistakes-yellow)
               (diredp-symlink :foreground ,minimal-mistakes-orange)
               (diredp-link-priv :foreground ,minimal-mistakes-orange)
               (diredp-autofile-name :foreground ,minimal-mistakes-yellow)
               (diredp-tagged-autofile-name :foreground ,minimal-mistakes-yellow)
               ;; elfeed
               (elfeed-search-date-face :foreground ,minimal-mistakes-comment)
               (elfeed-search-title-face :foreground ,minimal-mistakes-fg)
               (elfeed-search-unread-title-face :foreground ,minimal-mistakes-pink :weight bold)
               (elfeed-search-feed-face :foreground ,minimal-mistakes-fg :weight bold)
               (elfeed-search-tag-face :foreground ,minimal-mistakes-green)
               (elfeed-search-last-update-face :weight bold)
               (elfeed-search-unread-count-face :foreground ,minimal-mistakes-pink)
               (elfeed-search-filter-face :foreground ,minimal-mistakes-green :weight bold)
               ;;(elfeed-log-date-face :inherit font-lock-type-face)
               (elfeed-log-error-level-face :foreground ,minimal-mistakes-red)
               (elfeed-log-warn-level-face :foreground ,minimal-mistakes-orange)
               (elfeed-log-info-level-face :foreground ,minimal-mistakes-cyan)
               (elfeed-log-debug-level-face :foreground ,minimal-mistakes-comment)
               ;; elpher
               (elpher-gemini-heading1 :inherit bold :foreground ,minimal-mistakes-pink
                                       ,@(when minimal-mistakes-enlarge-headings
                                           (list :height minimal-mistakes-height-title-1)))
               (elpher-gemini-heading2 :inherit bold :foreground ,minimal-mistakes-purple
                                       ,@(when minimal-mistakes-enlarge-headings
                                           (list :height minimal-mistakes-height-title-2)))
               (elpher-gemini-heading3 :weight normal :foreground ,minimal-mistakes-green
                                       ,@(when minimal-mistakes-enlarge-headings
                                           (list :height minimal-mistakes-height-title-3)))
               (elpher-gemini-preformatted :inherit fixed-pitch
                                           :foreground ,minimal-mistakes-orange)
               ;; enh-ruby
               (enh-ruby-heredoc-delimiter-face :foreground ,minimal-mistakes-yellow)
               (enh-ruby-op-face :foreground ,minimal-mistakes-pink)
               (enh-ruby-regexp-delimiter-face :foreground ,minimal-mistakes-yellow)
               (enh-ruby-string-delimiter-face :foreground ,minimal-mistakes-yellow)
               ;; flyspell
               (flyspell-duplicate :underline (:style wave :color ,minimal-mistakes-orange))
               (flyspell-incorrect :underline (:style wave :color ,minimal-mistakes-red))
               ;; font-latex
               (font-latex-bold-face :foreground ,minimal-mistakes-purple)
               (font-latex-italic-face :foreground ,minimal-mistakes-pink :slant italic)
               (font-latex-match-reference-keywords :foreground ,minimal-mistakes-cyan)
               (font-latex-match-variable-keywords :foreground ,minimal-mistakes-fg)
               (font-latex-string-face :foreground ,minimal-mistakes-yellow)
               ;; gemini
               (gemini-heading-face-1 :inherit bold :foreground ,minimal-mistakes-pink
                                      ,@(when minimal-mistakes-enlarge-headings
                                          (list :height minimal-mistakes-height-title-1)))
               (gemini-heading-face-2 :inherit bold :foreground ,minimal-mistakes-purple
                                      ,@(when minimal-mistakes-enlarge-headings
                                          (list :height minimal-mistakes-height-title-2)))
               (gemini-heading-face-3 :weight normal :foreground ,minimal-mistakes-green
                                      ,@(when minimal-mistakes-enlarge-headings
                                          (list :height minimal-mistakes-height-title-3)))
               (gemini-heading-face-rest :weight normal :foreground ,minimal-mistakes-yellow)
               (gemini-quote-face :foreground ,minimal-mistakes-purple)
               ;; go-test
               (go-test--ok-face :inherit success)
               (go-test--error-face :inherit error)
               (go-test--warning-face :inherit warning)
               (go-test--pointer-face :foreground ,minimal-mistakes-pink)
               (go-test--standard-face :foreground ,minimal-mistakes-cyan)
               ;; gnus-group
               (gnus-group-mail-1 :foreground ,minimal-mistakes-pink :weight bold)
               (gnus-group-mail-1-empty :inherit gnus-group-mail-1 :weight normal)
               (gnus-group-mail-2 :foreground ,minimal-mistakes-cyan :weight bold)
               (gnus-group-mail-2-empty :inherit gnus-group-mail-2 :weight normal)
               (gnus-group-mail-3 :foreground ,minimal-mistakes-comment :weight bold)
               (gnus-group-mail-3-empty :inherit gnus-group-mail-3 :weight normal)
               (gnus-group-mail-low :foreground ,minimal-mistakes-current :weight bold)
               (gnus-group-mail-low-empty :inherit gnus-group-mail-low :weight normal)
               (gnus-group-news-1 :foreground ,minimal-mistakes-pink :weight bold)
               (gnus-group-news-1-empty :inherit gnus-group-news-1 :weight normal)
               (gnus-group-news-2 :foreground ,minimal-mistakes-cyan :weight bold)
               (gnus-group-news-2-empty :inherit gnus-group-news-2 :weight normal)
               (gnus-group-news-3 :foreground ,minimal-mistakes-comment :weight bold)
               (gnus-group-news-3-empty :inherit gnus-group-news-3 :weight normal)
               (gnus-group-news-4 :inherit gnus-group-news-low)
               (gnus-group-news-4-empty :inherit gnus-group-news-low-empty)
               (gnus-group-news-5 :inherit gnus-group-news-low)
               (gnus-group-news-5-empty :inherit gnus-group-news-low-empty)
               (gnus-group-news-6 :inherit gnus-group-news-low)
               (gnus-group-news-6-empty :inherit gnus-group-news-low-empty)
               (gnus-group-news-low :foreground ,minimal-mistakes-current :weight bold)
               (gnus-group-news-low-empty :inherit gnus-group-news-low :weight normal)
               (gnus-header-content :foreground ,minimal-mistakes-purple)
               (gnus-header-from :foreground ,minimal-mistakes-fg)
               (gnus-header-name :foreground ,minimal-mistakes-green)
               (gnus-header-subject :foreground ,minimal-mistakes-pink :weight bold)
               (gnus-summary-markup-face :foreground ,minimal-mistakes-cyan)
               (gnus-summary-high-unread :foreground ,minimal-mistakes-pink :weight bold)
               (gnus-summary-high-read :inherit gnus-summary-high-unread :weight normal)
               (gnus-summary-high-ancient :inherit gnus-summary-high-read)
               (gnus-summary-high-ticked :inherit gnus-summary-high-read :underline t)
               (gnus-summary-normal-unread :foreground ,other-blue :weight bold)
               (gnus-summary-normal-read :foreground ,minimal-mistakes-comment :weight normal)
               (gnus-summary-normal-ancient :inherit gnus-summary-normal-read :weight light)
               (gnus-summary-normal-ticked :foreground ,minimal-mistakes-pink :weight bold)
               (gnus-summary-low-unread :foreground ,minimal-mistakes-comment :weight bold)
               (gnus-summary-low-read :inherit gnus-summary-low-unread :weight normal)
               (gnus-summary-low-ancient :inherit gnus-summary-low-read)
               (gnus-summary-low-ticked :inherit gnus-summary-low-read :underline t)
               (gnus-summary-selected :inverse-video t)
               ;; haskell-mode
               (haskell-operator-face :foreground ,minimal-mistakes-pink)
               (haskell-constructor-face :foreground ,minimal-mistakes-purple)
               ;; helm
               (helm-bookmark-w3m :foreground ,minimal-mistakes-purple)
               (helm-buffer-not-saved :foreground ,minimal-mistakes-purple :background ,minimal-mistakes-bg)
               (helm-buffer-process :foreground ,minimal-mistakes-orange :background ,minimal-mistakes-bg)
               (helm-buffer-saved-out :foreground ,minimal-mistakes-fg :background ,minimal-mistakes-bg)
               (helm-buffer-size :foreground ,minimal-mistakes-fg :background ,minimal-mistakes-bg)
               (helm-candidate-number :foreground ,minimal-mistakes-bg :background ,minimal-mistakes-fg)
               (helm-ff-directory :foreground ,minimal-mistakes-green :background ,minimal-mistakes-bg :weight bold)
               (helm-ff-dotted-directory :foreground ,minimal-mistakes-green :background ,minimal-mistakes-bg :weight normal)
               (helm-ff-executable :foreground ,other-blue :background ,minimal-mistakes-bg :weight normal)
               (helm-ff-file :foreground ,minimal-mistakes-fg :background ,minimal-mistakes-bg :weight normal)
               (helm-ff-invalid-symlink :foreground ,minimal-mistakes-pink :background ,minimal-mistakes-bg :weight bold)
               (helm-ff-prefix :foreground ,minimal-mistakes-bg :background ,minimal-mistakes-pink :weight normal)
               (helm-ff-symlink :foreground ,minimal-mistakes-pink :background ,minimal-mistakes-bg :weight bold)
               (helm-grep-cmd-line :foreground ,minimal-mistakes-fg :background ,minimal-mistakes-bg)
               (helm-grep-file :foreground ,minimal-mistakes-fg :background ,minimal-mistakes-bg)
               (helm-grep-finish :foreground ,fg2 :background ,minimal-mistakes-bg)
               (helm-grep-lineno :foreground ,minimal-mistakes-fg :background ,minimal-mistakes-bg)
               (helm-grep-match :inherit match)
               (helm-grep-running :foreground ,minimal-mistakes-green :background ,minimal-mistakes-bg)
               (helm-header :foreground ,fg2 :background ,minimal-mistakes-bg :underline nil :box nil)
               (helm-moccur-buffer :foreground ,minimal-mistakes-green :background ,minimal-mistakes-bg)
               (helm-selection :background ,bg2 :underline nil)
               (helm-selection-line :background ,bg2)
               (helm-separator :foreground ,minimal-mistakes-purple :background ,minimal-mistakes-bg)
               (helm-source-go-package-godoc-description :foreground ,minimal-mistakes-yellow)
               (helm-source-header :foreground ,minimal-mistakes-pink :background ,minimal-mistakes-bg :underline nil :weight bold)
               (helm-time-zone-current :foreground ,minimal-mistakes-orange :background ,minimal-mistakes-bg)
               (helm-time-zone-home :foreground ,minimal-mistakes-purple :background ,minimal-mistakes-bg)
               (helm-visible-mark :foreground ,minimal-mistakes-bg :background ,bg3)
               ;; highlight-indentation minor mode
               (highlight-indentation-face :background ,bg2)
               ;; icicle
               (icicle-whitespace-highlight :background ,minimal-mistakes-fg)
               (icicle-special-candidate :foreground ,fg2)
               (icicle-extra-candidate :foreground ,fg2)
               (icicle-search-main-regexp-others :foreground ,minimal-mistakes-fg)
               (icicle-search-current-input :foreground ,minimal-mistakes-pink)
               (icicle-search-context-level-8 :foreground ,minimal-mistakes-orange)
               (icicle-search-context-level-7 :foreground ,minimal-mistakes-orange)
               (icicle-search-context-level-6 :foreground ,minimal-mistakes-orange)
               (icicle-search-context-level-5 :foreground ,minimal-mistakes-orange)
               (icicle-search-context-level-4 :foreground ,minimal-mistakes-orange)
               (icicle-search-context-level-3 :foreground ,minimal-mistakes-orange)
               (icicle-search-context-level-2 :foreground ,minimal-mistakes-orange)
               (icicle-search-context-level-1 :foreground ,minimal-mistakes-orange)
               (icicle-search-main-regexp-current :foreground ,minimal-mistakes-fg)
               (icicle-saved-candidate :foreground ,minimal-mistakes-fg)
               (icicle-proxy-candidate :foreground ,minimal-mistakes-fg)
               (icicle-mustmatch-completion :foreground ,minimal-mistakes-purple)
               (icicle-multi-command-completion :foreground ,fg2 :background ,bg2)
               (icicle-msg-emphasis :foreground ,minimal-mistakes-green)
               (icicle-mode-line-help :foreground ,fg4)
               (icicle-match-highlight-minibuffer :foreground ,minimal-mistakes-orange)
               (icicle-match-highlight-Completions :foreground ,minimal-mistakes-green)
               (icicle-key-complete-menu-local :foreground ,minimal-mistakes-fg)
               (icicle-key-complete-menu :foreground ,minimal-mistakes-fg)
               (icicle-input-completion-fail-lax :foreground ,minimal-mistakes-pink)
               (icicle-input-completion-fail :foreground ,minimal-mistakes-pink)
               (icicle-historical-candidate-other :foreground ,minimal-mistakes-fg)
               (icicle-historical-candidate :foreground ,minimal-mistakes-fg)
               (icicle-current-candidate-highlight :foreground ,minimal-mistakes-orange :background ,bg3)
               (icicle-Completions-instruction-2 :foreground ,fg4)
               (icicle-Completions-instruction-1 :foreground ,fg4)
               (icicle-completion :foreground ,minimal-mistakes-fg)
               (icicle-complete-input :foreground ,minimal-mistakes-orange)
               (icicle-common-match-highlight-Completions :foreground ,minimal-mistakes-purple)
               (icicle-candidate-part :foreground ,minimal-mistakes-fg)
               (icicle-annotation :foreground ,fg4)
               ;; icomplete
               (icompletep-determined :foreground ,minimal-mistakes-orange)
               ;; ido
               (ido-first-match
                ,@(if minimal-mistakes-alternate-mode-line-and-minibuffer
                      (list :weight 'normal :foreground minimal-mistakes-green)
                    (list :weight 'bold :foreground minimal-mistakes-pink)))
               (ido-only-match :foreground ,minimal-mistakes-orange)
               (ido-subdir :foreground ,minimal-mistakes-yellow)
               (ido-virtual :foreground ,minimal-mistakes-cyan)
               (ido-incomplete-regexp :inherit font-lock-warning-face)
               (ido-indicator :foreground ,minimal-mistakes-fg :background ,minimal-mistakes-pink)
               ;; ivy
               (ivy-current-match
                ,@(if minimal-mistakes-alternate-mode-line-and-minibuffer
                      (list :weight 'normal :background minimal-mistakes-current :foreground minimal-mistakes-green)
                    (list :weight 'bold :background minimal-mistakes-current :foreground minimal-mistakes-pink)))
               ;; Highlights the background of the match.
               (ivy-minibuffer-match-face-1 :background ,minimal-mistakes-current)
               ;; Highlights the first matched group.
               (ivy-minibuffer-match-face-2 :background ,minimal-mistakes-green
                                            :foreground ,minimal-mistakes-bg)
               ;; Highlights the second matched group.
               (ivy-minibuffer-match-face-3 :background ,minimal-mistakes-yellow
                                            :foreground ,minimal-mistakes-bg)
               ;; Highlights the third matched group.
               (ivy-minibuffer-match-face-4 :background ,minimal-mistakes-pink
                                            :foreground ,minimal-mistakes-bg)
               (ivy-confirm-face :foreground ,minimal-mistakes-orange)
               (ivy-match-required-face :foreground ,minimal-mistakes-red)
               (ivy-subdir :foreground ,minimal-mistakes-yellow)
               (ivy-remote :foreground ,minimal-mistakes-pink)
               (ivy-virtual :foreground ,minimal-mistakes-cyan)
               ;; isearch
               (isearch :inherit match :weight bold)
               (isearch-fail :foreground ,minimal-mistakes-bg :background ,minimal-mistakes-orange)
               ;; jde-java
               (jde-java-font-lock-constant-face :foreground ,minimal-mistakes-cyan)
               (jde-java-font-lock-modifier-face :foreground ,minimal-mistakes-pink)
               (jde-java-font-lock-number-face :foreground ,minimal-mistakes-fg)
               (jde-java-font-lock-package-face :foreground ,minimal-mistakes-fg)
               (jde-java-font-lock-private-face :foreground ,minimal-mistakes-pink)
               (jde-java-font-lock-public-face :foreground ,minimal-mistakes-pink)
               ;; js2-mode
               (js2-external-variable :foreground ,minimal-mistakes-purple)
               (js2-function-param :foreground ,minimal-mistakes-cyan)
               (js2-jsdoc-html-tag-delimiter :foreground ,minimal-mistakes-yellow)
               (js2-jsdoc-html-tag-name :foreground ,other-blue)
               (js2-jsdoc-value :foreground ,minimal-mistakes-yellow)
               (js2-private-function-call :foreground ,minimal-mistakes-cyan)
               (js2-private-member :foreground ,fg3)
               ;; js3-mode
               (js3-error-face :underline ,minimal-mistakes-orange)
               (js3-external-variable-face :foreground ,minimal-mistakes-fg)
               (js3-function-param-face :foreground ,minimal-mistakes-pink)
               (js3-instance-member-face :foreground ,minimal-mistakes-cyan)
               (js3-jsdoc-tag-face :foreground ,minimal-mistakes-pink)
               (js3-warning-face :underline ,minimal-mistakes-pink)
               ;; lsp
               (lsp-ui-peek-peek :background ,minimal-mistakes-bg)
               (lsp-ui-peek-list :background ,bg2)
               (lsp-ui-peek-filename :foreground ,minimal-mistakes-pink :weight bold)
               (lsp-ui-peek-line-number :foreground ,minimal-mistakes-fg)
               (lsp-ui-peek-highlight :inherit highlight :distant-foreground ,minimal-mistakes-bg)
               (lsp-ui-peek-header :background ,bg3 :foreground ,fg3, :weight bold)
               (lsp-ui-peek-footer :inherit lsp-ui-peek-header)
               (lsp-ui-peek-selection :inherit match)
               (lsp-ui-sideline-symbol :foreground ,fg4 :box (:line-width -1 :color ,fg4) :height 0.99)
               (lsp-ui-sideline-current-symbol :foreground ,minimal-mistakes-fg :weight ultra-bold
                                               :box (:line-width -1 :color minimal-mistakes-fg) :height 0.99)
               (lsp-ui-sideline-code-action :foreground ,minimal-mistakes-yellow)
               (lsp-ui-sideline-symbol-info :slant italic :height 0.99)
               (lsp-ui-doc-background :background ,minimal-mistakes-bg)
               (lsp-ui-doc-header :foreground ,minimal-mistakes-bg :background ,minimal-mistakes-cyan)
               ;; magit
               (magit-branch-local :foreground ,minimal-mistakes-cyan)
               (magit-branch-remote :foreground ,minimal-mistakes-green)
               (magit-tag :foreground ,minimal-mistakes-orange)
               (magit-section-heading :foreground ,minimal-mistakes-pink :weight bold)
               (magit-section-highlight :background ,bg3 :extend t)
               (magit-diff-context-highlight :background ,bg3
                                             :foreground ,fg3
                                             :extend t)
               (magit-diff-revision-summary :foreground ,minimal-mistakes-orange
                                            :background ,minimal-mistakes-bg
                                            :weight bold)
               (magit-diff-revision-summary-highlight :foreground ,minimal-mistakes-orange
                                                      :background ,bg3
                                                      :weight bold
                                                      :extend t)
               ;; the four following lines are just a patch of the
               ;; upstream color to add the extend keyword.
               (magit-diff-added :background "#335533"
                                 :foreground "#ddffdd"
                                 :extend t)
               (magit-diff-added-highlight :background "#336633"
                                           :foreground "#cceecc"
                                           :extend t)
               (magit-diff-removed :background "#553333"
                                   :foreground "#ffdddd"
                                   :extend t)
               (magit-diff-removed-highlight :background "#663333"
                                             :foreground "#eecccc"
                                             :extend t)
               (magit-diff-file-heading :foreground ,minimal-mistakes-fg)
               (magit-diff-file-heading-highlight :inherit magit-section-highlight)
               (magit-diffstat-added :foreground ,minimal-mistakes-green)
               (magit-diffstat-removed :foreground ,minimal-mistakes-red)
               (magit-hash :foreground ,fg2)
               (magit-hunk-heading :background ,bg3)
               (magit-hunk-heading-highlight :background ,bg3)
               (magit-item-highlight :background ,bg3)
               (magit-log-author :foreground ,fg3)
               (magit-process-ng :foreground ,minimal-mistakes-orange :weight bold)
               (magit-process-ok :foreground ,minimal-mistakes-green :weight bold)
               ;; markdown
               (markdown-blockquote-face :foreground ,minimal-mistakes-yellow
                                         :slant italic)
               (markdown-code-face :foreground ,minimal-mistakes-orange)
               (markdown-footnote-face :foreground ,other-blue)
               (markdown-header-face :weight normal)
               (markdown-header-face-1
                :inherit bold :foreground ,minimal-mistakes-pink
                ,@(when minimal-mistakes-enlarge-headings
                    (list :height minimal-mistakes-height-title-1)))
               (markdown-header-face-2
                :inherit bold :foreground ,minimal-mistakes-purple
                ,@(when minimal-mistakes-enlarge-headings
                    (list :height minimal-mistakes-height-title-2)))
               (markdown-header-face-3
                :foreground ,minimal-mistakes-green
                ,@(when minimal-mistakes-enlarge-headings
                    (list :height minimal-mistakes-height-title-3)))
               (markdown-header-face-4 :foreground ,minimal-mistakes-yellow)
               (markdown-header-face-5 :foreground ,minimal-mistakes-cyan)
               (markdown-header-face-6 :foreground ,minimal-mistakes-orange)
               (markdown-header-face-7 :foreground ,other-blue)
               (markdown-header-face-8 :foreground ,minimal-mistakes-fg)
               (markdown-inline-code-face :foreground ,minimal-mistakes-green)
               (markdown-plain-url-face :inherit link)
               (markdown-pre-face :foreground ,minimal-mistakes-orange)
               (markdown-table-face :foreground ,minimal-mistakes-purple)
               (markdown-list-face :foreground ,minimal-mistakes-cyan)
               (markdown-language-keyword-face :foreground ,minimal-mistakes-comment)
               ;; message
               (message-header-to :foreground ,minimal-mistakes-fg :weight bold)
               (message-header-cc :foreground ,minimal-mistakes-fg :bold bold)
               (message-header-subject :foreground ,minimal-mistakes-orange)
               (message-header-newsgroups :foreground ,minimal-mistakes-purple)
               (message-header-other :foreground ,minimal-mistakes-purple)
               (message-header-name :foreground ,minimal-mistakes-green)
               (message-header-xheader :foreground ,minimal-mistakes-cyan)
               (message-separator :foreground ,minimal-mistakes-cyan :slant italic)
               (message-cited-text :foreground ,minimal-mistakes-purple)
               (message-cited-text-1 :foreground ,minimal-mistakes-purple)
               (message-cited-text-2 :foreground ,minimal-mistakes-orange)
               (message-cited-text-3 :foreground ,minimal-mistakes-comment)
               (message-cited-text-4 :foreground ,fg2)
               (message-mml :foreground ,minimal-mistakes-green :weight normal)
               ;; mode-line
               (mode-line :background ,minimal-mistakes-current
                          :box ,minimal-mistakes-current :inverse-video nil
                          ,@(if minimal-mistakes-alternate-mode-line-and-minibuffer
                                (list :foreground fg3)
                              (list :foreground minimal-mistakes-fg)))
               (mode-line-inactive
                :background ,minimal-mistakes-bg :inverse-video nil
                ,@(if minimal-mistakes-alternate-mode-line-and-minibuffer
                      (list :foreground minimal-mistakes-comment :box minimal-mistakes-bg)
                    (list :foreground fg4 :box bg2)))
               (mini-modeline-mode-line :inherit mode-line :height 0.1 :box nil)
               ;; mu4e
               (mu4e-unread-face :foreground ,minimal-mistakes-pink :weight normal)
               (mu4e-view-url-number-face :foreground ,minimal-mistakes-purple)
               (mu4e-highlight-face :background ,minimal-mistakes-bg
                                    :foreground ,minimal-mistakes-yellow
                                    :extend t)
               (mu4e-header-highlight-face :background ,minimal-mistakes-current
                                           :foreground ,minimal-mistakes-fg
                                           :underline nil :weight bold
                                           :extend t)
               (mu4e-header-key-face :inherit message-mml)
               (mu4e-header-marks-face :foreground ,minimal-mistakes-purple)
               (mu4e-cited-1-face :foreground ,minimal-mistakes-purple)
               (mu4e-cited-2-face :foreground ,minimal-mistakes-orange)
               (mu4e-cited-3-face :foreground ,minimal-mistakes-comment)
               (mu4e-cited-4-face :foreground ,fg2)
               (mu4e-cited-5-face :foreground ,fg3)
               ;; neotree
               (neo-banner-face :foreground ,minimal-mistakes-orange :weight bold)
               ;;(neo-button-face :underline nil)
               (neo-dir-link-face :foreground ,minimal-mistakes-purple)
               (neo-expand-btn-face :foreground ,minimal-mistakes-fg)
               (neo-file-link-face :foreground ,minimal-mistakes-cyan)
               (neo-header-face :background ,minimal-mistakes-bg
                                :foreground ,minimal-mistakes-fg
                                :weight bold)
               (neo-root-dir-face :foreground ,minimal-mistakes-purple :weight bold)
               (neo-vc-added-face :foreground ,minimal-mistakes-orange)
               (neo-vc-conflict-face :foreground ,minimal-mistakes-red)
               (neo-vc-default-face :inherit neo-file-link-face)
               (neo-vc-edited-face :foreground ,minimal-mistakes-orange)
               (neo-vc-ignored-face :foreground ,minimal-mistakes-comment)
               (neo-vc-missing-face :foreground ,minimal-mistakes-red)
               (neo-vc-needs-merge-face :foreground ,minimal-mistakes-red
                                        :weight bold)
               ;;(neo-vc-needs-update-face :underline t)
               ;;(neo-vc-removed-face :strike-through t)
               (neo-vc-unlocked-changes-face :foreground ,minimal-mistakes-red)
               ;;(neo-vc-unregistered-face nil)
               (neo-vc-up-to-date-face :foreground ,minimal-mistakes-green)
               (neo-vc-user-face :foreground ,minimal-mistakes-purple)
               ;; org
               (org-agenda-date :foreground ,minimal-mistakes-cyan :underline nil)
               (org-agenda-dimmed-todo-face :foreground ,minimal-mistakes-comment)
               (org-agenda-done :foreground ,minimal-mistakes-green)
               (org-agenda-structure :foreground ,minimal-mistakes-purple)
               (org-block :foreground ,minimal-mistakes-orange)
               (org-code :foreground ,minimal-mistakes-green)
               (org-column :background ,bg4)
               (org-column-title :inherit org-column :weight bold :underline t)
               (org-date :foreground ,minimal-mistakes-cyan :underline t)
               (org-document-info :foreground ,other-blue)
               (org-document-info-keyword :foreground ,minimal-mistakes-comment)
               (org-document-title :weight bold :foreground ,minimal-mistakes-orange
                                   ,@(when minimal-mistakes-enlarge-headings
                                       (list :height minimal-mistakes-height-doc-title)))
               (org-done :foreground ,minimal-mistakes-green)
               (org-ellipsis :foreground ,minimal-mistakes-comment)
               (org-footnote :foreground ,other-blue)
               (org-formula :foreground ,minimal-mistakes-pink)
               (org-headline-done :foreground ,minimal-mistakes-comment
                                  :weight normal :strike-through t)
               (org-hide :foreground ,minimal-mistakes-bg :background ,minimal-mistakes-bg)
               (org-level-1 :inherit bold :foreground ,minimal-mistakes-pink
                            ,@(when minimal-mistakes-enlarge-headings
                                (list :height minimal-mistakes-height-title-1)))
               (org-level-2 :inherit bold :foreground ,minimal-mistakes-purple
                            ,@(when minimal-mistakes-enlarge-headings
                                (list :height minimal-mistakes-height-title-2)))
               (org-level-3 :weight normal :foreground ,minimal-mistakes-green
                            ,@(when minimal-mistakes-enlarge-headings
                                (list :height minimal-mistakes-height-title-3)))
               (org-level-4 :weight normal :foreground ,minimal-mistakes-yellow)
               (org-level-5 :weight normal :foreground ,minimal-mistakes-cyan)
               (org-level-6 :weight normal :foreground ,minimal-mistakes-orange)
               (org-level-7 :weight normal :foreground ,other-blue)
               (org-level-8 :weight normal :foreground ,minimal-mistakes-fg)
               (org-link :foreground ,minimal-mistakes-cyan :underline t)
               (org-priority :foreground ,minimal-mistakes-cyan)
               (org-quote :foreground ,minimal-mistakes-yellow :slant italic)
               (org-scheduled :foreground ,minimal-mistakes-green)
               (org-scheduled-previously :foreground ,minimal-mistakes-yellow)
               (org-scheduled-today :foreground ,minimal-mistakes-green)
               (org-sexp-date :foreground ,fg4)
               (org-special-keyword :foreground ,minimal-mistakes-yellow)
               (org-table :foreground ,minimal-mistakes-purple)
               (org-tag :foreground ,minimal-mistakes-pink :weight bold :background ,bg2)
               (org-todo :foreground ,minimal-mistakes-orange :weight bold :background ,bg2)
               (org-upcoming-deadline :foreground ,minimal-mistakes-yellow)
               (org-verbatim :inherit org-quote)
               (org-warning :weight bold :foreground ,minimal-mistakes-pink)
               ;; outline
               (outline-1 :foreground ,minimal-mistakes-pink)
               (outline-2 :foreground ,minimal-mistakes-purple)
               (outline-3 :foreground ,minimal-mistakes-green)
               (outline-4 :foreground ,minimal-mistakes-yellow)
               (outline-5 :foreground ,minimal-mistakes-cyan)
               (outline-6 :foreground ,minimal-mistakes-orange)
               ;; perspective
               (persp-selected-face :weight bold :foreground ,minimal-mistakes-pink)
               ;; powerline
               (powerline-active1 :background ,minimal-mistakes-bg :foreground ,minimal-mistakes-pink)
               (powerline-active2 :background ,minimal-mistakes-bg :foreground ,minimal-mistakes-pink)
               (powerline-inactive1 :background ,bg2 :foreground ,minimal-mistakes-purple)
               (powerline-inactive2 :background ,bg2 :foreground ,minimal-mistakes-purple)
               (powerline-evil-base-face :foreground ,bg2)
               (powerline-evil-emacs-face :inherit powerline-evil-base-face :background ,minimal-mistakes-yellow)
               (powerline-evil-insert-face :inherit powerline-evil-base-face :background ,minimal-mistakes-cyan)
               (powerline-evil-motion-face :inherit powerline-evil-base-face :background ,minimal-mistakes-purple)
               (powerline-evil-normal-face :inherit powerline-evil-base-face :background ,minimal-mistakes-green)
               (powerline-evil-operator-face :inherit powerline-evil-base-face :background ,minimal-mistakes-pink)
               (powerline-evil-replace-face :inherit powerline-evil-base-face :background ,minimal-mistakes-red)
               (powerline-evil-visual-face :inherit powerline-evil-base-face :background ,minimal-mistakes-orange)
               ;; rainbow-delimiters
               (rainbow-delimiters-depth-1-face :foreground ,minimal-mistakes-fg)
               (rainbow-delimiters-depth-2-face :foreground ,minimal-mistakes-cyan)
               (rainbow-delimiters-depth-3-face :foreground ,minimal-mistakes-purple)
               (rainbow-delimiters-depth-4-face :foreground ,minimal-mistakes-pink)
               (rainbow-delimiters-depth-5-face :foreground ,minimal-mistakes-orange)
               (rainbow-delimiters-depth-6-face :foreground ,minimal-mistakes-green)
               (rainbow-delimiters-depth-7-face :foreground ,minimal-mistakes-yellow)
               (rainbow-delimiters-depth-8-face :foreground ,other-blue)
               (rainbow-delimiters-unmatched-face :foreground ,minimal-mistakes-orange)
               ;; rpm-spec
               (rpm-spec-dir-face :foreground ,minimal-mistakes-green)
               (rpm-spec-doc-face :foreground ,minimal-mistakes-pink)
               (rpm-spec-ghost-face :foreground ,minimal-mistakes-purple)
               (rpm-spec-macro-face :foreground ,minimal-mistakes-yellow)
               (rpm-spec-obsolete-tag-face :inherit font-lock-warning-face)
               (rpm-spec-package-face :foreground ,minimal-mistakes-purple)
               (rpm-spec-section-face :foreground ,minimal-mistakes-yellow)
               (rpm-spec-tag-face :foreground ,minimal-mistakes-cyan)
               (rpm-spec-var-face :foreground ,minimal-mistakes-orange)
               ;; rst (reStructuredText)
               (rst-level-1 :foreground ,minimal-mistakes-pink :weight bold)
               (rst-level-2 :foreground ,minimal-mistakes-purple :weight bold)
               (rst-level-3 :foreground ,minimal-mistakes-green)
               (rst-level-4 :foreground ,minimal-mistakes-yellow)
               (rst-level-5 :foreground ,minimal-mistakes-cyan)
               (rst-level-6 :foreground ,minimal-mistakes-orange)
               (rst-level-7 :foreground ,other-blue)
               (rst-level-8 :foreground ,minimal-mistakes-fg)
               ;; selectrum-mode
               (selectrum-current-candidate :weight bold)
               (selectrum-primary-highlight :foreground ,minimal-mistakes-pink)
               (selectrum-secondary-highlight :foreground ,minimal-mistakes-green)
               ;; show-paren
               (show-paren-match-face :background unspecified
                                      :foreground ,minimal-mistakes-cyan
                                      :weight bold)
               (show-paren-match :background unspecified
                                 :foreground ,minimal-mistakes-cyan
                                 :weight bold)
               (show-paren-match-expression :inherit match)
               (show-paren-mismatch :inherit font-lock-warning-face)
               ;; slime
               (slime-repl-inputed-output-face :foreground ,minimal-mistakes-purple)
               ;; spam
               (spam :inherit gnus-summary-normal-read :foreground ,minimal-mistakes-orange
                     :strike-through t :slant oblique)
               ;; speedbar (and sr-speedbar)
               (speedbar-button-face :foreground ,minimal-mistakes-green)
               (speedbar-file-face :foreground ,minimal-mistakes-cyan)
               (speedbar-directory-face :foreground ,minimal-mistakes-purple)
               (speedbar-tag-face :foreground ,minimal-mistakes-yellow)
               (speedbar-selected-face :foreground ,minimal-mistakes-pink)
               (speedbar-highlight-face :inherit match)
               (speedbar-separator-face :background ,minimal-mistakes-bg
                                        :foreground ,minimal-mistakes-fg
                                        :weight bold)
               ;; tab-bar & tab-line (since Emacs 27.1)
               (tab-bar :foreground ,minimal-mistakes-purple :background ,minimal-mistakes-current
                        :inherit variable-pitch)
               (tab-bar-tab :foreground ,minimal-mistakes-pink :background ,minimal-mistakes-bg
                            :box (:line-width 2 :color ,minimal-mistakes-bg :style nil))
               (tab-bar-tab-inactive :foreground ,minimal-mistakes-purple :background ,bg2
                                     :box (:line-width 2 :color ,bg2 :style nil))
               (tab-line :foreground ,minimal-mistakes-purple :background ,minimal-mistakes-current
                         :height 0.9 :inherit variable-pitch)
               (tab-line-tab :foreground ,minimal-mistakes-pink :background ,minimal-mistakes-bg
                             :box (:line-width 2 :color ,minimal-mistakes-bg :style nil))
               (tab-line-tab-inactive :foreground ,minimal-mistakes-purple :background ,bg2
                                      :box (:line-width 2 :color ,bg2 :style nil))
               (tab-line-tab-current :inherit tab-line-tab)
               (tab-line-close-highlight :foreground ,minimal-mistakes-red)
               ;; telephone-line
               (telephone-line-accent-active :background ,minimal-mistakes-bg :foreground ,minimal-mistakes-pink)
               (telephone-line-accent-inactive :background ,bg2 :foreground ,minimal-mistakes-purple)
               (telephone-line-unimportant :background ,minimal-mistakes-bg :foreground ,minimal-mistakes-comment)
               ;; term
               (term :foreground ,minimal-mistakes-fg :background ,minimal-mistakes-bg)
               (term-color-black :foreground ,minimal-mistakes-bg :background ,minimal-mistakes-comment)
               (term-color-blue :foreground ,minimal-mistakes-purple :background ,minimal-mistakes-purple)
               (term-color-cyan :foreground ,minimal-mistakes-cyan :background ,minimal-mistakes-cyan)
               (term-color-green :foreground ,minimal-mistakes-green :background ,minimal-mistakes-green)
               (term-color-magenta :foreground ,minimal-mistakes-pink :background ,minimal-mistakes-pink)
               (term-color-red :foreground ,minimal-mistakes-red :background ,minimal-mistakes-red)
               (term-color-white :foreground ,minimal-mistakes-fg :background ,minimal-mistakes-fg)
               (term-color-yellow :foreground ,minimal-mistakes-yellow :background ,minimal-mistakes-yellow)
               ;; tree-sitter
               (tree-sitter-hl-face:attribute :inherit font-lock-constant-face)
               (tree-sitter-hl-face:comment :inherit font-lock-comment-face)
               (tree-sitter-hl-face:constant :inherit font-lock-constant-face)
               (tree-sitter-hl-face:constant.builtin :inherit font-lock-builtin-face)
               (tree-sitter-hl-face:constructor :inherit font-lock-constant-face)
               (tree-sitter-hl-face:escape :foreground ,minimal-mistakes-pink)
               (tree-sitter-hl-face:function :inherit font-lock-function-name-face)
               (tree-sitter-hl-face:function.builtin :inherit font-lock-builtin-face)
               (tree-sitter-hl-face:function.call :inherit font-lock-function-name-face
                                                  :weight normal)
               (tree-sitter-hl-face:function.macro :inherit font-lock-preprocessor-face)
               (tree-sitter-hl-face:function.special :inherit font-lock-preprocessor-face)
               (tree-sitter-hl-face:keyword :inherit font-lock-keyword-face)
               (tree-sitter-hl-face:punctuation :foreground ,minimal-mistakes-pink)
               (tree-sitter-hl-face:punctuation.bracket :foreground ,minimal-mistakes-fg)
               (tree-sitter-hl-face:punctuation.delimiter :foreground ,minimal-mistakes-fg)
               (tree-sitter-hl-face:punctuation.special :foreground ,minimal-mistakes-pink)
               (tree-sitter-hl-face:string :inherit font-lock-string-face)
               (tree-sitter-hl-face:string.special :foreground ,minimal-mistakes-red)
               (tree-sitter-hl-face:tag :inherit font-lock-keyword-face)
               (tree-sitter-hl-face:type :inherit font-lock-type-face)
               (tree-sitter-hl-face:type.parameter :foreground ,minimal-mistakes-pink)
               (tree-sitter-hl-face:variable :inherit font-lock-variable-name-face)
               (tree-sitter-hl-face:variable.parameter :inherit tree-sitter-hl-face:variable
                                                       :weight normal)
               ;; undo-tree
               (undo-tree-visualizer-current-face :foreground ,minimal-mistakes-orange)
               (undo-tree-visualizer-default-face :foreground ,fg2)
               (undo-tree-visualizer-register-face :foreground ,minimal-mistakes-purple)
               (undo-tree-visualizer-unmodified-face :foreground ,minimal-mistakes-fg)
               ;; web-mode
               (web-mode-builtin-face :inherit font-lock-builtin-face)
               (web-mode-comment-face :inherit font-lock-comment-face)
               (web-mode-constant-face :inherit font-lock-constant-face)
               (web-mode-css-property-name-face :inherit font-lock-constant-face)
               (web-mode-doctype-face :inherit font-lock-comment-face)
               (web-mode-function-name-face :inherit font-lock-function-name-face)
               (web-mode-html-attr-name-face :foreground ,minimal-mistakes-purple)
               (web-mode-html-attr-value-face :foreground ,minimal-mistakes-green)
               (web-mode-html-tag-face :foreground ,minimal-mistakes-pink :weight bold)
               (web-mode-keyword-face :foreground ,minimal-mistakes-pink)
               (web-mode-string-face :foreground ,minimal-mistakes-yellow)
               (web-mode-type-face :inherit font-lock-type-face)
               (web-mode-warning-face :inherit font-lock-warning-face)
               ;; which-func
               (which-func :inherit font-lock-function-name-face)
               ;; which-key
               (which-key-key-face :inherit font-lock-builtin-face)
               (which-key-command-description-face :inherit default)
               (which-key-separator-face :inherit font-lock-comment-delimiter-face)
               (which-key-local-map-description-face :foreground ,minimal-mistakes-green)
               ;; whitespace
               (whitespace-big-indent :background ,minimal-mistakes-red :foreground ,minimal-mistakes-red)
               (whitespace-empty :background ,minimal-mistakes-orange :foreground ,minimal-mistakes-red)
               (whitespace-hspace :background ,bg3 :foreground ,minimal-mistakes-comment)
               (whitespace-indentation :background ,minimal-mistakes-orange :foreground ,minimal-mistakes-red)
               (whitespace-line :background ,minimal-mistakes-bg :foreground ,minimal-mistakes-pink)
               (whitespace-newline :foreground ,minimal-mistakes-comment)
               (whitespace-space :background ,minimal-mistakes-bg :foreground ,minimal-mistakes-comment)
               (whitespace-space-after-tab :background ,minimal-mistakes-orange :foreground ,minimal-mistakes-red)
               (whitespace-space-before-tab :background ,minimal-mistakes-orange :foreground ,minimal-mistakes-red)
               (whitespace-tab :background ,bg2 :foreground ,minimal-mistakes-comment)
               (whitespace-trailing :inherit trailing-whitespace)
               ;; yard-mode
               (yard-tag-face :inherit font-lock-builtin-face)
               (yard-directive-face :inherit font-lock-builtin-face))))

  (apply #'custom-theme-set-faces
         'minimal-mistakes
         (let ((expand-with-func
                (lambda (func spec)
                  (let (reduced-color-list)
                    (dolist (col colors reduced-color-list)
                      (push (list (car col) (funcall func col))
                            reduced-color-list))
                    (eval `(let ,reduced-color-list
                             (backquote ,spec))))))
               whole-theme)
           (pcase-dolist (`(,face . ,spec) faces)
             (push `(,face
                     ((((min-colors 16777216)) ; fully graphical envs
                       ,(funcall expand-with-func 'cadr spec))
                      (((min-colors 256))      ; terminal withs 256 colors
                       ,(if minimal-mistakes-use-24-bit-colors-on-256-colors-terms
                            (funcall expand-with-func 'cadr spec)
                          (funcall expand-with-func 'caddr spec)))
                      (t                       ; should be only tty-like envs
                       ,(funcall expand-with-func 'cadddr spec))))
                   whole-theme))
           whole-theme))

  (apply #'custom-theme-set-variables
         'minimal-mistakes
         (let ((get-func
                (pcase (display-color-cells)
                  ((pred (<= 16777216)) 'car) ; fully graphical envs
                  ((pred (<= 256)) 'cadr)     ; terminal withs 256 colors
                  (_ 'caddr))))               ; should be only tty-like envs
           `((ansi-color-names-vector
              [,(funcall get-func (alist-get 'minimal-mistakes-bg colors))
               ,(funcall get-func (alist-get 'minimal-mistakes-red colors))
               ,(funcall get-func (alist-get 'minimal-mistakes-green colors))
               ,(funcall get-func (alist-get 'minimal-mistakes-yellow colors))
               ,(funcall get-func (alist-get 'minimal-mistakes-comment colors))
               ,(funcall get-func (alist-get 'minimal-mistakes-purple colors))
               ,(funcall get-func (alist-get 'minimal-mistakes-cyan colors))
               ,(funcall get-func (alist-get 'minimal-mistakes-fg colors))])))))


;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'minimal-mistakes)

;; Local Variables:
;; indent-tabs-mode: nil
;; End:

;;; minimal-mistakes-theme.el ends here