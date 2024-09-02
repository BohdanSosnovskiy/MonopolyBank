; ModuleID = 'marshal_methods.armeabi-v7a.ll'
source_filename = "marshal_methods.armeabi-v7a.ll"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [327 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [654 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 68
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 67
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 108
	i32 32687329, ; 3: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 247
	i32 34715100, ; 4: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 284
	i32 34839235, ; 5: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 48
	i32 39485524, ; 6: System.Net.WebSockets.dll => 0x25a8054 => 80
	i32 42639949, ; 7: System.Threading.Thread => 0x28aa24d => 145
	i32 66541672, ; 8: System.Diagnostics.StackTrace => 0x3f75868 => 30
	i32 67008169, ; 9: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 325
	i32 68219467, ; 10: System.Security.Cryptography.Primitives => 0x410f24b => 124
	i32 72070932, ; 11: Microsoft.Maui.Graphics.dll => 0x44bb714 => 189
	i32 82292897, ; 12: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 102
	i32 101534019, ; 13: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 266
	i32 117431740, ; 14: System.Runtime.InteropServices => 0x6ffddbc => 107
	i32 120558881, ; 15: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 266
	i32 122350210, ; 16: System.Threading.Channels.dll => 0x74aea82 => 139
	i32 134690465, ; 17: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 288
	i32 142721839, ; 18: System.Net.WebHeaderCollection => 0x881c32f => 77
	i32 149972175, ; 19: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 124
	i32 159306688, ; 20: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 21: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 221
	i32 176265551, ; 22: System.ServiceProcess => 0xa81994f => 132
	i32 182336117, ; 23: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 268
	i32 184328833, ; 24: System.ValueTuple.dll => 0xafca281 => 151
	i32 195452805, ; 25: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 322
	i32 199333315, ; 26: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 323
	i32 205061960, ; 27: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 28: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 219
	i32 220171995, ; 29: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 230216969, ; 30: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 241
	i32 230752869, ; 31: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 32: System.Linq.Parallel => 0xdcb05c4 => 59
	i32 231814094, ; 33: System.Globalization => 0xdd133ce => 42
	i32 246610117, ; 34: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 91
	i32 261689757, ; 35: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 224
	i32 266337479, ; 36: Xamarin.Google.Guava.FailureAccess.dll => 0xfdffcc7 => 283
	i32 276479776, ; 37: System.Threading.Timer.dll => 0x107abf20 => 147
	i32 278686392, ; 38: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 243
	i32 280482487, ; 39: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 240
	i32 280992041, ; 40: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 294
	i32 291076382, ; 41: System.IO.Pipes.AccessControl.dll => 0x1159791e => 54
	i32 293579439, ; 42: ExoPlayer.Dash.dll => 0x117faaaf => 195
	i32 298918909, ; 43: System.Net.Ping.dll => 0x11d123fd => 69
	i32 317674968, ; 44: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 322
	i32 318968648, ; 45: Xamarin.AndroidX.Activity.dll => 0x13031348 => 210
	i32 321597661, ; 46: System.Numerics => 0x132b30dd => 83
	i32 336156722, ; 47: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 307
	i32 342366114, ; 48: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 242
	i32 356389973, ; 49: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 306
	i32 360082299, ; 50: System.ServiceModel.Web => 0x15766b7b => 131
	i32 367780167, ; 51: System.IO.Pipes => 0x15ebe147 => 55
	i32 374914964, ; 52: System.Transactions.Local => 0x1658bf94 => 149
	i32 375677976, ; 53: System.Net.ServicePoint.dll => 0x16646418 => 74
	i32 379916513, ; 54: System.Threading.Thread.dll => 0x16a510e1 => 145
	i32 385762202, ; 55: System.Memory.dll => 0x16fe439a => 62
	i32 392610295, ; 56: System.Threading.ThreadPool.dll => 0x1766c1f7 => 146
	i32 395744057, ; 57: _Microsoft.Android.Resource.Designer => 0x17969339 => 326
	i32 403441872, ; 58: WindowsBase => 0x180c08d0 => 165
	i32 435591531, ; 59: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 318
	i32 441335492, ; 60: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 225
	i32 442565967, ; 61: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 62: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 238
	i32 451504562, ; 63: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 125
	i32 452127346, ; 64: ExoPlayer.Database.dll => 0x1af2ea72 => 196
	i32 456227837, ; 65: System.Web.HttpUtility.dll => 0x1b317bfd => 152
	i32 459347974, ; 66: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 113
	i32 465846621, ; 67: mscorlib => 0x1bc4415d => 166
	i32 469710990, ; 68: System.dll => 0x1bff388e => 164
	i32 476646585, ; 69: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 240
	i32 486930444, ; 70: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 253
	i32 498788369, ; 71: System.ObjectModel => 0x1dbae811 => 84
	i32 500358224, ; 72: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 305
	i32 503918385, ; 73: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 299
	i32 513247710, ; 74: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 183
	i32 526420162, ; 75: System.Transactions.dll => 0x1f6088c2 => 150
	i32 527452488, ; 76: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 288
	i32 530272170, ; 77: System.Linq.Queryable => 0x1f9b4faa => 60
	i32 539058512, ; 78: Microsoft.Extensions.Logging => 0x20216150 => 179
	i32 540030774, ; 79: System.IO.FileSystem.dll => 0x20303736 => 51
	i32 545304856, ; 80: System.Runtime.Extensions => 0x2080b118 => 103
	i32 546455878, ; 81: System.Runtime.Serialization.Xml => 0x20924146 => 114
	i32 549171840, ; 82: System.Globalization.Calendars => 0x20bbb280 => 40
	i32 557405415, ; 83: Jsr305Binding => 0x213954e7 => 279
	i32 569601784, ; 84: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 277
	i32 577335427, ; 85: System.Security.Cryptography.Cng => 0x22697083 => 120
	i32 592146354, ; 86: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 313
	i32 601371474, ; 87: System.IO.IsolatedStorage.dll => 0x23d83352 => 52
	i32 605376203, ; 88: System.IO.Compression.FileSystem => 0x24154ecb => 44
	i32 613668793, ; 89: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 119
	i32 626887733, ; 90: ExoPlayer.Container => 0x255d8c35 => 193
	i32 627609679, ; 91: Xamarin.AndroidX.CustomView => 0x2568904f => 230
	i32 627931235, ; 92: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 311
	i32 639843206, ; 93: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 236
	i32 643868501, ; 94: System.Net => 0x2660a755 => 81
	i32 662205335, ; 95: System.Text.Encodings.Web.dll => 0x27787397 => 136
	i32 663517072, ; 96: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 273
	i32 666292255, ; 97: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 217
	i32 672442732, ; 98: System.Collections.Concurrent => 0x2814a96c => 8
	i32 683518922, ; 99: System.Net.Security => 0x28bdabca => 73
	i32 688181140, ; 100: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 293
	i32 690569205, ; 101: System.Xml.Linq.dll => 0x29293ff5 => 155
	i32 691348768, ; 102: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 290
	i32 693804605, ; 103: System.Windows => 0x295a9e3d => 154
	i32 699345723, ; 104: System.Reflection.Emit => 0x29af2b3b => 92
	i32 700284507, ; 105: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 285
	i32 700358131, ; 106: System.IO.Compression.ZipFile => 0x29be9df3 => 45
	i32 706645707, ; 107: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 308
	i32 709557578, ; 108: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 296
	i32 720511267, ; 109: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 289
	i32 722857257, ; 110: System.Runtime.Loader.dll => 0x2b15ed29 => 109
	i32 735137430, ; 111: System.Security.SecureString.dll => 0x2bd14e96 => 129
	i32 752232764, ; 112: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 113: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 207
	i32 759454413, ; 114: System.Net.Requests => 0x2d445acd => 72
	i32 762598435, ; 115: System.IO.Pipes.dll => 0x2d745423 => 55
	i32 775507847, ; 116: System.IO.Compression => 0x2e394f87 => 46
	i32 777317022, ; 117: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 317
	i32 789151979, ; 118: Microsoft.Extensions.Options => 0x2f0980eb => 182
	i32 790371945, ; 119: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 231
	i32 804715423, ; 120: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 121: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 245
	i32 812693636, ; 122: ExoPlayer.Dash => 0x3070b884 => 195
	i32 823281589, ; 123: System.Private.Uri.dll => 0x311247b5 => 86
	i32 830298997, ; 124: System.IO.Compression.Brotli => 0x317d5b75 => 43
	i32 832635846, ; 125: System.Xml.XPath.dll => 0x31a103c6 => 160
	i32 834051424, ; 126: System.Net.Quic => 0x31b69d60 => 71
	i32 843511501, ; 127: Xamarin.AndroidX.Print => 0x3246f6cd => 259
	i32 873119928, ; 128: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 129: System.Globalization.dll => 0x34505120 => 42
	i32 878954865, ; 130: System.Net.Http.Json => 0x3463c971 => 63
	i32 904024072, ; 131: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 911108515, ; 132: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 53
	i32 915551335, ; 133: ExoPlayer.Ext.MediaSession => 0x36923467 => 201
	i32 926902833, ; 134: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 320
	i32 928116545, ; 135: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 284
	i32 939704684, ; 136: ExoPlayer.Extractor => 0x3802c16c => 199
	i32 952186615, ; 137: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 105
	i32 956575887, ; 138: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 289
	i32 966729478, ; 139: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 280
	i32 967690846, ; 140: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 242
	i32 975236339, ; 141: System.Diagnostics.Tracing => 0x3a20ecf3 => 34
	i32 975874589, ; 142: System.Xml.XDocument => 0x3a2aaa1d => 158
	i32 986514023, ; 143: System.Private.DataContractSerialization.dll => 0x3acd0267 => 85
	i32 987214855, ; 144: System.Diagnostics.Tools => 0x3ad7b407 => 32
	i32 992768348, ; 145: System.Collections.dll => 0x3b2c715c => 12
	i32 994442037, ; 146: System.IO.FileSystem => 0x3b45fb35 => 51
	i32 1001831731, ; 147: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 56
	i32 1012816738, ; 148: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 263
	i32 1019214401, ; 149: System.Drawing => 0x3cbffa41 => 36
	i32 1028013380, ; 150: ExoPlayer.UI.dll => 0x3d463d44 => 205
	i32 1028951442, ; 151: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 178
	i32 1029334545, ; 152: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 295
	i32 1031528504, ; 153: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 281
	i32 1035644815, ; 154: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 215
	i32 1036536393, ; 155: System.Drawing.Primitives.dll => 0x3dc84a49 => 35
	i32 1044663988, ; 156: System.Linq.Expressions.dll => 0x3e444eb4 => 58
	i32 1052210849, ; 157: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 249
	i32 1067306892, ; 158: GoogleGson => 0x3f9dcf8c => 174
	i32 1082857460, ; 159: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 160: Xamarin.Kotlin.StdLib => 0x409e66d8 => 286
	i32 1098259244, ; 161: System => 0x41761b2c => 164
	i32 1118262833, ; 162: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 308
	i32 1121599056, ; 163: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 248
	i32 1127624469, ; 164: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 181
	i32 1149092582, ; 165: Xamarin.AndroidX.Window => 0x447dc2e6 => 276
	i32 1151313727, ; 166: ExoPlayer.Rtsp => 0x449fa73f => 202
	i32 1168523401, ; 167: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 314
	i32 1170634674, ; 168: System.Web.dll => 0x45c677b2 => 153
	i32 1175144683, ; 169: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 272
	i32 1178241025, ; 170: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 257
	i32 1203215381, ; 171: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 312
	i32 1204270330, ; 172: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 217
	i32 1208641965, ; 173: System.Diagnostics.Process => 0x480a69ad => 29
	i32 1219128291, ; 174: System.IO.IsolatedStorage => 0x48aa6be3 => 52
	i32 1234928153, ; 175: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 310
	i32 1243150071, ; 176: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 277
	i32 1253011324, ; 177: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1260983243, ; 178: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 294
	i32 1263886435, ; 179: Xamarin.Google.Guava.dll => 0x4b556063 => 282
	i32 1264511973, ; 180: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 267
	i32 1267360935, ; 181: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 271
	i32 1273260888, ; 182: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 222
	i32 1275534314, ; 183: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 290
	i32 1278448581, ; 184: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 214
	i32 1293217323, ; 185: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 233
	i32 1309188875, ; 186: System.Private.DataContractSerialization => 0x4e08a30b => 85
	i32 1309209905, ; 187: ExoPlayer.DataSource => 0x4e08f531 => 197
	i32 1322716291, ; 188: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 276
	i32 1324164729, ; 189: System.Linq => 0x4eed2679 => 61
	i32 1335329327, ; 190: System.Runtime.Serialization.Json.dll => 0x4f97822f => 112
	i32 1364015309, ; 191: System.IO => 0x514d38cd => 57
	i32 1373134921, ; 192: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 324
	i32 1376866003, ; 193: Xamarin.AndroidX.SavedState => 0x52114ed3 => 263
	i32 1379779777, ; 194: System.Resources.ResourceManager => 0x523dc4c1 => 99
	i32 1395857551, ; 195: Xamarin.AndroidX.Media.dll => 0x5333188f => 254
	i32 1402170036, ; 196: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 197: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 226
	i32 1406299041, ; 198: Xamarin.Google.Guava.FailureAccess => 0x53d26ba1 => 283
	i32 1408764838, ; 199: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 111
	i32 1411638395, ; 200: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 101
	i32 1422545099, ; 201: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 102
	i32 1430672901, ; 202: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 292
	i32 1434145427, ; 203: System.Runtime.Handles => 0x557b5293 => 104
	i32 1435222561, ; 204: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 280
	i32 1439761251, ; 205: System.Net.Quic.dll => 0x55d10363 => 71
	i32 1452070440, ; 206: System.Formats.Asn1.dll => 0x568cd628 => 38
	i32 1453312822, ; 207: System.Diagnostics.Tools.dll => 0x569fcb36 => 32
	i32 1457743152, ; 208: System.Runtime.Extensions.dll => 0x56e36530 => 103
	i32 1458022317, ; 209: System.Net.Security.dll => 0x56e7a7ad => 73
	i32 1461004990, ; 210: es\Microsoft.Maui.Controls.resources => 0x57152abe => 298
	i32 1461234159, ; 211: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 212: System.Security.Cryptography.OpenSsl => 0x57201017 => 123
	i32 1462112819, ; 213: System.IO.Compression.dll => 0x57261233 => 46
	i32 1469204771, ; 214: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 216
	i32 1470490898, ; 215: Microsoft.Extensions.Primitives => 0x57a5e912 => 183
	i32 1479771757, ; 216: System.Collections.Immutable => 0x5833866d => 9
	i32 1480156764, ; 217: ExoPlayer.DataSource.dll => 0x5839665c => 197
	i32 1480492111, ; 218: System.IO.Compression.Brotli.dll => 0x583e844f => 43
	i32 1487239319, ; 219: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 220: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 264
	i32 1493001747, ; 221: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 302
	i32 1514721132, ; 222: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 297
	i32 1536373174, ; 223: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 31
	i32 1543031311, ; 224: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 138
	i32 1543355203, ; 225: System.Reflection.Emit.dll => 0x5bfdbb43 => 92
	i32 1550322496, ; 226: System.Reflection.Extensions.dll => 0x5c680b40 => 93
	i32 1551623176, ; 227: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 317
	i32 1565862583, ; 228: System.IO.FileSystem.Primitives => 0x5d552ab7 => 49
	i32 1566207040, ; 229: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 141
	i32 1573704789, ; 230: System.Runtime.Serialization.Json => 0x5dccd455 => 112
	i32 1580037396, ; 231: System.Threading.Overlapped => 0x5e2d7514 => 140
	i32 1582372066, ; 232: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 232
	i32 1592978981, ; 233: System.Runtime.Serialization.dll => 0x5ef2ee25 => 115
	i32 1597949149, ; 234: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 281
	i32 1601112923, ; 235: System.Xml.Serialization => 0x5f6f0b5b => 157
	i32 1604827217, ; 236: System.Net.WebClient => 0x5fa7b851 => 76
	i32 1618516317, ; 237: System.Net.WebSockets.Client.dll => 0x6078995d => 79
	i32 1622152042, ; 238: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 252
	i32 1622358360, ; 239: System.Dynamic.Runtime => 0x60b33958 => 37
	i32 1624863272, ; 240: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 275
	i32 1635184631, ; 241: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 236
	i32 1636350590, ; 242: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 229
	i32 1638652436, ; 243: CommunityToolkit.Maui.MediaElement => 0x61abda14 => 173
	i32 1639515021, ; 244: System.Net.Http.dll => 0x61b9038d => 64
	i32 1639986890, ; 245: System.Text.RegularExpressions => 0x61c036ca => 138
	i32 1641389582, ; 246: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1657153582, ; 247: System.Runtime => 0x62c6282e => 116
	i32 1658241508, ; 248: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 269
	i32 1658251792, ; 249: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 278
	i32 1670060433, ; 250: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 224
	i32 1675553242, ; 251: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 48
	i32 1677501392, ; 252: System.Net.Primitives.dll => 0x63fca3d0 => 70
	i32 1678508291, ; 253: System.Net.WebSockets => 0x640c0103 => 80
	i32 1679769178, ; 254: System.Security.Cryptography => 0x641f3e5a => 126
	i32 1691477237, ; 255: System.Reflection.Metadata => 0x64d1e4f5 => 94
	i32 1696967625, ; 256: System.Security.Cryptography.Csp => 0x6525abc9 => 121
	i32 1698840827, ; 257: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 287
	i32 1700397376, ; 258: ExoPlayer.Transformer => 0x655a0140 => 204
	i32 1701541528, ; 259: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1720223769, ; 260: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 245
	i32 1726116996, ; 261: System.Reflection.dll => 0x66e27484 => 97
	i32 1728033016, ; 262: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 28
	i32 1729485958, ; 263: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 220
	i32 1736233607, ; 264: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 315
	i32 1743415430, ; 265: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 293
	i32 1744735666, ; 266: System.Transactions.Local.dll => 0x67fe8db2 => 149
	i32 1746316138, ; 267: Mono.Android.Export => 0x6816ab6a => 169
	i32 1750313021, ; 268: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 269: System.Resources.Reader.dll => 0x68cc9d1e => 98
	i32 1763938596, ; 270: System.Diagnostics.TraceSource.dll => 0x69239124 => 33
	i32 1765620304, ; 271: ExoPlayer.Core => 0x693d3a50 => 194
	i32 1765942094, ; 272: System.Reflection.Extensions => 0x6942234e => 93
	i32 1766324549, ; 273: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 268
	i32 1770582343, ; 274: Microsoft.Extensions.Logging.dll => 0x6988f147 => 179
	i32 1776026572, ; 275: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 276: System.Globalization.Extensions.dll => 0x69ec0683 => 41
	i32 1780572499, ; 277: Mono.Android.Runtime.dll => 0x6a216153 => 170
	i32 1782862114, ; 278: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 309
	i32 1788241197, ; 279: Xamarin.AndroidX.Fragment => 0x6a96652d => 238
	i32 1793755602, ; 280: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 301
	i32 1808609942, ; 281: Xamarin.AndroidX.Loader => 0x6bcd3296 => 252
	i32 1813058853, ; 282: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 286
	i32 1813201214, ; 283: Xamarin.Google.Android.Material => 0x6c13413e => 278
	i32 1818569960, ; 284: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 258
	i32 1818787751, ; 285: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1824175904, ; 286: System.Text.Encoding.Extensions => 0x6cbab720 => 134
	i32 1824722060, ; 287: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 111
	i32 1828688058, ; 288: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 180
	i32 1842015223, ; 289: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 321
	i32 1847515442, ; 290: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 207
	i32 1853025655, ; 291: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 318
	i32 1858542181, ; 292: System.Linq.Expressions => 0x6ec71a65 => 58
	i32 1870277092, ; 293: System.Reflection.Primitives => 0x6f7a29e4 => 95
	i32 1875935024, ; 294: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 300
	i32 1879696579, ; 295: System.Formats.Tar.dll => 0x7009e4c3 => 39
	i32 1885316902, ; 296: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 218
	i32 1888955245, ; 297: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 298: System.Reflection.Metadata.dll => 0x70a66bdd => 94
	i32 1898237753, ; 299: System.Reflection.DispatchProxy => 0x7124cf39 => 89
	i32 1900610850, ; 300: System.Resources.ResourceManager.dll => 0x71490522 => 99
	i32 1910275211, ; 301: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1926145099, ; 302: ExoPlayer.Container.dll => 0x72cea44b => 193
	i32 1939592360, ; 303: System.Private.Xml.Linq => 0x739bd4a8 => 87
	i32 1956758971, ; 304: System.Resources.Writer => 0x74a1c5bb => 100
	i32 1961813231, ; 305: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 265
	i32 1968388702, ; 306: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 175
	i32 1983156543, ; 307: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 287
	i32 1984283898, ; 308: ExoPlayer.Ext.MediaSession.dll => 0x7645c4fa => 201
	i32 1985761444, ; 309: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 209
	i32 2003115576, ; 310: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 297
	i32 2011961780, ; 311: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2019465201, ; 312: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 249
	i32 2025202353, ; 313: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 292
	i32 2031763787, ; 314: Xamarin.Android.Glide => 0x791a414b => 206
	i32 2045470958, ; 315: System.Private.Xml => 0x79eb68ee => 88
	i32 2049988828, ; 316: HelloApp.dll => 0x7a3058dc => 0
	i32 2055257422, ; 317: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 244
	i32 2060060697, ; 318: System.Windows.dll => 0x7aca0819 => 154
	i32 2066184531, ; 319: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 296
	i32 2070888862, ; 320: System.Diagnostics.TraceSource => 0x7b6f419e => 33
	i32 2079903147, ; 321: System.Runtime.dll => 0x7bf8cdab => 116
	i32 2090596640, ; 322: System.Numerics.Vectors => 0x7c9bf920 => 82
	i32 2106312818, ; 323: ExoPlayer.Decoder => 0x7d8bc872 => 198
	i32 2113912252, ; 324: ExoPlayer.UI => 0x7dffbdbc => 205
	i32 2127167465, ; 325: System.Console => 0x7ec9ffe9 => 20
	i32 2142473426, ; 326: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 327: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 162
	i32 2146852085, ; 328: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2159891885, ; 329: Microsoft.Maui => 0x80bd55ad => 187
	i32 2169148018, ; 330: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 304
	i32 2181898931, ; 331: Microsoft.Extensions.Options.dll => 0x820d22b3 => 182
	i32 2192057212, ; 332: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 180
	i32 2193016926, ; 333: System.ObjectModel.dll => 0x82b6c85e => 84
	i32 2197017058, ; 334: Plugin.NFC.dll => 0x82f3d1e2 => 190
	i32 2201107256, ; 335: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 291
	i32 2201231467, ; 336: System.Net.Http => 0x8334206b => 64
	i32 2202964214, ; 337: ExoPlayer.dll => 0x834e90f6 => 191
	i32 2207618523, ; 338: it\Microsoft.Maui.Controls.resources => 0x839595db => 306
	i32 2217644978, ; 339: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 272
	i32 2222056684, ; 340: System.Threading.Tasks.Parallel => 0x8471e4ec => 143
	i32 2239138732, ; 341: ExoPlayer.SmoothStreaming => 0x85768bac => 203
	i32 2244775296, ; 342: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 253
	i32 2252106437, ; 343: System.Xml.Serialization.dll => 0x863c6ac5 => 157
	i32 2256313426, ; 344: System.Globalization.Extensions => 0x867c9c52 => 41
	i32 2265110946, ; 345: System.Security.AccessControl.dll => 0x8702d9a2 => 117
	i32 2266799131, ; 346: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 176
	i32 2267999099, ; 347: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 208
	i32 2270573516, ; 348: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 300
	i32 2279755925, ; 349: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 261
	i32 2293034957, ; 350: System.ServiceModel.Web.dll => 0x88acefcd => 131
	i32 2295906218, ; 351: System.Net.Sockets => 0x88d8bfaa => 75
	i32 2298471582, ; 352: System.Net.Mail => 0x88ffe49e => 66
	i32 2303942373, ; 353: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 310
	i32 2305521784, ; 354: System.Private.CoreLib.dll => 0x896b7878 => 172
	i32 2315684594, ; 355: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 212
	i32 2320631194, ; 356: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 143
	i32 2340441535, ; 357: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 106
	i32 2344264397, ; 358: System.ValueTuple => 0x8bbaa2cd => 151
	i32 2353062107, ; 359: System.Net.Primitives => 0x8c40e0db => 70
	i32 2368005991, ; 360: System.Xml.ReaderWriter.dll => 0x8d24e767 => 156
	i32 2371007202, ; 361: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 175
	i32 2378619854, ; 362: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 121
	i32 2383496789, ; 363: System.Security.Principal.Windows.dll => 0x8e114655 => 127
	i32 2395872292, ; 364: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 305
	i32 2401565422, ; 365: System.Web.HttpUtility => 0x8f24faee => 152
	i32 2403452196, ; 366: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 235
	i32 2421380589, ; 367: System.Threading.Tasks.Dataflow => 0x905355ed => 141
	i32 2423080555, ; 368: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 222
	i32 2427813419, ; 369: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 302
	i32 2435356389, ; 370: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 371: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2437192331, ; 372: CommunityToolkit.Maui.MediaElement.dll => 0x91449a8b => 173
	i32 2454642406, ; 373: System.Text.Encoding.dll => 0x924edee6 => 135
	i32 2458678730, ; 374: System.Net.Sockets.dll => 0x928c75ca => 75
	i32 2459001652, ; 375: System.Linq.Parallel.dll => 0x92916334 => 59
	i32 2465532216, ; 376: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 225
	i32 2471841756, ; 377: netstandard.dll => 0x93554fdc => 167
	i32 2475788418, ; 378: Java.Interop.dll => 0x93918882 => 168
	i32 2476233210, ; 379: ExoPlayer => 0x939851fa => 191
	i32 2480646305, ; 380: Microsoft.Maui.Controls => 0x93dba8a1 => 185
	i32 2483903535, ; 381: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 382: System.Net.ServicePoint => 0x94147f61 => 74
	i32 2490993605, ; 383: System.AppContext.dll => 0x94798bc5 => 6
	i32 2501346920, ; 384: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2505896520, ; 385: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 247
	i32 2515854816, ; 386: ExoPlayer.Common => 0x95f4e5e0 => 192
	i32 2522472828, ; 387: Xamarin.Android.Glide.dll => 0x9659e17c => 206
	i32 2538310050, ; 388: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 91
	i32 2550873716, ; 389: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 303
	i32 2562349572, ; 390: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 391: System.Text.Encodings.Web => 0x9930ee42 => 136
	i32 2581783588, ; 392: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 248
	i32 2581819634, ; 393: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 271
	i32 2585220780, ; 394: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 134
	i32 2585805581, ; 395: System.Net.Ping => 0x9a20430d => 69
	i32 2589602615, ; 396: System.Threading.ThreadPool => 0x9a5a3337 => 146
	i32 2593496499, ; 397: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 312
	i32 2605712449, ; 398: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 291
	i32 2615233544, ; 399: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 239
	i32 2616218305, ; 400: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 181
	i32 2617129537, ; 401: System.Private.Xml.dll => 0x9bfe3a41 => 88
	i32 2618712057, ; 402: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 96
	i32 2620871830, ; 403: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 229
	i32 2624644809, ; 404: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 234
	i32 2626028643, ; 405: ExoPlayer.Rtsp.dll => 0x9c860463 => 202
	i32 2626831493, ; 406: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 307
	i32 2627185994, ; 407: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 31
	i32 2629843544, ; 408: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 45
	i32 2633051222, ; 409: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 243
	i32 2663391936, ; 410: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 208
	i32 2663698177, ; 411: System.Runtime.Loader => 0x9ec4cf01 => 109
	i32 2664396074, ; 412: System.Xml.XDocument.dll => 0x9ecf752a => 158
	i32 2665622720, ; 413: System.Drawing.Primitives => 0x9ee22cc0 => 35
	i32 2676780864, ; 414: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2686887180, ; 415: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 114
	i32 2693849962, ; 416: System.IO.dll => 0xa090e36a => 57
	i32 2701096212, ; 417: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 269
	i32 2713040075, ; 418: ExoPlayer.Hls => 0xa1b5b4cb => 200
	i32 2715334215, ; 419: System.Threading.Tasks.dll => 0xa1d8b647 => 144
	i32 2717744543, ; 420: System.Security.Claims => 0xa1fd7d9f => 118
	i32 2719963679, ; 421: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 120
	i32 2724373263, ; 422: System.Runtime.Numerics.dll => 0xa262a30f => 110
	i32 2732626843, ; 423: Xamarin.AndroidX.Activity => 0xa2e0939b => 210
	i32 2735172069, ; 424: System.Threading.Channels => 0xa30769e5 => 139
	i32 2737747696, ; 425: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 216
	i32 2740948882, ; 426: System.IO.Pipes.AccessControl => 0xa35f8f92 => 54
	i32 2748088231, ; 427: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 105
	i32 2752995522, ; 428: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 313
	i32 2758225723, ; 429: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 186
	i32 2764765095, ; 430: Microsoft.Maui.dll => 0xa4caf7a7 => 187
	i32 2765824710, ; 431: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 133
	i32 2770495804, ; 432: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 285
	i32 2778768386, ; 433: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 274
	i32 2779977773, ; 434: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 262
	i32 2785988530, ; 435: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 319
	i32 2788224221, ; 436: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 239
	i32 2796087574, ; 437: ExoPlayer.Extractor.dll => 0xa6a8e916 => 199
	i32 2801831435, ; 438: Microsoft.Maui.Graphics => 0xa7008e0b => 189
	i32 2803228030, ; 439: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 159
	i32 2806116107, ; 440: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 298
	i32 2810250172, ; 441: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 226
	i32 2819470561, ; 442: System.Xml.dll => 0xa80db4e1 => 163
	i32 2821205001, ; 443: System.ServiceProcess.dll => 0xa8282c09 => 132
	i32 2821294376, ; 444: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 262
	i32 2824502124, ; 445: System.Xml.XmlDocument => 0xa85a7b6c => 161
	i32 2831556043, ; 446: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 311
	i32 2838993487, ; 447: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 250
	i32 2849599387, ; 448: System.Threading.Overlapped.dll => 0xa9d96f9b => 140
	i32 2851649503, ; 449: Plugin.NFC => 0xa9f8b7df => 190
	i32 2853208004, ; 450: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 274
	i32 2855708567, ; 451: Xamarin.AndroidX.Transition => 0xaa36a797 => 270
	i32 2861098320, ; 452: Mono.Android.Export.dll => 0xaa88e550 => 169
	i32 2861189240, ; 453: Microsoft.Maui.Essentials => 0xaa8a4878 => 188
	i32 2870099610, ; 454: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 211
	i32 2875164099, ; 455: Jsr305Binding.dll => 0xab5f85c3 => 279
	i32 2875220617, ; 456: System.Globalization.Calendars.dll => 0xab606289 => 40
	i32 2884993177, ; 457: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 237
	i32 2887636118, ; 458: System.Net.dll => 0xac1dd496 => 81
	i32 2899753641, ; 459: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 56
	i32 2900621748, ; 460: System.Dynamic.Runtime.dll => 0xace3f9b4 => 37
	i32 2901442782, ; 461: System.Reflection => 0xacf080de => 97
	i32 2905242038, ; 462: mscorlib.dll => 0xad2a79b6 => 166
	i32 2909740682, ; 463: System.Private.CoreLib => 0xad6f1e8a => 172
	i32 2916838712, ; 464: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 275
	i32 2919462931, ; 465: System.Numerics.Vectors.dll => 0xae037813 => 82
	i32 2921128767, ; 466: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 213
	i32 2936416060, ; 467: System.Resources.Reader => 0xaf06273c => 98
	i32 2940926066, ; 468: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 30
	i32 2942453041, ; 469: System.Xml.XPath.XDocument => 0xaf624531 => 159
	i32 2959614098, ; 470: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2960379616, ; 471: Xamarin.Google.Guava => 0xb073cee0 => 282
	i32 2968338931, ; 472: System.Security.Principal.Windows => 0xb0ed41f3 => 127
	i32 2972252294, ; 473: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 119
	i32 2978675010, ; 474: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 233
	i32 2987532451, ; 475: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 265
	i32 2996846495, ; 476: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 246
	i32 3016983068, ; 477: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 267
	i32 3023353419, ; 478: WindowsBase.dll => 0xb434b64b => 165
	i32 3024354802, ; 479: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 241
	i32 3027462113, ; 480: ExoPlayer.Common.dll => 0xb47367e1 => 192
	i32 3038032645, ; 481: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 326
	i32 3056245963, ; 482: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 264
	i32 3057625584, ; 483: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 255
	i32 3059408633, ; 484: Mono.Android.Runtime => 0xb65adef9 => 170
	i32 3059793426, ; 485: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3075834255, ; 486: System.Threading.Tasks => 0xb755818f => 144
	i32 3077302341, ; 487: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 304
	i32 3090735792, ; 488: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 125
	i32 3099732863, ; 489: System.Security.Claims.dll => 0xb8c22b7f => 118
	i32 3103600923, ; 490: System.Formats.Asn1 => 0xb8fd311b => 38
	i32 3111772706, ; 491: System.Runtime.Serialization => 0xb979e222 => 115
	i32 3121463068, ; 492: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 47
	i32 3124832203, ; 493: System.Threading.Tasks.Extensions => 0xba4127cb => 142
	i32 3132293585, ; 494: System.Security.AccessControl => 0xbab301d1 => 117
	i32 3144327419, ; 495: ExoPlayer.Hls.dll => 0xbb6aa0fb => 200
	i32 3147165239, ; 496: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 34
	i32 3148237826, ; 497: GoogleGson.dll => 0xbba64c02 => 174
	i32 3159123045, ; 498: System.Reflection.Primitives.dll => 0xbc4c6465 => 95
	i32 3160747431, ; 499: System.IO.MemoryMappedFiles => 0xbc652da7 => 53
	i32 3178803400, ; 500: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 256
	i32 3190271366, ; 501: ExoPlayer.Decoder.dll => 0xbe27ad86 => 198
	i32 3192346100, ; 502: System.Security.SecureString => 0xbe4755f4 => 129
	i32 3193515020, ; 503: System.Web => 0xbe592c0c => 153
	i32 3204380047, ; 504: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 505: System.Xml.XmlDocument.dll => 0xbf506931 => 161
	i32 3211777861, ; 506: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 232
	i32 3220365878, ; 507: System.Threading => 0xbff2e236 => 148
	i32 3226221578, ; 508: System.Runtime.Handles.dll => 0xc04c3c0a => 104
	i32 3251039220, ; 509: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 89
	i32 3258312781, ; 510: Xamarin.AndroidX.CardView => 0xc235e84d => 220
	i32 3265493905, ; 511: System.Linq.Queryable.dll => 0xc2a37b91 => 60
	i32 3265893370, ; 512: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 142
	i32 3277815716, ; 513: System.Resources.Writer.dll => 0xc35f7fa4 => 100
	i32 3279906254, ; 514: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 515: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3290767353, ; 516: System.Security.Cryptography.Encoding => 0xc4251ff9 => 122
	i32 3299363146, ; 517: System.Text.Encoding => 0xc4a8494a => 135
	i32 3303498502, ; 518: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 28
	i32 3305363605, ; 519: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 299
	i32 3316684772, ; 520: System.Net.Requests.dll => 0xc5b097e4 => 72
	i32 3317135071, ; 521: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 230
	i32 3317144872, ; 522: System.Data => 0xc5b79d28 => 24
	i32 3329734229, ; 523: ExoPlayer.Database => 0xc677b655 => 196
	i32 3340431453, ; 524: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 218
	i32 3345895724, ; 525: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 260
	i32 3346324047, ; 526: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 257
	i32 3357674450, ; 527: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 316
	i32 3358260929, ; 528: System.Text.Json => 0xc82afec1 => 137
	i32 3362336904, ; 529: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 211
	i32 3362522851, ; 530: Xamarin.AndroidX.Core => 0xc86c06e3 => 227
	i32 3366347497, ; 531: Java.Interop => 0xc8a662e9 => 168
	i32 3374999561, ; 532: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 261
	i32 3381016424, ; 533: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 295
	i32 3395150330, ; 534: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 101
	i32 3396979385, ; 535: ExoPlayer.Transformer.dll => 0xca79cab9 => 204
	i32 3403906625, ; 536: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 123
	i32 3405233483, ; 537: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 231
	i32 3425720591, ; 538: HelloApp => 0xcc30590f => 0
	i32 3428513518, ; 539: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 177
	i32 3429136800, ; 540: System.Xml => 0xcc6479a0 => 163
	i32 3430777524, ; 541: netstandard => 0xcc7d82b4 => 167
	i32 3441283291, ; 542: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 234
	i32 3445260447, ; 543: System.Formats.Tar => 0xcd5a809f => 39
	i32 3452344032, ; 544: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 184
	i32 3463511458, ; 545: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 303
	i32 3471940407, ; 546: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3476120550, ; 547: Mono.Android => 0xcf3163e6 => 171
	i32 3479583265, ; 548: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 316
	i32 3484440000, ; 549: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 315
	i32 3485117614, ; 550: System.Text.Json.dll => 0xcfbaacae => 137
	i32 3486566296, ; 551: System.Transactions => 0xcfd0c798 => 150
	i32 3493954962, ; 552: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 223
	i32 3509114376, ; 553: System.Xml.Linq => 0xd128d608 => 155
	i32 3515174580, ; 554: System.Security.dll => 0xd1854eb4 => 130
	i32 3530912306, ; 555: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 556: System.Net.HttpListener => 0xd2ff69f1 => 65
	i32 3560100363, ; 557: System.Threading.Timer => 0xd432d20b => 147
	i32 3570554715, ; 558: System.IO.FileSystem.AccessControl => 0xd4d2575b => 47
	i32 3580758918, ; 559: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 323
	i32 3597029428, ; 560: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 209
	i32 3598340787, ; 561: System.Net.WebSockets.Client => 0xd67a52b3 => 79
	i32 3608519521, ; 562: System.Linq.dll => 0xd715a361 => 61
	i32 3624195450, ; 563: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 106
	i32 3627220390, ; 564: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 259
	i32 3633644679, ; 565: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 213
	i32 3638274909, ; 566: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 49
	i32 3641597786, ; 567: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 244
	i32 3643446276, ; 568: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 320
	i32 3643854240, ; 569: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 256
	i32 3645089577, ; 570: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3657292374, ; 571: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 176
	i32 3660523487, ; 572: System.Net.NetworkInformation => 0xda2f27df => 68
	i32 3672681054, ; 573: Mono.Android.dll => 0xdae8aa5e => 171
	i32 3682565725, ; 574: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 219
	i32 3684561358, ; 575: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 223
	i32 3697841164, ; 576: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 325
	i32 3700866549, ; 577: System.Net.WebProxy.dll => 0xdc96bdf5 => 78
	i32 3706696989, ; 578: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 228
	i32 3716563718, ; 579: System.Runtime.Intrinsics => 0xdd864306 => 108
	i32 3718780102, ; 580: Xamarin.AndroidX.Annotation => 0xdda814c6 => 212
	i32 3724971120, ; 581: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 255
	i32 3732100267, ; 582: System.Net.NameResolution => 0xde7354ab => 67
	i32 3737834244, ; 583: System.Net.Http.Json.dll => 0xdecad304 => 63
	i32 3748608112, ; 584: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 27
	i32 3751444290, ; 585: System.Xml.XPath => 0xdf9a7f42 => 160
	i32 3786282454, ; 586: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 221
	i32 3792276235, ; 587: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3800979733, ; 588: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 184
	i32 3802395368, ; 589: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3819260425, ; 590: System.Net.WebProxy => 0xe3a54a09 => 78
	i32 3822602673, ; 591: Xamarin.AndroidX.Media => 0xe3d849b1 => 254
	i32 3823082795, ; 592: System.Security.Cryptography.dll => 0xe3df9d2b => 126
	i32 3829621856, ; 593: System.Numerics.dll => 0xe4436460 => 83
	i32 3841636137, ; 594: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 178
	i32 3844307129, ; 595: System.Net.Mail.dll => 0xe52378b9 => 66
	i32 3849253459, ; 596: System.Runtime.InteropServices.dll => 0xe56ef253 => 107
	i32 3870376305, ; 597: System.Net.HttpListener.dll => 0xe6b14171 => 65
	i32 3873536506, ; 598: System.Security.Principal => 0xe6e179fa => 128
	i32 3875112723, ; 599: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 122
	i32 3885497537, ; 600: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 77
	i32 3885922214, ; 601: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 270
	i32 3888767677, ; 602: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 260
	i32 3889960447, ; 603: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 324
	i32 3896106733, ; 604: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 605: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 227
	i32 3901907137, ; 606: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3920810846, ; 607: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 44
	i32 3921031405, ; 608: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 273
	i32 3928044579, ; 609: System.Xml.ReaderWriter => 0xea213423 => 156
	i32 3930554604, ; 610: System.Security.Principal.dll => 0xea4780ec => 128
	i32 3931092270, ; 611: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 258
	i32 3945713374, ; 612: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3953953790, ; 613: System.Text.Encoding.CodePages => 0xebac8bfe => 133
	i32 3955647286, ; 614: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 215
	i32 3959773229, ; 615: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 246
	i32 3980434154, ; 616: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 319
	i32 3987592930, ; 617: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 301
	i32 4003436829, ; 618: System.Diagnostics.Process.dll => 0xee9f991d => 29
	i32 4015948917, ; 619: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 214
	i32 4025784931, ; 620: System.Memory => 0xeff49a63 => 62
	i32 4046471985, ; 621: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 186
	i32 4054681211, ; 622: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 90
	i32 4068434129, ; 623: System.Private.Xml.Linq.dll => 0xf27f60d1 => 87
	i32 4073602200, ; 624: System.Threading.dll => 0xf2ce3c98 => 148
	i32 4094352644, ; 625: Microsoft.Maui.Essentials.dll => 0xf40add04 => 188
	i32 4099507663, ; 626: System.Drawing.dll => 0xf45985cf => 36
	i32 4100113165, ; 627: System.Private.Uri => 0xf462c30d => 86
	i32 4101593132, ; 628: Xamarin.AndroidX.Emoji2 => 0xf479582c => 235
	i32 4102112229, ; 629: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 314
	i32 4125707920, ; 630: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 309
	i32 4126470640, ; 631: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 177
	i32 4127667938, ; 632: System.IO.FileSystem.Watcher => 0xf60736e2 => 50
	i32 4130442656, ; 633: System.AppContext => 0xf6318da0 => 6
	i32 4147896353, ; 634: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 90
	i32 4150914736, ; 635: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 321
	i32 4151237749, ; 636: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 637: System.Xml.XmlSerializer => 0xf7e95c85 => 162
	i32 4161255271, ; 638: System.Reflection.TypeExtensions => 0xf807b767 => 96
	i32 4164802419, ; 639: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 50
	i32 4173364138, ; 640: ExoPlayer.SmoothStreaming.dll => 0xf8c07baa => 203
	i32 4181436372, ; 641: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 113
	i32 4182413190, ; 642: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 251
	i32 4185676441, ; 643: System.Security => 0xf97c5a99 => 130
	i32 4190597220, ; 644: ExoPlayer.Core.dll => 0xf9c77064 => 194
	i32 4196529839, ; 645: System.Net.WebClient.dll => 0xfa21f6af => 76
	i32 4213026141, ; 646: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 27
	i32 4256097574, ; 647: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 228
	i32 4258378803, ; 648: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 250
	i32 4260525087, ; 649: System.Buffers => 0xfdf2741f => 7
	i32 4271975918, ; 650: Microsoft.Maui.Controls.dll => 0xfea12dee => 185
	i32 4274976490, ; 651: System.Runtime.Numerics => 0xfecef6ea => 110
	i32 4292120959, ; 652: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 251
	i32 4294763496 ; 653: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 237
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [654 x i32] [
	i32 68, ; 0
	i32 67, ; 1
	i32 108, ; 2
	i32 247, ; 3
	i32 284, ; 4
	i32 48, ; 5
	i32 80, ; 6
	i32 145, ; 7
	i32 30, ; 8
	i32 325, ; 9
	i32 124, ; 10
	i32 189, ; 11
	i32 102, ; 12
	i32 266, ; 13
	i32 107, ; 14
	i32 266, ; 15
	i32 139, ; 16
	i32 288, ; 17
	i32 77, ; 18
	i32 124, ; 19
	i32 13, ; 20
	i32 221, ; 21
	i32 132, ; 22
	i32 268, ; 23
	i32 151, ; 24
	i32 322, ; 25
	i32 323, ; 26
	i32 18, ; 27
	i32 219, ; 28
	i32 26, ; 29
	i32 241, ; 30
	i32 1, ; 31
	i32 59, ; 32
	i32 42, ; 33
	i32 91, ; 34
	i32 224, ; 35
	i32 283, ; 36
	i32 147, ; 37
	i32 243, ; 38
	i32 240, ; 39
	i32 294, ; 40
	i32 54, ; 41
	i32 195, ; 42
	i32 69, ; 43
	i32 322, ; 44
	i32 210, ; 45
	i32 83, ; 46
	i32 307, ; 47
	i32 242, ; 48
	i32 306, ; 49
	i32 131, ; 50
	i32 55, ; 51
	i32 149, ; 52
	i32 74, ; 53
	i32 145, ; 54
	i32 62, ; 55
	i32 146, ; 56
	i32 326, ; 57
	i32 165, ; 58
	i32 318, ; 59
	i32 225, ; 60
	i32 12, ; 61
	i32 238, ; 62
	i32 125, ; 63
	i32 196, ; 64
	i32 152, ; 65
	i32 113, ; 66
	i32 166, ; 67
	i32 164, ; 68
	i32 240, ; 69
	i32 253, ; 70
	i32 84, ; 71
	i32 305, ; 72
	i32 299, ; 73
	i32 183, ; 74
	i32 150, ; 75
	i32 288, ; 76
	i32 60, ; 77
	i32 179, ; 78
	i32 51, ; 79
	i32 103, ; 80
	i32 114, ; 81
	i32 40, ; 82
	i32 279, ; 83
	i32 277, ; 84
	i32 120, ; 85
	i32 313, ; 86
	i32 52, ; 87
	i32 44, ; 88
	i32 119, ; 89
	i32 193, ; 90
	i32 230, ; 91
	i32 311, ; 92
	i32 236, ; 93
	i32 81, ; 94
	i32 136, ; 95
	i32 273, ; 96
	i32 217, ; 97
	i32 8, ; 98
	i32 73, ; 99
	i32 293, ; 100
	i32 155, ; 101
	i32 290, ; 102
	i32 154, ; 103
	i32 92, ; 104
	i32 285, ; 105
	i32 45, ; 106
	i32 308, ; 107
	i32 296, ; 108
	i32 289, ; 109
	i32 109, ; 110
	i32 129, ; 111
	i32 25, ; 112
	i32 207, ; 113
	i32 72, ; 114
	i32 55, ; 115
	i32 46, ; 116
	i32 317, ; 117
	i32 182, ; 118
	i32 231, ; 119
	i32 22, ; 120
	i32 245, ; 121
	i32 195, ; 122
	i32 86, ; 123
	i32 43, ; 124
	i32 160, ; 125
	i32 71, ; 126
	i32 259, ; 127
	i32 3, ; 128
	i32 42, ; 129
	i32 63, ; 130
	i32 16, ; 131
	i32 53, ; 132
	i32 201, ; 133
	i32 320, ; 134
	i32 284, ; 135
	i32 199, ; 136
	i32 105, ; 137
	i32 289, ; 138
	i32 280, ; 139
	i32 242, ; 140
	i32 34, ; 141
	i32 158, ; 142
	i32 85, ; 143
	i32 32, ; 144
	i32 12, ; 145
	i32 51, ; 146
	i32 56, ; 147
	i32 263, ; 148
	i32 36, ; 149
	i32 205, ; 150
	i32 178, ; 151
	i32 295, ; 152
	i32 281, ; 153
	i32 215, ; 154
	i32 35, ; 155
	i32 58, ; 156
	i32 249, ; 157
	i32 174, ; 158
	i32 17, ; 159
	i32 286, ; 160
	i32 164, ; 161
	i32 308, ; 162
	i32 248, ; 163
	i32 181, ; 164
	i32 276, ; 165
	i32 202, ; 166
	i32 314, ; 167
	i32 153, ; 168
	i32 272, ; 169
	i32 257, ; 170
	i32 312, ; 171
	i32 217, ; 172
	i32 29, ; 173
	i32 52, ; 174
	i32 310, ; 175
	i32 277, ; 176
	i32 5, ; 177
	i32 294, ; 178
	i32 282, ; 179
	i32 267, ; 180
	i32 271, ; 181
	i32 222, ; 182
	i32 290, ; 183
	i32 214, ; 184
	i32 233, ; 185
	i32 85, ; 186
	i32 197, ; 187
	i32 276, ; 188
	i32 61, ; 189
	i32 112, ; 190
	i32 57, ; 191
	i32 324, ; 192
	i32 263, ; 193
	i32 99, ; 194
	i32 254, ; 195
	i32 19, ; 196
	i32 226, ; 197
	i32 283, ; 198
	i32 111, ; 199
	i32 101, ; 200
	i32 102, ; 201
	i32 292, ; 202
	i32 104, ; 203
	i32 280, ; 204
	i32 71, ; 205
	i32 38, ; 206
	i32 32, ; 207
	i32 103, ; 208
	i32 73, ; 209
	i32 298, ; 210
	i32 9, ; 211
	i32 123, ; 212
	i32 46, ; 213
	i32 216, ; 214
	i32 183, ; 215
	i32 9, ; 216
	i32 197, ; 217
	i32 43, ; 218
	i32 4, ; 219
	i32 264, ; 220
	i32 302, ; 221
	i32 297, ; 222
	i32 31, ; 223
	i32 138, ; 224
	i32 92, ; 225
	i32 93, ; 226
	i32 317, ; 227
	i32 49, ; 228
	i32 141, ; 229
	i32 112, ; 230
	i32 140, ; 231
	i32 232, ; 232
	i32 115, ; 233
	i32 281, ; 234
	i32 157, ; 235
	i32 76, ; 236
	i32 79, ; 237
	i32 252, ; 238
	i32 37, ; 239
	i32 275, ; 240
	i32 236, ; 241
	i32 229, ; 242
	i32 173, ; 243
	i32 64, ; 244
	i32 138, ; 245
	i32 15, ; 246
	i32 116, ; 247
	i32 269, ; 248
	i32 278, ; 249
	i32 224, ; 250
	i32 48, ; 251
	i32 70, ; 252
	i32 80, ; 253
	i32 126, ; 254
	i32 94, ; 255
	i32 121, ; 256
	i32 287, ; 257
	i32 204, ; 258
	i32 26, ; 259
	i32 245, ; 260
	i32 97, ; 261
	i32 28, ; 262
	i32 220, ; 263
	i32 315, ; 264
	i32 293, ; 265
	i32 149, ; 266
	i32 169, ; 267
	i32 4, ; 268
	i32 98, ; 269
	i32 33, ; 270
	i32 194, ; 271
	i32 93, ; 272
	i32 268, ; 273
	i32 179, ; 274
	i32 21, ; 275
	i32 41, ; 276
	i32 170, ; 277
	i32 309, ; 278
	i32 238, ; 279
	i32 301, ; 280
	i32 252, ; 281
	i32 286, ; 282
	i32 278, ; 283
	i32 258, ; 284
	i32 2, ; 285
	i32 134, ; 286
	i32 111, ; 287
	i32 180, ; 288
	i32 321, ; 289
	i32 207, ; 290
	i32 318, ; 291
	i32 58, ; 292
	i32 95, ; 293
	i32 300, ; 294
	i32 39, ; 295
	i32 218, ; 296
	i32 25, ; 297
	i32 94, ; 298
	i32 89, ; 299
	i32 99, ; 300
	i32 10, ; 301
	i32 193, ; 302
	i32 87, ; 303
	i32 100, ; 304
	i32 265, ; 305
	i32 175, ; 306
	i32 287, ; 307
	i32 201, ; 308
	i32 209, ; 309
	i32 297, ; 310
	i32 7, ; 311
	i32 249, ; 312
	i32 292, ; 313
	i32 206, ; 314
	i32 88, ; 315
	i32 0, ; 316
	i32 244, ; 317
	i32 154, ; 318
	i32 296, ; 319
	i32 33, ; 320
	i32 116, ; 321
	i32 82, ; 322
	i32 198, ; 323
	i32 205, ; 324
	i32 20, ; 325
	i32 11, ; 326
	i32 162, ; 327
	i32 3, ; 328
	i32 187, ; 329
	i32 304, ; 330
	i32 182, ; 331
	i32 180, ; 332
	i32 84, ; 333
	i32 190, ; 334
	i32 291, ; 335
	i32 64, ; 336
	i32 191, ; 337
	i32 306, ; 338
	i32 272, ; 339
	i32 143, ; 340
	i32 203, ; 341
	i32 253, ; 342
	i32 157, ; 343
	i32 41, ; 344
	i32 117, ; 345
	i32 176, ; 346
	i32 208, ; 347
	i32 300, ; 348
	i32 261, ; 349
	i32 131, ; 350
	i32 75, ; 351
	i32 66, ; 352
	i32 310, ; 353
	i32 172, ; 354
	i32 212, ; 355
	i32 143, ; 356
	i32 106, ; 357
	i32 151, ; 358
	i32 70, ; 359
	i32 156, ; 360
	i32 175, ; 361
	i32 121, ; 362
	i32 127, ; 363
	i32 305, ; 364
	i32 152, ; 365
	i32 235, ; 366
	i32 141, ; 367
	i32 222, ; 368
	i32 302, ; 369
	i32 20, ; 370
	i32 14, ; 371
	i32 173, ; 372
	i32 135, ; 373
	i32 75, ; 374
	i32 59, ; 375
	i32 225, ; 376
	i32 167, ; 377
	i32 168, ; 378
	i32 191, ; 379
	i32 185, ; 380
	i32 15, ; 381
	i32 74, ; 382
	i32 6, ; 383
	i32 23, ; 384
	i32 247, ; 385
	i32 192, ; 386
	i32 206, ; 387
	i32 91, ; 388
	i32 303, ; 389
	i32 1, ; 390
	i32 136, ; 391
	i32 248, ; 392
	i32 271, ; 393
	i32 134, ; 394
	i32 69, ; 395
	i32 146, ; 396
	i32 312, ; 397
	i32 291, ; 398
	i32 239, ; 399
	i32 181, ; 400
	i32 88, ; 401
	i32 96, ; 402
	i32 229, ; 403
	i32 234, ; 404
	i32 202, ; 405
	i32 307, ; 406
	i32 31, ; 407
	i32 45, ; 408
	i32 243, ; 409
	i32 208, ; 410
	i32 109, ; 411
	i32 158, ; 412
	i32 35, ; 413
	i32 22, ; 414
	i32 114, ; 415
	i32 57, ; 416
	i32 269, ; 417
	i32 200, ; 418
	i32 144, ; 419
	i32 118, ; 420
	i32 120, ; 421
	i32 110, ; 422
	i32 210, ; 423
	i32 139, ; 424
	i32 216, ; 425
	i32 54, ; 426
	i32 105, ; 427
	i32 313, ; 428
	i32 186, ; 429
	i32 187, ; 430
	i32 133, ; 431
	i32 285, ; 432
	i32 274, ; 433
	i32 262, ; 434
	i32 319, ; 435
	i32 239, ; 436
	i32 199, ; 437
	i32 189, ; 438
	i32 159, ; 439
	i32 298, ; 440
	i32 226, ; 441
	i32 163, ; 442
	i32 132, ; 443
	i32 262, ; 444
	i32 161, ; 445
	i32 311, ; 446
	i32 250, ; 447
	i32 140, ; 448
	i32 190, ; 449
	i32 274, ; 450
	i32 270, ; 451
	i32 169, ; 452
	i32 188, ; 453
	i32 211, ; 454
	i32 279, ; 455
	i32 40, ; 456
	i32 237, ; 457
	i32 81, ; 458
	i32 56, ; 459
	i32 37, ; 460
	i32 97, ; 461
	i32 166, ; 462
	i32 172, ; 463
	i32 275, ; 464
	i32 82, ; 465
	i32 213, ; 466
	i32 98, ; 467
	i32 30, ; 468
	i32 159, ; 469
	i32 18, ; 470
	i32 282, ; 471
	i32 127, ; 472
	i32 119, ; 473
	i32 233, ; 474
	i32 265, ; 475
	i32 246, ; 476
	i32 267, ; 477
	i32 165, ; 478
	i32 241, ; 479
	i32 192, ; 480
	i32 326, ; 481
	i32 264, ; 482
	i32 255, ; 483
	i32 170, ; 484
	i32 16, ; 485
	i32 144, ; 486
	i32 304, ; 487
	i32 125, ; 488
	i32 118, ; 489
	i32 38, ; 490
	i32 115, ; 491
	i32 47, ; 492
	i32 142, ; 493
	i32 117, ; 494
	i32 200, ; 495
	i32 34, ; 496
	i32 174, ; 497
	i32 95, ; 498
	i32 53, ; 499
	i32 256, ; 500
	i32 198, ; 501
	i32 129, ; 502
	i32 153, ; 503
	i32 24, ; 504
	i32 161, ; 505
	i32 232, ; 506
	i32 148, ; 507
	i32 104, ; 508
	i32 89, ; 509
	i32 220, ; 510
	i32 60, ; 511
	i32 142, ; 512
	i32 100, ; 513
	i32 5, ; 514
	i32 13, ; 515
	i32 122, ; 516
	i32 135, ; 517
	i32 28, ; 518
	i32 299, ; 519
	i32 72, ; 520
	i32 230, ; 521
	i32 24, ; 522
	i32 196, ; 523
	i32 218, ; 524
	i32 260, ; 525
	i32 257, ; 526
	i32 316, ; 527
	i32 137, ; 528
	i32 211, ; 529
	i32 227, ; 530
	i32 168, ; 531
	i32 261, ; 532
	i32 295, ; 533
	i32 101, ; 534
	i32 204, ; 535
	i32 123, ; 536
	i32 231, ; 537
	i32 0, ; 538
	i32 177, ; 539
	i32 163, ; 540
	i32 167, ; 541
	i32 234, ; 542
	i32 39, ; 543
	i32 184, ; 544
	i32 303, ; 545
	i32 17, ; 546
	i32 171, ; 547
	i32 316, ; 548
	i32 315, ; 549
	i32 137, ; 550
	i32 150, ; 551
	i32 223, ; 552
	i32 155, ; 553
	i32 130, ; 554
	i32 19, ; 555
	i32 65, ; 556
	i32 147, ; 557
	i32 47, ; 558
	i32 323, ; 559
	i32 209, ; 560
	i32 79, ; 561
	i32 61, ; 562
	i32 106, ; 563
	i32 259, ; 564
	i32 213, ; 565
	i32 49, ; 566
	i32 244, ; 567
	i32 320, ; 568
	i32 256, ; 569
	i32 14, ; 570
	i32 176, ; 571
	i32 68, ; 572
	i32 171, ; 573
	i32 219, ; 574
	i32 223, ; 575
	i32 325, ; 576
	i32 78, ; 577
	i32 228, ; 578
	i32 108, ; 579
	i32 212, ; 580
	i32 255, ; 581
	i32 67, ; 582
	i32 63, ; 583
	i32 27, ; 584
	i32 160, ; 585
	i32 221, ; 586
	i32 10, ; 587
	i32 184, ; 588
	i32 11, ; 589
	i32 78, ; 590
	i32 254, ; 591
	i32 126, ; 592
	i32 83, ; 593
	i32 178, ; 594
	i32 66, ; 595
	i32 107, ; 596
	i32 65, ; 597
	i32 128, ; 598
	i32 122, ; 599
	i32 77, ; 600
	i32 270, ; 601
	i32 260, ; 602
	i32 324, ; 603
	i32 8, ; 604
	i32 227, ; 605
	i32 2, ; 606
	i32 44, ; 607
	i32 273, ; 608
	i32 156, ; 609
	i32 128, ; 610
	i32 258, ; 611
	i32 23, ; 612
	i32 133, ; 613
	i32 215, ; 614
	i32 246, ; 615
	i32 319, ; 616
	i32 301, ; 617
	i32 29, ; 618
	i32 214, ; 619
	i32 62, ; 620
	i32 186, ; 621
	i32 90, ; 622
	i32 87, ; 623
	i32 148, ; 624
	i32 188, ; 625
	i32 36, ; 626
	i32 86, ; 627
	i32 235, ; 628
	i32 314, ; 629
	i32 309, ; 630
	i32 177, ; 631
	i32 50, ; 632
	i32 6, ; 633
	i32 90, ; 634
	i32 321, ; 635
	i32 21, ; 636
	i32 162, ; 637
	i32 96, ; 638
	i32 50, ; 639
	i32 203, ; 640
	i32 113, ; 641
	i32 251, ; 642
	i32 130, ; 643
	i32 194, ; 644
	i32 76, ; 645
	i32 27, ; 646
	i32 228, ; 647
	i32 250, ; 648
	i32 7, ; 649
	i32 185, ; 650
	i32 110, ; 651
	i32 251, ; 652
	i32 237 ; 653
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.2xx @ 96b6bb65e8736e45180905177aa343f0e1854ea3"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"min_enum_size", i32 4}
