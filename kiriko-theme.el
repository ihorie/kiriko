;;; kiriko-theme.el --- A low contrast color theme for Emacs.

;;; Code:

(deftheme kiriko "The Kiriko color theme")

;;; Color Palette

(defvar kiriko-default-colors-alist
  '(("kiriko-fg+1"     . "#FFFFEF")
    ("kiriko-fg"       . "#DCDCCC")
    ("kiriko-fg-1"     . "#656555")
    ("kiriko-bg-2"     . "#000000")
    ("kiriko-bg-1"     . "#2B2B2B")
    ("kiriko-bg-05"    . "#383838")
    ("kiriko-bg"       . "#3F3F3F")
    ("kiriko-bg+05"    . "#494949")
    ("kiriko-bg+1"     . "#4F4F4F")
    ("kiriko-bg+2"     . "#5F5F5F")
    ("kiriko-bg+3"     . "#6F6F6F")
    ("kiriko-red+1"    . "#DCA3A3")
    ("kiriko-red"      . "#CC9393")
    ("kiriko-red-1"    . "#BC8383")
    ("kiriko-red-2"    . "#AC7373")
    ("kiriko-red-3"    . "#9C6363")
    ("kiriko-red-4"    . "#8C5353")
    ("kiriko-orange"   . "#DFAF8F")
    ("kiriko-yellow"   . "#F0DFAF")
    ("kiriko-yellow-1" . "#E0CF9F")
    ("kiriko-yellow-2" . "#D0BF8F")
    ("kiriko-green-1"  . "#5F7F5F")
    ("kiriko-green"    . "#7F9F7F")
    ("kiriko-green+1"  . "#8FB28F")
    ("kiriko-green+2"  . "#9FC59F")
    ("kiriko-green+3"  . "#AFD8AF")
    ("kiriko-green+4"  . "#BFEBBF")
    ("kiriko-cyan"     . "#93E0E3")
    ("kiriko-blue+1"   . "#94BFF3")
    ("kiriko-blue"     . "#8CD0D3")
    ("kiriko-blue-1"   . "#7CB8BB")
    ("kiriko-blue-2"   . "#6CA0A3")
    ("kiriko-blue-3"   . "#5C888B")
    ("kiriko-blue-4"   . "#4C7073")
    ("kiriko-blue-5"   . "#366060")
    ("kiriko-magenta"  . "#DC8CC3"))
  "List of Kiriko colors.
Each element has the form (NAME . HEX).

`+N' suffixes indicate a color is lighter.
`-N' suffixes indicate a color is darker.")

