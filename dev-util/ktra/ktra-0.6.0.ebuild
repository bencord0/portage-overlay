# Copyright 2017-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.3.1

EAPI=7

CRATES="
addr2line-0.17.0
adler-1.0.2
alloc-no-stdlib-2.0.3
alloc-stdlib-0.2.1
ansi_term-0.12.1
anyhow-1.0.57
arrayref-0.3.6
arrayvec-0.5.2
async-compression-0.3.14
async-trait-0.1.56
atty-0.2.14
autocfg-1.1.0
backtrace-0.3.65
base64-0.11.0
base64-0.12.3
base64-0.13.0
bitflags-1.3.2
blake2b_simd-0.5.11
block-buffer-0.10.2
block-buffer-0.9.0
brotli-3.3.4
brotli-decompressor-2.3.2
bson-1.2.4
buf_redux-0.8.4
bumpalo-3.10.0
byteorder-1.4.3
bytes-0.5.6
bytes-1.1.0
cc-1.0.73
cfg-if-0.1.10
cfg-if-1.0.0
chrono-0.4.19
clap-2.34.0
combine-4.6.4
constant_time_eq-0.1.5
core-foundation-0.9.3
core-foundation-sys-0.8.3
cpufeatures-0.2.2
crc32fast-1.3.2
crossbeam-epoch-0.9.8
crossbeam-utils-0.8.8
crypto-common-0.1.3
crypto-mac-0.11.1
darling-0.13.4
darling_core-0.13.4
darling_macro-0.13.4
derivative-2.2.0
digest-0.10.3
digest-0.9.0
dtoa-0.4.8
encoding_rs-0.8.31
enum-as-inner-0.3.4
err-derive-0.2.4
fastrand-1.7.0
flate2-1.0.24
fnv-1.0.7
foreign-types-0.3.2
foreign-types-shared-0.1.1
form_urlencoded-1.0.1
fs2-0.4.3
fuchsia-zircon-0.3.3
fuchsia-zircon-sys-0.3.3
futures-0.3.21
futures-channel-0.3.21
futures-core-0.3.21
futures-executor-0.3.21
futures-io-0.3.21
futures-macro-0.3.21
futures-sink-0.3.21
futures-task-0.3.21
futures-util-0.3.21
fxhash-0.2.1
generic-array-0.14.5
getrandom-0.1.16
getrandom-0.2.6
gimli-0.26.1
git2-0.13.25
h2-0.2.7
h2-0.3.13
hashbrown-0.11.2
headers-0.3.7
headers-core-0.2.0
heck-0.4.0
hermit-abi-0.1.19
hex-0.4.3
hmac-0.11.0
hostname-0.3.1
http-0.2.7
http-body-0.3.1
http-body-0.4.5
httparse-1.7.1
httpdate-0.3.2
httpdate-1.0.2
hyper-0.13.10
hyper-0.14.19
hyper-rustls-0.21.0
hyper-tls-0.5.0
ident_case-1.0.1
idna-0.2.3
indexmap-1.8.2
instant-0.1.12
iovec-0.1.4
ipconfig-0.2.2
ipnet-2.5.0
itoa-0.4.8
itoa-1.0.2
jobserver-0.1.24
js-sys-0.3.57
kernel32-sys-0.2.2
lazy_static-1.4.0
libc-0.2.126
libgit2-sys-0.12.26+1.3.0
libssh2-sys-0.2.23
libz-sys-1.1.8
linked-hash-map-0.5.4
lock_api-0.4.7
log-0.4.17
lru-cache-0.1.2
match_cfg-0.1.0
matchers-0.0.1
matches-0.1.9
md-5-0.9.1
memchr-2.5.0
memoffset-0.6.5
mime-0.3.16
mime_guess-2.0.4
miniz_oxide-0.5.3
mio-0.6.23
mio-0.8.3
miow-0.2.2
mongodb-1.2.5
multipart-0.18.0
native-tls-0.2.10
net2-0.2.37
num-integer-0.1.45
num-traits-0.2.15
num_cpus-1.13.1
object-0.28.4
once_cell-1.12.0
opaque-debug-0.3.0
openssl-0.10.40
openssl-macros-0.1.0
openssl-probe-0.1.5
openssl-sys-0.9.74
os_info-3.4.0
parking_lot-0.11.2
parking_lot_core-0.8.5
pbkdf2-0.8.0
percent-encoding-2.1.0
pest-2.1.3
pin-project-1.0.10
pin-project-internal-1.0.10
pin-project-lite-0.1.12
pin-project-lite-0.2.9
pin-utils-0.1.0
pkg-config-0.3.25
ppv-lite86-0.2.16
proc-macro-error-1.0.4
proc-macro-error-attr-1.0.4
proc-macro2-1.0.39
quick-error-1.2.3
quote-1.0.18
rand-0.7.3
rand-0.8.5
rand_chacha-0.2.2
rand_chacha-0.3.1
rand_core-0.5.1
rand_core-0.6.3
rand_hc-0.2.0
rand_pcg-0.2.1
redis-0.19.0
redox_syscall-0.2.13
regex-1.5.6
regex-automata-0.1.10
regex-syntax-0.6.26
remove_dir_all-0.5.3
reqwest-0.10.10
reqwest-0.11.10
resolv-conf-0.7.0
ring-0.16.20
rust-argon2-0.8.3
rustc-demangle-0.1.21
rustls-0.17.0
rustls-0.18.1
rustls-pemfile-0.2.1
rustversion-1.0.6
ryu-1.0.10
safemem-0.3.3
schannel-0.1.20
scoped-tls-1.0.0
scopeguard-1.1.0
sct-0.6.1
security-framework-2.6.1
security-framework-sys-2.6.1
semver-0.11.0
semver-parser-0.10.2
serde-1.0.137
serde_bytes-0.11.6
serde_derive-1.0.137
serde_json-1.0.81
serde_urlencoded-0.7.1
serde_with-1.14.0
serde_with_macros-1.5.2
sha-1-0.10.0
sha-1-0.9.8
sha1-0.6.1
sha1_smol-1.0.0
sha2-0.9.9
sharded-slab-0.1.4
slab-0.4.6
sled-0.34.7
smallvec-1.8.0
socket2-0.3.19
socket2-0.4.4
spin-0.5.2
stringprep-0.1.2
strsim-0.10.0
strsim-0.8.0
subtle-2.4.1
syn-1.0.96
synstructure-0.12.6
take_mut-0.2.2
tempfile-3.3.0
textwrap-0.11.0
thiserror-1.0.31
thiserror-impl-1.0.31
thread_local-1.1.4
time-0.1.43
tinyvec-1.6.0
tinyvec_macros-0.1.0
tokio-0.2.25
tokio-1.19.0
tokio-macros-0.2.6
tokio-macros-1.7.0
tokio-native-tls-0.3.0
tokio-rustls-0.13.1
tokio-rustls-0.14.1
tokio-stream-0.1.8
tokio-tungstenite-0.15.0
tokio-util-0.3.1
tokio-util-0.6.10
tokio-util-0.7.2
toml-0.5.9
tower-service-0.3.1
tracing-0.1.34
tracing-attributes-0.1.21
tracing-core-0.1.26
tracing-futures-0.2.5
tracing-log-0.1.3
tracing-serde-0.1.3
tracing-subscriber-0.2.25
trust-dns-proto-0.19.7
trust-dns-resolver-0.19.7
try-lock-0.2.3
tungstenite-0.14.0
twoway-0.1.8
typed-builder-0.4.1
typenum-1.15.0
ucd-trie-0.1.3
unicase-2.6.0
unicode-bidi-0.3.8
unicode-ident-1.0.0
unicode-normalization-0.1.19
unicode-width-0.1.9
unicode-xid-0.2.3
untrusted-0.7.1
url-2.2.2
utf-8-0.7.6
uuid-0.8.2
valuable-0.1.0
vcpkg-0.2.15
vec_map-0.8.2
version_check-0.9.4
want-0.3.0
warp-0.3.2
wasi-0.10.2+wasi-snapshot-preview1
wasi-0.11.0+wasi-snapshot-preview1
wasi-0.9.0+wasi-snapshot-preview1
wasm-bindgen-0.2.80
wasm-bindgen-backend-0.2.80
wasm-bindgen-futures-0.4.30
wasm-bindgen-macro-0.2.80
wasm-bindgen-macro-support-0.2.80
wasm-bindgen-shared-0.2.80
web-sys-0.3.57
webpki-0.21.4
webpki-roots-0.20.0
webpki-roots-0.21.1
widestring-0.4.3
winapi-0.2.8
winapi-0.3.9
winapi-build-0.1.1
winapi-i686-pc-windows-gnu-0.4.0
winapi-x86_64-pc-windows-gnu-0.4.0
windows-sys-0.36.1
windows_aarch64_msvc-0.36.1
windows_i686_gnu-0.36.1
windows_i686_msvc-0.36.1
windows_x86_64_gnu-0.36.1
windows_x86_64_msvc-0.36.1
winreg-0.10.1
winreg-0.6.2
winreg-0.7.0
ws2_32-sys-0.2.1
"

inherit cargo

DESCRIPTION="Your Little Cargo Registry"
# Double check the homepage as the cargo_metadata crate
# does not provide this value so instead repository is used
HOMEPAGE="https://github.com/moriturus/ktra"
SRC_URI="
	$(cargo_crate_uris ${CRATES})
	https://github.com/moriturus/ktra/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
"
RESTRICT="mirror"
# License set may be more restrictive as OR is not respected
# use cargo-license for a more accurate license picture
LICENSE="(Apache-2.0 0BSD Apache-2.0 Apache-2.0 WITH LLVM-exception BSD-2-Clause BSD-3-Clause BSL-1.0 CC0-1.0 ISC MIT MIT) MPL-2.0 Unlicense Zlib"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	virtual/pkgconfig
"
RDEPEND=""
