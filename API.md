# Protocol Documentation
<a name="top"></a>

## Table of Contents

- [lspd.proto](#lspd-proto)
    - [ChannelInformationReply](#lspd-ChannelInformationReply)
    - [ChannelInformationRequest](#lspd-ChannelInformationRequest)
    - [Encrypted](#lspd-Encrypted)
    - [GetTimeLockDeltaReply](#lspd-GetTimeLockDeltaReply)
    - [GetTimeLockDeltaRequest](#lspd-GetTimeLockDeltaRequest)
    - [IntegrityNonceReply](#lspd-IntegrityNonceReply)
    - [IntegrityNonceRequest](#lspd-IntegrityNonceRequest)
    - [IntegrityVerifyReply](#lspd-IntegrityVerifyReply)
    - [IntegrityVerifyRequest](#lspd-IntegrityVerifyRequest)
    - [NodePair](#lspd-NodePair)
    - [OpenChannelReply](#lspd-OpenChannelReply)
    - [OpenChannelRequest](#lspd-OpenChannelRequest)
    - [PaymentInformation](#lspd-PaymentInformation)
    - [PingReply](#lspd-PingReply)
    - [PingRequest](#lspd-PingRequest)
    - [QueryRoutesRequest](#lspd-QueryRoutesRequest)
    - [ReceiveSubmarineReply](#lspd-ReceiveSubmarineReply)
    - [ReceiveSubmarineRequest](#lspd-ReceiveSubmarineRequest)
    - [RegisterPaymentReply](#lspd-RegisterPaymentReply)
    - [RegisterPaymentRequest](#lspd-RegisterPaymentRequest)
    - [RegisterSubmarineReply](#lspd-RegisterSubmarineReply)
    - [RegisterSubmarineRequest](#lspd-RegisterSubmarineRequest)
    - [RegisterUserInfoReply](#lspd-RegisterUserInfoReply)
    - [RegisterUserInfoRequest](#lspd-RegisterUserInfoRequest)
    - [ReportReply](#lspd-ReportReply)
    - [ReportRequest](#lspd-ReportRequest)
  
    - [IntegrityResult](#lspd-IntegrityResult)
    - [ReportRequest.ReportLevel](#lspd-ReportRequest-ReportLevel)
  
    - [LightningService](#lspd-LightningService)
  
- [Scalar Value Types](#scalar-value-types)



<a name="lspd-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## lspd.proto



<a name="lspd-ChannelInformationReply"></a>

### ChannelInformationReply



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| name | [string](#string) |  | The name of of LSP |
| pubkey | [string](#string) |  | The identity pubkey of the Lightning node |
| host | [string](#string) |  | The network location of the lightning node, e.g. `12.34.56.78:9012` or / `localhost:10011` |
| base_fee_msat | [int64](#int64) |  | The base fee charged regardless of the number of milli-satoshis sent. |
| fee_rate | [double](#double) |  | The effective fee rate in milli-satoshis. The precision of this value goes / up to 6 decimal places, so 1e-6. |
| time_lock_delta | [uint32](#uint32) |  | The required timelock delta for HTLCs forwarded over the channel. |
| channel_fee_permyriad | [int64](#int64) |  | The feerate per 10000 sats(1/100 percent) |
| lsp_pubkey | [bytes](#bytes) |  | LSP pubkey(not LN node_id). / It uses for encoding `Encrypted.data` from remote peer. |
| max_inactive_duration | [int64](#int64) |  | The channel can be closed if not used this duration in seconds. |
| channel_minimum_fee_msat | [int64](#int64) |  | The minimum fee msat for On-The-Fly channel creation and Submarine Swap(not routing fee). |
| version | [string](#string) |  | LSP version |
| swap_script_version | [int32](#int32) |  | Submarine Script version |






<a name="lspd-ChannelInformationRequest"></a>

### ChannelInformationRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| pubkey | [string](#string) |  | The identity pubkey of the Lightning node |






<a name="lspd-Encrypted"></a>

### Encrypted



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| data | [bytes](#bytes) |  | The encrypted data by LSP pubkey |






<a name="lspd-GetTimeLockDeltaReply"></a>

### GetTimeLockDeltaReply



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| time_lock_delta_hub | [uint32](#uint32) |  | time_lock_delta value from hub routing policy |
| time_lock_delta_another | [uint32](#uint32) |  | time_lock_delta value from another node routing policy |






<a name="lspd-GetTimeLockDeltaRequest"></a>

### GetTimeLockDeltaRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| chan_id | [uint64](#uint64) |  | The ID to request channel time_lock_delta value. |






<a name="lspd-IntegrityNonceReply"></a>

### IntegrityNonceReply



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| nonce | [string](#string) |  | The nonce for Integrity API |






<a name="lspd-IntegrityNonceRequest"></a>

### IntegrityNonceRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| encrypt_pubkey | [bytes](#bytes) |  | The pubkey to encrypt response data(`QueryRouteReply`) |
| pubkey | [bytes](#bytes) |  | The identity pubkey of the Lightning node |
| id | [string](#string) |  | The model -dependent ID |






<a name="lspd-IntegrityVerifyReply"></a>

### IntegrityVerifyReply



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| result | [IntegrityResult](#lspd-IntegrityResult) |  |  |






<a name="lspd-IntegrityVerifyRequest"></a>

### IntegrityVerifyRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| pubkey | [bytes](#bytes) |  | The identity pubkey of the Lightning node |
| token | [string](#string) |  | Integrity token(empty string: return previous result if exist) |
| id | [string](#string) |  | The model -dependent ID |






<a name="lspd-NodePair"></a>

### NodePair



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| from | [bytes](#bytes) |  |  |
| to | [bytes](#bytes) |  |  |






<a name="lspd-OpenChannelReply"></a>

### OpenChannelReply



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| tx_hash | [string](#string) |  | The transaction hash |
| output_index | [uint32](#uint32) |  | The output index |






<a name="lspd-OpenChannelRequest"></a>

### OpenChannelRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| pubkey | [string](#string) |  | The identity pubkey of the Lightning node |






<a name="lspd-PaymentInformation"></a>

### PaymentInformation



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| payment_hash | [bytes](#bytes) |  | The payment hash to intercept forwarding HTLC |
| payment_secret | [bytes](#bytes) |  | The payment address. / An optional payment addr to be included within the last hop of the route. |
| destination | [bytes](#bytes) |  | The payee LND node_id |
| incoming_amount_msat | [int64](#int64) |  | The incoming amount to LSP&#39;s LN node |
| outgoing_amount_msat | [int64](#int64) |  | The outgoing amount from LSP&#39;s LN node to payee |






<a name="lspd-PingReply"></a>

### PingReply



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| nonce | [int32](#int32) |  |  |






<a name="lspd-PingRequest"></a>

### PingRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| nonce | [int32](#int32) |  |  |






<a name="lspd-QueryRoutesRequest"></a>

### QueryRoutesRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| encrypt_pubkey | [bytes](#bytes) |  | The pubkey to encrypt response data(`QueryRouteReply`) |
| invoice | [string](#string) |  | The LN invoice to send after open channel |
| ignored_nodes | [bytes](#bytes) | repeated | The nodes to ignore routing |
| ignored_pairs | [NodePair](#lspd-NodePair) | repeated | The pairs to ignore routing |
| amount | [int64](#int64) |  | Specify amount if invoice not have amount(0: use `invoice` amount) |






<a name="lspd-ReceiveSubmarineReply"></a>

### ReceiveSubmarineReply







<a name="lspd-ReceiveSubmarineRequest"></a>

### ReceiveSubmarineRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| payment_hash | [bytes](#bytes) |  | THe payment_hash to process Submarine Swap |
| invoice | [string](#string) |  | The LN invoice to send after open channel |






<a name="lspd-RegisterPaymentReply"></a>

### RegisterPaymentReply







<a name="lspd-RegisterPaymentRequest"></a>

### RegisterPaymentRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| blob | [bytes](#bytes) |  | The encrypted `PaymentInformation` by LSP pubkey |






<a name="lspd-RegisterSubmarineReply"></a>

### RegisterSubmarineReply



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| script_address | [string](#string) |  | swap address |
| htlc_pubkey | [bytes](#bytes) |  | The HTLC pubkey for swap script |






<a name="lspd-RegisterSubmarineRequest"></a>

### RegisterSubmarineRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| encrypt_pubkey | [bytes](#bytes) |  | The pubkey to encrypt response data(`RegisterSubmarineReply`) |
| payment_hash | [bytes](#bytes) |  | THe payment_hash for swap script and LN invoice |
| repay_pubkey | [bytes](#bytes) |  | The repayment pubkey for swap script |
| destination | [bytes](#bytes) |  | The payee LN node_id |
| swap_script_version | [int32](#int32) |  | Supported submarine Script version |






<a name="lspd-RegisterUserInfoReply"></a>

### RegisterUserInfoReply







<a name="lspd-RegisterUserInfoRequest"></a>

### RegisterUserInfoRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| mail_address | [string](#string) |  | mail address |






<a name="lspd-ReportReply"></a>

### ReportReply







<a name="lspd-ReportRequest"></a>

### ReportRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| category | [string](#string) |  | category |
| level | [ReportRequest.ReportLevel](#lspd-ReportRequest-ReportLevel) |  |  |
| message | [string](#string) |  | message |





 


<a name="lspd-IntegrityResult"></a>

### IntegrityResult


| Name | Number | Description |
| ---- | ------ | ----------- |
| INTEGRITYRESULT_NONE | 0 |  |
| INTEGRITYRESULT_OK | 1 |  |
| INTEGRITYRESULT_NG | 2 |  |



<a name="lspd-ReportRequest-ReportLevel"></a>

### ReportRequest.ReportLevel
level

| Name | Number | Description |
| ---- | ------ | ----------- |
| REPORTLEVEL_NORMAL | 0 |  |
| REPORTLEVEL_NOTIFY | 1 |  |
| REPORTLEVEL_ALERT | 2 |  |


 

 


<a name="lspd-LightningService"></a>

### LightningService


| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| Ping | [PingRequest](#lspd-PingRequest) | [PingReply](#lspd-PingReply) | Ping/Pong |
| ChannelInformation | [ChannelInformationRequest](#lspd-ChannelInformationRequest) | [ChannelInformationReply](#lspd-ChannelInformationReply) | Get LSP information |
| OpenChannel | [OpenChannelRequest](#lspd-OpenChannelRequest) | [OpenChannelReply](#lspd-OpenChannelReply) | Open private zero-conf channel |
| RegisterPayment | [RegisterPaymentRequest](#lspd-RegisterPaymentRequest) | [RegisterPaymentReply](#lspd-RegisterPaymentReply) | [on-the-fly]Register a on-the-fly channel creation information |
| RegisterSubmarine | [Encrypted](#lspd-Encrypted) | [Encrypted](#lspd-Encrypted) | [submarine swap]Register a Submarine Swap information |
| ReceiveSubmarine | [Encrypted](#lspd-Encrypted) | [ReceiveSubmarineReply](#lspd-ReceiveSubmarineReply) | [submarine swap]Request starting Submarine Swap |
| QueryRoutes | [Encrypted](#lspd-Encrypted) | [Encrypted](#lspd-Encrypted) | Request query routes |
| GetTimeLockDelta | [GetTimeLockDeltaRequest](#lspd-GetTimeLockDeltaRequest) | [GetTimeLockDeltaReply](#lspd-GetTimeLockDeltaReply) | Request time_lock_delta obtained from GetChanInfo() result. (time_lock_delta is the same as cltv_expiry_delta in channel_update message.) If GetChanInfo() result doesn&#39;t contain hub&#39;s lnrpc.RoutingPolicy, return error. [GetChanInfo](https://lightning.engineering/api-docs/api/lnd/lightning/get-chan-info) |
| RegisterUserInfo | [Encrypted](#lspd-Encrypted) | [RegisterUserInfoReply](#lspd-RegisterUserInfoReply) | Register user mail address |
| ReportMessage | [Encrypted](#lspd-Encrypted) | [ReportReply](#lspd-ReportReply) | Report message |
| IntegrityNonce | [Encrypted](#lspd-Encrypted) | [Encrypted](#lspd-Encrypted) | Integrity get nonce message |
| IntegrityVerify | [Encrypted](#lspd-Encrypted) | [IntegrityVerifyReply](#lspd-IntegrityVerifyReply) | Integrity Verify message |

 



## Scalar Value Types

| .proto Type | Notes | C++ | Java | Python | Go | C# | PHP | Ruby |
| ----------- | ----- | --- | ---- | ------ | -- | -- | --- | ---- |
| <a name="double" /> double |  | double | double | float | float64 | double | float | Float |
| <a name="float" /> float |  | float | float | float | float32 | float | float | Float |
| <a name="int32" /> int32 | Uses variable-length encoding. Inefficient for encoding negative numbers – if your field is likely to have negative values, use sint32 instead. | int32 | int | int | int32 | int | integer | Bignum or Fixnum (as required) |
| <a name="int64" /> int64 | Uses variable-length encoding. Inefficient for encoding negative numbers – if your field is likely to have negative values, use sint64 instead. | int64 | long | int/long | int64 | long | integer/string | Bignum |
| <a name="uint32" /> uint32 | Uses variable-length encoding. | uint32 | int | int/long | uint32 | uint | integer | Bignum or Fixnum (as required) |
| <a name="uint64" /> uint64 | Uses variable-length encoding. | uint64 | long | int/long | uint64 | ulong | integer/string | Bignum or Fixnum (as required) |
| <a name="sint32" /> sint32 | Uses variable-length encoding. Signed int value. These more efficiently encode negative numbers than regular int32s. | int32 | int | int | int32 | int | integer | Bignum or Fixnum (as required) |
| <a name="sint64" /> sint64 | Uses variable-length encoding. Signed int value. These more efficiently encode negative numbers than regular int64s. | int64 | long | int/long | int64 | long | integer/string | Bignum |
| <a name="fixed32" /> fixed32 | Always four bytes. More efficient than uint32 if values are often greater than 2^28. | uint32 | int | int | uint32 | uint | integer | Bignum or Fixnum (as required) |
| <a name="fixed64" /> fixed64 | Always eight bytes. More efficient than uint64 if values are often greater than 2^56. | uint64 | long | int/long | uint64 | ulong | integer/string | Bignum |
| <a name="sfixed32" /> sfixed32 | Always four bytes. | int32 | int | int | int32 | int | integer | Bignum or Fixnum (as required) |
| <a name="sfixed64" /> sfixed64 | Always eight bytes. | int64 | long | int/long | int64 | long | integer/string | Bignum |
| <a name="bool" /> bool |  | bool | boolean | boolean | bool | bool | boolean | TrueClass/FalseClass |
| <a name="string" /> string | A string must always contain UTF-8 encoded or 7-bit ASCII text. | string | String | str/unicode | string | string | string | String (UTF-8) |
| <a name="bytes" /> bytes | May contain any arbitrary sequence of bytes. | string | ByteString | str | []byte | ByteString | string | String (ASCII-8BIT) |