(defvar kiriko-override-colors-alist
  '()
  "Place to override default theme colors.

You can override a subset of the theme's default colors by
defining them in this alist before loading the theme.")

(defvar kiriko-colors-alist
  (append kiriko-default-colors-alist kiriko-override-colors-alist))

(defmacro kiriko-with-color-variables (&rest body)
  "`let' bind all colors defined in `kiriko-colors-alist' around BODY.
Also bind `class' to ((class color) (min-colors 89))."
  (declare (indent 0))
  `(let ((class '((class color) (min-colors 89)))
         ,@(mapcar (lambda (cons)
                     (list (intern (car cons)) (cdr cons)))
                   kiriko-colors-alist))
     ,@body))

;;; Theme Faces
(kiriko-with-color-variables
  (custom-theme-set-faces
   'kiriko
;;;; Built-in
;;;;; basic coloring
   '(button ((t (:underline t))))
   `(link ((t (:foreground ,kiriko-yellow :underline t :weight bold))))
   `(link-visited ((t (:foreground ,kiriko-yellow-2 :underline t :weight normal))))
;   `(default ((t (:foreground ,kiriko-fg :background ,kiriko-bg))))
   `(cursor ((t (:foreground ,kiriko-fg :background ,kiriko-fg+1))))
   `(escape-glyph ((t (:foreground ,kiriko-yellow :weight bold))))
   `(fringe ((t (:foreground ,kiriko-fg :background ,kiriko-bg+1))))
   `(header-line ((t (:foreground ,kiriko-yellow
                                  :background ,kiriko-bg-1
                                  :box (:line-width -1 :style released-button)))))
   `(highlight ((t (:background ,kiriko-bg-05))))
   `(success ((t (:foreground ,kiriko-green :weight bold))))
   `(warning ((t (:foreground ,kiriko-orange :weight bold))))
   `(tooltip ((t (:foreground ,kiriko-fg :background ,kiriko-bg+1))))
;;;;; compilation
   `(compilation-column-face ((t (:foreground ,kiriko-yellow))))
   `(compilation-enter-directory-face ((t (:foreground ,kiriko-green))))
   `(compilation-error-face ((t (:foreground ,kiriko-red-1 :weight bold :underline t))))
   `(compilation-face ((t (:foreground ,kiriko-fg))))
   `(compilation-info-face ((t (:foreground ,kiriko-blue))))
   `(compilation-info ((t (:foreground ,kiriko-green+4 :underline t))))
   `(compilation-leave-directory-face ((t (:foreground ,kiriko-green))))
   `(compilation-line-face ((t (:foreground ,kiriko-yellow))))
   `(compilation-line-number ((t (:foreground ,kiriko-yellow))))
   `(compilation-message-face ((t (:foreground ,kiriko-blue))))
   `(compilation-warning-face ((t (:foreground ,kiriko-orange :weight bold :underline t))))
   `(compilation-mode-line-exit ((t (:foreground ,kiriko-green+2 :weight bold))))
   `(compilation-mode-line-fail ((t (:foreground ,kiriko-red :weight bold))))
   `(compilation-mode-line-run ((t (:foreground ,kiriko-yellow :weight bold))))
;;;;; completions
   `(completions-annotations ((t (:foreground ,kiriko-fg-1))))
;;;;; eww
   '(eww-invalid-certificate ((t (:inherit error))))
   '(eww-valid-certificate   ((t (:inherit success))))
;;;;; grep
   `(grep-context-face ((t (:foreground ,kiriko-fg))))
   `(grep-error-face ((t (:foreground ,kiriko-red-1 :weight bold :underline t))))
   `(grep-hit-face ((t (:foreground ,kiriko-blue))))
   `(grep-match-face ((t (:foreground ,kiriko-orange :weight bold))))
   `(match ((t (:background ,kiriko-bg-1 :foreground ,kiriko-orange :weight bold))))
;;;;; hi-lock
   `(hi-blue    ((t (:background ,kiriko-cyan    :foreground ,kiriko-bg-1))))
   `(hi-green   ((t (:background ,kiriko-green+4 :foreground ,kiriko-bg-1))))
   `(hi-pink    ((t (:background ,kiriko-magenta :foreground ,kiriko-bg-1))))
   `(hi-yellow  ((t (:background ,kiriko-yellow  :foreground ,kiriko-bg-1))))
   `(hi-blue-b  ((t (:foreground ,kiriko-blue    :weight     bold))))
   `(hi-green-b ((t (:foreground ,kiriko-green+2 :weight     bold))))
   `(hi-red-b   ((t (:foreground ,kiriko-red     :weight     bold))))
;;;;; info
   `(Info-quoted ((t (:inherit font-lock-constant-face))))
;;;;; isearch
   `(isearch ((t (:foreground ,kiriko-yellow-2 :weight bold :background ,kiriko-bg+2))))
   `(isearch-fail ((t (:foreground ,kiriko-fg :background ,kiriko-red-4))))
   `(lazy-highlight ((t (:foreground ,kiriko-yellow-2 :weight bold :background ,kiriko-bg-05))))

   `(menu ((t (:foreground ,kiriko-fg :background ,kiriko-bg))))
   `(minibuffer-prompt ((t (:foreground ,kiriko-yellow))))
   `(mode-line
     ((,class (:foreground ,kiriko-green+1
                           :background ,kiriko-bg-1
                           :box (:line-width -1 :style released-button)))
      (t :inverse-video t)))
   `(mode-line-buffer-id ((t (:foreground ,kiriko-yellow :weight bold))))
   `(mode-line-inactive
     ((t (:foreground ,kiriko-green-1
                      :background ,kiriko-bg-05
                      :box (:line-width -1 :style released-button)))))
   `(region ((,class (:background ,kiriko-bg-1))
             (t :inverse-video t)))
   `(secondary-selection ((t (:background ,kiriko-bg+2))))
   `(trailing-whitespace ((t (:background ,kiriko-red))))
   `(vertical-border ((t (:foreground ,kiriko-fg))))
;;;;; font lock
   `(font-lock-builtin-face ((t (:foreground ,kiriko-fg :weight bold))))
   `(font-lock-comment-face ((t (:foreground ,kiriko-green))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,kiriko-green-1))))
   `(font-lock-constant-face ((t (:foreground ,kiriko-green+4))))
   `(font-lock-doc-face ((t (:foreground ,kiriko-green+2))))
   `(font-lock-function-name-face ((t (:foreground ,kiriko-cyan))))
   `(font-lock-keyword-face ((t (:foreground ,kiriko-yellow :weight bold))))
   `(font-lock-negation-char-face ((t (:foreground ,kiriko-yellow :weight bold))))
   `(font-lock-preprocessor-face ((t (:foreground ,kiriko-blue+1))))
   `(font-lock-regexp-grouping-construct ((t (:foreground ,kiriko-yellow :weight bold))))
   `(font-lock-regexp-grouping-backslash ((t (:foreground ,kiriko-green :weight bold))))
   `(font-lock-string-face ((t (:foreground ,kiriko-red))))
   `(font-lock-type-face ((t (:foreground ,kiriko-blue-1))))
   `(font-lock-variable-name-face ((t (:foreground ,kiriko-orange))))
   `(font-lock-warning-face ((t (:foreground ,kiriko-yellow-2 :weight bold))))

   `(c-annotation-face ((t (:inherit font-lock-constant-face))))
;;;;; man
   '(Man-overstrike ((t (:inherit font-lock-keyword-face))))
   '(Man-underline  ((t (:inherit (font-lock-string-face underline)))))
;;;;; newsticker
   `(newsticker-date-face ((t (:foreground ,kiriko-fg))))
   `(newsticker-default-face ((t (:foreground ,kiriko-fg))))
   `(newsticker-enclosure-face ((t (:foreground ,kiriko-green+3))))
   `(newsticker-extra-face ((t (:foreground ,kiriko-bg+2 :height 0.8))))
   `(newsticker-feed-face ((t (:foreground ,kiriko-fg))))
   `(newsticker-immortal-item-face ((t (:foreground ,kiriko-green))))
   `(newsticker-new-item-face ((t (:foreground ,kiriko-blue))))
   `(newsticker-obsolete-item-face ((t (:foreground ,kiriko-red))))
   `(newsticker-old-item-face ((t (:foreground ,kiriko-bg+3))))
   `(newsticker-statistics-face ((t (:foreground ,kiriko-fg))))
   `(newsticker-treeview-face ((t (:foreground ,kiriko-fg))))
   `(newsticker-treeview-immortal-face ((t (:foreground ,kiriko-green))))
   `(newsticker-treeview-listwindow-face ((t (:foreground ,kiriko-fg))))
   `(newsticker-treeview-new-face ((t (:foreground ,kiriko-blue :weight bold))))
   `(newsticker-treeview-obsolete-face ((t (:foreground ,kiriko-red))))
   `(newsticker-treeview-old-face ((t (:foreground ,kiriko-bg+3))))
   `(newsticker-treeview-selection-face ((t (:background ,kiriko-bg-1 :foreground ,kiriko-yellow))))
;;;;; woman
   '(woman-bold   ((t (:inherit font-lock-keyword-face))))
   '(woman-italic ((t (:inherit (font-lock-string-face italic)))))
;;;; Third-party
;;;;; ace-jump
   `(ace-jump-face-background
     ((t (:foreground ,kiriko-fg-1 :background ,kiriko-bg :inverse-video nil))))
   `(ace-jump-face-foreground
     ((t (:foreground ,kiriko-green+2 :background ,kiriko-bg :inverse-video nil))))
;;;;; ace-window
   `(aw-background-face
     ((t (:foreground ,kiriko-fg-1 :background ,kiriko-bg :inverse-video nil))))
   `(aw-leading-char-face ((t (:inherit aw-mode-line-face))))
;;;;; android mode
   `(android-mode-debug-face ((t (:foreground ,kiriko-green+1))))
   `(android-mode-error-face ((t (:foreground ,kiriko-orange :weight bold))))
   `(android-mode-info-face ((t (:foreground ,kiriko-fg))))
   `(android-mode-verbose-face ((t (:foreground ,kiriko-green))))
   `(android-mode-warning-face ((t (:foreground ,kiriko-yellow))))
;;;;; anzu
   `(anzu-mode-line ((t (:foreground ,kiriko-cyan :weight bold))))
   `(anzu-mode-line-no-match ((t (:foreground ,kiriko-red :weight bold))))
   `(anzu-match-1 ((t (:foreground ,kiriko-bg :background ,kiriko-green))))
   `(anzu-match-2 ((t (:foreground ,kiriko-bg :background ,kiriko-orange))))
   `(anzu-match-3 ((t (:foreground ,kiriko-bg :background ,kiriko-blue))))
   `(anzu-replace-to ((t (:inherit anzu-replace-highlight :foreground ,kiriko-yellow))))
;;;;; auctex
   `(font-latex-bold-face ((t (:inherit bold))))
   `(font-latex-warning-face ((t (:foreground nil :inherit font-lock-warning-face))))
   `(font-latex-sectioning-5-face ((t (:foreground ,kiriko-red :weight bold ))))
   `(font-latex-sedate-face ((t (:foreground ,kiriko-yellow))))
   `(font-latex-italic-face ((t (:foreground ,kiriko-cyan :slant italic))))
   `(font-latex-string-face ((t (:inherit ,font-lock-string-face))))
   `(font-latex-math-face ((t (:foreground ,kiriko-orange))))
;;;;; agda-mode
   `(agda2-highlight-keyword-face ((t (:foreground ,kiriko-yellow :weight bold))))
   `(agda2-highlight-string-face ((t (:foreground ,kiriko-red))))
   `(agda2-highlight-symbol-face ((t (:foreground ,kiriko-orange))))
   `(agda2-highlight-primitive-type-face ((t (:foreground ,kiriko-blue-1))))
   `(agda2-highlight-inductive-constructor-face ((t (:foreground ,kiriko-fg))))
   `(agda2-highlight-coinductive-constructor-face ((t (:foreground ,kiriko-fg))))
   `(agda2-highlight-datatype-face ((t (:foreground ,kiriko-blue))))
   `(agda2-highlight-function-face ((t (:foreground ,kiriko-blue))))
   `(agda2-highlight-module-face ((t (:foreground ,kiriko-blue-1))))
   `(agda2-highlight-error-face ((t (:foreground ,kiriko-bg :background ,kiriko-magenta))))
   `(agda2-highlight-unsolved-meta-face ((t (:foreground ,kiriko-bg :background ,kiriko-magenta))))
   `(agda2-highlight-unsolved-constraint-face ((t (:foreground ,kiriko-bg :background ,kiriko-magenta))))
   `(agda2-highlight-termination-problem-face ((t (:foreground ,kiriko-bg :background ,kiriko-magenta))))
   `(agda2-highlight-incomplete-pattern-face ((t (:foreground ,kiriko-bg :background ,kiriko-magenta))))
   `(agda2-highlight-typechecks-face ((t (:background ,kiriko-red-4))))
;;;;; auto-complete
   `(ac-candidate-face ((t (:background ,kiriko-bg+3 :foreground ,kiriko-bg-2))))
   `(ac-selection-face ((t (:background ,kiriko-blue-4 :foreground ,kiriko-fg))))
   `(popup-tip-face ((t (:background ,kiriko-yellow-2 :foreground ,kiriko-bg-2))))
   `(popup-menu-mouse-face ((t (:background ,kiriko-yellow-2 :foreground ,kiriko-bg-2))))
   `(popup-summary-face ((t (:background ,kiriko-bg+3 :foreground ,kiriko-bg-2))))
   `(popup-scroll-bar-foreground-face ((t (:background ,kiriko-blue-5))))
   `(popup-scroll-bar-background-face ((t (:background ,kiriko-bg-1))))
   `(popup-isearch-match ((t (:background ,kiriko-bg :foreground ,kiriko-fg))))
;;;;; avy
   `(avy-background-face
     ((t (:foreground ,kiriko-fg-1 :background ,kiriko-bg :inverse-video nil))))
   `(avy-lead-face-0
     ((t (:foreground ,kiriko-green+3 :background ,kiriko-bg :inverse-video nil :weight bold))))
   `(avy-lead-face-1
     ((t (:foreground ,kiriko-yellow :background ,kiriko-bg :inverse-video nil :weight bold))))
   `(avy-lead-face-2
     ((t (:foreground ,kiriko-red+1 :background ,kiriko-bg :inverse-video nil :weight bold))))
   `(avy-lead-face
     ((t (:foreground ,kiriko-cyan :background ,kiriko-bg :inverse-video nil :weight bold))))
;;;;; company-mode
   `(company-tooltip ((t (:foreground ,kiriko-fg :background ,kiriko-bg+1))))
   `(company-tooltip-annotation ((t (:foreground ,kiriko-orange :background ,kiriko-bg+1))))
   `(company-tooltip-annotation-selection ((t (:foreground ,kiriko-orange :background ,kiriko-bg-1))))
   `(company-tooltip-selection ((t (:foreground ,kiriko-fg :background ,kiriko-bg-1))))
   `(company-tooltip-mouse ((t (:background ,kiriko-bg-1))))
   `(company-tooltip-common ((t (:foreground ,kiriko-green+2))))
   `(company-tooltip-common-selection ((t (:foreground ,kiriko-green+2))))
   `(company-scrollbar-fg ((t (:background ,kiriko-bg-1))))
   `(company-scrollbar-bg ((t (:background ,kiriko-bg+2))))
   `(company-preview ((t (:background ,kiriko-green+2))))
   `(company-preview-common ((t (:foreground ,kiriko-green+2 :background ,kiriko-bg-1))))
;;;;; bm
   `(bm-face ((t (:background ,kiriko-yellow-1 :foreground ,kiriko-bg))))
   `(bm-fringe-face ((t (:background ,kiriko-yellow-1 :foreground ,kiriko-bg))))
   `(bm-fringe-persistent-face ((t (:background ,kiriko-green-1 :foreground ,kiriko-bg))))
   `(bm-persistent-face ((t (:background ,kiriko-green-1 :foreground ,kiriko-bg))))
;;;;; calfw
   `(cfw:face-annotation ((t (:foreground ,kiriko-red :inherit cfw:face-day-title))))
   `(cfw:face-day-title ((t nil)))
   `(cfw:face-default-content ((t (:foreground ,kiriko-green))))
   `(cfw:face-default-day ((t (:weight bold))))
   `(cfw:face-disable ((t (:foreground ,kiriko-fg-1))))
   `(cfw:face-grid ((t (:inherit shadow))))
   `(cfw:face-header ((t (:inherit font-lock-keyword-face))))
   `(cfw:face-holiday ((t (:inherit cfw:face-sunday))))
   `(cfw:face-periods ((t (:foreground ,kiriko-cyan))))
   `(cfw:face-saturday ((t (:foreground ,kiriko-blue :weight bold))))
   `(cfw:face-select ((t (:background ,kiriko-blue-5))))
   `(cfw:face-sunday ((t (:foreground ,kiriko-red :weight bold))))
   `(cfw:face-title ((t (:height 2.0 :inherit (variable-pitch font-lock-keyword-face)))))
   `(cfw:face-today ((t (:foreground ,kiriko-cyan :weight bold))))
   `(cfw:face-today-title ((t (:inherit highlight bold))))
   `(cfw:face-toolbar ((t (:background ,kiriko-blue-5))))
   `(cfw:face-toolbar-button-off ((t (:underline nil :inherit link))))
   `(cfw:face-toolbar-button-on ((t (:underline nil :inherit link-visited))))
;;;;; cider
   `(cider-result-overlay-face ((t (:background unspecified))))
   `(cider-enlightened-face ((t (:box (:color ,kiriko-orange :line-width -1)))))
   `(cider-enlightened-local-face ((t (:weight bold :foreground ,kiriko-green+1))))
   `(cider-deprecated-face ((t (:background ,kiriko-yellow-2))))
   `(cider-instrumented-face ((t (:box (:color ,kiriko-red :line-width -1)))))
   `(cider-traced-face ((t (:box (:color ,kiriko-cyan :line-width -1)))))
   `(cider-test-failure-face ((t (:background ,kiriko-red-4))))
   `(cider-test-error-face ((t (:background ,kiriko-magenta))))
   `(cider-test-success-face ((t (:background ,kiriko-green-1))))
   `(cider-fringe-good-face ((t (:foreground ,kiriko-green+4))))
;;;;; circe
   `(circe-highlight-nick-face ((t (:foreground ,kiriko-cyan))))
   `(circe-my-message-face ((t (:foreground ,kiriko-fg))))
   `(circe-fool-face ((t (:foreground ,kiriko-red+1))))
   `(circe-topic-diff-removed-face ((t (:foreground ,kiriko-red :weight bold))))
   `(circe-originator-face ((t (:foreground ,kiriko-fg))))
   `(circe-server-face ((t (:foreground ,kiriko-green))))
   `(circe-topic-diff-new-face ((t (:foreground ,kiriko-orange :weight bold))))
   `(circe-prompt-face ((t (:foreground ,kiriko-orange :background ,kiriko-bg :weight bold))))
;;;;; context-coloring
   `(context-coloring-level-0-face ((t :foreground ,kiriko-fg)))
   `(context-coloring-level-1-face ((t :foreground ,kiriko-cyan)))
   `(context-coloring-level-2-face ((t :foreground ,kiriko-green+4)))
   `(context-coloring-level-3-face ((t :foreground ,kiriko-yellow)))
   `(context-coloring-level-4-face ((t :foreground ,kiriko-orange)))
   `(context-coloring-level-5-face ((t :foreground ,kiriko-magenta)))
   `(context-coloring-level-6-face ((t :foreground ,kiriko-blue+1)))
   `(context-coloring-level-7-face ((t :foreground ,kiriko-green+2)))
   `(context-coloring-level-8-face ((t :foreground ,kiriko-yellow-2)))
   `(context-coloring-level-9-face ((t :foreground ,kiriko-red+1)))
;;;;; coq
   `(coq-solve-tactics-face ((t (:foreground nil :inherit font-lock-constant-face))))
;;;;; ctable
   `(ctbl:face-cell-select ((t (:background ,kiriko-blue :foreground ,kiriko-bg))))
   `(ctbl:face-continue-bar ((t (:background ,kiriko-bg-05 :foreground ,kiriko-bg))))
   `(ctbl:face-row-select ((t (:background ,kiriko-cyan :foreground ,kiriko-bg))))
;;;;; debbugs
   `(debbugs-gnu-done ((t (:foreground ,kiriko-fg-1))))
   `(debbugs-gnu-handled ((t (:foreground ,kiriko-green))))
   `(debbugs-gnu-new ((t (:foreground ,kiriko-red))))
   `(debbugs-gnu-pending ((t (:foreground ,kiriko-blue))))
   `(debbugs-gnu-stale ((t (:foreground ,kiriko-orange))))
   `(debbugs-gnu-tagged ((t (:foreground ,kiriko-red))))
;;;;; diff
   `(diff-added          ((t (:background "#335533" :foreground ,kiriko-green))))
   `(diff-changed        ((t (:background "#555511" :foreground ,kiriko-yellow-1))))
   `(diff-removed        ((t (:background "#553333" :foreground ,kiriko-red-2))))
   `(diff-refine-added   ((t (:background "#338833" :foreground ,kiriko-green+4))))
   `(diff-refine-change  ((t (:background "#888811" :foreground ,kiriko-yellow))))
   `(diff-refine-removed ((t (:background "#883333" :foreground ,kiriko-red))))
   `(diff-header ((,class (:background ,kiriko-bg+2))
                  (t (:background ,kiriko-fg :foreground ,kiriko-bg))))
   `(diff-file-header
     ((,class (:background ,kiriko-bg+2 :foreground ,kiriko-fg :weight bold))
      (t (:background ,kiriko-fg :foreground ,kiriko-bg :weight bold))))
;;;;; diff-hl
   `(diff-hl-change ((,class (:foreground ,kiriko-blue :background ,kiriko-blue-2))))
   `(diff-hl-delete ((,class (:foreground ,kiriko-red+1 :background ,kiriko-red-1))))
   `(diff-hl-insert ((,class (:foreground ,kiriko-green+1 :background ,kiriko-green-1))))
;;;;; dim-autoload
   `(dim-autoload-cookie-line ((t :foreground ,kiriko-bg+1)))
;;;;; dired+
   `(diredp-display-msg ((t (:foreground ,kiriko-blue))))
   `(diredp-compressed-file-suffix ((t (:foreground ,kiriko-orange))))
   `(diredp-date-time ((t (:foreground ,kiriko-magenta))))
   `(diredp-deletion ((t (:foreground ,kiriko-yellow))))
   `(diredp-deletion-file-name ((t (:foreground ,kiriko-red))))
   `(diredp-dir-heading ((t (:foreground ,kiriko-blue :background ,kiriko-bg-1))))
   `(diredp-dir-priv ((t (:foreground ,kiriko-cyan))))
   `(diredp-exec-priv ((t (:foreground ,kiriko-red))))
   `(diredp-executable-tag ((t (:foreground ,kiriko-green+1))))
   `(diredp-file-name ((t (:foreground ,kiriko-blue))))
   `(diredp-file-suffix ((t (:foreground ,kiriko-green))))
   `(diredp-flag-mark ((t (:foreground ,kiriko-yellow))))
   `(diredp-flag-mark-line ((t (:foreground ,kiriko-orange))))
   `(diredp-ignored-file-name ((t (:foreground ,kiriko-red))))
   `(diredp-link-priv ((t (:foreground ,kiriko-yellow))))
   `(diredp-mode-line-flagged ((t (:foreground ,kiriko-yellow))))
   `(diredp-mode-line-marked ((t (:foreground ,kiriko-orange))))
   `(diredp-no-priv ((t (:foreground ,kiriko-fg))))
   `(diredp-number ((t (:foreground ,kiriko-green+1))))
   `(diredp-other-priv ((t (:foreground ,kiriko-yellow-1))))
   `(diredp-rare-priv ((t (:foreground ,kiriko-red-1))))
   `(diredp-read-priv ((t (:foreground ,kiriko-green-1))))
   `(diredp-symlink ((t (:foreground ,kiriko-yellow))))
   `(diredp-write-priv ((t (:foreground ,kiriko-magenta))))
;;;;; dired-async
   `(dired-async-failures ((t (:foreground ,kiriko-red :weight bold))))
   `(dired-async-message ((t (:foreground ,kiriko-yellow :weight bold))))
   `(dired-async-mode-message ((t (:foreground ,kiriko-yellow))))
;;;;; ediff
   `(ediff-current-diff-A ((t (:foreground ,kiriko-fg :background ,kiriko-red-4))))
   `(ediff-current-diff-Ancestor ((t (:foreground ,kiriko-fg :background ,kiriko-red-4))))
   `(ediff-current-diff-B ((t (:foreground ,kiriko-fg :background ,kiriko-green-1))))
   `(ediff-current-diff-C ((t (:foreground ,kiriko-fg :background ,kiriko-blue-5))))
   `(ediff-even-diff-A ((t (:background ,kiriko-bg+1))))
   `(ediff-even-diff-Ancestor ((t (:background ,kiriko-bg+1))))
   `(ediff-even-diff-B ((t (:background ,kiriko-bg+1))))
   `(ediff-even-diff-C ((t (:background ,kiriko-bg+1))))
   `(ediff-fine-diff-A ((t (:foreground ,kiriko-fg :background ,kiriko-red-2 :weight bold))))
   `(ediff-fine-diff-Ancestor ((t (:foreground ,kiriko-fg :background ,kiriko-red-2 weight bold))))
   `(ediff-fine-diff-B ((t (:foreground ,kiriko-fg :background ,kiriko-green :weight bold))))
   `(ediff-fine-diff-C ((t (:foreground ,kiriko-fg :background ,kiriko-blue-3 :weight bold ))))
   `(ediff-odd-diff-A ((t (:background ,kiriko-bg+2))))
   `(ediff-odd-diff-Ancestor ((t (:background ,kiriko-bg+2))))
   `(ediff-odd-diff-B ((t (:background ,kiriko-bg+2))))
   `(ediff-odd-diff-C ((t (:background ,kiriko-bg+2))))
;;;;; egg
   `(egg-text-base ((t (:foreground ,kiriko-fg))))
   `(egg-help-header-1 ((t (:foreground ,kiriko-yellow))))
   `(egg-help-header-2 ((t (:foreground ,kiriko-green+3))))
   `(egg-branch ((t (:foreground ,kiriko-yellow))))
   `(egg-branch-mono ((t (:foreground ,kiriko-yellow))))
   `(egg-term ((t (:foreground ,kiriko-yellow))))
   `(egg-diff-add ((t (:foreground ,kiriko-green+4))))
   `(egg-diff-del ((t (:foreground ,kiriko-red+1))))
   `(egg-diff-file-header ((t (:foreground ,kiriko-yellow-2))))
   `(egg-section-title ((t (:foreground ,kiriko-yellow))))
   `(egg-stash-mono ((t (:foreground ,kiriko-green+4))))
;;;;; elfeed
   `(elfeed-log-error-level-face ((t (:foreground ,kiriko-red))))
   `(elfeed-log-info-level-face ((t (:foreground ,kiriko-blue))))
   `(elfeed-log-warn-level-face ((t (:foreground ,kiriko-yellow))))
   `(elfeed-search-date-face ((t (:foreground ,kiriko-yellow-1 :underline t
                                              :weight bold))))
   `(elfeed-search-tag-face ((t (:foreground ,kiriko-green))))
   `(elfeed-search-feed-face ((t (:foreground ,kiriko-cyan))))
;;;;; emacs-w3m
   `(w3m-anchor ((t (:foreground ,kiriko-yellow :underline t
                                 :weight bold))))
   `(w3m-arrived-anchor ((t (:foreground ,kiriko-yellow-2
                                         :underline t :weight normal))))
   `(w3m-form ((t (:foreground ,kiriko-red-1 :underline t))))
   `(w3m-header-line-location-title ((t (:foreground ,kiriko-yellow
                                                     :underline t :weight bold))))
   '(w3m-history-current-url ((t (:inherit match))))
   `(w3m-lnum ((t (:foreground ,kiriko-green+2 :background ,kiriko-bg))))
   `(w3m-lnum-match ((t (:background ,kiriko-bg-1
                                     :foreground ,kiriko-orange
                                     :weight bold))))
   `(w3m-lnum-minibuffer-prompt ((t (:foreground ,kiriko-yellow))))
;;;;; erc
   `(erc-action-face ((t (:inherit erc-default-face))))
   `(erc-bold-face ((t (:weight bold))))
   `(erc-current-nick-face ((t (:foreground ,kiriko-blue :weight bold))))
   `(erc-dangerous-host-face ((t (:inherit font-lock-warning-face))))
   `(erc-default-face ((t (:foreground ,kiriko-fg))))
   `(erc-direct-msg-face ((t (:inherit erc-default-face))))
   `(erc-error-face ((t (:inherit font-lock-warning-face))))
   `(erc-fool-face ((t (:inherit erc-default-face))))
   `(erc-highlight-face ((t (:inherit hover-highlight))))
   `(erc-input-face ((t (:foreground ,kiriko-yellow))))
   `(erc-keyword-face ((t (:foreground ,kiriko-blue :weight bold))))
   `(erc-nick-default-face ((t (:foreground ,kiriko-yellow :weight bold))))
   `(erc-my-nick-face ((t (:foreground ,kiriko-red :weight bold))))
   `(erc-nick-msg-face ((t (:inherit erc-default-face))))
   `(erc-notice-face ((t (:foreground ,kiriko-green))))
   `(erc-pal-face ((t (:foreground ,kiriko-orange :weight bold))))
   `(erc-prompt-face ((t (:foreground ,kiriko-orange :background ,kiriko-bg :weight bold))))
   `(erc-timestamp-face ((t (:foreground ,kiriko-green+4))))
   `(erc-underline-face ((t (:underline t))))
;;;;; eros
   `(eros-result-overlay-face ((t (:background unspecified))))
;;;;; ert
   `(ert-test-result-expected ((t (:foreground ,kiriko-green+4 :background ,kiriko-bg))))
   `(ert-test-result-unexpected ((t (:foreground ,kiriko-red :background ,kiriko-bg))))
;;;;; eshell
   `(eshell-prompt ((t (:foreground ,kiriko-yellow :weight bold))))
   `(eshell-ls-archive ((t (:foreground ,kiriko-red-1 :weight bold))))
   `(eshell-ls-backup ((t (:inherit font-lock-comment-face))))
   `(eshell-ls-clutter ((t (:inherit font-lock-comment-face))))
   `(eshell-ls-directory ((t (:foreground ,kiriko-blue+1 :weight bold))))
   `(eshell-ls-executable ((t (:foreground ,kiriko-red+1 :weight bold))))
   `(eshell-ls-unreadable ((t (:foreground ,kiriko-fg))))
   `(eshell-ls-missing ((t (:inherit font-lock-warning-face))))
   `(eshell-ls-product ((t (:inherit font-lock-doc-face))))
   `(eshell-ls-special ((t (:foreground ,kiriko-yellow :weight bold))))
   `(eshell-ls-symlink ((t (:foreground ,kiriko-cyan :weight bold))))
;;;;; flx
   `(flx-highlight-face ((t (:foreground ,kiriko-green+2 :weight bold))))
;;;;; flycheck
   `(flycheck-error
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,kiriko-red-1) :inherit unspecified))
      (t (:foreground ,kiriko-red-1 :weight bold :underline t))))
   `(flycheck-warning
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,kiriko-yellow) :inherit unspecified))
      (t (:foreground ,kiriko-yellow :weight bold :underline t))))
   `(flycheck-info
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,kiriko-cyan) :inherit unspecified))
      (t (:foreground ,kiriko-cyan :weight bold :underline t))))
   `(flycheck-fringe-error ((t (:foreground ,kiriko-red-1 :weight bold))))
   `(flycheck-fringe-warning ((t (:foreground ,kiriko-yellow :weight bold))))
   `(flycheck-fringe-info ((t (:foreground ,kiriko-cyan :weight bold))))
;;;;; flymake
   `(flymake-errline
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,kiriko-red)
                   :inherit unspecified :foreground unspecified :background unspecified))
      (t (:foreground ,kiriko-red-1 :weight bold :underline t))))
   `(flymake-warnline
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,kiriko-orange)
                   :inherit unspecified :foreground unspecified :background unspecified))
      (t (:foreground ,kiriko-orange :weight bold :underline t))))
   `(flymake-infoline
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,kiriko-green)
                   :inherit unspecified :foreground unspecified :background unspecified))
      (t (:foreground ,kiriko-green-1 :weight bold :underline t))))
