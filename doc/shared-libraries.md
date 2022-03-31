Shared Libraries
================

## xnetconsensus

The purpose of this library is to make the verification functionality that is critical to xnet's consensus available to other applications, e.g. to language bindings.

### API

The interface is defined in the C header `xnetconsensus.h` located in `src/script/xnetconsensus.h`.

#### Version

`xnetconsensus_version` returns an `unsigned int` with the API version *(currently `1`)*.

#### Script Validation

`xnetconsensus_verify_script` returns an `int` with the status of the verification. It will be `1` if the input script correctly spends the previous output `scriptPubKey`.

##### Parameters
- `const unsigned char *scriptPubKey` - The previous output script that encumbers spending.
- `unsigned int scriptPubKeyLen` - The number of bytes for the `scriptPubKey`.
- `const unsigned char *txTo` - The transaction with the input that is spending the previous output.
- `unsigned int txToLen` - The number of bytes for the `txTo`.
- `unsigned int nIn` - The index of the input in `txTo` that spends the `scriptPubKey`.
- `unsigned int flags` - The script validation flags *(see below)*.
- `xnetconsensus_error* err` - Will have the error/success code for the operation *(see below)*.

##### Script Flags
- `xnetconsensus_SCRIPT_FLAGS_VERIFY_NONE`
- `xnetconsensus_SCRIPT_FLAGS_VERIFY_P2SH` - Evaluate P2SH ([BIP16](https://github.com/xnet/bips/blob/master/bip-0016.mediawiki)) subscripts
- `xnetconsensus_SCRIPT_FLAGS_VERIFY_DERSIG` - Enforce strict DER ([BIP66](https://github.com/xnet/bips/blob/master/bip-0066.mediawiki)) compliance
- `xnetconsensus_SCRIPT_FLAGS_VERIFY_NULLDUMMY` - Enforce NULLDUMMY ([BIP147](https://github.com/xnet/bips/blob/master/bip-0147.mediawiki))
- `xnetconsensus_SCRIPT_FLAGS_VERIFY_CHECKLOCKTIMEVERIFY` - Enable CHECKLOCKTIMEVERIFY ([BIP65](https://github.com/xnet/bips/blob/master/bip-0065.mediawiki))
- `xnetconsensus_SCRIPT_FLAGS_VERIFY_CHECKSEQUENCEVERIFY` - Enable CHECKSEQUENCEVERIFY ([BIP112](https://github.com/xnet/bips/blob/master/bip-0112.mediawiki))
- `xnetconsensus_SCRIPT_FLAGS_VERIFY_WITNESS` - Enable WITNESS ([BIP141](https://github.com/xnet/bips/blob/master/bip-0141.mediawiki))

##### Errors
- `xnetconsensus_ERR_OK` - No errors with input parameters *(see the return value of `xnetconsensus_verify_script` for the verification status)*
- `xnetconsensus_ERR_TX_INDEX` - An invalid index for `txTo`
- `xnetconsensus_ERR_TX_SIZE_MISMATCH` - `txToLen` did not match with the size of `txTo`
- `xnetconsensus_ERR_DESERIALIZE` - An error deserializing `txTo`
- `xnetconsensus_ERR_AMOUNT_REQUIRED` - Input amount is required if WITNESS is used

### Example Implementations
- [Nxnet](https://github.com/NicolasDorier/Nxnet/blob/master/Nxnet/Script.cs#L814) (.NET Bindings)
- [node-libxnetconsensus](https://github.com/bitpay/node-libxnetconsensus) (Node.js Bindings)
- [java-libxnetconsensus](https://github.com/dexX7/java-libxnetconsensus) (Java Bindings)
- [xnetconsensus-php](https://github.com/Bit-Wasp/xnetconsensus-php) (PHP Bindings)
