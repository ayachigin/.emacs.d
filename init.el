; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

;; ------------------------------------------------------------------------
;; @ coding system

   ;; 日本語入力のための設定
   (set-keyboard-coding-system 'cp932)

   (prefer-coding-system 'utf-8-dos)
   (set-file-name-coding-system 'cp932)
   (setq default-process-coding-system '(cp932 . cp932))
;;; Code:
;;; PATH:
(setenv "PATH" (concat
                "C:/cmder/vendor/msysgit/bin;"
                (getenv "PATH")))
(setenv "PATH" (concat
                "C:\\Program Files (x86)\\Microsoft SDKs\\TypeScript\\1.0;"
                (getenv "PATH")))
(setq default-directory (getenv "HOME"))
(add-to-list 'exec-path (concat (getenv "HOME")
                                "C:\\cmder\\vendor\\msysgit\\bin"))
;; newline
(global-set-key "\C-m" 'newline)


(show-paren-mode t)

;; flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;;; *.~ とかのバックアップファイルを作らない
(setq make-backup-files nil)

;; ------------------------------------------------------------------------
;; @ ime

   ;; 標準IMEの設定
   (setq default-input-method "W32-IME")

   ;; IME状態のモードライン表示
   (setq-default w32-ime-mode-line-state-indicator "[Aa]")
   (setq w32-ime-mode-line-state-indicator-list '("[Aa]" "[あ]" "[Aa]"))

   ;; IMEの初期化
(w32-ime-initialize)

   ;; IME OFF時の初期カーソルカラー
(set-cursor-color "#c0ffee")

   ;; IME ON/OFF時のカーソルカラー
(add-hook 'input-method-activate-hook
	  (lambda() (set-cursor-color "#ffc000")))
(add-hook 'input-method-inactivate-hook
	  (lambda() (set-cursor-color "#c0ffee")))

   ;; バッファ切り替え時にIME状態を引き継ぐ
   (setq w32-ime-buffer-switch-p nil)

;; ------------------------------------------------------------------------
;; @ font

   ;; 標準フォントの設定
   ;; (set-default-font "M+2VM+IPAG circle-12")

   ;; IME変換時フォントの設定（テストバージョンのみ）
   ;; (setq w32-ime-font-face "MigMix 1M")
   ;; (setq w32-ime-font-height 22)

   ;; 固定等幅フォントの設定
   ;; (set-face-attribute 'fixed-pitch    nil :family "M+2VM+IPAG circle")

   ;; 可変幅フォントの設定
   ;; (set-face-attribute 'variable-pitch nil :family "M+2VM+IPAG circle")

;; ------------------------------------------------------------------------
;; @ custom-set-variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (misterioso)))
 '(custom-safe-themes (quote ("0f0adcd1352b15a622afd48fcff8232169aac4b5966841e506f815f81dac44ea" "f211f8db2328fb031908c9496582e7de2ae8abd5f59a27b4c1218720a7d11803" "0521e8bea7954b4d42e9b68390be2a6d4549d15a3f47b391b8c870766f520cf7" "e0b1e7cea8624d6c724a8f046fd456db8af3ffff14a85bea46d1bc87b08b5964" "f07583bdbcca020adecb151868c33820dfe3ad5076ca96f6d51b1da3f0db7105" "2c73700ef9c2c3aacaf4b65a7751b8627b95a1fd8cebed8aa199f2afb089a85f" "ad97202c92f426a867e83060801938acf035921d5d7e78da3041a999082fb565" "6cf0e8d082a890e94e4423fc9e222beefdbacee6210602524b7c84d207a5dfb5" "3fe4861111710e42230627f38ebb8f966391eadefb8b809f4bfb8340a4e85529" "fc89666d6de5e1d75e6fe4210bd20be560a68982da7f352bd19c1033fb7583ba" default)))
 '(default-frame-alist (quote ((background-color . "grey30") (background-mode . dark) (border-color . "black") (cursor-color . "black") (foreground-color . "gainsboro") (mouse-color . "black"))))
 '(electric-indent-mode t)
 '(eshell-prompt-function (lambda nil (concat (abbreviate-file-name (eshell/pwd)) "
λ ")))
 '(eshell-prompt-regexp "^[^
]*λ ")
 '(flycheck-haskell-hlint-executable "hlint --encoding=utf-8")
 '(global-auto-complete-mode t)
 '(haskell-ask-also-kill-buffers nil)
 '(haskell-check-command "hlint --encoding=utf-8")
 '(haskell-compile-ghc-filter-linker-messages nil)
 '(haskell-interactive-mode-delete-superseded-errors nil)
 '(haskell-mode-hook (quote (turn-on-haskell-decl-scan turn-on-haskell-indentation interactive-haskell-mode (lambda nil (ghc-init) (flycheck-mode) (auto-complete-mode)))))
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-use-presentation-mode t)
 '(indent-tabs-mode nil)
 '(inferior-haskell-wait-and-jump t)
 '(initial-frame-alist (quote ((alpha . 90) (width . 85) (height . 48) (top . 0) (left . 0) nil)))
 '(prolog-program-name (quote (((getenv "EPROLOG") (eval (getenv "EPROLOG"))) (eclipse "eclipse") (mercury nil) (sicstus "sicstus") (swi "C:/Program Files/swipl/bin/swipl.exe") (t "prolog"))))
 '(prolog-system (quote swi))
 '(rainbow-identifiers-cie-l*a*b*-lightness 80)
 '(rainbow-identifiers-cie-l*a*b*-saturation 18)
 '(shell-pop-shell-type (quote ("shell" "*shell*" (lambda nil (eshell)))))
 '(tool-bar-mode nil)
 '(vc-handled-backends nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; ------------------------------------------------------------------------
;; @ frame

   ;; フレームタイトルの設定
   (setq frame-title-format "%b")

;; ------------------------------------------------------------------------
;; @ buffer

   ;; バッファ画面外文字の切り詰め表示
   (setq truncate-lines nil)

   ;; ウィンドウ縦分割時のバッファ画面外文字の切り詰め表示
   (setq truncate-partial-width-windows t)

   ;; 同一バッファ名にディレクトリ付与
   (require 'uniquify)
   (setq uniquify-buffer-name-style 'forward)
   (setq uniquify-buffer-name-style 'post-forward-angle-brackets)
   (setq uniquify-ignore-buffers-re "*[^*]+*")

;; ------------------------------------------------------------------------
;; @ fringe

   ;; バッファ中の行番号表示
   (global-linum-mode t)

   ;; 行番号のフォーマット
   ;; (set-face-attribute 'linum nil :foreground "red" :height 0.8)
   (set-face-attribute 'linum nil :height 0.8)
   (setq linum-format "%4d")

;; ------------------------------------------------------------------------
;; @ modeline

   ;; 行番号の表示
   (line-number-mode t)

   ;; 列番号の表示
   (column-number-mode t)

   ;; 時刻の表示
;   (require 'time)
;   (setq display-time-24hr-format t)
;   (setq display-time-string-forms '(24-hours ":" minutes))
;   (display-time-mode t)

   ;; cp932エンコード時の表示を「P」とする
   (coding-system-put 'cp932 :mnemonic ?P)
   (coding-system-put 'cp932-dos :mnemonic ?P)
   (coding-system-put 'cp932-unix :mnemonic ?P)
   (coding-system-put 'cp932-mac :mnemonic ?P)

;; ------------------------------------------------------------------------
;; @ cursor

   ;; カーソル点滅表示
   (blink-cursor-mode 0)

   ;; スクロール時のカーソル位置の維持
   (setq scroll-preserve-screen-position t)

   ;; スクロール行数（一行ごとのスクロール）
   (setq vertical-centering-font-regexp ".*")
   (setq scroll-conservatively 35)
   (setq scroll-margin 0)
   (setq scroll-step 1)

   ;; 画面スクロール時の重複行数
   (setq next-screen-context-lines 1)

;; mouse wheel scroll
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)

;; ------------------------------------------------------------------------
;; @ default setting

   ;; 起動メッセージの非表示
   (setq inhibit-startup-message t)

   ;; スタートアップ時のエコー領域メッセージの非表示
   (setq inhibit-startup-echo-area-message -1)

;; ------------------------------------------------------------------------
;; @ package manager
   (require 'package)
   (add-to-list 'package-archives
                '("melpa" . "http://melpa.milkbox.net/packages/") t)
   (add-to-list 'package-archives
                '("marmalade" . "http://marmalade-repo.org/packages/"))
   (package-initialize)

;; ------------------------------------------------------------------------
;; @ tabbar

   (require 'tabbar)

   ;; tabbar有効化
   (tabbar-mode)

   ;; タブ切替にマウスホイールを使用（0：有効，-1：無効）
   (tabbar-mwheel-mode -1)

   ;; タブグループを使用（t：有効，nil：無効）
   (setq tabbar-buffer-groups-function nil)

   ;; ボタン非表示
   (dolist (btn '(tabbar-buffer-home-button
                  tabbar-scroll-left-button
                  tabbar-scroll-right-button))
     (set btn (cons (cons "" nil) (cons "" nil))))

   ;; タブ表示 一時バッファ一覧
   (defvar tabbar-displayed-buffers
     '("*scratch*" "*Messages*" "*Backtrace*" "*Colors*"
       "*Faces*" "*Apropos*" "*Customize*" "*shell*" "*Help*")
     "*Regexps matches buffer names always included tabs.")

   ;; 作業バッファの一部を非表示
   (setq tabbar-buffer-list-function
         (lambda ()
           (let* ((hides (list ?\  ?\*))
                  (re (regexp-opt tabbar-displayed-buffers))
                  (cur-buf (current-buffer))
                  (tabs (delq
                         nil
                         (mapcar
                          (lambda (buf)
                            (let ((name (buffer-name buf)))
                              (when (or (string-match re name)
                                        (not (memq (aref name 0) hides)))
                                buf)))
                          (buffer-list)))))
             (if (memq cur-buf tabs)
                 tabs
               (cons cur-buf tabs)))))

   ;; キーバインド設定
   (global-set-key (kbd "<C-tab>")   'tabbar-forward-tab)
   (global-set-key (kbd "<C-S-tab>") 'tabbar-backward-tab)

   ;; タブ表示欄の見た目（フェイス）
   (set-face-attribute 'tabbar-default nil
                       :background "SystemMenuBar")

   ;; 選択タブの見た目（フェイス）
   (set-face-attribute 'tabbar-selected nil
                       :foreground "red3"
                       :background "SystemMenuBar"
                       :box (list
                             :line-width 1
                             :color "gray80"
                             :style 'released-button)
                       :overline "#F3F2EF"
                       :weight 'bold
                       :family "ＭＳ Ｐゴシック"
                       )

   ;; 非選択タブの見た目（フェイス）
   (set-face-attribute 'tabbar-unselected nil
                       :foreground "black"
                       :background "SystemMenuBar"
                       :box (list
                             :line-width 1
                             :color "gray80"
                             :style 'released-button)
                       :overline "#F3F2EF"
                       :family "ＭＳ Ｐゴシック"
                       )

   ;; タブ間隔の調整
   (set-face-attribute 'tabbar-separator nil
                       :height 0.1)

;; ----------------------------------------------------------------------
;; @ color-theme
(add-to-list 'custom-theme-load-path
             (file-name-as-directory "~/.emacs.d/themes/"))

;; ----------------------------------------------------------------------
;; @ initial-frame
'(setq initial-frame-alist
      (append (list
	       '(alpha . 80)
	       '(width . 84)                ;; フレームの幅
	       '(height . 48)                ;; フレームの高さ
	       '(top . 0)                    ;; Y 表示位置
	       '(left . 0)                ;; X 表示位置
	      initial-frame-alist)))
'(setq default-frame-alist initial-frame-alist)

;;==========================================================================
;; linum-adjust
(setq linum-delay t)
(defadvice linum-schedule (around my-linum-schedule () activate)
  (run-with-idle-timer 0.2 nil #'linum-update-current))


;;UNDO
(global-set-key "\C-z" 'undo)

;;クリップボードにコピー
(cond (window-system
       (setq x-select-enable-clipboard t)))

;; visual-regexp
(require 'visual-regexp)
(define-key global-map (kbd "C-c r") 'vr/replace)
(define-key global-map (kbd "C-c q") 'vr/query-replace)

;; fonts
(set-face-attribute 'default nil :family "Migu 1M" :height 100)
(set-fontset-font nil 'japanese-jisx0208 (font-spec :family "Migu 1M"))

;;==========================================================================
;; shell-pop
(global-set-key (kbd "C-c p") 'shell-pop)

;;==========================================================================
;; haskell-mode
;; ghc-mod
(add-to-list 'exec-path "C:\\Program Files\\Haskell\\bin")


;;==========================================================================
;; coq-mode
(load "~/.emacs.d/ProofGeneral-4.2/generic/proof-site.elc")
(add-to-list 'exec-path "C:/Program Files (x86)/Coq/bin")

;;==========================================================================
;; js2-mode
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js2-mode-hook (lambda ()
                           (ac-js2-mode)
                           (electric-pair-mode)))
(require 'js2-refactor)
(js2r-add-keybindings-with-prefix "C-c C-m")

;;==========================================================================
;; helm-mode
(require 'helm-config)
(helm-mode 1)

;;==========================================================================
;; egison-mode
(add-to-list 'load-path "C:/home/.emacs.d/egison-mode")
(autoload 'egison-mode "egison-mode" "Major mode for editing Egison code." t)
(setq auto-mode-alist
(cons `("\\.egi$" . egison-mode) auto-mode-alist))

;; ------------------------------------------------------------------------
;; @ migemo/cmigemo
(require 'migemo)

(setq migemo-command "C:/home/cmigemo/cmigemo")
(setq migemo-options '("-q" "--emacs"))
(setq migemo-dictionary "C:/home/cmigemo/dict/utf-8/migemo-dict")
(setq migemo-user-dictionary nil)
(setq migemo-regex-dictionary nil)
(setq migemo-use-pattern-alist t)
(setq migemo-use-frequent-pattern-alist t)
(setq migemo-pattern-alist-length 1024)
(setq migemo-coding-system 'utf-8-unix)
(load-library "migemo")
(migemo-init)

;;==========================================================================
;; web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;;==========================================================================
;; typescript-mode
(require 'typescript)
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))

(require 'tss)

;; Key binding
(setq tss-popup-help-key "C-:")
(setq tss-jump-to-definition-key "C->")
(setq tss-implement-definition-key "C-c i")

;; Make config suit for you. About the config item, eval the following sexp.
;; (customize-group "tss")

;; Do setting recommemded configuration
(tss-config-default)



(provide 'init)
;;; init.el ends here