;;;;; flyspell
   `(flyspell-duplicate
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,kiriko-orange) :inherit unspecified))
      (t (:foreground ,kiriko-orange :weight bold :underline t))))
   `(flyspell-incorrect
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,kiriko-red) :inherit unspecified))
      (t (:foreground ,kiriko-red-1 :weight bold :underline t))))
;;;;; full-ack
   `(ack-separator ((t (:foreground ,kiriko-fg))))
   `(ack-file ((t (:foreground ,kiriko-blue))))
   `(ack-line ((t (:foreground ,kiriko-yellow))))
   `(ack-match ((t (:foreground ,kiriko-orange :background ,kiriko-bg-1 :weight bold))))
;;;;; git-annex
   '(git-annex-dired-annexed-available ((t (:inherit success :weight normal))))
   '(git-annex-dired-annexed-unavailable ((t (:inherit error :weight normal))))
;;;;; git-commit
   `(git-commit-comment-action  ((,class (:foreground ,kiriko-green+1 :weight bold))))
   `(git-commit-comment-branch  ((,class (:foreground ,kiriko-blue+1  :weight bold))))
   `(git-commit-comment-heading ((,class (:foreground ,kiriko-yellow  :weight bold))))
;;;;; git-gutter
   `(git-gutter:added ((t (:foreground ,kiriko-green :weight bold :inverse-video t))))
   `(git-gutter:deleted ((t (:foreground ,kiriko-red :weight bold :inverse-video t))))
   `(git-gutter:modified ((t (:foreground ,kiriko-magenta :weight bold :inverse-video t))))
   `(git-gutter:unchanged ((t (:foreground ,kiriko-fg :weight bold :inverse-video t))))
;;;;; git-gutter-fr
   `(git-gutter-fr:added ((t (:foreground ,kiriko-green  :weight bold))))
   `(git-gutter-fr:deleted ((t (:foreground ,kiriko-red :weight bold))))
   `(git-gutter-fr:modified ((t (:foreground ,kiriko-magenta :weight bold))))
