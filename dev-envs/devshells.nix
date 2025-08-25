{ pkgs, lib }:
let
  common = with pkgs; [ git just pre-commit tree ];

  goTools = with pkgs; [ go gopls delve golangci-lint go-tools gofumpt ];
  tsTools = with pkgs; [
    nodejs_24 nodejs_22 nodePackages.npm nodePackages.pnpm nodePackages.typescript
    nodePackages.typescript-language-server
    nodePackages.eslint nodePackages.prettier
  ];
  cppTools = with pkgs; [
    gcc clang clang-tools cmake meson ninja pkg-config gdb lldb ccache
  ];
in {
  go = pkgs.mkShell {
    packages = common ++ goTools;
    GOBIN = "$PWD/.gobin";
    GOPATH = "$PWD/.gopath";
  };

  ts = pkgs.mkShell {
    packages = common ++ tsTools;
  };

  cpp = pkgs.mkShell {
    packages = common ++ cppTools;
    CC = "gcc"; CXX = "g++";
  };

  all = pkgs.mkShell {
    packages = common ++ goTools ++ tsTools ++ cppTools;
  };
}

