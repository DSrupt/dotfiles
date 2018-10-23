;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     markdown
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     auto-completion
     ;; better-defaults
     emacs-lisp
     git
     ;; org
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; spell-checking
     syntax-checking
     version-control
     c-c++
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(company clang-format color-theme-sanityinc-tomorrow)
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'all
   ))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'emacs
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(sanityinc-tomorrow-eighties spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (defun copy-from-osx ()
    (shell-command-to-string "pbpaste"))

  (defun paste-to-osx (text &optional push)
    (let ((process-connection-type nil))
      (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
        (process-send-string proc text)
        (process-send-eof proc))))

  (setq interprogram-cut-function 'paste-to-osx)
  (setq interprogram-paste-function 'copy-from-osx)
  (setq-default dotspacemacs-configuration-layers
		'((c-c++ :variables c-c++-enable-clang-support t)))
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (defun xah-copy-line-or-region ()
  "Copy current line, or text selection.
When called repeatedly, append copy subsequent lines.
When `universal-argument' is called first, copy whole buffer (respects `narrow-to-region').

URL `http://ergoemacs.org/emacs/emacs_copy_cut_current_line.html'
Version 2018-09-10"
  (interactive)
  (if current-prefix-arg
      (progn
        (copy-region-as-kill (point-min) (point-max)))
    (if (use-region-p)
        (progn
          (copy-region-as-kill (region-beginning) (region-end)))
      (if (eq last-command this-command)
          (if (eobp)
              (progn )
            (progn
              (kill-append "\n" nil)
              (kill-append
               (buffer-substring-no-properties (line-beginning-position) (line-end-position))
               nil)
              (progn
                (end-of-line)
                (forward-char))))
        (if (eobp)
            (if (eq (char-before) 10 )
                (progn )
              (progn
                (copy-region-as-kill (line-beginning-position) (line-end-position))
                (end-of-line)))
          (progn
            (copy-region-as-kill (line-beginning-position) (line-end-position))
            (end-of-line)
            (forward-char)))))))
  (defun xah-cut-line-or-region ()
    "Cut current line, or text selection.
When `universal-argument' is called first, cut whole buffer (respects `narrow-to-region').

URL `http://ergoemacs.org/emacs/emacs_copy_cut_current_line.html'
Version 2015-06-10"
    (interactive)
    (if current-prefix-arg
	(progn ; not using kill-region because we don't want to include previous kill
	  (kill-new (buffer-string))
	  (delete-region (point-min) (point-max)))
      (progn (if (use-region-p)
		 (kill-region (region-beginning) (region-end) t)
	       (kill-region (line-beginning-position) (line-beginning-position 2))))))

  (global-set-key (kbd "C-c d") 'xah-cut-line-or-region) ; cut
  (global-set-key (kbd "C-c c") 'xah-copy-line-or-region) ; copy
  (global-set-key (kbd "C-c y") 'yank) ; paste

  (paradox-enable)
  (global-company-mode)
  ;; Bind clang-format-buffer to tab on the c++-mode only:
  (add-hook 'c++-mode-hook 'clang-format-bindings)
  (defun clang-format-bindings ()
    (define-key c++-mode-map [C-M-tab] 'clang-format-buffer))
  (setq-default indent-tabs-mode t)
  ;; set default tab char's display width to 4 spaces
  (setq-default tab-width 8) ; emacs 23.1 to 26 default to 8

  ;; set current buffer's tab char's display width to 4 spaces
  (setq tab-width 8)

  ;; make tab key do indent first then completion.
  (setq-default tab-always-indent 'complete)
  ;; ace-window
  (use-package ace-window
    :ensure t
    :defer 1
    :config
    ;;(global-set-key [remap other-window] 'ace-window)
    (set-face-attribute
     'aw-leading-char-face nil
     :foreground "deep sky blue"
     :weight 'bold
     :height 3.0)
    (set-face-attribute
     'aw-mode-line-face nil
     :inherit 'mode-line-buffer-id
     :foreground "lawn green")
    (setq aw-keys '(?a ?s ?d ?f ?j ?k ?l)
          aw-dispatch-always t
          aw-dispatch-alist
          '((?x aw-delete-window "Ace - Delete Window")
            (?c aw-swap-window "Ace - Swap Window")
            (?n aw-flip-window)
            (?v aw-split-window-vert "Ace - Split Vert Window")
            (?h aw-split-window-horz "Ace - Split Horz Window")
            (?m delete-other-windows "Ace - Maximize Window")
            (?g delete-other-windows)
            (?b balance-windows)
            (?u (lambda ()
                  (progn
                    (winner-undo)
                    (setq this-command 'winner-undo))))
            (?r winner-redo)))
    (when (package-installed-p 'hydra)
      (defhydra hydra-window-size (:color red)
        "Windows size"
        ("h" shrink-window-horizontally "shrink horizontal")
        ("j" shrink-window "shrink vertical")
        ("k" enlarge-window "enlarge vertical")
        ("l" enlarge-window-horizontally "enlarge horizontal"))
      (defhydra hydra-window-frame (:color red)
        "Frame"
        ("f" make-frame "new frame")
        ("x" delete-frame "delete frame"))
      (defhydra hydra-window-scroll (:color red)
        "Scroll other window"
        ("n" joe-scroll-other-window "scroll")
        ("p" joe-scroll-other-window-down "scroll down"))
      (add-to-list 'aw-dispatch-alist '(?w hydra-window-size/body) t)
      (add-to-list 'aw-dispatch-alist '(?o hydra-window-scroll/body) t)
      (add-to-list 'aw-dispatch-alist '(?\; hydra-window-frame/body) t))
    (ace-window-display-mode t))
)

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-tomorrow-eighties)))
 '(custom-safe-themes
   (quote
    ("8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" default)))
 '(evil-want-Y-yank-to-eol nil)
 '(package-selected-packages
   (quote
    (twittering-mode engine-mode geeknote spotify helm-spotify-plus multi elfeed-goodies ace-jump-mode elfeed-org elfeed-web elfeed wakatime-mode feature-mode projectile-rails pony-mode company-tern emmet-mode js-doc tern web-beautify web-mode ggtags helm-gtags merlin ocp-indent tuareg caml utop geiser plantuml-mode powershell vimrc-mode dactyl-mode nasm-mode x86-lookup company-go flycheck-gometalinter go-eldoc go-guru go-mode racket-mode faceup flycheck-nim nim-mode flycheck-nimsuggest commenter epc concurrent company-anaconda anaconda-mode cython-mode helm-cscope helm-pydoc hy-mode live-py-mode pip-requirements py-isort pyenv-mode pythonic pytest pyvenv stickyfunc-enhance xcscope yapfify cider-eval-sexp-fu clj-refactor inflections edn cider sesman queue peg clojure-mode clojure-snippets alchemist flycheck-mix elixir-mode flycheck-credo ob-elixir company-ycmd srefactor company-emoji emoji-cheat-sheet-plus vmd-mode auctex-latexmk company-auctex auctex typo tide typescript-mode cargo racer flycheck-rust rust-mode toml-mode psci purescript-mode psc-ide erlang fsharp-mode company-quickhelp company-emacs-eclim eclim elm-mode flycheck-elm seq company-web web-completion-data helm-css-scss less-css-mode pug-mode sass-mode haml-mode scss-mode slim-mode tagedit cmm-mode company-cabal company-ghci company-ghc flycheck-haskell ghc haskell-snippets helm-hoogle hindent hlint-refactor intero haskell-mode drupal-mode php-auto-yasnippets php-extras php-mode phpcbf phpunit ein lua-mode arduino-mode matlab-mode qml-mode scad-mode stan-mode thrift faust-mode company-shell fish-mode insert-shebang org-ref key-chord helm-bibtex parsebib biblio biblio-core ahk-mode adoc-mode markup-faces ensime noflet scala-mode sbt-mode swift-mode csv-mode ess-R-data-view ctable ess-smart-equals ess julia-mode graphviz-dot-mode glsl-mode company-glsl ob-sml sml-mode omnisharp shut-up csharp-mode idris-mode prop-menu coffee-mode js2-refactor multiple-cursors livid-mode skewer-mode js2-mode simple-httpd company-dcd d-mode flycheck-dmd-dub common-lisp-snippets slime-company slime bundler chruby enh-ruby-mode minitest rbenv robe inf-ruby rspec-mode rubocop ruby-test-mode ruby-tools rvm rake sql-indent gist github-browse-file github-clone github-search magit-gh-pulls gh marshal logito pcache p4 afternoon-theme alect-themes ample-theme ample-zen-theme apropospriate-theme anti-zenburn-theme badwolf-theme birds-of-paradise-plus-theme bubbleberry-theme busybee-theme cherry-blossom-theme clues-theme color-theme-sanityinc-solarized cyberpunk-theme dakrone-theme darkburn-theme darkmine-theme darkokai-theme darktooth-theme django-theme dracula-theme espresso-theme exotica-theme farmhouse-theme flatland-theme flatui-theme gandalf-theme gotham-theme grandshell-theme gruber-darker-theme gruvbox-theme autothemer hc-zenburn-theme hemisu-theme heroku-theme inkpot-theme ir-black-theme jazz-theme jbeans-theme light-soap-theme lush-theme madhat2r-theme majapahit-theme material-theme minimal-theme moe-theme molokai-theme monokai-theme monochrome-theme mustang-theme naquadah-theme noctilux-theme obsidian-theme occidental-theme omtose-phellack-theme oldlace-theme organic-green-theme phoenix-dark-mono-theme phoenix-dark-pink-theme planet-theme professional-theme purple-haze-theme railscasts-theme rebecca-theme reverse-theme seti-theme smyx-theme soft-charcoal-theme soft-morning-theme soft-stone-theme solarized-theme soothe-theme spacegray-theme subatomic-theme subatomic256-theme sublime-themes sunny-day-theme tango-2-theme tango-plus-theme tangotango-theme tao-theme toxi-theme twilight-anti-bright-theme twilight-bright-theme twilight-theme ujelly-theme underwater-theme white-sand-theme zen-and-art-theme zenburn-theme color-identifiers-mode rainbow-identifiers rainbow-mode mu4e-alert mu4e-maildirs-extension terraform-mode hcl-mode ranger pandoc-mode ox-pandoc docker json-mode json-snatcher json-reformat docker-tramp dockerfile-mode flycheck-ycmd ycmd request-deferred deferred esh-help eshell-prompt-extras eshell-z multi-term shell-pop xterm-color vagrant vagrant-tramp systemd spray ansible ansible-doc company-ansible jinja2-mode salt-mode mmm-jinja2 yaml-mode imenu-list nginx-mode command-log-mode rebox2 edit-server gmail-message-mode ham-mode html-to-markdown flymd osx-location rase sunshine theme-changer dash-at-point counsel-dash helm-dash prodigy flycheck-ledger ledger-mode company-restclient know-your-http-well ob-http ob-restclient restclient-helm restclient puppet-mode fasd deft pdf-tools tablist pyim pyim-basedict chinese-wbim fcitx find-by-pinyin-dired ace-pinyin pinyinlib pangu-spacing youdao-dictionary names chinese-word-at-point launchctl osx-dictionary osx-trash pbcopy reveal-in-osx-finder company-nixos-options helm-nixos-options nix-mode nixos-options selectric-mode 2048-game pacmacs dash-functional sudoku typit mmt xkcd rcirc-color rcirc-notify jabber srv fsm slack emojify circe oauth2 websocket ht erc-terminal-notifier erc-gitter erc-hl-nicks erc-image erc-social-graph erc-view-log erc-yt nlinum-relative nlinum counsel-projectile counsel ivy-hydra smex swiper wgrep auto-dictionary flyspell-correct-ivy ivy flyspell-correct-helm flyspell-correct-popup flyspell-correct flyspell-popup floobits mwim unfill ox-twbs ox-gfm ox-reveal ibuffer-projectile bracketed-paste origami hl-anything evil-snipe evil-commentary evil-cleverparens paredit smeargle orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download magit-gitflow htmlize helm-gitignore helm-company helm-c-yasnippet gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter fuzzy flycheck-pos-tip pos-tip flycheck evil-magit magit magit-popup git-commit ghub treepy let-alist graphql with-editor disaster diff-hl company-statistics company-c-headers cmake-mode auto-yasnippet yasnippet ac-ispell company color-theme-solarized color-theme-sanityinc-tomorrow auto-complete mmm-mode markdown-toc markdown-mode gh-md clang-format win-switch ws-butler winum volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg eval-sexp-fu highlight elisp-slime-nav dumb-jump diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed ace-link ace-jump-helm-line helm helm-core popup which-key undo-tree org-plus-contrib hydra evil-unimpaired f s dash async aggressive-indent adaptive-wrap ace-window avy))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