;;;;; git-rebase
   `(git-rebase-hash ((t (:foreground, kiriko-orange))))
;;;;; gnus
   `(gnus-group-mail-1 ((t (:weight bold :inherit gnus-group-mail-1-empty))))
   `(gnus-group-mail-1-empty ((t (:inherit gnus-group-news-1-empty))))
   `(gnus-group-mail-2 ((t (:weight bold :inherit gnus-group-mail-2-empty))))
   `(gnus-group-mail-2-empty ((t (:inherit gnus-group-news-2-empty))))
   `(gnus-group-mail-3 ((t (:weight bold :inherit gnus-group-mail-3-empty))))
   `(gnus-group-mail-3-empty ((t (:inherit gnus-group-news-3-empty))))
   `(gnus-group-mail-4 ((t (:weight bold :inherit gnus-group-mail-4-empty))))
   `(gnus-group-mail-4-empty ((t (:inherit gnus-group-news-4-empty))))
   `(gnus-group-mail-5 ((t (:weight bold :inherit gnus-group-mail-5-empty))))
   `(gnus-group-mail-5-empty ((t (:inherit gnus-group-news-5-empty))))
   `(gnus-group-mail-6 ((t (:weight bold :inherit gnus-group-mail-6-empty))))
   `(gnus-group-mail-6-empty ((t (:inherit gnus-group-news-6-empty))))
   `(gnus-group-mail-low ((t (:weight bold :inherit gnus-group-mail-low-empty))))
   `(gnus-group-mail-low-empty ((t (:inherit gnus-group-news-low-empty))))
   `(gnus-group-news-1 ((t (:weight bold :inherit gnus-group-news-1-empty))))
   `(gnus-group-news-2 ((t (:weight bold :inherit gnus-group-news-2-empty))))
   `(gnus-group-news-3 ((t (:weight bold :inherit gnus-group-news-3-empty))))
   `(gnus-group-news-4 ((t (:weight bold :inherit gnus-group-news-4-empty))))
   `(gnus-group-news-5 ((t (:weight bold :inherit gnus-group-news-5-empty))))
   `(gnus-group-news-6 ((t (:weight bold :inherit gnus-group-news-6-empty))))
   `(gnus-group-news-low ((t (:weight bold :inherit gnus-group-news-low-empty))))
   `(gnus-header-content ((t (:inherit message-header-other))))
   `(gnus-header-from ((t (:inherit message-header-to))))
   `(gnus-header-name ((t (:inherit message-header-name))))
   `(gnus-header-newsgroups ((t (:inherit message-header-other))))
   `(gnus-header-subject ((t (:inherit message-header-subject))))
   `(gnus-server-opened ((t (:foreground ,kiriko-green+2 :weight bold))))
   `(gnus-server-denied ((t (:foreground ,kiriko-red+1 :weight bold))))
   `(gnus-server-closed ((t (:foreground ,kiriko-blue :slant italic))))
   `(gnus-server-offline ((t (:foreground ,kiriko-yellow :weight bold))))
   `(gnus-server-agent ((t (:foreground ,kiriko-blue :weight bold))))
   `(gnus-summary-cancelled ((t (:foreground ,kiriko-orange))))
   `(gnus-summary-high-ancient ((t (:foreground ,kiriko-blue))))
   `(gnus-summary-high-read ((t (:foreground ,kiriko-green :weight bold))))
   `(gnus-summary-high-ticked ((t (:foreground ,kiriko-orange :weight bold))))
   `(gnus-summary-high-unread ((t (:foreground ,kiriko-fg :weight bold))))
   `(gnus-summary-low-ancient ((t (:foreground ,kiriko-blue))))
   `(gnus-summary-low-read ((t (:foreground ,kiriko-green))))
   `(gnus-summary-low-ticked ((t (:foreground ,kiriko-orange :weight bold))))
   `(gnus-summary-low-unread ((t (:foreground ,kiriko-fg))))
   `(gnus-summary-normal-ancient ((t (:foreground ,kiriko-blue))))
   `(gnus-summary-normal-read ((t (:foreground ,kiriko-green))))
   `(gnus-summary-normal-ticked ((t (:foreground ,kiriko-orange :weight bold))))
   `(gnus-summary-normal-unread ((t (:foreground ,kiriko-fg))))
   `(gnus-summary-selected ((t (:foreground ,kiriko-yellow :weight bold))))
   `(gnus-cite-1 ((t (:foreground ,kiriko-blue))))
   `(gnus-cite-10 ((t (:foreground ,kiriko-yellow-1))))
   `(gnus-cite-11 ((t (:foreground ,kiriko-yellow))))
   `(gnus-cite-2 ((t (:foreground ,kiriko-blue-1))))
   `(gnus-cite-3 ((t (:foreground ,kiriko-blue-2))))
   `(gnus-cite-4 ((t (:foreground ,kiriko-green+2))))
   `(gnus-cite-5 ((t (:foreground ,kiriko-green+1))))
   `(gnus-cite-6 ((t (:foreground ,kiriko-green))))
   `(gnus-cite-7 ((t (:foreground ,kiriko-red))))
   `(gnus-cite-8 ((t (:foreground ,kiriko-red-1))))
   `(gnus-cite-9 ((t (:foreground ,kiriko-red-2))))
   `(gnus-group-news-1-empty ((t (:foreground ,kiriko-yellow))))
   `(gnus-group-news-2-empty ((t (:foreground ,kiriko-green+3))))
   `(gnus-group-news-3-empty ((t (:foreground ,kiriko-green+1))))
   `(gnus-group-news-4-empty ((t (:foreground ,kiriko-blue-2))))
   `(gnus-group-news-5-empty ((t (:foreground ,kiriko-blue-3))))
   `(gnus-group-news-6-empty ((t (:foreground ,kiriko-bg+2))))
   `(gnus-group-news-low-empty ((t (:foreground ,kiriko-bg+2))))
   `(gnus-signature ((t (:foreground ,kiriko-yellow))))
   `(gnus-x ((t (:background ,kiriko-fg :foreground ,kiriko-bg))))
   `(mm-uu-extract ((t (:background ,kiriko-bg-05 :foreground ,kiriko-green+1))))
;;;;; go-guru
   `(go-guru-hl-identifier-face ((t (:foreground ,kiriko-bg-1 :background ,kiriko-green+1))))
;;;;; guide-key
   `(guide-key/highlight-command-face ((t (:foreground ,kiriko-blue))))
   `(guide-key/key-face ((t (:foreground ,kiriko-green))))
   `(guide-key/prefix-command-face ((t (:foreground ,kiriko-green+1))))
;;;;; hackernews
   '(hackernews-comment-count-face ((t (:inherit link-visited :underline nil))))
   '(hackernews-link-face          ((t (:inherit link         :underline nil))))
;;;;; helm
   `(helm-header
     ((t (:foreground ,kiriko-green
                      :background ,kiriko-bg
                      :underline nil
                      :box nil))))
   `(helm-source-header
     ((t (:foreground ,kiriko-yellow
                      :background ,kiriko-bg-1
                      :underline nil
                      :weight bold
                      :box (:line-width -1 :style released-button)))))
   `(helm-selection ((t (:background ,kiriko-bg+1 :underline nil))))
   `(helm-selection-line ((t (:background ,kiriko-bg+1))))
   `(helm-visible-mark ((t (:foreground ,kiriko-bg :background ,kiriko-yellow-2))))
   `(helm-candidate-number ((t (:foreground ,kiriko-green+4 :background ,kiriko-bg-1))))
   `(helm-separator ((t (:foreground ,kiriko-red :background ,kiriko-bg))))
   `(helm-time-zone-current ((t (:foreground ,kiriko-green+2 :background ,kiriko-bg))))
   `(helm-time-zone-home ((t (:foreground ,kiriko-red :background ,kiriko-bg))))
   `(helm-bookmark-addressbook ((t (:foreground ,kiriko-orange :background ,kiriko-bg))))
   `(helm-bookmark-directory ((t (:foreground nil :background nil :inherit helm-ff-directory))))
   `(helm-bookmark-file ((t (:foreground nil :background nil :inherit helm-ff-file))))
   `(helm-bookmark-gnus ((t (:foreground ,kiriko-magenta :background ,kiriko-bg))))
   `(helm-bookmark-info ((t (:foreground ,kiriko-green+2 :background ,kiriko-bg))))
   `(helm-bookmark-man ((t (:foreground ,kiriko-yellow :background ,kiriko-bg))))
   `(helm-bookmark-w3m ((t (:foreground ,kiriko-magenta :background ,kiriko-bg))))
   `(helm-buffer-not-saved ((t (:foreground ,kiriko-red :background ,kiriko-bg))))
   `(helm-buffer-process ((t (:foreground ,kiriko-cyan :background ,kiriko-bg))))
   `(helm-buffer-saved-out ((t (:foreground ,kiriko-fg :background ,kiriko-bg))))
   `(helm-buffer-size ((t (:foreground ,kiriko-fg-1 :background ,kiriko-bg))))
   `(helm-ff-directory ((t (:foreground ,kiriko-cyan :background ,kiriko-bg :weight bold))))
   `(helm-ff-file ((t (:foreground ,kiriko-fg :background ,kiriko-bg :weight normal))))
   `(helm-ff-executable ((t (:foreground ,kiriko-green+2 :background ,kiriko-bg :weight normal))))
   `(helm-ff-invalid-symlink ((t (:foreground ,kiriko-red :background ,kiriko-bg :weight bold))))
   `(helm-ff-symlink ((t (:foreground ,kiriko-yellow :background ,kiriko-bg :weight bold))))
   `(helm-ff-prefix ((t (:foreground ,kiriko-bg :background ,kiriko-yellow :weight normal))))
   `(helm-grep-cmd-line ((t (:foreground ,kiriko-cyan :background ,kiriko-bg))))
   `(helm-grep-file ((t (:foreground ,kiriko-fg :background ,kiriko-bg))))
   `(helm-grep-finish ((t (:foreground ,kiriko-green+2 :background ,kiriko-bg))))
   `(helm-grep-lineno ((t (:foreground ,kiriko-fg-1 :background ,kiriko-bg))))
   `(helm-grep-match ((t (:foreground nil :background nil :inherit helm-match))))
   `(helm-grep-running ((t (:foreground ,kiriko-red :background ,kiriko-bg))))
   `(helm-match ((t (:foreground ,kiriko-orange :background ,kiriko-bg-1 :weight bold))))
   `(helm-moccur-buffer ((t (:foreground ,kiriko-cyan :background ,kiriko-bg))))
   `(helm-mu-contacts-address-face ((t (:foreground ,kiriko-fg-1 :background ,kiriko-bg))))
   `(helm-mu-contacts-name-face ((t (:foreground ,kiriko-fg :background ,kiriko-bg))))
;;;;; helm-swoop
   `(helm-swoop-target-line-face ((t (:foreground ,kiriko-fg :background ,kiriko-bg+1))))
   `(helm-swoop-target-word-face ((t (:foreground ,kiriko-yellow :background ,kiriko-bg+2 :weight bold))))
;;;;; hl-line-mode
   `(hl-line-face ((,class (:background ,kiriko-bg-05))
                   (t :weight bold)))
   `(hl-line ((,class (:background ,kiriko-bg-05)) ; old emacsen
              (t :weight bold)))
;;;;; hl-sexp
   `(hl-sexp-face ((,class (:background ,kiriko-bg+1))
                   (t :weight bold)))
;;;;; hydra
   `(hydra-face-red ((t (:foreground ,kiriko-red-1 :background ,kiriko-bg))))
   `(hydra-face-amaranth ((t (:foreground ,kiriko-red-3 :background ,kiriko-bg))))
   `(hydra-face-blue ((t (:foreground ,kiriko-blue :background ,kiriko-bg))))
   `(hydra-face-pink ((t (:foreground ,kiriko-magenta :background ,kiriko-bg))))
   `(hydra-face-teal ((t (:foreground ,kiriko-cyan :background ,kiriko-bg))))
;;;;; info+
   `(info-command-ref-item ((t (:background ,kiriko-bg-1 :foreground ,kiriko-orange))))
   `(info-constant-ref-item ((t (:background ,kiriko-bg-1 :foreground ,kiriko-magenta))))
   `(info-double-quoted-name ((t (:inherit font-lock-comment-face))))
   `(info-file ((t (:background ,kiriko-bg-1 :foreground ,kiriko-yellow))))
   `(info-function-ref-item ((t (:background ,kiriko-bg-1 :inherit font-lock-function-name-face))))
   `(info-macro-ref-item ((t (:background ,kiriko-bg-1 :foreground ,kiriko-yellow))))
   `(info-menu ((t (:foreground ,kiriko-yellow))))
   `(info-quoted-name ((t (:inherit font-lock-constant-face))))
   `(info-reference-item ((t (:background ,kiriko-bg-1))))
   `(info-single-quote ((t (:inherit font-lock-keyword-face))))
   `(info-special-form-ref-item ((t (:background ,kiriko-bg-1 :foreground ,kiriko-yellow))))
   `(info-string ((t (:inherit font-lock-string-face))))
   `(info-syntax-class-item ((t (:background ,kiriko-bg-1 :foreground ,kiriko-blue+1))))
   `(info-user-option-ref-item ((t (:background ,kiriko-bg-1 :foreground ,kiriko-red))))
   `(info-variable-ref-item ((t (:background ,kiriko-bg-1 :foreground ,kiriko-orange))))
