using HelloApp.Classes;
using System.Windows.Input;
using System.Net.Sockets;
using Plugin.NFC;
using System.Collections.ObjectModel;
using CommunityToolkit.Maui.Views;

namespace HelloApp;

public partial class GameMainPage : ContentPage
{
    public const string MIME_TYPE = "application/com.companyname.helloapp";

    public ObservableCollection<User> UserList { get; set; }

    //public static ICommand SelectCompany {  get; set; }

    TcpClient client = new TcpClient();
    private const int port = 8888;

    public StreamReader? Reader = null;
    public StreamWriter? Writer = null;

    public User CurrentUser { get; set; }

    public GameMainPage()
    {
        InitializeComponent();

        Loaded += GameMainPage_Loaded;

        PresetGame.link_GameMainPage = this;

        //SelectCompany = new Command<Company>(async p =>
        //{
        //    await Navigation.PushModalAsync(new PopUpCompanyInfo(p), false);
        //});

        //Carusel_Company.PropertyChanged += Carusel_Company_PropertyChanged;
        BindingContext = this;

        if (DeviceInfo.Current.Platform == DevicePlatform.WinUI)
        {
            return;
        }
        if (CrossNFC.Current.IsAvailable) //���� �� ������ nfc
        {
            if (CrossNFC.Current.IsEnabled) //�� �������?
            {
                // ������� ��������� ��� ��������� ��������� ndef.
                CrossNFC.Current.OnMessageReceived += Current_OnMessageReceived;
                // �������, ����������� ��� ���������� ��������� ndef.
                CrossNFC.Current.OnMessagePublished += Current_OnMessagePublished;
                // ������� ��������� ��� ����������� ����. ������������ ��� ����������.
                CrossNFC.Current.OnTagDiscovered += Current_OnTagDiscovered;
                // ������� ��������� ��� ��������� ������� �������������� NFC
                CrossNFC.Current.OnTagListeningStatusChanged += Current_OnTagListeningStatusChanged;

                // ������ ��� Android:
                // ������� ���������, ����� ��������� NFC ����������.
                CrossNFC.Current.OnNfcStatusChanged += Current_OnNfcStatusChanged;

                // ������ ��� iOS: 
                // ������� ���������, ����� ������������ ������� ����� NFC.
                CrossNFC.Current.OniOSReadingSessionCancelled += Current_OniOSReadingSessionCancelled;
            }
        }
    }

    public Company getCurrentCompany()
    {
        return (Company)Carusel_Company.CurrentItem;
    }

    public User getCurrentUser()
    {
        return (User)Carusel_Users.CurrentItem;
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

    private async void Current_OnMessageReceived(ITagInfo tagInfo)
    {
        Console.WriteLine("Recived");

        if (tagInfo != null)
        {
            var records = tagInfo.Records;
            if (records != null)
            {
                if (records.Length > 0)
                {
                    var rec = records[0];
                    var message = rec.Message;
                    if(message != null)
                    {
                        if(message == "start_mon")
                        {
                            PlaySound("coindrop");
                        }
                        else if(message == "pobori")
                        {
                            PlaySound("gopstop");
                        }
                        else if(message == "taska")
                        {
                            PlaySound("policay");
                        }
                        else if(message == "turma")
                        {
                            PlaySound("turma");
                        }
                        else if(message.IndexOf("Card_k") > -1)
                        {

                        }
                        else if (message.IndexOf("Card_shans") > -1)
                        {

                        }
                        else
                        {
                            bool isFind = false;

                            for (int i = 0; i < PresetGame.Companys.Count; i++)
                            {
                                if(message == PresetGame.Companys[i].nfc_marker)
                                {
                                    await Navigation.PushModalAsync(new PopUpCompany(this, PresetGame.Companys[i]), false);
                                    isFind = true;
                                    break;
                                }
                            }

                            if (!isFind)
                            {
                                var alert_pop = new PopUpAlert("������", "NFC ����� �� �������", "�����");
                                await Navigation.PushModalAsync(alert_pop, false);
                            }
                        }
                    }
                    
                }
            }
        }
    }

    public void PlaySound(string name)
    {
        mainMediaElement.Source = MediaSource.FromResource($"{name}.mp3");
        mainMediaElement.Volume = 1;
        mainMediaElement.Play();
    }

    public void SetBallans()
    {
        Lable_ballans.Text = CurrentUser.Cash + " $";
    }

    private async void GameMainPage_Loaded(object? sender, EventArgs e)
    {
        UserList = PresetGame.Users;

        Carusel_Users.ItemsSource = UserList;
        //Carusel_Users.SetBinding(ItemsView.ItemsSourceProperty, "UserList");
        //Carusel_Users.BindingContext = UserList;

        Carusel_Company.Loop = false;
        Carusel_Users.Loop = false;

        CurrentUser.Companys = new ObservableCollection<Company>
        {
            new Company
            {
                IsNoEmty = false,
            }
        };

        Carusel_Company.ItemsSource = CurrentUser.Companys;
            

        Lable_username.Text = CurrentUser.Name;
        SetBallans();

        CrossNFC.Current.StartListening();
        

        await SendMessageAsync(Writer, "Loaded");
    }

    public void UpdateCaruselCompany(ObservableCollection<Company> list)
    {
        Carusel_Company.ItemsSource = list;
        Carusel_Company.ScrollTo(0);
        Carusel_Company.SendRemainingItemsThresholdReached();
    }

    public void CreateServer()
    {
        Thread thread = new Thread(WorkServer);
        thread.Start();

        ConnectServer("127.0.0.1");
    }

    private async void WorkServer()
    {
        ServerObject server = new ServerObject();// ������� ������
        await server.ListenAsync(); // ��������� ������
    }

    public async void ConnectServer(string ip)
    {
        try
        {
            client.Connect(ip, port); //����������� �������
            Reader = new StreamReader(client.GetStream());
            Writer = new StreamWriter(client.GetStream());
            if (Writer is null || Reader is null) return;
            // ��������� ����� ����� ��� ��������� ������
            Task.Run(() => ReceiveMessageAsync(Reader));
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message);
        }
    }

