#! /bin/bash

set -ev

DIR=`pwd`;

if [ -z "$NO_STD" ]; then
    cd "$DIR/alga" && cargo build --verbose;
    cd "$DIR/alga_derive" && cargo build --verbose;
    if [ "$TRAVIS_RUST_VERSION" == "nightly" ]; then
        cd "$DIR/alga_derive_test" && cargo build --verbose;
    fi
else
    rustup component add rust-src;
    cargo install xargo;
    cd "$DIR/alga" && xargo build --verbose --no-default-features --target=x86_64-unknown-linux-gnu;
    cd "$DIR/alga_derive" && xargo build --verbose --no-default-features --target=x86_64-unknown-linux-gnu;
fi