;;;;; irfc
   `(irfc-head-name-face ((t (:foreground ,kiriko-red :weight bold))))
   `(irfc-head-number-face ((t (:foreground ,kiriko-red :weight bold))))
   `(irfc-reference-face ((t (:foreground ,kiriko-blue-1 :weight bold))))
   `(irfc-requirement-keyword-face ((t (:inherit font-lock-keyword-face))))
   `(irfc-rfc-link-face ((t (:inherit link))))
   `(irfc-rfc-number-face ((t (:foreground ,kiriko-cyan :weight bold))))
   `(irfc-std-number-face ((t (:foreground ,kiriko-green+4 :weight bold))))
   `(irfc-table-item-face ((t (:foreground ,kiriko-green+3))))
   `(irfc-title-face ((t (:foreground ,kiriko-yellow
                                      :underline t :weight bold))))
;;;;; ivy
   `(ivy-confirm-face ((t (:foreground ,kiriko-green :background ,kiriko-bg))))
   `(ivy-current-match ((t (:foreground ,kiriko-yellow :weight bold :underline t))))
   `(ivy-cursor ((t (:foreground ,kiriko-bg :background ,kiriko-fg))))
   `(ivy-match-required-face ((t (:foreground ,kiriko-red :background ,kiriko-bg))))
   `(ivy-minibuffer-match-face-1 ((t (:background ,kiriko-bg+1))))
   `(ivy-minibuffer-match-face-2 ((t (:background ,kiriko-green-1))))
   `(ivy-minibuffer-match-face-3 ((t (:background ,kiriko-green))))
   `(ivy-minibuffer-match-face-4 ((t (:background ,kiriko-green+1))))
   `(ivy-remote ((t (:foreground ,kiriko-blue :background ,kiriko-bg))))
   `(ivy-subdir ((t (:foreground ,kiriko-yellow :background ,kiriko-bg))))
;;;;; ido-mode
   `(ido-first-match ((t (:foreground ,kiriko-yellow :weight bold))))
   `(ido-only-match ((t (:foreground ,kiriko-orange :weight bold))))
   `(ido-subdir ((t (:foreground ,kiriko-yellow))))
   `(ido-indicator ((t (:foreground ,kiriko-yellow :background ,kiriko-red-4))))
;;;;; iedit-mode
   `(iedit-occurrence ((t (:background ,kiriko-bg+2 :weight bold))))
;;;;; jabber-mode
   `(jabber-roster-user-away ((t (:foreground ,kiriko-green+2))))
   `(jabber-roster-user-online ((t (:foreground ,kiriko-blue-1))))
   `(jabber-roster-user-dnd ((t (:foreground ,kiriko-red+1))))
   `(jabber-roster-user-xa ((t (:foreground ,kiriko-magenta))))
   `(jabber-roster-user-chatty ((t (:foreground ,kiriko-orange))))
   `(jabber-roster-user-error ((t (:foreground ,kiriko-red+1))))
   `(jabber-rare-time-face ((t (:foreground ,kiriko-green+1))))
   `(jabber-chat-prompt-local ((t (:foreground ,kiriko-blue-1))))
   `(jabber-chat-prompt-foreign ((t (:foreground ,kiriko-red+1))))
   `(jabber-chat-prompt-system ((t (:foreground ,kiriko-green+3))))
   `(jabber-activity-face((t (:foreground ,kiriko-red+1))))
   `(jabber-activity-personal-face ((t (:foreground ,kiriko-blue+1))))
   `(jabber-title-small ((t (:height 1.1 :weight bold))))
   `(jabber-title-medium ((t (:height 1.2 :weight bold))))
   `(jabber-title-large ((t (:height 1.3 :weight bold))))
;;;;; js2-mode
   `(js2-warning ((t (:underline ,kiriko-orange))))
   `(js2-error ((t (:foreground ,kiriko-red :weight bold))))
   `(js2-jsdoc-tag ((t (:foreground ,kiriko-green-1))))
   `(js2-jsdoc-type ((t (:foreground ,kiriko-green+2))))
   `(js2-jsdoc-value ((t (:foreground ,kiriko-green+3))))
   `(js2-function-param ((t (:foreground, kiriko-orange))))
   `(js2-external-variable ((t (:foreground ,kiriko-orange))))
;;;;; additional js2 mode attributes for better syntax highlighting
   `(js2-instance-member ((t (:foreground ,kiriko-green-1))))
   `(js2-jsdoc-html-tag-delimiter ((t (:foreground ,kiriko-orange))))
   `(js2-jsdoc-html-tag-name ((t (:foreground ,kiriko-red-1))))
   `(js2-object-property ((t (:foreground ,kiriko-blue+1))))
   `(js2-magic-paren ((t (:foreground ,kiriko-blue-5))))
   `(js2-private-function-call ((t (:foreground ,kiriko-cyan))))
   `(js2-function-call ((t (:foreground ,kiriko-cyan))))
   `(js2-private-member ((t (:foreground ,kiriko-blue-1))))
   `(js2-keywords ((t (:foreground ,kiriko-magenta))))
;;;;; ledger-mode
   `(ledger-font-payee-uncleared-face ((t (:foreground ,kiriko-red-1 :weight bold))))
   `(ledger-font-payee-cleared-face ((t (:foreground ,kiriko-fg :weight normal))))
   `(ledger-font-payee-pending-face ((t (:foreground ,kiriko-red :weight normal))))
   `(ledger-font-xact-highlight-face ((t (:background ,kiriko-bg+1))))
   `(ledger-font-auto-xact-face ((t (:foreground ,kiriko-yellow-1 :weight normal))))
   `(ledger-font-periodic-xact-face ((t (:foreground ,kiriko-green :weight normal))))
   `(ledger-font-pending-face ((t (:foreground ,kiriko-orange weight: normal))))
   `(ledger-font-other-face ((t (:foreground ,kiriko-fg))))
   `(ledger-font-posting-date-face ((t (:foreground ,kiriko-orange :weight normal))))
   `(ledger-font-posting-account-face ((t (:foreground ,kiriko-blue-1))))
   `(ledger-font-posting-account-cleared-face ((t (:foreground ,kiriko-fg))))
   `(ledger-font-posting-account-pending-face ((t (:foreground ,kiriko-orange))))
   `(ledger-font-posting-amount-face ((t (:foreground ,kiriko-orange))))
   `(ledger-occur-narrowed-face ((t (:foreground ,kiriko-fg-1 :invisible t))))
   `(ledger-occur-xact-face ((t (:background ,kiriko-bg+1))))
   `(ledger-font-comment-face ((t (:foreground ,kiriko-green))))
   `(ledger-font-reconciler-uncleared-face ((t (:foreground ,kiriko-red-1 :weight bold))))
   `(ledger-font-reconciler-cleared-face ((t (:foreground ,kiriko-fg :weight normal))))
   `(ledger-font-reconciler-pending-face ((t (:foreground ,kiriko-orange :weight normal))))
   `(ledger-font-report-clickable-face ((t (:foreground ,kiriko-orange :weight normal))))
;;;;; linum-mode
   `(linum ((t (:foreground ,kiriko-green+2 :background ,kiriko-bg))))
