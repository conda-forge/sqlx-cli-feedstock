@echo on

set CARGO_PROFILE_RELEASE_STRIP=symbols
set CARGO_PROFILE_RELEASE_LTO=fat

:: build
cargo install --locked ^
    --root "%PREFIX%" ^
    --path sqlx-cli ^
    || exit 1

:: dump licenses
cargo-bundle-licenses ^
    --bins ^
    --no-track ^
    --format yaml ^
    --output "%SRC_DIR%\THIRDPARTY.yml" ^
    || exit 1
