                                        ; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

;; ------------------------------------------------------------------------
;; @ coding system
(if (eq system-type 'windows-nt)
    ;; 日本語入力のための設定
    (set-keyboard-coding-system 'cp932)

  (prefer-coding-system 'utf-8-dos)
  (set-file-name-coding-system 'cp932)
  (setq default-process-coding-system '(cp932 . cp932))
;;; Code:
;;; PATH:
  (setenv "PATH" (concat
                  "C:/cmder/vendor/msysgit/bin"
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

  ;;; ------------------------------------------------------------------------
  ;;; @ ime

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
  )
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
 '(custom-enabled-themes (quote (dark-laptop)))
 '(custom-safe-themes (quote ("f07583bdbcca020adecb151868c33820dfe3ad5076ca96f6d51b1da3f0db7105" "2c73700ef9c2c3aacaf4b65a7751b8627b95a1fd8cebed8aa199f2afb089a85f" "ad97202c92f426a867e83060801938acf035921d5d7e78da3041a999082fb565" "6cf0e8d082a890e94e4423fc9e222beefdbacee6210602524b7c84d207a5dfb5" "3fe4861111710e42230627f38ebb8f966391eadefb8b809f4bfb8340a4e85529" "fc89666d6de5e1d75e6fe4210bd20be560a68982da7f352bd19c1033fb7583ba" default)))
 '(electric-indent-mode t)
 '(global-auto-complete-mode t)
 '(haskell-ask-also-kill-buffers nil)
 '(haskell-check-command "ghc -fno-code")
 '(haskell-compile-ghc-filter-linker-messages nil)
 '(haskell-interactive-mode-delete-superseded-errors nil)
 '(haskell-mode-hook (quote (turn-on-haskell-indent turn-on-haskell-indentation interactive-haskell-mode (lambda nil (ghc-init) (flycheck-mode)))))
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-use-presentation-mode t)
 '(indent-tabs-mode nil)
 '(prolog-program-name (quote (((getenv "EPROLOG") (eval (getenv "EPROLOG"))) (eclipse "eclipse") (mercury nil) (sicstus "sicstus") (swi "C:/Program Files/swipl/bin/swipl.exe") (t "prolog"))))
 '(prolog-system (quote swi))
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
(load-theme 'dark-laptop t t)
(enable-theme 'dark-laptop)

;; ----------------------------------------------------------------------
;; @ initial-frame
(setq initial-frame-alist
      (append (list
	       '(alpha . 80)
	       '(width . 82)                ;; フレームの幅
	       '(height . 48)                ;; フレームの高さ
	       '(top . 0)                    ;; Y 表示位置
	       '(left . 0)                ;; X 表示位置
               initial-frame-alist)))
(setq default-frame-alist initial-frame-alist)

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
;; haskell-mode
;; ghc-mod
(add-to-list 'exec-path "C:\\Program Files\\Haskell\\bin")
;; auto-complete
(require 'auto-complete-config)
(add-to-list 'ac-sources 'ac-source-ghc-mod)

;;==========================================================================
;; coq-mode
(load "~/.emacs.d/ProofGeneral-4.2/generic/proof-site.elc")
(add-to-list 'exec-path "C:/Program Files (x86)/Coq/bin")


(provide 'init)
;;; init.el ends here