;;;;; lispy
   `(lispy-command-name-face ((t (:background ,kiriko-bg-05 :inherit font-lock-function-name-face))))
   `(lispy-cursor-face ((t (:foreground ,kiriko-bg :background ,kiriko-fg))))
   `(lispy-face-hint ((t (:inherit highlight :foreground ,kiriko-yellow))))
;;;;; ruler-mode
   `(ruler-mode-column-number ((t (:inherit 'ruler-mode-default :foreground ,kiriko-fg))))
   `(ruler-mode-fill-column ((t (:inherit 'ruler-mode-default :foreground ,kiriko-yellow))))
   `(ruler-mode-goal-column ((t (:inherit 'ruler-mode-fill-column))))
   `(ruler-mode-comment-column ((t (:inherit 'ruler-mode-fill-column))))
   `(ruler-mode-tab-stop ((t (:inherit 'ruler-mode-fill-column))))
   `(ruler-mode-current-column ((t (:foreground ,kiriko-yellow :box t))))
   `(ruler-mode-default ((t (:foreground ,kiriko-green+2 :background ,kiriko-bg))))

;;;;; lui
   `(lui-time-stamp-face ((t (:foreground ,kiriko-blue-1))))
   `(lui-hilight-face ((t (:foreground ,kiriko-green+2 :background ,kiriko-bg))))
   `(lui-button-face ((t (:inherit hover-highlight))))
;;;;; macrostep
   `(macrostep-gensym-1
     ((t (:foreground ,kiriko-green+2 :background ,kiriko-bg-1))))
   `(macrostep-gensym-2
     ((t (:foreground ,kiriko-red+1 :background ,kiriko-bg-1))))
   `(macrostep-gensym-3
     ((t (:foreground ,kiriko-blue+1 :background ,kiriko-bg-1))))
   `(macrostep-gensym-4
     ((t (:foreground ,kiriko-magenta :background ,kiriko-bg-1))))
   `(macrostep-gensym-5
     ((t (:foreground ,kiriko-yellow :background ,kiriko-bg-1))))
   `(macrostep-expansion-highlight-face
     ((t (:inherit highlight))))
   `(macrostep-macro-face
     ((t (:underline t))))
;;;;; magit
;;;;;; headings and diffs
   `(magit-section-highlight           ((t (:background ,kiriko-bg+05))))
   `(magit-section-heading             ((t (:foreground ,kiriko-yellow :weight bold))))
   `(magit-section-heading-selection   ((t (:foreground ,kiriko-orange :weight bold))))
   `(magit-diff-file-heading           ((t (:weight bold))))
   `(magit-diff-file-heading-highlight ((t (:background ,kiriko-bg+05  :weight bold))))
   `(magit-diff-file-heading-selection ((t (:background ,kiriko-bg+05
                                                        :foreground ,kiriko-orange :weight bold))))
   `(magit-diff-hunk-heading           ((t (:background ,kiriko-bg+1))))
   `(magit-diff-hunk-heading-highlight ((t (:background ,kiriko-bg+2))))
   `(magit-diff-hunk-heading-selection ((t (:background ,kiriko-bg+2
                                                        :foreground ,kiriko-orange))))
   `(magit-diff-lines-heading          ((t (:background ,kiriko-orange
                                                        :foreground ,kiriko-bg+2))))
   `(magit-diff-context-highlight      ((t (:background ,kiriko-bg+05
                                                        :foreground "grey70"))))
   `(magit-diffstat-added   ((t (:foreground ,kiriko-green+4))))
   `(magit-diffstat-removed ((t (:foreground ,kiriko-red))))
;;;;;; popup
   `(magit-popup-heading             ((t (:foreground ,kiriko-yellow  :weight bold))))
   `(magit-popup-key                 ((t (:foreground ,kiriko-green-1 :weight bold))))
   `(magit-popup-argument            ((t (:foreground ,kiriko-green   :weight bold))))
   `(magit-popup-disabled-argument   ((t (:foreground ,kiriko-fg-1    :weight normal))))
   `(magit-popup-option-value        ((t (:foreground ,kiriko-blue-2  :weight bold))))
;;;;;; process
   `(magit-process-ok    ((t (:foreground ,kiriko-green  :weight bold))))
   `(magit-process-ng    ((t (:foreground ,kiriko-red    :weight bold))))
;;;;;; log
   `(magit-log-author    ((t (:foreground ,kiriko-orange))))
   `(magit-log-date      ((t (:foreground ,kiriko-fg-1))))
   `(magit-log-graph     ((t (:foreground ,kiriko-fg+1))))
;;;;;; sequence
   `(magit-sequence-pick ((t (:foreground ,kiriko-yellow-2))))
   `(magit-sequence-stop ((t (:foreground ,kiriko-green))))
   `(magit-sequence-part ((t (:foreground ,kiriko-yellow))))
   `(magit-sequence-head ((t (:foreground ,kiriko-blue))))
   `(magit-sequence-drop ((t (:foreground ,kiriko-red))))
   `(magit-sequence-done ((t (:foreground ,kiriko-fg-1))))
   `(magit-sequence-onto ((t (:foreground ,kiriko-fg-1))))
;;;;;; bisect
   `(magit-bisect-good ((t (:foreground ,kiriko-green))))
   `(magit-bisect-skip ((t (:foreground ,kiriko-yellow))))
   `(magit-bisect-bad  ((t (:foreground ,kiriko-red))))
;;;;;; blame
   `(magit-blame-heading ((t (:background ,kiriko-bg-1 :foreground ,kiriko-blue-2))))
   `(magit-blame-hash    ((t (:background ,kiriko-bg-1 :foreground ,kiriko-blue-2))))
   `(magit-blame-name    ((t (:background ,kiriko-bg-1 :foreground ,kiriko-orange))))
   `(magit-blame-date    ((t (:background ,kiriko-bg-1 :foreground ,kiriko-orange))))
   `(magit-blame-summary ((t (:background ,kiriko-bg-1 :foreground ,kiriko-blue-2
                                          :weight bold))))
;;;;;; references etc
   `(magit-dimmed         ((t (:foreground ,kiriko-bg+3))))
   `(magit-hash           ((t (:foreground ,kiriko-bg+3))))
   `(magit-tag            ((t (:foreground ,kiriko-orange :weight bold))))
   `(magit-branch-remote  ((t (:foreground ,kiriko-green  :weight bold))))
   `(magit-branch-local   ((t (:foreground ,kiriko-blue   :weight bold))))
   `(magit-branch-current ((t (:foreground ,kiriko-blue   :weight bold :box t))))
   `(magit-head           ((t (:foreground ,kiriko-blue   :weight bold))))
   `(magit-refname        ((t (:background ,kiriko-bg+2 :foreground ,kiriko-fg :weight bold))))
   `(magit-refname-stash  ((t (:background ,kiriko-bg+2 :foreground ,kiriko-fg :weight bold))))
   `(magit-refname-wip    ((t (:background ,kiriko-bg+2 :foreground ,kiriko-fg :weight bold))))
   `(magit-signature-good      ((t (:foreground ,kiriko-green))))
   `(magit-signature-bad       ((t (:foreground ,kiriko-red))))
   `(magit-signature-untrusted ((t (:foreground ,kiriko-yellow))))
   `(magit-cherry-unmatched    ((t (:foreground ,kiriko-cyan))))
   `(magit-cherry-equivalent   ((t (:foreground ,kiriko-magenta))))
   `(magit-reflog-commit       ((t (:foreground ,kiriko-green))))
   `(magit-reflog-amend        ((t (:foreground ,kiriko-magenta))))
   `(magit-reflog-merge        ((t (:foreground ,kiriko-green))))
   `(magit-reflog-checkout     ((t (:foreground ,kiriko-blue))))
   `(magit-reflog-reset        ((t (:foreground ,kiriko-red))))
   `(magit-reflog-rebase       ((t (:foreground ,kiriko-magenta))))
   `(magit-reflog-cherry-pick  ((t (:foreground ,kiriko-green))))
   `(magit-reflog-remote       ((t (:foreground ,kiriko-cyan))))
   `(magit-reflog-other        ((t (:foreground ,kiriko-cyan))))
;;;;; message-mode
   `(message-cited-text ((t (:inherit font-lock-comment-face))))
   `(message-header-name ((t (:foreground ,kiriko-green+1))))
   `(message-header-other ((t (:foreground ,kiriko-green))))
   `(message-header-to ((t (:foreground ,kiriko-yellow :weight bold))))
   `(message-header-cc ((t (:foreground ,kiriko-yellow :weight bold))))
   `(message-header-newsgroups ((t (:foreground ,kiriko-yellow :weight bold))))
   `(message-header-subject ((t (:foreground ,kiriko-orange :weight bold))))
   `(message-header-xheader ((t (:foreground ,kiriko-green))))
   `(message-mml ((t (:foreground ,kiriko-yellow :weight bold))))
   `(message-separator ((t (:inherit font-lock-comment-face))))
;;;;; mew
   `(mew-face-header-subject ((t (:foreground ,kiriko-orange))))
   `(mew-face-header-from ((t (:foreground ,kiriko-yellow))))
   `(mew-face-header-date ((t (:foreground ,kiriko-green))))
   `(mew-face-header-to ((t (:foreground ,kiriko-red))))
   `(mew-face-header-key ((t (:foreground ,kiriko-green))))
   `(mew-face-header-private ((t (:foreground ,kiriko-green))))
   `(mew-face-header-important ((t (:foreground ,kiriko-blue))))
   `(mew-face-header-marginal ((t (:foreground ,kiriko-fg :weight bold))))
   `(mew-face-header-warning ((t (:foreground ,kiriko-red))))
   `(mew-face-header-xmew ((t (:foreground ,kiriko-green))))
   `(mew-face-header-xmew-bad ((t (:foreground ,kiriko-red))))
   `(mew-face-body-url ((t (:foreground ,kiriko-orange))))
   `(mew-face-body-comment ((t (:foreground ,kiriko-fg :slant italic))))
   `(mew-face-body-cite1 ((t (:foreground ,kiriko-green))))
   `(mew-face-body-cite2 ((t (:foreground ,kiriko-blue))))
   `(mew-face-body-cite3 ((t (:foreground ,kiriko-orange))))
   `(mew-face-body-cite4 ((t (:foreground ,kiriko-yellow))))
   `(mew-face-body-cite5 ((t (:foreground ,kiriko-red))))
   `(mew-face-mark-review ((t (:foreground ,kiriko-blue))))
   `(mew-face-mark-escape ((t (:foreground ,kiriko-green))))
   `(mew-face-mark-delete ((t (:foreground ,kiriko-red))))
   `(mew-face-mark-unlink ((t (:foreground ,kiriko-yellow))))
   `(mew-face-mark-refile ((t (:foreground ,kiriko-green))))
   `(mew-face-mark-unread ((t (:foreground ,kiriko-red-2))))
   `(mew-face-eof-message ((t (:foreground ,kiriko-green))))
   `(mew-face-eof-part ((t (:foreground ,kiriko-yellow))))
;;;;; mic-paren
   `(paren-face-match ((t (:foreground ,kiriko-cyan :background ,kiriko-bg :weight bold))))
   `(paren-face-mismatch ((t (:foreground ,kiriko-bg :background ,kiriko-magenta :weight bold))))
   `(paren-face-no-match ((t (:foreground ,kiriko-bg :background ,kiriko-red :weight bold))))
;;;;; mingus
   `(mingus-directory-face ((t (:foreground ,kiriko-blue))))
   `(mingus-pausing-face ((t (:foreground ,kiriko-magenta))))
   `(mingus-playing-face ((t (:foreground ,kiriko-cyan))))
   `(mingus-playlist-face ((t (:foreground ,kiriko-cyan ))))
   `(mingus-mark-face ((t (:bold t :foreground ,kiriko-magenta))))
   `(mingus-song-file-face ((t (:foreground ,kiriko-yellow))))
   `(mingus-artist-face ((t (:foreground ,kiriko-cyan))))
   `(mingus-album-face ((t (:underline t :foreground ,kiriko-red+1))))
   `(mingus-album-stale-face ((t (:foreground ,kiriko-red+1))))
   `(mingus-stopped-face ((t (:foreground ,kiriko-red))))
;;;;; nav
   `(nav-face-heading ((t (:foreground ,kiriko-yellow))))
   `(nav-face-button-num ((t (:foreground ,kiriko-cyan))))
   `(nav-face-dir ((t (:foreground ,kiriko-green))))
   `(nav-face-hdir ((t (:foreground ,kiriko-red))))
   `(nav-face-file ((t (:foreground ,kiriko-fg))))
   `(nav-face-hfile ((t (:foreground ,kiriko-red-4))))
;;;;; merlin
   `(merlin-type-face ((t (:inherit highlight))))
   `(merlin-compilation-warning-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,kiriko-orange)))
      (t
       (:underline ,kiriko-orange))))
   `(merlin-compilation-error-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,kiriko-red)))
      (t
       (:underline ,kiriko-red))))
;;;;; mu4e
   `(mu4e-cited-1-face ((t (:foreground ,kiriko-blue    :slant italic))))
   `(mu4e-cited-2-face ((t (:foreground ,kiriko-green+2 :slant italic))))
   `(mu4e-cited-3-face ((t (:foreground ,kiriko-blue-2  :slant italic))))
   `(mu4e-cited-4-face ((t (:foreground ,kiriko-green   :slant italic))))
   `(mu4e-cited-5-face ((t (:foreground ,kiriko-blue-4  :slant italic))))
   `(mu4e-cited-6-face ((t (:foreground ,kiriko-green-1 :slant italic))))
   `(mu4e-cited-7-face ((t (:foreground ,kiriko-blue    :slant italic))))
   `(mu4e-replied-face ((t (:foreground ,kiriko-bg+3))))
   `(mu4e-trashed-face ((t (:foreground ,kiriko-bg+3 :strike-through t))))
;;;;; mumamo
   `(mumamo-background-chunk-major ((t (:background nil))))
   `(mumamo-background-chunk-submode1 ((t (:background ,kiriko-bg-1))))
   `(mumamo-background-chunk-submode2 ((t (:background ,kiriko-bg+2))))
   `(mumamo-background-chunk-submode3 ((t (:background ,kiriko-bg+3))))
   `(mumamo-background-chunk-submode4 ((t (:background ,kiriko-bg+1))))
;;;;; neotree
   `(neo-banner-face ((t (:foreground ,kiriko-blue+1 :weight bold))))
   `(neo-header-face ((t (:foreground ,kiriko-fg))))
   `(neo-root-dir-face ((t (:foreground ,kiriko-blue+1 :weight bold))))
   `(neo-dir-link-face ((t (:foreground ,kiriko-blue))))
   `(neo-file-link-face ((t (:foreground ,kiriko-fg))))
   `(neo-expand-btn-face ((t (:foreground ,kiriko-blue))))
   `(neo-vc-default-face ((t (:foreground ,kiriko-fg+1))))
   `(neo-vc-user-face ((t (:foreground ,kiriko-red :slant italic))))
   `(neo-vc-up-to-date-face ((t (:foreground ,kiriko-fg))))
   `(neo-vc-edited-face ((t (:foreground ,kiriko-magenta))))
   `(neo-vc-needs-merge-face ((t (:foreground ,kiriko-red+1))))
   `(neo-vc-unlocked-changes-face ((t (:foreground ,kiriko-red :background ,kiriko-blue-5))))
   `(neo-vc-added-face ((t (:foreground ,kiriko-green+1))))
   `(neo-vc-conflict-face ((t (:foreground ,kiriko-red+1))))
   `(neo-vc-missing-face ((t (:foreground ,kiriko-red+1))))
   `(neo-vc-ignored-face ((t (:foreground ,kiriko-fg-1))))
;;;;; org-mode
   `(org-agenda-date-today
     ((t (:foreground ,kiriko-fg+1 :slant italic :weight bold))) t)
   `(org-agenda-structure
     ((t (:inherit font-lock-comment-face))))
   `(org-archived ((t (:foreground ,kiriko-fg :weight bold))))
   `(org-checkbox ((t (:background ,kiriko-bg+2 :foreground ,kiriko-fg+1
                                   :box (:line-width 1 :style released-button)))))
   `(org-date ((t (:foreground ,kiriko-blue :underline t))))
   `(org-deadline-announce ((t (:foreground ,kiriko-red-1))))
   `(org-done ((t (:weight bold :weight bold :foreground ,kiriko-green+3))))
   `(org-formula ((t (:foreground ,kiriko-yellow-2))))
   `(org-headline-done ((t (:foreground ,kiriko-green+3))))
   `(org-hide ((t (:foreground ,kiriko-bg-1))))
   `(org-level-1 ((t (:foreground ,kiriko-orange))))
   `(org-level-2 ((t (:foreground ,kiriko-green+4))))
   `(org-level-3 ((t (:foreground ,kiriko-blue-1))))
   `(org-level-4 ((t (:foreground ,kiriko-yellow-2))))
   `(org-level-5 ((t (:foreground ,kiriko-cyan))))
   `(org-level-6 ((t (:foreground ,kiriko-green+2))))
   `(org-level-7 ((t (:foreground ,kiriko-red-4))))
   `(org-level-8 ((t (:foreground ,kiriko-blue-4))))
   `(org-link ((t (:foreground ,kiriko-yellow-2 :underline t))))
   `(org-scheduled ((t (:foreground ,kiriko-green+4))))
   `(org-scheduled-previously ((t (:foreground ,kiriko-red))))
   `(org-scheduled-today ((t (:foreground ,kiriko-blue+1))))
   `(org-sexp-date ((t (:foreground ,kiriko-blue+1 :underline t))))
   `(org-special-keyword ((t (:inherit font-lock-comment-face))))
   `(org-table ((t (:foreground ,kiriko-green+2))))
   `(org-tag ((t (:weight bold :weight bold))))
   `(org-time-grid ((t (:foreground ,kiriko-orange))))
   `(org-todo ((t (:weight bold :foreground ,kiriko-red :weight bold))))
   `(org-upcoming-deadline ((t (:inherit font-lock-keyword-face))))
   `(org-warning ((t (:weight bold :foreground ,kiriko-red :weight bold :underline nil))))
   `(org-column ((t (:background ,kiriko-bg-1))))
   `(org-column-title ((t (:background ,kiriko-bg-1 :underline t :weight bold))))
   `(org-mode-line-clock ((t (:foreground ,kiriko-fg :background ,kiriko-bg-1))))
   `(org-mode-line-clock-overrun ((t (:foreground ,kiriko-bg :background ,kiriko-red-1))))
   `(org-ellipsis ((t (:foreground ,kiriko-yellow-1 :underline t))))
   `(org-footnote ((t (:foreground ,kiriko-cyan :underline t))))
   `(org-document-title ((t (:foreground ,kiriko-blue))))
   `(org-document-info ((t (:foreground ,kiriko-blue))))
   `(org-habit-ready-face ((t :background ,kiriko-green)))
   `(org-habit-alert-face ((t :background ,kiriko-yellow-1 :foreground ,kiriko-bg)))
   `(org-habit-clear-face ((t :background ,kiriko-blue-3)))
   `(org-habit-overdue-face ((t :background ,kiriko-red-3)))
   `(org-habit-clear-future-face ((t :background ,kiriko-blue-4)))
   `(org-habit-ready-future-face ((t :background ,kiriko-green-1)))
   `(org-habit-alert-future-face ((t :background ,kiriko-yellow-2 :foreground ,kiriko-bg)))
   `(org-habit-overdue-future-face ((t :background ,kiriko-red-4)))
;;;;; outline
   `(outline-1 ((t (:foreground ,kiriko-orange))))
   `(outline-2 ((t (:foreground ,kiriko-green+4))))
   `(outline-3 ((t (:foreground ,kiriko-blue-1))))
   `(outline-4 ((t (:foreground ,kiriko-yellow-2))))
   `(outline-5 ((t (:foreground ,kiriko-cyan))))
   `(outline-6 ((t (:foreground ,kiriko-green+2))))
   `(outline-7 ((t (:foreground ,kiriko-red-4))))
   `(outline-8 ((t (:foreground ,kiriko-blue-4))))
;;;;; p4
   `(p4-depot-added-face ((t :inherit diff-added)))
   `(p4-depot-branch-op-face ((t :inherit diff-changed)))
   `(p4-depot-deleted-face ((t :inherit diff-removed)))
   `(p4-depot-unmapped-face ((t :inherit diff-changed)))
   `(p4-diff-change-face ((t :inherit diff-changed)))
   `(p4-diff-del-face ((t :inherit diff-removed)))
   `(p4-diff-file-face ((t :inherit diff-file-header)))
   `(p4-diff-head-face ((t :inherit diff-header)))
   `(p4-diff-ins-face ((t :inherit diff-added)))
;;;;; perspective
   `(persp-selected-face ((t (:foreground ,kiriko-yellow-2 :inherit mode-line))))
;;;;; powerline
   `(powerline-active1 ((t (:background ,kiriko-bg-05 :inherit mode-line))))
   `(powerline-active2 ((t (:background ,kiriko-bg+2 :inherit mode-line))))
   `(powerline-inactive1 ((t (:background ,kiriko-bg+1 :inherit mode-line-inactive))))
   `(powerline-inactive2 ((t (:background ,kiriko-bg+3 :inherit mode-line-inactive))))
;;;;; proofgeneral
   `(proof-active-area-face ((t (:underline t))))
   `(proof-boring-face ((t (:foreground ,kiriko-fg :background ,kiriko-bg+2))))
   `(proof-command-mouse-highlight-face ((t (:inherit proof-mouse-highlight-face))))
   `(proof-debug-message-face ((t (:inherit proof-boring-face))))
   `(proof-declaration-name-face ((t (:inherit font-lock-keyword-face :foreground nil))))
   `(proof-eager-annotation-face ((t (:foreground ,kiriko-bg :background ,kiriko-orange))))
   `(proof-error-face ((t (:foreground ,kiriko-fg :background ,kiriko-red-4))))
   `(proof-highlight-dependency-face ((t (:foreground ,kiriko-bg :background ,kiriko-yellow-1))))
   `(proof-highlight-dependent-face ((t (:foreground ,kiriko-bg :background ,kiriko-orange))))
   `(proof-locked-face ((t (:background ,kiriko-blue-5))))
   `(proof-mouse-highlight-face ((t (:foreground ,kiriko-bg :background ,kiriko-orange))))
   `(proof-queue-face ((t (:background ,kiriko-red-4))))
   `(proof-region-mouse-highlight-face ((t (:inherit proof-mouse-highlight-face))))
   `(proof-script-highlight-error-face ((t (:background ,kiriko-red-2))))
   `(proof-tacticals-name-face ((t (:inherit font-lock-constant-face :foreground nil :background ,kiriko-bg))))
   `(proof-tactics-name-face ((t (:inherit font-lock-constant-face :foreground nil :background ,kiriko-bg))))
   `(proof-warning-face ((t (:foreground ,kiriko-bg :background ,kiriko-yellow-1))))
;;;;; racket-mode
   `(racket-keyword-argument-face ((t (:inherit font-lock-constant-face))))
   `(racket-selfeval-face ((t (:inherit font-lock-type-face))))
;;;;; rainbow-delimiters
   `(rainbow-delimiters-depth-1-face ((t (:foreground ,kiriko-fg))))
   `(rainbow-delimiters-depth-2-face ((t (:foreground ,kiriko-green+4))))
   `(rainbow-delimiters-depth-3-face ((t (:foreground ,kiriko-yellow-2))))
   `(rainbow-delimiters-depth-4-face ((t (:foreground ,kiriko-cyan))))
   `(rainbow-delimiters-depth-5-face ((t (:foreground ,kiriko-green+2))))
   `(rainbow-delimiters-depth-6-face ((t (:foreground ,kiriko-blue+1))))
   `(rainbow-delimiters-depth-7-face ((t (:foreground ,kiriko-yellow-1))))
   `(rainbow-delimiters-depth-8-face ((t (:foreground ,kiriko-green+1))))
   `(rainbow-delimiters-depth-9-face ((t (:foreground ,kiriko-blue-2))))
   `(rainbow-delimiters-depth-10-face ((t (:foreground ,kiriko-orange))))
   `(rainbow-delimiters-depth-11-face ((t (:foreground ,kiriko-green))))
   `(rainbow-delimiters-depth-12-face ((t (:foreground ,kiriko-blue-5))))
;;;;; rcirc
   `(rcirc-my-nick ((t (:foreground ,kiriko-blue))))
   `(rcirc-other-nick ((t (:foreground ,kiriko-orange))))
   `(rcirc-bright-nick ((t (:foreground ,kiriko-blue+1))))
   `(rcirc-dim-nick ((t (:foreground ,kiriko-blue-2))))
   `(rcirc-server ((t (:foreground ,kiriko-green))))
   `(rcirc-server-prefix ((t (:foreground ,kiriko-green+1))))
   `(rcirc-timestamp ((t (:foreground ,kiriko-green+2))))
   `(rcirc-nick-in-message ((t (:foreground ,kiriko-yellow))))
   `(rcirc-nick-in-message-full-line ((t (:weight bold))))
   `(rcirc-prompt ((t (:foreground ,kiriko-yellow :weight bold))))
   `(rcirc-track-nick ((t (:inverse-video t))))
   `(rcirc-track-keyword ((t (:weight bold))))
   `(rcirc-url ((t (:weight bold))))
   `(rcirc-keyword ((t (:foreground ,kiriko-yellow :weight bold))))
;;;;; re-builder
   `(reb-match-0 ((t (:foreground ,kiriko-bg :background ,kiriko-magenta))))
   `(reb-match-1 ((t (:foreground ,kiriko-bg :background ,kiriko-blue))))
   `(reb-match-2 ((t (:foreground ,kiriko-bg :background ,kiriko-orange))))
   `(reb-match-3 ((t (:foreground ,kiriko-bg :background ,kiriko-red))))
;;;;; regex-tool
   `(regex-tool-matched-face ((t (:background ,kiriko-blue-4 :weight bold))))
;;;;; rpm-mode
   `(rpm-spec-dir-face ((t (:foreground ,kiriko-green))))
   `(rpm-spec-doc-face ((t (:foreground ,kiriko-green))))
   `(rpm-spec-ghost-face ((t (:foreground ,kiriko-red))))
   `(rpm-spec-macro-face ((t (:foreground ,kiriko-yellow))))
   `(rpm-spec-obsolete-tag-face ((t (:foreground ,kiriko-red))))
   `(rpm-spec-package-face ((t (:foreground ,kiriko-red))))
   `(rpm-spec-section-face ((t (:foreground ,kiriko-yellow))))
   `(rpm-spec-tag-face ((t (:foreground ,kiriko-blue))))
   `(rpm-spec-var-face ((t (:foreground ,kiriko-red))))
;;;;; rst-mode
   `(rst-level-1-face ((t (:foreground ,kiriko-orange))))
   `(rst-level-2-face ((t (:foreground ,kiriko-green+1))))
   `(rst-level-3-face ((t (:foreground ,kiriko-blue-1))))
   `(rst-level-4-face ((t (:foreground ,kiriko-yellow-2))))
   `(rst-level-5-face ((t (:foreground ,kiriko-cyan))))
   `(rst-level-6-face ((t (:foreground ,kiriko-green-1))))
;;;;; sh-mode
   `(sh-heredoc     ((t (:foreground ,kiriko-yellow :weight bold))))
   `(sh-quoted-exec ((t (:foreground ,kiriko-red))))
;;;;; show-paren
   `(show-paren-mismatch ((t (:foreground ,kiriko-red+1 :background ,kiriko-bg+3 :weight bold))))
   `(show-paren-match ((t (:background ,kiriko-bg+3 :weight bold))))
;;;;; smart-mode-line
   ;; use (setq sml/theme nil) to enable Kiriko for sml
   `(sml/global ((,class (:foreground ,kiriko-fg :weight bold))))
   `(sml/modes ((,class (:foreground ,kiriko-yellow :weight bold))))
   `(sml/minor-modes ((,class (:foreground ,kiriko-fg-1 :weight bold))))
   `(sml/filename ((,class (:foreground ,kiriko-yellow :weight bold))))
   `(sml/line-number ((,class (:foreground ,kiriko-blue :weight bold))))
   `(sml/col-number ((,class (:foreground ,kiriko-blue+1 :weight bold))))
   `(sml/position-percentage ((,class (:foreground ,kiriko-blue-1 :weight bold))))
   `(sml/prefix ((,class (:foreground ,kiriko-orange))))
   `(sml/git ((,class (:foreground ,kiriko-green+3))))
   `(sml/process ((,class (:weight bold))))
   `(sml/sudo ((,class  (:foreground ,kiriko-orange :weight bold))))
   `(sml/read-only ((,class (:foreground ,kiriko-red-2))))
   `(sml/outside-modified ((,class (:foreground ,kiriko-orange))))
   `(sml/modified ((,class (:foreground ,kiriko-red))))
   `(sml/vc-edited ((,class (:foreground ,kiriko-green+2))))
   `(sml/charging ((,class (:foreground ,kiriko-green+4))))
   `(sml/discharging ((,class (:foreground ,kiriko-red+1))))
;;;;; smartparens
   `(sp-show-pair-mismatch-face ((t (:foreground ,kiriko-red+1 :background ,kiriko-bg+3 :weight bold))))
   `(sp-show-pair-match-face ((t (:background ,kiriko-bg+3 :weight bold))))
;;;;; sml-mode-line
   '(sml-modeline-end-face ((t :inherit default :width condensed)))
;;;;; SLIME
   `(slime-repl-output-face ((t (:foreground ,kiriko-red))))
   `(slime-repl-inputed-output-face ((t (:foreground ,kiriko-green))))
   `(slime-error-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,kiriko-red)))
      (t
       (:underline ,kiriko-red))))
   `(slime-warning-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,kiriko-orange)))
      (t
       (:underline ,kiriko-orange))))
   `(slime-style-warning-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,kiriko-yellow)))
      (t
       (:underline ,kiriko-yellow))))
   `(slime-note-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,kiriko-green)))
      (t
       (:underline ,kiriko-green))))
   `(slime-highlight-face ((t (:inherit highlight))))
;;;;; speedbar
   `(speedbar-button-face ((t (:foreground ,kiriko-green+2))))
   `(speedbar-directory-face ((t (:foreground ,kiriko-cyan))))
   `(speedbar-file-face ((t (:foreground ,kiriko-fg))))
   `(speedbar-highlight-face ((t (:foreground ,kiriko-bg :background ,kiriko-green+2))))
   `(speedbar-selected-face ((t (:foreground ,kiriko-red))))
   `(speedbar-separator-face ((t (:foreground ,kiriko-bg :background ,kiriko-blue-1))))
   `(speedbar-tag-face ((t (:foreground ,kiriko-yellow))))