    public void UpdateGUIData()
    {
        MainThread.BeginInvokeOnMainThread(() =>
        {
            Lable_ballans.Text = CurrentUser.Cash + " $";
        });
    }

    public void Close()
    {
        Writer?.Close();
        Reader?.Close();
    }

    bool IsSendName = false;
    // �������� ���������
    public async Task SendMessageAsync(StreamWriter writer, string message)
    {
        // ������� ���������� ���
        if (!IsSendName)
        {
            await writer.WriteLineAsync(CurrentUser.Name);
            await writer.FlushAsync();
            IsSendName = true;
        }
        await writer.WriteLineAsync(message);
        await writer.FlushAsync();
    }

    // ��������� ���������
    async Task ReceiveMessageAsync(StreamReader reader)
    {
        while (true)
        {
            try
            {
                // ��������� ����� � ���� ������
                string? message = await reader.ReadLineAsync();
                // ���� ������ �����, ������ �� ������� �� �������
                if (string.IsNullOrEmpty(message)) continue;
                Console.WriteLine($"======================================================={message}======================================================================");//����� ���������
                var values = message.Split(":");
                if (values.Length == 2)
                {
                    string nick_name = values[0];
                    string command = values[1];
                    if (command.IndexOf("|") > -1)
                    {
                        var v = command.Split("|");
                        string Action_str = v[0];
                        string Data = v[1];

                        if (Action_str.IndexOf("AddUser") > -1)
                        {
                            User user = new User(Data);
                            PresetGame.Users.Add(user);
                            Console.WriteLine($"�������� ����� ������������: {user.Name}");
                        }
                        else if (Action_str.IndexOf("SetCountStartSum") > -1)
                        {
                            PresetGame.CountStartSum = Convert.ToInt32(Data);
                            
                            Console.WriteLine($"����������� ����� ����� �����: {PresetGame.CountStartSum}");
                        }
                        else if (Action_str.IndexOf("SetCountCahsStart") > -1)
                        {
                            PresetGame.CountCahsStart = Convert.ToInt32(Data);
                            CurrentUser.Cash = PresetGame.CountCahsStart;
                            UpdateGUIData();
                            Console.WriteLine($"����������� ����� ��������� �����: {PresetGame.CountCahsStart}");
                        }
                        else if (Action_str.IndexOf("UpdateBallans") > -1)
                        {
                            int NewBallans = Convert.ToInt32(Data);
                            for(int i = 0; i < PresetGame.Users.Count; i++)
                            {
                                if (PresetGame.Users[i].Name.IndexOf(nick_name) > -1)
                                {
                                    PresetGame.Users[i].Cash = NewBallans;
                                    break;
                                }
                            }
                        }
                        else if(Action_str.IndexOf("UpdateBuldFilial") > -1)
                        {
                            var data_UpdateBuldFilial = Data.Split(",");
                            for(int i = 0; i < PresetGame.Users.Count; i++)
                            {
                                if (PresetGame.Users[i].Name.IndexOf(nick_name) > -1)
                                {
                                    var user_UBF = PresetGame.Users[i];
                                    for(int j = 0; j < user_UBF.Companys.Count; j++)
                                    {
                                        if (data_UpdateBuldFilial[0].IndexOf(user_UBF.Companys[j].Name) > -1)
                                        {
                                            PresetGame.Users[i].Companys[j].CountBulds = Convert.ToInt32(data_UpdateBuldFilial[1]);
                                            PresetGame.Users[i].Companys[j].CompanyBuldVisible[PresetGame.Users[i].Companys[j].CountBulds-1] = Convert.ToBoolean(data_UpdateBuldFilial[2]);
                                            break;
                                        }
                                    }
                                    break;
                                }
                            }
                        }
                    }
                    else if (command.IndexOf("Loaded") > -1)
                    {
                        User user = new User(nick_name);
                        PresetGame.Users.Add(user);

                        await SendMessageAsync(Writer, $"SetCountStartSum|{PresetGame.CountStartSum}");
                        await SendMessageAsync(Writer, $"SetCountCahsStart|{PresetGame.CountCahsStart}");

                        await SendMessageAsync(Writer, $"AddUser|{CurrentUser.Name}");
                    }
                }
                
                
            }
            catch(Exception ex)
            {
                Console.WriteLine(ex.Message);
                break;
            }
        }
    }
}