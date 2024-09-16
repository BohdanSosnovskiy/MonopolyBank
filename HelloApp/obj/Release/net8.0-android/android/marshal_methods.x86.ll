; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [120 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [240 x i32] [
	i32 10166715, ; 0: System.Net.NameResolution.dll => 0x9b21bb => 101
	i32 42639949, ; 1: System.Threading.Thread => 0x28aa24d => 112
	i32 67008169, ; 2: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 33
	i32 72070932, ; 3: Microsoft.Maui.Graphics.dll => 0x44bb714 => 47
	i32 117431740, ; 4: System.Runtime.InteropServices => 0x6ffddbc => 108
	i32 165246403, ; 5: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 59
	i32 182336117, ; 6: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 79
	i32 195452805, ; 7: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 30
	i32 199333315, ; 8: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 31
	i32 205061960, ; 9: System.ComponentModel => 0xc38ff48 => 92
	i32 280992041, ; 10: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 2
	i32 317674968, ; 11: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 30
	i32 318968648, ; 12: Xamarin.AndroidX.Activity.dll => 0x13031348 => 55
	i32 336156722, ; 13: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 15
	i32 342366114, ; 14: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 66
	i32 356389973, ; 15: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 14
	i32 379916513, ; 16: System.Threading.Thread.dll => 0x16a510e1 => 112
	i32 395744057, ; 17: _Microsoft.Android.Resource.Designer => 0x17969339 => 34
	i32 435591531, ; 18: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 26
	i32 442565967, ; 19: System.Collections => 0x1a61054f => 89
	i32 450948140, ; 20: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 65
	i32 469710990, ; 21: System.dll => 0x1bff388e => 115
	i32 486930444, ; 22: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 71
	i32 498788369, ; 23: System.ObjectModel => 0x1dbae811 => 105
	i32 500358224, ; 24: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 13
	i32 503918385, ; 25: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 7
	i32 513247710, ; 26: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 41
	i32 592146354, ; 27: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 21
	i32 627609679, ; 28: Xamarin.AndroidX.CustomView => 0x2568904f => 63
	i32 627931235, ; 29: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 19
	i32 663517072, ; 30: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 80
	i32 672442732, ; 31: System.Collections.Concurrent => 0x2814a96c => 87
	i32 688181140, ; 32: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 1
	i32 706645707, ; 33: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 16
	i32 709557578, ; 34: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 4
	i32 759454413, ; 35: System.Net.Requests => 0x2d445acd => 103
	i32 775507847, ; 36: System.IO.Compression => 0x2e394f87 => 97
	i32 777317022, ; 37: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 25
	i32 823281589, ; 38: System.Private.Uri.dll => 0x311247b5 => 106
	i32 830298997, ; 39: System.IO.Compression.Brotli => 0x317d5b75 => 96
	i32 904024072, ; 40: System.ComponentModel.Primitives.dll => 0x35e25008 => 90
	i32 915551335, ; 41: ExoPlayer.Ext.MediaSession => 0x36923467 => 53
	i32 926902833, ; 42: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 28
	i32 967690846, ; 43: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 66
	i32 992768348, ; 44: System.Collections.dll => 0x3b2c715c => 89
	i32 1012816738, ; 45: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 78
	i32 1028013380, ; 46: ExoPlayer.UI.dll => 0x3d463d44 => 54
	i32 1028951442, ; 47: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 39
	i32 1029334545, ; 48: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 3
	i32 1035644815, ; 49: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 56
	i32 1044663988, ; 50: System.Linq.Expressions.dll => 0x3e444eb4 => 98
	i32 1052210849, ; 51: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 68
	i32 1082857460, ; 52: System.ComponentModel.TypeConverter => 0x408b17f4 => 91
	i32 1084122840, ; 53: Xamarin.Kotlin.StdLib => 0x409e66d8 => 84
	i32 1098259244, ; 54: System => 0x41761b2c => 115
	i32 1118262833, ; 55: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 16
	i32 1168523401, ; 56: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 22
	i32 1178241025, ; 57: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 75
	i32 1203215381, ; 58: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 20
	i32 1234928153, ; 59: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 18
	i32 1260983243, ; 60: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 2
	i32 1293217323, ; 61: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 64
	i32 1309209905, ; 62: ExoPlayer.DataSource => 0x4e08f531 => 51
	i32 1324164729, ; 63: System.Linq => 0x4eed2679 => 99
	i32 1373134921, ; 64: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 32
	i32 1376866003, ; 65: Xamarin.AndroidX.SavedState => 0x52114ed3 => 78
	i32 1395857551, ; 66: Xamarin.AndroidX.Media.dll => 0x5333188f => 72
	i32 1406073936, ; 67: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 60
	i32 1430672901, ; 68: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 0
	i32 1461004990, ; 69: es\Microsoft.Maui.Controls.resources => 0x57152abe => 6
	i32 1462112819, ; 70: System.IO.Compression.dll => 0x57261233 => 97
	i32 1469204771, ; 71: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 57
	i32 1470490898, ; 72: Microsoft.Extensions.Primitives => 0x57a5e912 => 41
	i32 1480156764, ; 73: ExoPlayer.DataSource.dll => 0x5839665c => 51
	i32 1480492111, ; 74: System.IO.Compression.Brotli.dll => 0x583e844f => 96
	i32 1493001747, ; 75: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 10
	i32 1514721132, ; 76: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 5
	i32 1543031311, ; 77: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 111
	i32 1551623176, ; 78: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 25
	i32 1622152042, ; 79: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 70
	i32 1624863272, ; 80: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 82
	i32 1636350590, ; 81: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 62
	i32 1638652436, ; 82: CommunityToolkit.Maui.MediaElement => 0x61abda14 => 35
	i32 1639515021, ; 83: System.Net.Http.dll => 0x61b9038d => 100
	i32 1639986890, ; 84: System.Text.RegularExpressions => 0x61c036ca => 111
	i32 1657153582, ; 85: System.Runtime => 0x62c6282e => 109
	i32 1658251792, ; 86: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 83
	i32 1677501392, ; 87: System.Net.Primitives.dll => 0x63fca3d0 => 102
	i32 1679769178, ; 88: System.Security.Cryptography => 0x641f3e5a => 110
	i32 1729485958, ; 89: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 58
	i32 1736233607, ; 90: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 23
	i32 1743415430, ; 91: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 1
	i32 1763938596, ; 92: System.Diagnostics.TraceSource.dll => 0x69239124 => 95
	i32 1765620304, ; 93: ExoPlayer.Core => 0x693d3a50 => 50
	i32 1766324549, ; 94: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 79
	i32 1780572499, ; 95: Mono.Android.Runtime.dll => 0x6a216153 => 118
	i32 1782862114, ; 96: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 17
	i32 1788241197, ; 97: Xamarin.AndroidX.Fragment => 0x6a96652d => 65
	i32 1793755602, ; 98: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 9
	i32 1808609942, ; 99: Xamarin.AndroidX.Loader => 0x6bcd3296 => 70
	i32 1813058853, ; 100: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 84
	i32 1813201214, ; 101: Xamarin.Google.Android.Material => 0x6c13413e => 83
	i32 1818569960, ; 102: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 76
	i32 1828688058, ; 103: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 40
	i32 1842015223, ; 104: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 29
	i32 1853025655, ; 105: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 26
	i32 1858542181, ; 106: System.Linq.Expressions => 0x6ec71a65 => 98
	i32 1875935024, ; 107: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 8
	i32 1910275211, ; 108: System.Collections.NonGeneric.dll => 0x71dc7c8b => 88
	i32 1968388702, ; 109: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 36
	i32 1984283898, ; 110: ExoPlayer.Ext.MediaSession.dll => 0x7645c4fa => 53
	i32 2003115576, ; 111: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 5
	i32 2019465201, ; 112: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 68
	i32 2025202353, ; 113: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 0
	i32 2045470958, ; 114: System.Private.Xml => 0x79eb68ee => 107
	i32 2049988828, ; 115: HelloApp.dll => 0x7a3058dc => 86
	i32 2055257422, ; 116: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 67
	i32 2066184531, ; 117: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 4
	i32 2070888862, ; 118: System.Diagnostics.TraceSource => 0x7b6f419e => 95
	i32 2079903147, ; 119: System.Runtime.dll => 0x7bf8cdab => 109
	i32 2106312818, ; 120: ExoPlayer.Decoder => 0x7d8bc872 => 52
	i32 2113912252, ; 121: ExoPlayer.UI => 0x7dffbdbc => 54
	i32 2127167465, ; 122: System.Console => 0x7ec9ffe9 => 93
	i32 2159891885, ; 123: Microsoft.Maui => 0x80bd55ad => 45
	i32 2169148018, ; 124: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 12
	i32 2192057212, ; 125: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 40
	i32 2193016926, ; 126: System.ObjectModel.dll => 0x82b6c85e => 105
	i32 2197017058, ; 127: Plugin.NFC.dll => 0x82f3d1e2 => 48
	i32 2201107256, ; 128: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 85
	i32 2201231467, ; 129: System.Net.Http => 0x8334206b => 100
	i32 2207618523, ; 130: it\Microsoft.Maui.Controls.resources => 0x839595db => 14
	i32 2244775296, ; 131: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 71
	i32 2266799131, ; 132: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 37
	i32 2270573516, ; 133: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 8
	i32 2279755925, ; 134: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 77
	i32 2295906218, ; 135: System.Net.Sockets => 0x88d8bfaa => 104
	i32 2303942373, ; 136: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 18
	i32 2305521784, ; 137: System.Private.CoreLib.dll => 0x896b7878 => 116
	i32 2353062107, ; 138: System.Net.Primitives => 0x8c40e0db => 102
	i32 2368005991, ; 139: System.Xml.ReaderWriter.dll => 0x8d24e767 => 114
	i32 2371007202, ; 140: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 36
	i32 2395872292, ; 141: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 13
	i32 2427813419, ; 142: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 10
	i32 2435356389, ; 143: System.Console.dll => 0x912896e5 => 93
	i32 2437192331, ; 144: CommunityToolkit.Maui.MediaElement.dll => 0x91449a8b => 35
	i32 2458678730, ; 145: System.Net.Sockets.dll => 0x928c75ca => 104
	i32 2475788418, ; 146: Java.Interop.dll => 0x93918882 => 117
	i32 2480646305, ; 147: Microsoft.Maui.Controls => 0x93dba8a1 => 43
	i32 2515854816, ; 148: ExoPlayer.Common => 0x95f4e5e0 => 49
	i32 2550873716, ; 149: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 11
	i32 2593496499, ; 150: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 20
	i32 2605712449, ; 151: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 85
	i32 2617129537, ; 152: System.Private.Xml.dll => 0x9bfe3a41 => 107
	i32 2620871830, ; 153: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 62
	i32 2626831493, ; 154: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 15
	i32 2732626843, ; 155: Xamarin.AndroidX.Activity => 0xa2e0939b => 55
	i32 2737747696, ; 156: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 57
	i32 2752995522, ; 157: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 21
	i32 2758225723, ; 158: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 44
	i32 2764765095, ; 159: Microsoft.Maui.dll => 0xa4caf7a7 => 45
	i32 2778768386, ; 160: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 81
	i32 2785988530, ; 161: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 27
	i32 2801831435, ; 162: Microsoft.Maui.Graphics => 0xa7008e0b => 47
	i32 2806116107, ; 163: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 6
	i32 2810250172, ; 164: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 60
	i32 2831556043, ; 165: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 19
	i32 2851649503, ; 166: Plugin.NFC => 0xa9f8b7df => 48
	i32 2853208004, ; 167: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 81
	i32 2861189240, ; 168: Microsoft.Maui.Essentials => 0xaa8a4878 => 46
	i32 2909740682, ; 169: System.Private.CoreLib => 0xad6f1e8a => 116
	i32 2916838712, ; 170: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 82
	i32 2959614098, ; 171: System.ComponentModel.dll => 0xb0682092 => 92
	i32 2978675010, ; 172: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 64
	i32 3027462113, ; 173: ExoPlayer.Common.dll => 0xb47367e1 => 49
	i32 3038032645, ; 174: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 34
	i32 3057625584, ; 175: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 73
	i32 3059408633, ; 176: Mono.Android.Runtime => 0xb65adef9 => 118
	i32 3059793426, ; 177: System.ComponentModel.Primitives => 0xb660be12 => 90
	i32 3077302341, ; 178: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 12
	i32 3178803400, ; 179: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 74
	i32 3190271366, ; 180: ExoPlayer.Decoder.dll => 0xbe27ad86 => 52
	i32 3220365878, ; 181: System.Threading => 0xbff2e236 => 113
	i32 3258312781, ; 182: Xamarin.AndroidX.CardView => 0xc235e84d => 58
	i32 3305363605, ; 183: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 7
	i32 3316684772, ; 184: System.Net.Requests.dll => 0xc5b097e4 => 103
	i32 3317135071, ; 185: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 63
	i32 3346324047, ; 186: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 75
	i32 3357674450, ; 187: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 24
	i32 3362522851, ; 188: Xamarin.AndroidX.Core => 0xc86c06e3 => 61
	i32 3366347497, ; 189: Java.Interop => 0xc8a662e9 => 117
	i32 3374999561, ; 190: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 77
	i32 3381016424, ; 191: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 3
	i32 3425720591, ; 192: HelloApp => 0xcc30590f => 86
	i32 3428513518, ; 193: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 38
	i32 3452344032, ; 194: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 42
	i32 3463511458, ; 195: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 11
	i32 3471940407, ; 196: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 91
	i32 3476120550, ; 197: Mono.Android => 0xcf3163e6 => 119
	i32 3479583265, ; 198: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 24
	i32 3484440000, ; 199: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 23
	i32 3580758918, ; 200: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 31
	i32 3608519521, ; 201: System.Linq.dll => 0xd715a361 => 99
	i32 3641597786, ; 202: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 67
	i32 3643446276, ; 203: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 28
	i32 3643854240, ; 204: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 74
	i32 3657292374, ; 205: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 37
	i32 3672681054, ; 206: Mono.Android.dll => 0xdae8aa5e => 119
	i32 3697841164, ; 207: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 33
	i32 3724971120, ; 208: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 73
	i32 3732100267, ; 209: System.Net.NameResolution => 0xde7354ab => 101
	i32 3748608112, ; 210: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 94
	i32 3786282454, ; 211: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 59
	i32 3792276235, ; 212: System.Collections.NonGeneric => 0xe2098b0b => 88
	i32 3800979733, ; 213: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 42
	i32 3822602673, ; 214: Xamarin.AndroidX.Media => 0xe3d849b1 => 72
	i32 3823082795, ; 215: System.Security.Cryptography.dll => 0xe3df9d2b => 110
	i32 3841636137, ; 216: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 39
	i32 3849253459, ; 217: System.Runtime.InteropServices.dll => 0xe56ef253 => 108
	i32 3889960447, ; 218: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 32
	i32 3896106733, ; 219: System.Collections.Concurrent.dll => 0xe839deed => 87
	i32 3896760992, ; 220: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 61
	i32 3921031405, ; 221: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 80
	i32 3928044579, ; 222: System.Xml.ReaderWriter => 0xea213423 => 114
	i32 3931092270, ; 223: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 76
	i32 3955647286, ; 224: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 56
	i32 3980434154, ; 225: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 27
	i32 3987592930, ; 226: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 9
	i32 4046471985, ; 227: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 44
	i32 4073602200, ; 228: System.Threading.dll => 0xf2ce3c98 => 113
	i32 4094352644, ; 229: Microsoft.Maui.Essentials.dll => 0xf40add04 => 46
	i32 4100113165, ; 230: System.Private.Uri => 0xf462c30d => 106
	i32 4102112229, ; 231: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 22
	i32 4125707920, ; 232: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 17
	i32 4126470640, ; 233: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 38
	i32 4150914736, ; 234: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 29
	i32 4182413190, ; 235: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 69
	i32 4190597220, ; 236: ExoPlayer.Core.dll => 0xf9c77064 => 50
	i32 4213026141, ; 237: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 94
	i32 4271975918, ; 238: Microsoft.Maui.Controls.dll => 0xfea12dee => 43
	i32 4292120959 ; 239: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 69
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [240 x i32] [
	i32 101, ; 0
	i32 112, ; 1
	i32 33, ; 2
	i32 47, ; 3
	i32 108, ; 4
	i32 59, ; 5
	i32 79, ; 6
	i32 30, ; 7
	i32 31, ; 8
	i32 92, ; 9
	i32 2, ; 10
	i32 30, ; 11
	i32 55, ; 12
	i32 15, ; 13
	i32 66, ; 14
	i32 14, ; 15
	i32 112, ; 16
	i32 34, ; 17
	i32 26, ; 18
	i32 89, ; 19
	i32 65, ; 20
	i32 115, ; 21
	i32 71, ; 22
	i32 105, ; 23
	i32 13, ; 24
	i32 7, ; 25
	i32 41, ; 26
	i32 21, ; 27
	i32 63, ; 28
	i32 19, ; 29
	i32 80, ; 30
	i32 87, ; 31
	i32 1, ; 32
	i32 16, ; 33
	i32 4, ; 34
	i32 103, ; 35
	i32 97, ; 36
	i32 25, ; 37
	i32 106, ; 38
	i32 96, ; 39
	i32 90, ; 40
	i32 53, ; 41
	i32 28, ; 42
	i32 66, ; 43
	i32 89, ; 44
	i32 78, ; 45
	i32 54, ; 46
	i32 39, ; 47
	i32 3, ; 48
	i32 56, ; 49
	i32 98, ; 50
	i32 68, ; 51
	i32 91, ; 52
	i32 84, ; 53
	i32 115, ; 54
	i32 16, ; 55
	i32 22, ; 56
	i32 75, ; 57
	i32 20, ; 58
	i32 18, ; 59
	i32 2, ; 60
	i32 64, ; 61
	i32 51, ; 62
	i32 99, ; 63
	i32 32, ; 64
	i32 78, ; 65
	i32 72, ; 66
	i32 60, ; 67
	i32 0, ; 68
	i32 6, ; 69
	i32 97, ; 70
	i32 57, ; 71
	i32 41, ; 72
	i32 51, ; 73
	i32 96, ; 74
	i32 10, ; 75
	i32 5, ; 76
	i32 111, ; 77
	i32 25, ; 78
	i32 70, ; 79
	i32 82, ; 80
	i32 62, ; 81
	i32 35, ; 82
	i32 100, ; 83
	i32 111, ; 84
	i32 109, ; 85
	i32 83, ; 86
	i32 102, ; 87
	i32 110, ; 88
	i32 58, ; 89
	i32 23, ; 90
	i32 1, ; 91
	i32 95, ; 92
	i32 50, ; 93
	i32 79, ; 94
	i32 118, ; 95
	i32 17, ; 96
	i32 65, ; 97
	i32 9, ; 98
	i32 70, ; 99
	i32 84, ; 100
	i32 83, ; 101
	i32 76, ; 102
	i32 40, ; 103
	i32 29, ; 104
	i32 26, ; 105
	i32 98, ; 106
	i32 8, ; 107
	i32 88, ; 108
	i32 36, ; 109
	i32 53, ; 110
	i32 5, ; 111
	i32 68, ; 112
	i32 0, ; 113
	i32 107, ; 114
	i32 86, ; 115
	i32 67, ; 116
	i32 4, ; 117
	i32 95, ; 118
	i32 109, ; 119
	i32 52, ; 120
	i32 54, ; 121
	i32 93, ; 122
	i32 45, ; 123
	i32 12, ; 124
	i32 40, ; 125
	i32 105, ; 126
	i32 48, ; 127
	i32 85, ; 128
	i32 100, ; 129
	i32 14, ; 130
	i32 71, ; 131
	i32 37, ; 132
	i32 8, ; 133
	i32 77, ; 134
	i32 104, ; 135
	i32 18, ; 136
	i32 116, ; 137
	i32 102, ; 138
	i32 114, ; 139
	i32 36, ; 140
	i32 13, ; 141
	i32 10, ; 142
	i32 93, ; 143
	i32 35, ; 144
	i32 104, ; 145
	i32 117, ; 146
	i32 43, ; 147
	i32 49, ; 148
	i32 11, ; 149
	i32 20, ; 150
	i32 85, ; 151
	i32 107, ; 152
	i32 62, ; 153
	i32 15, ; 154
	i32 55, ; 155
	i32 57, ; 156
	i32 21, ; 157
	i32 44, ; 158
	i32 45, ; 159
	i32 81, ; 160
	i32 27, ; 161
	i32 47, ; 162
	i32 6, ; 163
	i32 60, ; 164
	i32 19, ; 165
	i32 48, ; 166
	i32 81, ; 167
	i32 46, ; 168
	i32 116, ; 169
	i32 82, ; 170
	i32 92, ; 171
	i32 64, ; 172
	i32 49, ; 173
	i32 34, ; 174
	i32 73, ; 175
	i32 118, ; 176
	i32 90, ; 177
	i32 12, ; 178
	i32 74, ; 179
	i32 52, ; 180
	i32 113, ; 181
	i32 58, ; 182
	i32 7, ; 183
	i32 103, ; 184
	i32 63, ; 185
	i32 75, ; 186
	i32 24, ; 187
	i32 61, ; 188
	i32 117, ; 189
	i32 77, ; 190
	i32 3, ; 191
	i32 86, ; 192
	i32 38, ; 193
	i32 42, ; 194
	i32 11, ; 195
	i32 91, ; 196
	i32 119, ; 197
	i32 24, ; 198
	i32 23, ; 199
	i32 31, ; 200
	i32 99, ; 201
	i32 67, ; 202
	i32 28, ; 203
	i32 74, ; 204
	i32 37, ; 205
	i32 119, ; 206
	i32 33, ; 207
	i32 73, ; 208
	i32 101, ; 209
	i32 94, ; 210
	i32 59, ; 211
	i32 88, ; 212
	i32 42, ; 213
	i32 72, ; 214
	i32 110, ; 215
	i32 39, ; 216
	i32 108, ; 217
	i32 32, ; 218
	i32 87, ; 219
	i32 61, ; 220
	i32 80, ; 221
	i32 114, ; 222
	i32 76, ; 223
	i32 56, ; 224
	i32 27, ; 225
	i32 9, ; 226
	i32 44, ; 227
	i32 113, ; 228
	i32 46, ; 229
	i32 106, ; 230
	i32 22, ; 231
	i32 17, ; 232
	i32 38, ; 233
	i32 29, ; 234
	i32 69, ; 235
	i32 50, ; 236
	i32 94, ; 237
	i32 43, ; 238
	i32 69 ; 239
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
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

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
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