;;;;; sx
   `(sx-custom-button
     ((t (:background ,kiriko-fg :foreground ,kiriko-bg-1
          :box (:line-width 3 :style released-button) :height 0.9))))
   `(sx-question-list-answers
     ((t (:foreground ,kiriko-green+3
          :height 1.0 :inherit sx-question-list-parent))))
   `(sx-question-mode-accepted
     ((t (:foreground ,kiriko-green+3
          :height 1.3 :inherit sx-question-mode-title))))
   '(sx-question-mode-content-face ((t (:inherit highlight))))
   `(sx-question-mode-kbd-tag
     ((t (:box (:color ,kiriko-bg-1 :line-width 3 :style released-button)
          :height 0.9 :weight semi-bold))))
;;;;; tabbar
   `(tabbar-button ((t (:foreground ,kiriko-fg
                                    :background ,kiriko-bg))))
   `(tabbar-selected ((t (:foreground ,kiriko-fg
                                      :background ,kiriko-bg
                                      :box (:line-width -1 :style pressed-button)))))
   `(tabbar-unselected ((t (:foreground ,kiriko-fg
                                        :background ,kiriko-bg+1
                                        :box (:line-width -1 :style released-button)))))
;;;;; term
   `(term-color-black ((t (:foreground ,kiriko-bg
                                       :background ,kiriko-bg-1))))
   `(term-color-red ((t (:foreground ,kiriko-red-2
                                     :background ,kiriko-red-4))))
   `(term-color-green ((t (:foreground ,kiriko-green
                                       :background ,kiriko-green+2))))
   `(term-color-yellow ((t (:foreground ,kiriko-orange
                                        :background ,kiriko-yellow))))
   `(term-color-blue ((t (:foreground ,kiriko-blue-1
                                      :background ,kiriko-blue-4))))
   `(term-color-magenta ((t (:foreground ,kiriko-magenta
                                         :background ,kiriko-red))))
   `(term-color-cyan ((t (:foreground ,kiriko-cyan
                                      :background ,kiriko-blue))))
   `(term-color-white ((t (:foreground ,kiriko-fg
                                       :background ,kiriko-fg-1))))
   '(term-default-fg-color ((t (:inherit term-color-white))))
   '(term-default-bg-color ((t (:inherit term-color-black))))
;;;;; undo-tree
   `(undo-tree-visualizer-active-branch-face ((t (:foreground ,kiriko-fg+1 :weight bold))))
   `(undo-tree-visualizer-current-face ((t (:foreground ,kiriko-red-1 :weight bold))))
   `(undo-tree-visualizer-default-face ((t (:foreground ,kiriko-fg))))
   `(undo-tree-visualizer-register-face ((t (:foreground ,kiriko-yellow))))
   `(undo-tree-visualizer-unmodified-face ((t (:foreground ,kiriko-cyan))))
