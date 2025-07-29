# Cấu hình Neovim cá nhân

Đây là cấu hình Neovim cá nhân của tôi, được thiết kế để mang lại trải nghiệm phát triển hiện đại, nhanh chóng và hiệu quả. Cấu hình này sử dụng `lazy.nvim` để quản lý plugin và được xây dựng với mục tiêu dễ dàng cài đặt và sử dụng, ngay cả trên một máy tính hoàn toàn mới.

![Ảnh chụp màn hình Neovim của bạn ở đây](https://placeholder.com/screenshot.png)
*(Mẹo: bạn có thể chụp ảnh màn hình Neovim của mình và thay thế liên kết ở trên để làm cho README này đẹp hơn!)*

## Mục lục

- [Triết lý](#triết-lý)
- [Yêu cầu hệ thống](#yêu-cầu-hệ-thống)
- [Hướng dẫn cài đặt](#hướng-dẫn-cài-đặt)
- [Sau khi cài đặt](#sau-khi-cài-đặt)
- [Các tính năng chính và phím tắt](#các-tính-năng-chính-và-phím-tắt)
- [Gỡ rối](#gỡ-rối)

## Triết lý

- **Nhanh và nhẹ**: Sử dụng `lazy.nvim` để tải plugin theo yêu cầu, đảm bảo thời gian khởi động nhanh.
- **Hiện đại**: Tận dụng sức mạnh của LSP, Treesitter, và các công cụ hiện đại khác để có trải-nghiệm-như-IDE.
- **Dễ sử dụng**: Các phím tắt được sắp xếp hợp lý với `which-key.nvim` để bạn dễ dàng khám phá và ghi nhớ.
- **Mở rộng được**: Dễ dàng thêm hoặc xóa các plugin và tùy chỉnh cấu hình trong thư mục `lua/plugins`.

## Yêu cầu hệ thống

Trước khi bạn bắt đầu, hãy đảm bảo rằng bạn đã cài đặt tất cả các phần mềm cần thiết sau đây. Đây là bước quan trọng nhất!

1.  **Neovim**: Phiên bản `0.8.0` trở lên.
2.  **Git**: Cần thiết để sao chép cấu hình này và để `lazy.nvim` quản lý các plugin.
3.  **Nerd Font**: Rất quan trọng! Cần thiết để hiển thị các icon một cách chính xác.
    -   Truy cập [Ryanoasis Nerd Fonts](https://www.nerdfonts.com/font-downloads) để tải về.
    -   Tôi đề xuất **FiraCode Nerd Font** hoặc **JetBrainsMono Nerd Font**.
    -   Sau khi cài đặt font, **bạn phải cấu hình terminal của mình để sử dụng font này**.
4.  **Bộ công cụ xây dựng C/C++**: Cần thiết cho `nvim-treesitter`.
    -   Trên Ubuntu/Debian: `sudo apt update && sudo apt install build-essential`
    -   Trên Arch Linux: `sudo pacman -S base-devel`
    -   Trên macOS: `xcode-select --install`
5.  **Ripgrep**: Cần thiết cho Telescope để tìm kiếm văn bản trong dự án.
    -   Trên Ubuntu/Debian: `sudo apt install ripgrep`
    -   Trên Arch Linux: `sudo pacman -S ripgrep`
    -   Trên macOS: `brew install ripgrep`
6.  **Node.js và npm**: Cần thiết cho một số Language Server và plugin `markdown-preview.nvim`.
    -   Cách dễ nhất là sử dụng `nvm` (Node Version Manager) để cài đặt.

## Hướng dẫn cài đặt

Làm theo các bước sau một cách cẩn thận.

**Bước 1: Cài đặt tất cả các yêu cầu hệ thống**

Đảm bảo bạn đã hoàn thành tất cả các bước trong phần [Yêu cầu hệ thống](#yêu-cầu-hệ-thống) ở trên.

**Bước 2: Sao lưu cấu hình Neovim cũ của bạn (nếu có)**

Nếu bạn đã có cấu hình Neovim, hãy sao lưu nó:
```bash
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
```

**Bước 3: Sao chép (Clone) cấu hình này**

Sử dụng `git` để sao chép kho lưu trữ này vào đúng vị trí:
```bash
git clone https://github.com/your-username/your-nvim-repo.git ~/.config/nvim
```
*(Lưu ý: Thay thế `https://github.com/your-username/your-nvim-repo.git` bằng URL kho lưu trữ của bạn)*

**Bước 4: Khởi động Neovim**

Mở Neovim:
```bash
nvim
```
Lần đầu tiên bạn khởi động, `lazy.nvim` sẽ tự động được cài đặt và sau đó sẽ cài đặt tất cả các plugin được định cấu hình. Quá trình này có thể mất vài phút. Bạn sẽ thấy một cửa sổ hiển thị tiến trình.

Sau khi hoàn tất, hãy khởi động lại Neovim.

## Sau khi cài đặt

Cấu hình của bạn gần như đã sẵn sàng. Đây là một vài bước cuối cùng để đảm bảo mọi thứ hoạt động hoàn hảo.

1.  **Kiểm tra sức khỏe (Health Check)**
    Chạy lệnh `:checkhealth` bên trong Neovim để chẩn đoán bất kỳ sự cố tiềm ẩn nào. Nó sẽ cho bạn biết nếu thiếu bất kỳ chương trình nào.

2.  **Cài đặt Language Servers (LSP)**
    Cấu hình này sử dụng `mason.nvim` để quản lý LSP.
    -   Mở Mason bằng lệnh `:Mason`.
    -   Một cửa sổ sẽ hiện ra, liệt kê tất cả các LSP có sẵn.
    -   Di chuyển đến LSP bạn muốn cài đặt (ví dụ: `lua_ls` cho Lua, `pyright` cho Python, `tsserver` cho TypeScript) và nhấn `i` để cài đặt.

3.  **Cài đặt bộ phân tích (Parser) Tree-sitter**
    Tree-sitter đã được cấu hình để tự động cài đặt các parser cho các loại tệp phổ biến. Nếu bạn muốn cài đặt thêm, hãy chạy `:TSUpdate`.

## Các tính năng chính và phím tắt

Phím `leader` được đặt thành phím **Space**.

| Phím tắt             | Chức năng                                       | Plugin được sử dụng |
| -------------------- | ----------------------------------------------- | ------------------- |
| `<leader>pv`         | Mở/đóng cây thư mục                             | `nvim-tree.lua`     |
| `<leader>ff`         | Tìm kiếm tệp trong dự án                        | `telescope.nvim`    |
| `<leader>fg`         | Tìm kiếm văn bản trong dự án (Live Grep)        | `telescope.nvim`    |
| `<leader>fb`         | Tìm kiếm trong các buffer đang mở                | `telescope.nvim`    |
| `<leader>fh`         | Tìm kiếm trong lịch sử trợ giúp                  | `telescope.nvim`    |
| `gd`                 | Đi đến định nghĩa (Go to Definition)            | `nvim-lspconfig`    |
| `gr`                 | Xem các tham chiếu (Go to References)           | `nvim-lspconfig`    |
| `K`                  | Hiển thị tài liệu (Hover Documentation)         | `nvim-lspconfig`    |
| `<leader>ca`         | Hành động mã (Code Actions)                     | `nvim-lspconfig`    |
| `<leader>e`          | Hiển thị lỗi chẩn đoán (Diagnostics)            | `nvim-lspconfig`    |
| `<leader>gt`         | Mở terminal (lazygit)                           | `lazygit.nvim`      |
| `<leader>ot`         | Mở terminal nổi (floating)                      | `toggleterm.nvim`   |
| `<leader>` (và chờ)  | Hiển thị các phím tắt có thể có                  | `which-key.nvim`    |

## Gỡ rối

- **Icons hiển thị sai hoặc có ký tự lạ?**
  Đây gần như chắc chắn là sự cố về font. Hãy chắc chắn rằng bạn đã:
  1. Cài đặt một [Nerd Font](https://www.nerdfonts.com/).
  2. **Cấu hình terminal của bạn** (ví dụ: Windows Terminal, iTerm2, Alacritty) để **sử dụng font đó**. Đây là bước mà nhiều người bỏ qua.

- **Lệnh `:Mason` không hoạt động?**
  Chạy `:checkhealth mason` để xem có lỗi gì không. Đảm bảo `wget`, `curl`, `unzip` đã được cài đặt trên hệ thống của bạn.
