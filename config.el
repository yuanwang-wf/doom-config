;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!
;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Yuan Wang"
      user-mail-address "yuan.wang@workiva.com")
(add-to-list 'default-frame-alist '(height . 24))
(add-to-list 'default-frame-alist '(width . 80))
;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-palenight
      doom-font (font-spec :family "PragmataPro" :size 18))

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/"
      org-roam-directory (concat org-directory "roam/")
       org-agenda-files (append
                         (file-expand-wildcards (concat org-directory "*.org"))
                         (file-expand-wildcards (concat org-directory "agenda/*.org"))
                         (file-expand-wildcards (concat org-directory "projects/*.org")))
       org-default-notes-file (concat org-directory "agenda/inbox.org")
       +org-capture-notes-file (concat org-directory "agenda/inbox.org")
       +org-capture-todo-file (concat org-directory "agenda/inbox.org")
)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type nil)

(setq company-idle-delay 0.2)

;; Disable invasive lsp-mode features
(setq lsp-ui-sideline-enable nil   ; not anymore useful than flycheck
      lsp-ui-doc-enable nil        ; slow and redundant with K
      lsp-enable-symbol-highlighting nil
      ;; If an LSP server isn't present when I start a prog-mode buffer, you
      ;; don't need to tell me. I know. On some systems I don't care to have a
      ;; whole development environment for some ecosystems.
      ;;+lsp-prompt-to-install-server 'quiet
      )

(use-package! interaction-log)

(after! browse-at-remote
  (setq browse-at-remote-add-line-number-if-no-region-selected t))

(after! org
  (setq org-eukleides-path (getenv "EUKLEIDES_PATH")
        org-agenda-dim-blocked-tasks nil
        org-agenda-inhibit-startup t
        org-agenda-use-tag-inheritance nil)
  (add-to-list 'org-modules 'org-habit)
  )

(setq
    magit-list-refs-sortby "-committerdate"
    ;; org-export-with-broken-links t
    ;; org-id-track-globally t
    lsp-enable-on-type-formatting nil
    lsp-java-completion-max-results 20
    lsp-java-jdt-download-url "https://download.eclipse.org/jdtls/milestones/1.8.0/jdt-language-server-1.8.0-202201261434.tar.gz"
    lsp-java-vmargs
      '("-noverify"
        "-Xmx5G"
        "-Xms100m"
        "-XX:+UseParallelGC"
        "-XX:GCTimeRatio=4"
        "-XX:AdaptiveSizePolicyWeight=90"
        "-Dsun.zip.disableMemoryMapping=true"
        "-XX:+UseStringDeduplication"
        "-javaagent:/Users/yuanwang/.m2/repository/org/projectlombok/lombok/1.18.16/lombok-1.18.16.jar"
        "-Xbootclasspath/a:/Users/yuanwang/.m2/repository/org/projectlombok/lombok/1.18.16/lombok-1.18.16.jar"))

(setq lsp-java-configuration-runtimes '[(:name "JavaSE-1.8"
						:path "/Users/yuanwang/.sdkman/candidates/java/8.0.242.j9-adpt/")
					(:name "JavaSE-11"
						:path "/Users/yuanwang/.sdkman/candidates/java/11.0.4-amzn/"
						:default t)])
;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
