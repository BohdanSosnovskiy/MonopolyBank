using Plugin.NFC;

namespace HelloApp
{
    public partial class MainPage : ContentPage
    {
        public const string MIME_TYPE = "application/com.companyname.helloapp";

        public MainPage()
        {
            InitializeComponent();
            Application.Current.UserAppTheme = AppTheme.Light;
            
        }

        private void Current_OniOSReadingSessionCancelled(object? sender, EventArgs e)
        {
            Console.WriteLine("Cancel: ");
        }

        private void Current_OnTagListeningStatusChanged(bool isListening)
        {
            Console.WriteLine("Listening: " + isListening.ToString());
        }

        private void Current_OnNfcStatusChanged(bool isEnabled)
        {
            Console.WriteLine("Status change: " + isEnabled.ToString());
        }

        private void Current_OnTagDiscovered(ITagInfo tagInfo, bool format)
        {
            Console.WriteLine("Discover");

            NFCNdefRecord record;

            record = new NFCNdefRecord
            {
                TypeFormat = NFCNdefTypeFormat.WellKnown,
                MimeType = MIME_TYPE,
                Payload = NFCUtils.EncodeToByteArray("Plugin.NFC is awesome!"),
                LanguageCode = "en"
            };

            tagInfo.Records = new[] { record };

            if (format)
            {
                CrossNFC.Current.ClearMessage(tagInfo);
            }
            else
            {
                CrossNFC.Current.PublishMessage(tagInfo, false);
            }
        }

        private void Current_OnMessagePublished(ITagInfo tagInfo)
        {
            Console.WriteLine("Publivv");
            CrossNFC.Current.StopPublishing();
        }

        private void Current_OnMessageReceived(ITagInfo tagInfo)
        {
            Console.WriteLine("Recived");

            if (tagInfo != null)
            {
                var records = tagInfo.Records;
                if (records != null)
                {
                    if(records.Length > 0)
                    {
                        var rec = records[0];
                        var message = rec.Message;
                    }
                }
            }
        }

        private async void OnStartNewGame(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new NewGamePage()
            {
                Title = "Новая игра"
            },true);
        }

        private async void OnJoinNewGame(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new JoinGamePage()
            {
                Title = "Присоеденится к игре"
            }, true);
        }

        private void OnTestReadNfcClicked(object sender, EventArgs e)
        {
            CrossNFC.Current.StartListening();
        }
    }

}
