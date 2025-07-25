# Cấu hình Neovim của tôi

Đây là cấu hình Neovim cá nhân của tôi. Nó được thiết kế để cung cấp một môi trường phát triển mạnh mẽ và hiệu quả.

## Hướng dẫn sử dụng

### 1. Clone Repository

Để sử dụng cấu hình này, bạn có thể clone repository vào thư mục cấu hình Neovim của mình:

```bash
git clone https://github.com/your-username/your-neovim-config.git ~/.config/nvim
```
*(Lưu ý: Thay `https://github.com/your-username/your-neovim-config.git` bằng URL thực tế của repository này.)*

Nếu bạn đã có một thư mục `~/.config/nvim` hiện có, hãy sao lưu nó trước khi clone:

```bash
mv ~/.config/nvim ~/.config/nvim_backup
git clone https://github.com/your-username/your-neovim-config.git ~/.config/nvim
```

### 2. Cài đặt Neovim

Đảm bảo bạn đã cài đặt Neovim phiên bản mới nhất (khuyến nghị v0.9.0 trở lên). Bạn có thể tìm hướng dẫn cài đặt tại [trang chủ Neovim](https://neovim.io/doc/user/install.html).

### 3. Cài đặt các Dependencies cần thiết

Cấu hình này có thể yêu cầu một số dependencies bên ngoài như `ripgrep`, `fd`, `nodejs`, `npm` (cho LSP và các plugin khác). Hãy đảm bảo bạn đã cài đặt chúng trên hệ thống của mình.

Ví dụ trên Ubuntu/Debian:

```bash
sudo apt install ripgrep fd-find nodejs npm
```

### 4. Khởi động Neovim và cài đặt Plugin

Sau khi clone repository và cài đặt các dependencies, hãy khởi động Neovim:

```bash
nvim
```

Khi Neovim khởi động lần đầu, nó sẽ tự động cài đặt các plugin được định nghĩa trong cấu hình (sử dụng `lazy.nvim`). Quá trình này có thể mất một chút thời gian tùy thuộc vào tốc độ mạng của bạn.

Nếu các plugin không tự động cài đặt, bạn có thể chạy lệnh sau bên trong Neovim:

```
:Lazy sync
```

### 5. Cấu hình và Tùy chỉnh

Các file cấu hình chính nằm trong thư mục `lua/`.

- `lua/config/base.lua`: Cài đặt cơ bản của Neovim.
- `lua/config/map.lua`: Các keymap tùy chỉnh.
- `lua/config/lazy.lua`: Cấu hình cho trình quản lý plugin `lazy.nvim`.
- `lua/plugins/`: Chứa các file cấu hình riêng lẻ cho từng plugin.

Bạn có thể chỉnh sửa các file này để phù hợp với nhu cầu của mình.

### 6. Các phím tắt hữu ích

Dưới đây là một số phím tắt (keymap) phổ biến được cấu hình:

- `<leader>pv`: Mở/đóng NvimTree (quản lý cây thư mục).
- `<leader>ff`: Tìm kiếm file bằng Telescope.
- `<leader>fg`: Tìm kiếm chuỗi trong file bằng Telescope.
- `<leader>gs`: Mở Lazygit.
- `<leader>th`: Chuyển đổi theme.
- `<leader>b`: Chuyển đổi buffer.

*(Lưu ý: `<leader>` mặc định là phím `Space`.)*

## Hỗ trợ

Nếu bạn gặp bất kỳ vấn đề nào, vui lòng mở một issue trên repository này.