;;;;; visual-regexp
   `(vr/group-0 ((t (:foreground ,kiriko-bg :background ,kiriko-green :weight bold))))
   `(vr/group-1 ((t (:foreground ,kiriko-bg :background ,kiriko-orange :weight bold))))
   `(vr/group-2 ((t (:foreground ,kiriko-bg :background ,kiriko-blue :weight bold))))
   `(vr/match-0 ((t (:inherit isearch))))
   `(vr/match-1 ((t (:foreground ,kiriko-yellow-2 :background ,kiriko-bg-1 :weight bold))))
   `(vr/match-separator-face ((t (:foreground ,kiriko-red :weight bold))))
;;;;; volatile-highlights
   `(vhl/default-face ((t (:background ,kiriko-bg-05))))
;;;;; web-mode
   `(web-mode-builtin-face ((t (:inherit ,font-lock-builtin-face))))
   `(web-mode-comment-face ((t (:inherit ,font-lock-comment-face))))
   `(web-mode-constant-face ((t (:inherit ,font-lock-constant-face))))
   `(web-mode-css-at-rule-face ((t (:foreground ,kiriko-orange ))))
   `(web-mode-css-prop-face ((t (:foreground ,kiriko-orange))))
   `(web-mode-css-pseudo-class-face ((t (:foreground ,kiriko-green+3 :weight bold))))
   `(web-mode-css-rule-face ((t (:foreground ,kiriko-blue))))
   `(web-mode-doctype-face ((t (:inherit ,font-lock-comment-face))))
   `(web-mode-folded-face ((t (:underline t))))
   `(web-mode-function-name-face ((t (:foreground ,kiriko-blue))))
   `(web-mode-html-attr-name-face ((t (:foreground ,kiriko-orange))))
   `(web-mode-html-attr-value-face ((t (:inherit ,font-lock-string-face))))
   `(web-mode-html-tag-face ((t (:foreground ,kiriko-cyan))))
   `(web-mode-keyword-face ((t (:inherit ,font-lock-keyword-face))))
   `(web-mode-preprocessor-face ((t (:inherit ,font-lock-preprocessor-face))))
   `(web-mode-string-face ((t (:inherit ,font-lock-string-face))))
   `(web-mode-type-face ((t (:inherit ,font-lock-type-face))))
   `(web-mode-variable-name-face ((t (:inherit ,font-lock-variable-name-face))))
   `(web-mode-server-background-face ((t (:background ,kiriko-bg))))
   `(web-mode-server-comment-face ((t (:inherit web-mode-comment-face))))
   `(web-mode-server-string-face ((t (:inherit web-mode-string-face))))
   `(web-mode-symbol-face ((t (:inherit font-lock-constant-face))))
   `(web-mode-warning-face ((t (:inherit font-lock-warning-face))))
   `(web-mode-whitespaces-face ((t (:background ,kiriko-red))))
;;;;; whitespace-mode
   `(whitespace-space ((t (:background ,kiriko-bg+1 :foreground ,kiriko-bg+1))))
   `(whitespace-hspace ((t (:background ,kiriko-bg+1 :foreground ,kiriko-bg+1))))
   `(whitespace-tab ((t (:background ,kiriko-red-1))))
   `(whitespace-newline ((t (:foreground ,kiriko-bg+1))))
   `(whitespace-trailing ((t (:background ,kiriko-red))))
   `(whitespace-line ((t (:background ,kiriko-bg :foreground ,kiriko-magenta))))
   `(whitespace-space-before-tab ((t (:background ,kiriko-orange :foreground ,kiriko-orange))))
   `(whitespace-indentation ((t (:background ,kiriko-yellow :foreground ,kiriko-red))))
   `(whitespace-empty ((t (:background ,kiriko-yellow))))
   `(whitespace-space-after-tab ((t (:background ,kiriko-yellow :foreground ,kiriko-red))))
;;;;; wanderlust
   `(wl-highlight-folder-few-face ((t (:foreground ,kiriko-red-2))))
   `(wl-highlight-folder-many-face ((t (:foreground ,kiriko-red-1))))
   `(wl-highlight-folder-path-face ((t (:foreground ,kiriko-orange))))
   `(wl-highlight-folder-unread-face ((t (:foreground ,kiriko-blue))))
   `(wl-highlight-folder-zero-face ((t (:foreground ,kiriko-fg))))
   `(wl-highlight-folder-unknown-face ((t (:foreground ,kiriko-blue))))
   `(wl-highlight-message-citation-header ((t (:foreground ,kiriko-red-1))))
   `(wl-highlight-message-cited-text-1 ((t (:foreground ,kiriko-red))))
   `(wl-highlight-message-cited-text-2 ((t (:foreground ,kiriko-green+2))))
   `(wl-highlight-message-cited-text-3 ((t (:foreground ,kiriko-blue))))
   `(wl-highlight-message-cited-text-4 ((t (:foreground ,kiriko-blue+1))))
   `(wl-highlight-message-header-contents-face ((t (:foreground ,kiriko-green))))
   `(wl-highlight-message-headers-face ((t (:foreground ,kiriko-red+1))))
   `(wl-highlight-message-important-header-contents ((t (:foreground ,kiriko-green+2))))
   `(wl-highlight-message-header-contents ((t (:foreground ,kiriko-green+1))))
   `(wl-highlight-message-important-header-contents2 ((t (:foreground ,kiriko-green+2))))
   `(wl-highlight-message-signature ((t (:foreground ,kiriko-green))))
   `(wl-highlight-message-unimportant-header-contents ((t (:foreground ,kiriko-fg))))
   `(wl-highlight-summary-answered-face ((t (:foreground ,kiriko-blue))))
   `(wl-highlight-summary-disposed-face ((t (:foreground ,kiriko-fg
                                                         :slant italic))))
   `(wl-highlight-summary-new-face ((t (:foreground ,kiriko-blue))))
   `(wl-highlight-summary-normal-face ((t (:foreground ,kiriko-fg))))
   `(wl-highlight-summary-thread-top-face ((t (:foreground ,kiriko-yellow))))
   `(wl-highlight-thread-indent-face ((t (:foreground ,kiriko-magenta))))
   `(wl-highlight-summary-refiled-face ((t (:foreground ,kiriko-fg))))
   `(wl-highlight-summary-displaying-face ((t (:underline t :weight bold))))
;;;;; which-func-mode
   `(which-func ((t (:foreground ,kiriko-green+4))))
;;;;; xcscope
   `(cscope-file-face ((t (:foreground ,kiriko-yellow :weight bold))))
   `(cscope-function-face ((t (:foreground ,kiriko-cyan :weight bold))))
   `(cscope-line-number-face ((t (:foreground ,kiriko-red :weight bold))))
   `(cscope-mouse-face ((t (:foreground ,kiriko-bg :background ,kiriko-blue+1))))
   `(cscope-separator-face ((t (:foreground ,kiriko-red :weight bold
                                            :underline t :overline t))))
;;;;; yascroll
   `(yascroll:thumb-text-area ((t (:background ,kiriko-bg-1))))
   `(yascroll:thumb-fringe ((t (:background ,kiriko-bg-1 :foreground ,kiriko-bg-1))))
   ))

;;; Theme Variables
(kiriko-with-color-variables
  (custom-theme-set-variables
   'kiriko
;;;;; ansi-color
   `(ansi-color-names-vector [,kiriko-bg ,kiriko-red ,kiriko-green ,kiriko-yellow
                                          ,kiriko-blue ,kiriko-magenta ,kiriko-cyan ,kiriko-fg])
;;;;; fill-column-indicator
   `(fci-rule-color ,kiriko-bg-05)
;;;;; nrepl-client
   `(nrepl-message-colors
     '(,kiriko-red ,kiriko-orange ,kiriko-yellow ,kiriko-green ,kiriko-green+4
                    ,kiriko-cyan ,kiriko-blue+1 ,kiriko-magenta))
;;;;; pdf-tools
   `(pdf-view-midnight-colors '(,kiriko-fg . ,kiriko-bg-05))
;;;;; vc-annotate
   `(vc-annotate-color-map
     '(( 20. . ,kiriko-red-1)
       ( 40. . ,kiriko-red)
       ( 60. . ,kiriko-orange)
       ( 80. . ,kiriko-yellow-2)
       (100. . ,kiriko-yellow-1)
       (120. . ,kiriko-yellow)
       (140. . ,kiriko-green-1)
       (160. . ,kiriko-green)
       (180. . ,kiriko-green+1)
       (200. . ,kiriko-green+2)
       (220. . ,kiriko-green+3)
       (240. . ,kiriko-green+4)
       (260. . ,kiriko-cyan)
       (280. . ,kiriko-blue-2)
       (300. . ,kiriko-blue-1)
       (320. . ,kiriko-blue)
       (340. . ,kiriko-blue+1)
       (360. . ,kiriko-magenta)))
   `(vc-annotate-very-old-color ,kiriko-magenta)
   `(vc-annotate-background ,kiriko-bg-1)
   ))

;;; Rainbow Support

(declare-function rainbow-mode 'rainbow-mode)
(declare-function rainbow-colorize-by-assoc 'rainbow-mode)

(defvar kiriko-add-font-lock-keywords nil
  "Whether to add font-lock keywords for kiriko color names.
In buffers visiting library `kiriko-theme.el' the kiriko
specific keywords are always added.  In all other Emacs-Lisp
buffers this variable controls whether this should be done.
This requires library `rainbow-mode'.")

(defvar kiriko-colors-font-lock-keywords nil)

;; (defadvice rainbow-turn-on (after kiriko activate)
;;   "Maybe also add font-lock keywords for kiriko colors."
;;   (when (and (derived-mode-p 'emacs-lisp-mode)
;;              (or kiriko-add-font-lock-keywords
;;                  (equal (file-name-nondirectory (buffer-file-name))
;;                         "kiriko-theme.el")))
;;     (unless kiriko-colors-font-lock-keywords
;;       (setq kiriko-colors-font-lock-keywords
;;             `((,(regexp-opt (mapcar 'car kiriko-colors-alist) 'words)
;;                (0 (rainbow-colorize-by-assoc kiriko-colors-alist))))))
;;     (font-lock-add-keywords nil kiriko-colors-font-lock-keywords)))

;; (defadvice rainbow-turn-off (after kiriko activate)
;;   "Also remove font-lock keywords for kiriko colors."
;;   (font-lock-remove-keywords nil kiriko-colors-font-lock-keywords))

;;; Footer

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide-theme 'kiriko)

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; eval: (when (require 'rainbow-mode nil t) (rainbow-mode 1))
;; End:
;;; kiriko-theme.el ends here
